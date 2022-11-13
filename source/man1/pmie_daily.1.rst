.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmie_check(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMIE_CHECK(1)            General Commands Manual           PMIE_CHECK(1)

NAME
-------------------------------------------------

::

          pmie_check, pmie_daily - administration of the Performance Co-
          Pilot inference engine


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmie_check [-CNsTV?]  [-c control] [-l logfile]
          $PCP_BINADM_DIR/pmie_daily [-NV?]  [-c control] [-k discard] [-l
          logfile] [-m addresses] [-x compress] [-X program] [-Y regex]


---------------------------------------------------------------

::

          This series of shell scripts and associated control files may be
          used to create a customized regime of administration and
          management for the Performance Co-Pilot (see PCPIntro(1))
          inference engine, pmie(1).

          pmie_check may be run at any time of the day and verifies that a
          desired set of pmie processes is running.  If not, it (re-)starts
          any missing inference engine processes.

          pmie_daily is intended to be run once per day, preferably in the
          early morning, as soon after midnight as practicable.  Its task
          is to rotate the log files for the running pmie processes - these
          files may grow without bound if the ``print'' action is used, or
          any other pmie action writes to its stdout/stderr streams.  After
          some period, old pmie log files are discarded.


-------------------------------------------------------

::

          The available command line options are:

          -c control, --control=control
               Both pmie_check and pmie_daily are controlled by PCP
               inference engine control file(s) that specify the pmie
               instances to be managed.  The default control file is
               $PCP_PMIECONTROL_PATH but an alternate may be specified
               using the -c option.  If the directory
               $PCP_PMLOGGERCONTROL_PATH.d (or control.d from the -c
               option) exists, then the contents of any additional control
               files therein will be appended to the main control file
               (which must exist).

          -C   This option causes pmie_check to query the system service
               runlevel information for pmie, and use that to determine
               whether to start processes or not.

          -k period, --discard=period
               The log retention period is 14 days by default, but this may
               be changed using this option.  Two special values are
               recognized for the discard period, namely 0 to keep no log
               files beyond the current one, and forever to prevent any log
               files being discarded.

          -l file, --logfile=file
               In order to ensure that mail is not unintentionally sent
               when these scripts are run from cron(8) diagnostics are
               always sent to log files.  By default, these files are
               $PCP_LOG_DIR/pmie/pmie_daily.log and
               $PCP_LOG_DIR/pmie/pmie_check.log but this can be changed
               using the -l option.  If this log file already exists when
               the script starts, it will be renamed with a .prev suffix
               (overwriting any log file saved earlier) before diagnostics
               are generated to the new log file.

          -m addresses, --mail=addresses
               Use of this option causes pmie_daily to construct a summary
               of the log files generated for all monitored hosts in the
               last 24 hours (lines matching `` OK '' are culled), and e-
               mail that summary to the set of space-separated addresses.

          -N, --showme
               This option enables a ``show me'' mode, where the programs
               actions are echoed, but not executed, in the style of ``make
               -n''.  Using -N in conjunction with -V maximizes the
               diagnostic capabilities for debugging.

          -s, --stop
               Use of this option provides the reverse pmie_check
               functionality, allowing the set of pmie processes to be
               cleanly shutdown.

          -T, --terse
               This option to pmie_check produces less verbose output than
               the default.  This is most suitable for a pmie ``farm''
               where many instances of pmie are expected to be running.

          -V, --verbose
               The output from the cron execution of the scripts may be
               extended using the -V option to the scripts which will
               enable verbose tracing of their activity.  By default the
               scripts generate no output unless some error or warning
               condition is encountered.  Using -N in conjunction with -V
               maximizes the diagnostic capabilities for debugging.

          -x period, --compress-after=period
               Log files can optionally be compressed after some period to
               conserve disk space.  This is particularly useful for large
               numbers of pmie processes under the control of pmie_check.
               The -x option specifies the number of days after which to
               compress archive data files.

          -X program, --compressor=program
               This option specifies the program to use for compression -
               by default this is xz(1).

          -Y regex, --regex=regex
               This option allows a regular expression to be specified
               causing files in the set of files matched for compression to
               be omitted - this allows only the data file to be
               compressed, and also prevents the program from attempting to
               compress it more than once.  The default regex is
               ".(meta|index|Z|gz|bz2|zip|xz|lzma|lzo|lz4)$" - such files
               are filtered using the -v option to egrep(1).

          -?, --help
               Display usage message and exit.


-------------------------------------------------------------------

::

          Warning: The $PCP_PMIECONTROL_PATH and $PCP_PMIECONTROL_PATH.d
          files must not be writable by any user other than root.

          The control file(s) should be customized according to the
          following rules that define for the current version (1.1) of the
          control file format.

          1.  Lines beginning with a ``#'' are comments.
          2.  Lines beginning with a ``$'' are assumed to be assignments to
              environment variables in the style of sh(1), and all text
              following the ``$'' will be eval'ed by the script reading the
              control file, and the corresponding variable exported into
              the environment.  This is particularly useful to set and
              export variables into the environment of the administrative
              script, e.g.
                  $ PMCD_CONNECT_TIMEOUT=20
          3.  There must be a version line in the initial control file of
              the form:
                  $ version=1.1
          4.  There should be one line in the control file(s) for each pmie
              instance of the form:

                  host y|n y|n logfile args

          5.  Fields within a line of the control file(s) are separated by
              one or more spaces or tabs.
          6.  The first field is the name of the host that is the default
              source of the performance metrics for this pmie instance.
          7.  The second field indicates if this is a primary pmie instance
              (y) or not (n).  Since the primary inference engine must run
              on the local host, and there may be at most one primary for a
              particular host, this field can be y for at most one pmie
              instance, in which case the host name must be the name of the
              local host.  When generating pmie configuration files, the
              primary clause indicates that pmieconf(1) should enable all
              rules in the primary group, in addition to all other default
              rules.
          8.  The third field indicates whether this pmie instance needs to
              be started under the control of pmsocks(1) to connect to a
              pmcd through a firewall (y or n).
          9.  The fourth field is the name of the pmie activity log file.
              A useful convention is that pmie instances monitoring the
              local host with hostname myhost are maintained in the
              directory $PCP_LOG_DIR/pmie/myhost, while activity logs for
              the remote host mumble are maintained in
              $PCP_LOG_DIR/pmie/mumble.  This is consistent with the way
              pmlogger(1) maintains its activity logs and archive files.
          10. All other fields are interpreted as arguments to be passed to
              pmie(1).  Most typically this would be the -c option.

          The following sample control lines specify one pmie instance
          monitoring the local host (wobbly), and another monitoring
          performance metrics from the host splat.

          wobbly  n  PCP_LOG_DIR/pmie/wobbly  -c config.default
          splat   n  PCP_LOG_DIR/pmie/splat   -c splat/cpu.conf

          Typical crontab(5) entries for periodic execution of pmie_daily
          and pmie_check are given in $PCP_SYSCONF_DIR/pmie/crontab (unless
          installed by default in /etc/cron.d already) and shown below.

          # daily processing of pmie logs
          08      0       *       *       *       $PCP_BINADM_DIR/pmie_daily
          # every 30 minutes, check pmie instances are running
          28,58   *       *       *       *       $PCP_BINADM_DIR/pmie_check
          When using systemd(1) on Linux, no crontab entries are needed as
          the timer mechanism provided by systemd is used instead.


---------------------------------------------------

::

          $PCP_PMIECONTROL_PATH
               the default PCP inference engine control file
               Warning: this file must not be writable by any user other
               than root.

          $PCP_PMIECONTROL_PATH.d
               optional directory containing additional PCP inference
               engine control files, typically one per host
               Warning: this files herein must not be writable by any user
               other than root.

          $PCP_SYSCONF_DIR/pmie/crontab
               sample crontab for automated script execution by $PCP_USER
               (or root) - exists only if the platform does not support the
               /etc/cron.d mechanism.

          $PCP_VAR_DIR/config/pmie/config.default
               default pmlogger configuration file location for a localhost
               inference engine, typically generated automatically by
               pmieconf(1).

          $PCP_LOG_DIR/pmie/pmie_check.log
               default location for the pmie_check log file.  When run as a
               daemon service, if the pmie process failed to start or
               exited early, there may be error messages in this file,
               particularly if the daemon could not open it's own log file.

          $PCP_LOG_DIR/pmie/pmie_daily.log
               default location for error messages generated during the
               daily pmie service maintenance operations.

          $PCP_LOG_DIR/pmie/<hostname>
               default directory location for the pmie log file for the
               host hostname

          $PCP_LOG_DIR/pmie/<hostname>/lock
               transient lock file to guarantee mutual exclusion during
               pmie administration for the host hostname - if present, can
               be safely removed if neither pmie_daily nor pmie_check are
               running

          $PCP_LOG_DIR/NOTICES
               PCP ``notices'' file used by pmie(1) and friends


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          egrep(1), PCPIntro(1), pmie(1), pmieconf(1), systemd(1), xz(1)
          and cron(8).

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

   Performance Co-Pilot               PCP                     PMIE_CHECK(1)

--------------

Pages that refer to this page:
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmfind_check(1) <../man1/pmfind_check.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pmieconf(1) <../man1/pmieconf.1.html>`__, 
`pmiestatus(1) <../man1/pmiestatus.1.html>`__

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
