.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlogconf(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SETUP GR                         |                                   |
| OUP FILES <#SETUP_GROUP_FILES>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `MIGRATION <#MIGRATION>`__ \|     |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOGCONF(1)             General Commands Manual            PMLOGCONF(1)

NAME
-------------------------------------------------

::

          pmlogconf - create/edit a pmlogger configuration file


---------------------------------------------------------

::

          pmlogconf [-cqrvV?]  [-d groupsdir] [-g grouptag] [-h host] [-s
          groupfile] configfile


---------------------------------------------------------------

::

          pmlogconf may be used to create and modify a generic
          configuration file for the PCP archive logger, pmlogger(1).

          If configfile does not exist, pmlogconf will create a generic
          configuration file with a default set of enabled metrics and
          logging intervals.

          Once created, configfile may be used with the -c option to
          pmlogger(1) to select performance metrics and specify logging
          intervals for a PCP archive.

          If configfile does exist, pmlogconf will prompt for input from
          the user to enable or disable groups of related performance
          metrics and to control the logging interval for each enabled
          group.

          Group selection requires a simple y (yes) or n (no) response to
          the prompt Log this group?.

          Other responses at this point may be used to select additional
          control functions as follows:

          m         Report the names of the metrics in the current group.

          q         Finish with group selection (quit) and make no further
                    changes to this group or any subsequent group.

          /pattern  Make no change to this group but search for a group
                    containing pattern in the description of the group or
                    the names of the associated metrics.

          A logging interval is specified by responding to the Logging
          interval?  prompt with the keywords once or default or a valid
          pmlogger(1) interval specification of the form ``every N
          timeunits'' or simply ``N timeunits '' (the every is optional)
          where N is an unsigned integer and timeunits is one of the
          keywords msec, millisecond, sec, second, min, minute, hour or the
          plural form of one of the keywords.

          When run from automated logging setup processes, the -c option is
          used to indicate that pmlogconf is in auto-create mode and no
          interactive dialog takes place.  The output configfile has an
          additional comment message and timestamp indicating this fact, so
          that it can be identified and subsequently updated using -c
          again.  This option is not appropriate for interactive use of the
          tool.

          The -q option suppresses the logging interval dialog and
          preserves the current interval from configfile.

          More verbose output may be enabled with the -v option.


---------------------------------------------------------------------------

::

          When an initial configfile is created, the default specifications
          come from a set of group files below the groupsdir specified with
          the -d option (the default groupsdir is
          $PCP_VAR_DIR/config/pmlogconf which is most commonly correct, so
          the -d option is rarely used in practice).

          The directory structure below groupsdir is arbitrary as all
          regular files will be found by recursive descent and considered,
          so add-on products and PMDA developers can easily extend the
          available defaults to pmlogconf by adding new directories and/or
          group files below groupsdir.

          These group files are processed in the following ways:

          •  When a new configfile is created, all group files are
             processed.

          •  Whenever pmlogconf is run with an existing configfile,
             groupsdir is traversed to see if any new groups have been
             defined and should be considered for inclusion in configfile.

          •  When pmlogconf processes a group in configfile that is
             enabled, the list of metrics associated with the group is
             taken from the group file (and replaces any previous list of
             metrics associated with this group in configfile).

          •  When either the -r (reprobe) or the -c (auto-create) command
             line option is specified, every group (not just newly
             discovered ones) is reprocessed to see if it should be
             considered for inclusion in configfile.

          •  If a group is found in configfile but the corresponding group
             does not exist below groupsdir (as would be the case when a
             group is made obsolete by a PCP upgrade) then the handling of
             the group depends on the mode in which pmlogconf is being run.
             With -c the corresponding group is culled from configfile,
             otherwise the corresponding group is unchanged in configfile.
             In either case a warning is issued.

          Each group file is structured as follows:

          •  The first line must contain #pmlogconf-setup 2.0

          •  Other lines beginning with # are treated as comments.

          •  Blank lines are ignored.

          •  One or more lines starting with the keyword ident are used to
             provide the human-readable description of the group.

          •  Non-blank lines beginning with white space define metrics to
             be associated with this group, one per line.  Each metric
             specification follows the rules for a pmlogger(1)
             configuration, namely either the name of a non-leaf node in
             the PMNS (implying all descendent names in the PMNS), or the
             name of a leaf node in the PMNS optionally followed by one or
             more instance names enclosed by ``['' and ``]''.

          •  A control line starting with one of the keywords probe or
             force must be present.

          •  An optional logging interval control line begins with the
             keyword delta followed by one of the pmlogger(1) interval
             specification described above.

          •  probe control lines have the format:
                         probe metric [condition [state_rule] ]
             where metric is the name of a PCP metric (must be a leaf node
             in the PMNS, no instance specification is allowed, and it must
             not be a derived metric) and the optional condition is the
             keyword exists (true if metric exists, i.e. is defined in the
             PMNS) or the keyword values (true if metric exists in the PMNS
             and has one or more current values) or an expression of the
             form
                                         op val
             where op is one of the awk(1) operators (==, !=, >, >=, <, <=,
             ~ (regular expression match) or !~ (negated regular expression
             match)) and val is a value (arbitrary sequence of characters,
             excluding a space) and the condition is true if there is some
             instance of metric that makes the expression true.

             If the condition is missing, the default is exists.

             When an explicit condition is provided, there may also be an
             optional state_rule of the form
                               ? true_state : false_state
             where true_state (applies if condition is true) and
             false_state (applies if condition is false) are both taken
             from the keywords include (include and enable the group and
             the associated metrics in configfile), available (include and
             disable the group in configfile - a user action of y as
             described above is needed to enable the group and add the
             associated metrics into configfile) or exclude (the group is
             not considered for inclusion in configfile).

             The default state_rule is
                                 ? available : exclude

          •  force control lines begin with the keyword force followed by
             one of the states defined above, so one of the actions
             include, exclude or available is applied unconditionally to
             the group.

          Probing is only done when a new group is being added to
          configfile or when the -r command line option is specified.  The
          evaluation of the probing conditions is done by contacting
          pmcd(1) on hostname (defaults to local:).


-------------------------------------------------------

::

          The available command line options are:

          -c   Enable non-interactive, auto-create mode.

          -d groupdir, --groups=groupdir
               Specify the path to the groupsdir directory.

          -g grouptag, --group=grouptag
               Query logging state for the specific logging group named
               grouptag.

          -h host, --host=host
               Performance metrics source is pmcd(1) on host, rather than
               on the default localhost.

          -q, --quiet
               Quiet mode, suppress logging interval dialog.

          -r, --reprobe
               Reconsider every group for inclusion in the configfile.

          -s groupfile, --setup=groupfile
               Report the default logging state for the one logging group
               in groupfile.  This is equivalent output to that produced by
               the retired pmlogconf-setup shell script from earlier
               versions of PCP.

          -v, --verbose
               Enable verbose mode.

          -V, --version
               Display version number and exit.

          -?, --help
               Display usage message and exit.


-------------------------------------------------------

::

          The following group file demonstrates all of the supported
          syntactic elements.

          #pmlogconf-setup 2.0
          ident   Example group file
          ident   ... more description
          delta   1 minute
          probe   sample.secret.foo.one values ? include : exclude
                  sample.secret.foo.one
                  sample.secret.foo.bar   # non-leaf in the PMNS
                  sample.colour [ red green ]


-----------------------------------------------------------

::

          The current version of pmlogconf (2.0) supports a slightly
          different format for configfile compared to earlier versions.  If
          an old version configfile is presented to pmlogconf it will be
          converted to the new format.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          pmlogconf overrides any $PCP_DERIVED_CONFIG environment variable
          to an empty string, for performance reasons.

          pmlogconf honours the $PMCD_WAIT_TIMEOUT environment variable
          when probing and creating new pmlogger configuration files.  It
          uses a default timeout value of 10 seconds for this, in the
          absence of an environment setting.


---------------------------------------------------------

::

          pmcd(1), pmlogger(1), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                      PMLOGCONF(1)

--------------

Pages that refer to this page: `pcp(1) <../man1/pcp.1.html>`__, 
`pcpcompat(1) <../man1/pcpcompat.1.html>`__, 
`pmdasockets(1) <../man1/pmdasockets.1.html>`__, 
`pmlogctl(1) <../man1/pmlogctl.1.html>`__, 
`pmlogger_check(1) <../man1/pmlogger_check.1.html>`__, 
`pmrepconf(1) <../man1/pmrepconf.1.html>`__

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
