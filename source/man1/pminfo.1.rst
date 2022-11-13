.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pminfo(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMINFO(1)                General Commands Manual               PMINFO(1)

NAME
-------------------------------------------------

::

          pminfo - display information about performance metrics


---------------------------------------------------------

::

          pminfo [-dfFIlLmMstTvVxz?]  [-a archive] [-b batchsize] [-c
          dmfile] [--container name] [-h hostname] [-K spec] [-[n|N]
          pmnsfile] [-O time] [-Z timezone] [metricname | pmid | indom]...


---------------------------------------------------------------

::

          pminfo displays various types of information about performance
          metrics available through the facilities of the Performance Co-
          Pilot (PCP).

          The metrics of interest are named in the metricname arguments.
          If metricname is a non-leaf node in the PMNS, then pminfo will
          recursively descend the PMNS and report on all leaf nodes.  If no
          metricname argument is given, the root of the PMNS is used.

          If the metricname argument is in numeric dotted notation, it is
          interpreted as either a 3-dotted pmid (metric identifier -
          domain, cluster, item numbers) or a 2-dotted indom (instance
          domain identifier - domain, serial number).  In the pmid case, a
          reverse PMID-to-name lookup is performed, and in the indom case,
          the instance domain is reported directly.  This latter mode can
          be used to report the instance domain ``one line'' and long form
          help text summaries.

          Unless directed to another host by the -h option, by default
          pminfo will contact the Performance Metrics Collector Daemon
          (PMCD) on the local host.  The connection to a PMCD is only
          required if pminfo requires distributed PMNS information, and/or
          meta-data describing metrics, and/or metric values, and/or help
          text.

          The -a option causes pminfo to use the specified set of archives
          rather than connecting to a PMCD.

          The -L option causes pminfo to use a local context to collect
          metrics from PMDAs on the local host without PMCD.  Only some
          metrics are available in this mode.

          The -a, -h and -L options are mutually exclusive.


-------------------------------------------------------

::

          The available command line options are:

          -a archive, --archive=archive
               Performance metric values are retrieved from the set of
               Performance Co-Pilot (PCP) archive log files identified by
               the archive argument, which is a comma-separated list of
               names, each of which may be the base name of an archive or
               the name of a directory containing one or more archives.

          -b, --batch
               This option may be used to define the maximum number of
               metrics to be fetched in a single request for the -f and -v
               options.  The default value for batchsize is 128.

          -c dmfile, --derived=dmfile
               The dmfile argument specifies a file that contains derived
               metric definitions in the format described for
               pmLoadDerivedConfig(3).  The -c option provides a way to
               load derived metric definitions that is an alternative to
               the more generic use of the PCP_DERIVED_CONFIG environment
               variable as described in PCPIntro(1).  Using the -c option
               and the PCP_DERIVED_CONFIG environment variable to specify
               the same configuration is a bad idea, so choose one or the
               other method.

          --container=container
               Specify an individual container to be queried.

          -d, --desc
               Metric descriptions detailing the PMID, data type, data
               semantics, units, scale and associated instance domain.

          -f, --fetch
               Fetch and print values for all instances.  When fetching
               from a set of archives, only those instances present in the
               first archive record for a metric will be displayed; see
               also the -O option, else use pmdumplog(1) which may be a
               better tool for examining archives.

          -F, --fetchall
               Same as -f but try harder to fetch instances for metrics
               which have non-enumerable instance domains (e.g. metrics in
               the ``proc'' subtree of the default PMNS on some platforms).

          -h host, --host=host
               Fetch performance metrics from pmcd(1) on host, rather than
               from the default localhost.

          -I, --fullindom
               Print the InDom in verbose mode.

          -K spec, --spec-local=spec
               When using the -L/ option to fetch metrics from a local
               context, this option controls the DSO PMDAs that should be
               made accessible.  The spec argument conforms to the syntax
               described in pmSpecLocalPMDA(3).  More than one -K option
               may be used.

          -l, --labels
               Print label sets associated with metrics and instances.
               Labels are optional metric metadata described in detail in
               pmLookupLabels(3).

          -L, --local-PMDA
               Use a local context to collect metrics from DSO PMDAs on the
               local host without PMCD.  See also -K.

          -m, --pmid
               Print the PMID in terse mode.

          -M, --fullpmid
               Print the PMID in verbose mode.

          -n pmnsfile, --namespace=pmnsfile
               Normally pminfo operates on the distributed Performance
               Metrics Name Space (PMNS), however if the -n option is
               specified an alternative local PMNS is loaded from the file
               pmnsfile.

          -N pmnsfile, --uniqnames=pmnsfile
               The -N option supports the same function as -n, except for
               the handling of duplicate names for the same Performance
               Metric Identifier (PMID) in pmnsfile - duplicate names are
               allowed with -n but they are not allowed with -N.

          -O time, --origin=time
               When used in conjunction with an archive source of metrics
               and the options -f/, the time argument defines a time origin
               at which the metrics should be fetched from the set of
               archives.  Refer to PCPIntro(1) for a complete description
               of this option, and the syntax for the time argument.

          -s, --series
               Print time series identifiers associated with metrics,
               instances and sources.  These unique identifiers are
               calculated from intrinsic (non-optional) labels and other
               metric metadata associated with each PMAPI context
               (sources), metrics and instances.  Archive, local context or
               pmcd(1) connections for the same host all produce the same
               source identifier.  See also pmLookupLabels(3) and the -l
               option.

          -t, --oneline
               Print the ``one line'' help summary, if available.

          -T, --helptext
               Print the help text, if available.

          -v, --verify
               Verify mode in which descriptions and values are retrieved,
               but only error conditions are reported.  This option
               silently disables any output from the options -f/--fetch,
               -l/--labels, -I/--fullindom, -M/--fullpmid, -m/--pmid,
               -t/--oneline and -T/--helptext.

          -V, --version
               Display version number and exit.

          -x, --events
               Like the -f/--fetch option, but with the additional
               functionality that if a value is processed that is of type
               PM_TYPE_EVENT or PM_TYPE_HIGHRES_EVENT, then the event
               records will be unpacked and the details of each event
               record reported.

          -z, --hostzone
               Change the reporting timezone to the local timezone at the
               host that is the source of the performance metrics, as
               identified via either the -h or -a options.

          -Z timezone, --timezone=timezone
               By default, pminfo reports the time of day according to the
               local timezone on the system where pminfo is run.  The -Z
               option changes the timezone to timezone in the format of the
               environment variable TZ as described in environ(7).

          -?, --help
               Display usage message and exit.


---------------------------------------------------

::

          $PCP_VAR_DIR/pmns/*
               default local PMNS specification files


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

          PCPIntro(1), pmcd(1), pmchart(1), pmdumplog(1), pmprobe(1),
          pmrep(1), pmval(1), PMAPI(3), pmGetOptions(3), pmLookupLabels(3),
          pmLoadDerivedConfig(3), pmSpecLocalPMDA(3), pcp.conf(5),
          pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                         PMINFO(1)

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
`pcp-dstat(1) <../man1/pcp-dstat.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmchart(1) <../man1/pmchart.1.html>`__, 
`pmclient(1) <../man1/pmclient.1.html>`__, 
`pmdagluster(1) <../man1/pmdagluster.1.html>`__, 
`pmdajson(1) <../man1/pmdajson.1.html>`__, 
`pmdalio(1) <../man1/pmdalio.1.html>`__, 
`pmdaopenmetrics(1) <../man1/pmdaopenmetrics.1.html>`__, 
`pmdaopenvswitch(1) <../man1/pmdaopenvswitch.1.html>`__, 
`pmdaoracle(1) <../man1/pmdaoracle.1.html>`__, 
`pmdarabbitmq(1) <../man1/pmdarabbitmq.1.html>`__, 
`pmdatrace(1) <../man1/pmdatrace.1.html>`__, 
`pmdaweblog(1) <../man1/pmdaweblog.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__, 
`pmfind_check(1) <../man1/pmfind_check.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pmstore(1) <../man1/pmstore.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmdalabel(3) <../man3/pmdalabel.3.html>`__, 
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`pmmergelabels(3) <../man3/pmmergelabels.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`zbxpcp(3) <../man3/zbxpcp.3.html>`__, 
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
