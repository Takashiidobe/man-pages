.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmrep.conf(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILE FORMAT <#FILE_FORMAT>`__ \| |                                   |
| `SPECIA                           |                                   |
| L SECTIONS <#SPECIAL_SECTIONS>`__ |                                   |
| \|                                |                                   |
| `CUST                             |                                   |
| OM SECTIONS <#CUSTOM_SECTIONS>`__ |                                   |
| \|                                |                                   |
| `METRICSET SPECIFICAT             |                                   |
| ION <#METRICSET_SPECIFICATION>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMREP.CONF(5)              File Formats Manual             PMREP.CONF(5)

NAME
-------------------------------------------------

::

          pmrep.conf - pmrep configuration file


---------------------------------------------------------------

::

          pmrep is a customizable performance metrics reporting tool.  Any
          available performance metric, live or archived, system and/or
          application, can be selected for reporting using one of the
          available output alternatives together with applicable formatting
          options.

          The metrics of interest are named in the metricspec argument(s)
          on the pmrep command line.  These metricspecs define individual
          metrics or pre-defined performance metricsets to be read from the
          configuration file described below.  For command line argument
          details see pmrep(1).

          The pmrep.conf configuration file allows setting default runtime
          values and defining any number of custom metricsets for pmrep.  A
          metricset is a user-defined set of arbitrary performance metrics.
          This allows users to create specifically crafted metricsets
          particularly relevant for their application or environment.
          Instead of being dependent on what existing tools provide or
          collecting the needed data with several disjoint utilities users
          can define custom metricsets by merely editing pmrep.conf.  See
          below for the metricset specification.

          In case pmrep configuration files are read from a directory then
          values for the [options] and [global] sections will be combined
          from each file where defined.  The last definition of a directive
          wins, meaning the last definition will be used in case defined
          multiple times.  However, custom metricset sections will not be
          combined, only the last definition found will be used for
          reporting.

          Options via environment values (see pmGetOptions(3)) override the
          corresponding built-in default values (if any).  Configuration
          file options override the corresponding environment variables (if
          any).  Command line options override the corresponding
          configuration file options (if any).


---------------------------------------------------------------

::

          The file has an ini-style syntax and consists of sections and
          options.  A section begins with the name of the section in square
          brackets and continues until the next section begins.  An example
          section with two options follows:

              [section]
              key = value
              key2 = value2

          The supported value data types are string, integer, and boolean.
          String values need not to be quoted expect when whitespace needs
          to be included in the value (for instance, for the column
          separator); double quotes from quoted strings will be removed.

          A line comment starts with a hash sign (``#'') or a semicolon
          (``;'').  Inline comments are not supported.

          pmrep.conf must be readable by the user invoking pmrep.

          Any option described below with a corresponding command line
          option contains additional description in pmrep(1).


-------------------------------------------------------------------------

::

      The [options] section
          The [options] section is read every time pmrep is run and it
          defines the default runtime values (which may be overridden by
          the corresponding command line options).  Metric specifications
          are not allowed in this section.

          Section options

          version (integer)
              Indicates the configuration file version.  Defaults to 1.
              The only currently supported value is 1.

          source (string)
              Indicates the source for metrics.  Interpreted as a PCP
              archive if the string contains a slash (``/'').  If set to
              the special character ``@'', local DSO PMDA context is used.
              Otherwise interpreted as a hostname.  Corresponding command
              line paraters are -a, -h, and -L.  Defaults to local: (see
              PCPIntro(1)).

          output (string)
              Indicates the output target.  Corresponding command line
              option is -o.  For supported output targets, see pmrep(1).
              Defaults to stdout.

          speclocal (string)
              Indicates the local DSO PMDAs to be made available when using
              the local DSO PMDA context.  Corresponding command line
              option is -K.  For syntax description, see
              pmSpecLocalPMDA(3).  Use a semicolon (``;'') to separate more
              than one spec.  Undefined by default.

          derived (string)
              Derived metric specifications.  Corresponding command line
              option is -e.  For syntax description, see pmrep(1).
              Undefined by default.

          daemonize (boolean)
              Indicates whether to daemonize on startup.  Corresponding
              command line option is --daemonize.  Defaults to no.

          header (boolean)
              Indicates whether to print headers.  Corresponding command
              line option is -H.  Defaults to yes.

          instinfo (boolean)
              Indicates whether to include instance information as part of
              headers.  Corresponding command line option is
              --no-inst-info.  Defaults to yes.

          unitinfo (boolean)
              Indicates whether to include unit information as part of
              headers.  Corresponding command line option is -U.  Defaults
              to yes.

          globals (boolean)
              Indicates whether to include metrics from the [global]
              section (see below) for reporting.  Corresponding command
              line option is -G.  Defaults to yes.

          timestamp (boolean)
              Indicates whether to print the timestamp.  Corresponding
              command line option is -p.  Defaults to no.

          samples (integer)
              Indicates the number of samples to print.  Corresponding
              command line option is -s.  Undefined by default (meaning
              unlimited number of samples if not limited by other options).

          interval (string)
              Indicates the interval between samples.  Corresponding
              command line option is -o.  Follows the time syntax described
              in PCPIntro(1).  Defaults to 1s.

          delay (boolean)
              Indicates whether to pause between samples when replaying
              from an archive rather than replaying at full speed.
              Corresponding command line option is -d.  Defaults to no.

          type (string)
              Indicates whether to output raw metric values by disabling
              all rate conversions or convert cumulative counters to rates
              (default).  Corresponding command line option is -r.  Allowed
              values are default or raw.

          type_prefer (string)
              As type but does not override possible per-metric type
              specifications.  Corresponding command line option is -R.
              Allowed values are default or raw.

          ignore_incompat (boolean)
              Indicates that incompatible metrics are to be ignored.
              Corresponding command line option is -I.  Defaults to no.

          ignore_unknown (boolean)
              Indicates that unknown metrics are to be ignored.
              Corresponding command line option is -5.  Defaults to no.

          names_change (string)
              Indicates the action to take on PMNS changes during sampling.
              Corresponding command line option is -4.  Defaults to ignore.

          instances (string)
              Indicates the instances to be reported.  Corresponding
              command line option is -i.  Undefined (all instances are
              reported) by default.

          live_filter (boolean)
              Indicates that live filtering should be enabled.
              Corresponding command line option is -j.  Defaults to no.

          rank (integer)
              Indicates the value to be used for ranking instances.
              Corresponding command line option is -J.  Undefined (all
              instances are reported) by default.

          overall_rank (boolean)
              Indicates that overall ranking should be performed.
              Corresponding command line option is -2.  Defaults to no.

          overall_rank_alt (boolean)
              Indicates that overall ranking with alternative output format
              should be performed.  Corresponding command line option is
              -3.  Defaults to no.

          limit_filter (integer)
              Indicates the value to be used with limit filtering.
              Corresponding command line option is -8.  Undefined (all
              instances are reported) by default.

          limit_filter_force (integer)
              As limit_filter but overrides possible possible per-metric
              specifications.  Corresponding command line option is -9.
              Undefined (all instances are reported) by default.

          invert_filter (boolean)
              Indicates that invert filtering should be performed.
              Corresponding command line option is -n.  Defaults to no.

          predicate (string)
              Indicates the metrics to be used as predicate metrics.
              Corresponding command line option is -N.  Undefined by
              default.

          sort_metric (string)
              Indicates the metrics to be used as sort reference metrics.
              Corresponding command line option is -6.  Undefined by
              default.

          omit_flat (boolean)
              Indicates that single-valued ``flat'' metrics are to be
              omitted from reporting.  Corresponding command line option is
              -v.  Defaults to no.

          include_labels (boolean)
              Indicates that metric labels should included in the output.
              Corresponding command line option is -m.  Defaults to no.

          include_texts (boolean)
              Indicates that when writing a PCP archive, PCP help texts
              shall be included in the created archive.  Corresponding
              command line option is --include-texts.  Defaults to no.

          colxrow (string)
              Indicates to swap columns and rows in stdout output using the
              given text label.  Corresponding command line option is -X.
              Undefined (no swapping) by default.

          width (integer)
              Indicates the width of stdout output columns.  Corresponding
              command line option is -w.  Forced minimum is 3.  Defaults to
              the shortest width that can fit the metric text label.

          width_force (integer)
              As width but overrides possible possible per-metric
              specifications.  Corresponding command line option is -W.
              Forced minimum is 3.

          precision (integer)
              Indicates how many decimals to use for numeric non-integer
              output values.  Corresponding command line option is -P.
              Defaults to 3.

          precision_force (integer)
              As precision but overrides possible per-metric
              specifications.  Corresponding command line option is -0.
              Undefined by default.

          delimiter (string)
              Indicates the column separator.  Corresponding command line
              option is -l.  Default depends on the output target, see
              pmrep(1).

          extcsv (boolean)
              Indicates whether to write extended CSV output similar to
              sadf(1).  Corresponding command line option is -k.  Defaults
              to no.

          extheader (boolean)
              Indicates whether to print extended header.  Corresponding
              command line option is -x.  Defaults to no.

          fixed_header (boolean)
              Indicates that a fixed header should be used.  Corresponding
              command line option is -7.  Defaults to no.

          repeat_header (integer)
              Indicates how often to repeat the header.  Corresponding
              command line option is -E.  auto uses terminal height.
              Defaults to 0 (disabled).

          dynamic_header (boolean)
              Indicates that a dynamic header should be used.
              Corresponding command line option is -1.  Defaults to no.

          separate_header (boolean)
              Indicates whether to print a separate header.  Corresponding
              command line option is -g.  Defaults to no.

          timefmt (string)
              Indicates the format string for formatting the timestamp.
              Corresponding command line option is -f.  Defaults to
              %H:%M:%S.

          interpol (boolean)
              Indicates whether to interpolate reported archive values.
              Corresponding command line option is -u.  See pmrep(1) for
              complete description.  Defaults to yes.

          count_scale (string)
              Indicates the unit/scale for counter metrics.  Corresponding
              command line option is -q.  For supported syntax, see
              pmrep(1).  Undefined (no scaling) by default.

          count_scale_force (string)
              Like count_scale but overrides possible per-metric
              specifications.  Corresponding command line option is -Q.
              Undefined by default.

          space_scale (string)
              Indicates the unit/scale for space metrics.  Corresponding
              command line option is -b.  For supported syntax, see
              pmrep(1).  Undefined (no scaling) by default.

          space_scale_force (string)
              Like space_scale but overrides possible per-metric
              specifications.  Corresponding command line option is -B.
              Undefined by default.

          time_scale (string)
              Indicates the unit/scale for time metrics.  Corresponding
              command line option is -y.  For supported syntax, see
              pmrep(1).  Undefined (no scaling) by default.

          time_scale_force (string)
              Like time_scale but overrides possible per-metric
              specifications.  Corresponding command line option is -Y.
              Undefined by default.

      The [global] section
          The [global] section is used to define metrics that will be
          reported in addition to any other separately defined metrics or
          metricsets.  Configuration options are not allowed in this
          section.  Global metrics are reported by default, the command
          line option -G or the configuration file option globals can be
          used to disable global metrics.

          Section options

              No predefined options, only metricspecs allowed in this
              section.  See below for the metricspec specification.


-----------------------------------------------------------------------

::

          Any other section than [options] or [global] will be interpreted
          as a new metricset specification.  The section name is arbitrary,
          typically a reference to its coverage or purpose.  A custom
          section can contain options, metricspecs, or both.

          All the metrics specified in a custom section will be reported
          when pmrep is instructed to use the particular custom section.
          pmrep can be executed with more than one custom section (i.e.,
          metricset) defined in which case the combination of all the
          metrics specified in them will be reported.

          Section options

              Any option valid in the [options] section is also valid in a
              custom section.  Any option or metric defined in the custom
              section will override the same option or metric possibly
              defined in an earlier section.  See below for the metricspec
              specification.


---------------------------------------------------------------------------------------

::

          There are three forms of the metricspec.  First, on the command
          line a metricspec can start with a colon (``:'') to indicate a
          reference to a metricset to be read from the pmrep configuration
          file.  Second, the compact form of a metricspec is a one-line
          metric specification which can be used both on the command line
          and in the [global] and custom sections of the configuration
          file.  The only difference of its usage in the configuration file
          is that the metric name is used as the key and the optional
          specifiers as values.  The compact form of the metricspec is
          specified in detail in pmrep(1).  The third, verbose form of a
          metricspec, is valid only in the configuration file (see below).

          A key containing a dot (``.'') is interpreted as a metric name
          (see above), a non-option key not containing a dot is interpreted
          as an identifier (see below).

          The verbose form of a metricspec starts with a declaration
          consisting of a mandatory identifier as the key and the actual
          performance metric name (a PMNS leaf node) as its value.  This
          equals to the compact form of the metricspec defining the same
          performance metric without any of optional specifiers defined.
          The identifier is arbitrary and is not used otherwise except for
          binding the below specifiers and the metric together.

          The following specifiers are optional in the verbose form and can
          be used as keys in any order with an earlier declared identifier
          followed by a dot and the specifier (as in identifier.specifier):

                 label
                   Defines text label for the metric used by supporting
                   output targets.

                 formula
                   Defines the needed arithmetic expression for the metric.
                   For details, see pmRegisterDerived(3).

                 instances
                   Defines the instances to be reported for the metric.
                   For details, see pmrep(1).

                 unit
                   Defines the unit/scale conversion for the metric.  Needs
                   to be dimension-compatible and is used with non-string
                   metrics.  For allowed values, see pmrep(1).

                 type
                   If set to raw rate conversion for the metric will be
                   disabled.

                 width
                   Defines the width of the output column for the metric.

                 precision
                   Defines precision for numeric non-integer output values.

                 limit
                   Defines value limit filter for numeric metric values.


-------------------------------------------------------

::

          The following example contains a short [options] section setting
          some locally wanted default values.  It then goes on to define
          the global metrics kernel.all.sysfork using the compact form and
          mem.util.allcache using the verbose form of a metricspec.  The
          latter is a derived metric using the later specified formula.
          Both of these metrics will be included in reporting unless
          disabled with -G or globals = no.

          Three different metricsets are also specified: db1, db2, and
          sar-w.

          The DB sets define a host to be used as the source for the
          metrics.  Both use the verbose form of a metricspec (as the non-
          option key set does not contain the dot) to include all
          postgresql related metrics.

          The sar-w set is an example how to mimic an existing tool with
          pmrep.

          The system default pmrep configuration files contain many more
          examples.  Using the tab key on the command line after the colon
          can be used to complete available metricsets (with bash and zsh).

              [options]
              timestamp = yes
              interval = 2s
              extheader = yes
              repeat_header = auto
              space_scale = MB

              [global]
              kernel.all.sysfork = forks,,,,8
              allcache = mem.util.allcache
              allcache.formula = mem.util.bufmem + mem.util.cached + mem.util.slab
              allcache.width = 12

              [db1]
              source = db-host1.example.com
              set = postgresql

              [db2]
              source = db-host2.example.com
              set = postgresql

              [sar-w]
              header = yes
              unitinfo = no
              globals = no
              timestamp = yes
              precision = 2
              delimiter = " "
              kernel.all.sysfork = proc/s,,,,12
              kernel.all.pswitch = cswch/s,,,,9


---------------------------------------------------

::

          $PCP_SYSCONF_DIR/pmrep/*.conf
                 system provided default pmrep configuration files


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          For environment variables affecting PCP tools, see
          pmGetOptions(3).


---------------------------------------------------------

::

          PCPIntro(1), pmrep(1), pmGetOptions(3), pmSpecLocalPMDA(3) and
          pmRegisterDerived(3).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                     PMREP.CONF(5)

--------------

Pages that refer to this page:
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pmlogger_daily_report(1) <../man1/pmlogger_daily_report.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmrepconf(1) <../man1/pmrepconf.1.html>`__, 
`pcp-dstat(5) <../man5/pcp-dstat.5.html>`__

--------------

--------------

.. container:: footer

   +-----------------------+-----------------------+-----------------------+
   | HTML rendering        |                       | |Cover of TLPI|       |
   | created 2021-08-27 by |                       |                       |
   | `Michael              |                       |                       |
   | Ker                   |                       |                       |
   | risk <https://man7.or |                       |                       |
   | g/mtk/index.html>`__, |                       |                       |
   | author of `The Linux  |                       |                       |
   | Programming           |                       |                       |
   | Interface <https:     |                       |                       |
   | //man7.org/tlpi/>`__, |                       |                       |
   | maintainer of the     |                       |                       |
   | `Linux man-pages      |                       |                       |
   | project <             |                       |                       |
   | https://www.kernel.or |                       |                       |
   | g/doc/man-pages/>`__. |                       |                       |
   |                       |                       |                       |
   | For details of        |                       |                       |
   | in-depth **Linux/UNIX |                       |                       |
   | system programming    |                       |                       |
   | training courses**    |                       |                       |
   | that I teach, look    |                       |                       |
   | `here <https://ma     |                       |                       |
   | n7.org/training/>`__. |                       |                       |
   |                       |                       |                       |
   | Hosting by `jambit    |                       |                       |
   | GmbH                  |                       |                       |
   | <https://www.jambit.c |                       |                       |
   | om/index_en.html>`__. |                       |                       |
   +-----------------------+-----------------------+-----------------------+

--------------

.. container:: statcounter

   |Web Analytics Made Easy - StatCounter|

.. |Cover of TLPI| image:: https://man7.org/tlpi/cover/TLPI-front-cover-vsmall.png
   :target: https://man7.org/tlpi/
.. |Web Analytics Made Easy - StatCounter| image:: https://c.statcounter.com/7422636/0/9b6714ff/1/
   :class: statcounter
   :target: https://statcounter.com/
