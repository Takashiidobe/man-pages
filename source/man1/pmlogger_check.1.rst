.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlogger_check(1) — Linux manual page
=====================================

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
| \|                                |                                   |
| `COMPATIBILITY                    |                                   |
| ISSUES <#COMPATIBILITY_ISSUES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOGGER_CHECK(1)        General Commands Manual       PMLOGGER_CHECK(1)

NAME
-------------------------------------------------

::

          pmlogger_check, pmlogger_daily - administration of Performance
          Co-Pilot archive log files


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmlogger_check [-CNpqsTV?]  [-c control] [-l
          logfile]
          $PCP_BINADM_DIR/pmlogger_daily [-EfKMNoprRV?]  [-c control] [-k
          time] [-l logfile] [-m addresses] [-s size] [-t want] [-x time]
          [-X program] [-Y regex]


---------------------------------------------------------------

::

          These shell scripts and associated control files may be used to
          create a customized regime of administration and management for
          Performance Co-Pilot (see PCPIntro(1)) archive log files.

          pmlogger_check may be run at any time of the day and is intended
          to check that a desired set of pmlogger(1) processes are running.
          If not, it (re-)starts any missing logger processes.

          pmlogger_daily is intended to be run once per day, preferably in
          the early morning, as soon after midnight as practicable.  Its
          task is to aggregate, rotate and perform general housekeeping one
          or more sets of PCP archives.

          To accommodate the evolution of PMDAs and changes in production
          logging environments, pmlogger_daily is integrated with
          pmlogrewrite(1) to allow optional and automatic rewriting of
          archives before merging.  If there are global rewriting rules to
          be applied across all archives mentioned in the control file(s),
          then create the directory $PCP_SYSCONF_DIR/pmlogrewrite and place
          any pmlogrewrite(1) rewriting rules in this directory.  For
          rewriting rules that are specific to only one family of archives,
          use the directory name from the control file(s) - i.e. the fourth
          field - and create a file, or a directory, or a symbolic link
          named pmlogrewrite within this directory and place the required
          rewriting rule(s) in the pmlogrewrite file or in files within the
          pmlogrewrite subdirectory.  pmlogger_daily will choose rewriting
          rules from the archive directory if they exist, else rewriting
          rules from $PCP_SYSCONF_DIR/pmlogrewrite if that directory
          exists, else no rewriting is attempted.

          As an alternate mechanism, if the file
          $PCP_LOG_DIR/pmlogger/.NeedRewrite exists when pmlogger_daily
          starts then this is treated the same as specifying -R on the
          command line and $PCP_LOG_DIR/pmlogger/.NeedRewrite will be
          removed once all the rewriting has been done.


-------------------------------------------------------

::

          -c control, --control=control
               Both pmlogger_check and pmlogger_daily are controlled by PCP
               logger control file(s) that specifies the pmlogger instances
               to be managed.  The default control file is
               $PCP_PMLOGGERCONTROL_PATH, but an alternate may be specified
               using the -c option.  If the directory
               $PCP_PMLOGGERCONTROL_PATH.d (or control.d from the -c
               option) exists, then the contents of any additional control
               files therein will be appended to the main control file
               (which must exist).

          -C   This option causes pmlogger_check to query the system
               service runlevel information for pmlogger, and use that to
               determine whether to start processes or not.

          -E, --expunge
               This option causes pmlogger_daily to pass the -E flag to
               pmlogger_merge in order to expunge metrics with metadata
               inconsistencies and continue rather than fail.  This is
               intended for automated daily log rotation where it is highly
               desirable for unattended daily archive merging, rewriting
               and compression to succeed.  For further details, see
               pmlogger_merge(1) and description for the -x flag in
               pmlogextract(1).

          -f, --force
               This option causes pmlogger_daily to forces action.  Using
               this option in production is not recommended.

          -k time, --discard=time
               After some period, old PCP archives are discarded.  time is
               a time specification in the syntax of find-filter(1), so
               DD[:HH[:MM]].  The optional HH (hours) and MM (minutes)
               parts are 0 if not specified.  By default the time is 14:0:0
               or 14 days, but may be changed using this option.

               Some special values are recognized for the time, namely 0 to
               keep no archives beyond the the ones being currently written
               by pmlogger(1), and forever or never to prevent any archives
               being discarded.

               The time can also be set using the $PCP_CULLAFTER variable,
               set in either the environment or in a control file.  If both
               $PCP_CULLAFTER and -k specify different values for time then
               the environment variable value is used and a warning is
               issued.  I.e., if $PCP_CULLAFTER is set in the control file,
               it overrides -k given on the command line.

               Note that the semantics of time are that it is measured from
               the time of last modification of each archive, and not from
               the original archive creation date.  This has subtle
               implications for compression (see below) - the compression
               process results in the creation of new archive files which
               have new modification times.  In this case, the time period
               (re)starts from the time of compression.

          -K   When this option is specified for pmlogger_daily then only
               the compression tasks are attempted, so no pmlogger
               rotation, no culling, no rewriting, etc.  When -K is used
               and a period of 0 is in effect (from -x on the command line
               or $PCP_COMPRESSAFTER in the environment or via the control
               file) this is intended for environments where compression of
               archives is desired before the scheduled daily processing
               happens.  To achieve this, once pmlogger_check has completed
               regular processing, it calls pmlogger_daily with just the -K
               option.  Provided $PCP_COMPRESSAFTER is set to 0 along with
               any other required compression options to match the
               scheduled invocation of pmlogger_daily, then this will
               compress all volumes except the ones being currently written
               by pmlogger(1).  If $PCP_COMPRESSAFTER is set to a value
               greater than zero, then manually running pmlogger_daily with
               the -x option may be used to compress volumes that are
               younger than the $PCP_COMPRESSAFTER time.  This may be used
               to reclaim filesystem space by compressing volumes earlier
               than they would have otherwise been compressed.  Note that
               since the default value of $PCP_COMPRESSAFTER is 0 days, the
               -x option has no effect unless the control file has been
               edited and $PCP_COMPRESSAFTER has been set to a value
               greater than 0.

          -l file, --logfile=file
               In order to ensure that mail is not unintentionally sent
               when these scripts are run from cron(8) diagnostics are
               always sent to log files.  By default, this file is
               $PCP_LOG_DIR/pmlogger/pmlogger_check.log or
               $PCP_LOG_DIR/pmlogger/pmlogger_daily.log but this can be
               changed using the -l option.  If this log file already
               exists when the script starts, it will be renamed with a
               .prev suffix (overwriting any log file saved earlier) before
               diagnostics are generated to the log file.  The -l and -t
               options cannot be used together.

          -m addresses, --mail=addresses
               Use of this option causes pmlogger_daily to construct a
               summary of the ``notices'' file entries which were generated
               in the last 24 hours, and e-mail that summary to the set of
               space-separated addresses.  This daily summary is stored in
               the file $PCP_LOG_DIR/NOTICES.daily, which will be empty
               when no new ``notices'' entries were made in the previous 24
               hour period.

          -M   This option may be used to disable archive merging (or
               renaming) and rewriting (-M implies -r).  This is most
               useful in cases where the archives are being incrementally
               copied to a remote repository, e.g. using rsync(1).
               Merging, renaming and rewriting all risk an increase in the
               synchronization load, especially immediately after
               pmlogger_daily has run, so -M may be useful in these cases.

          -N, --showme
               This option enables a ``show me'' mode, where the programs
               actions are echoed, but not executed, in the style of ``make
               -n''.  Using -N in conjunction with -V maximizes the
               diagnostic capabilities for debugging.

          -o   By default all possible archives will be merged.  This
               option reinstates the old behaviour in which only
               yesterday's archives will be considered as merge candidates.
               In the special case where only a single input archive needs
               to be merged, pmlogmv(1) is used to rename the archive,
               otherwise pmlogger_merge(1) is used to merge all of the
               archives for a single host and a single day into a new PCP
               archive and the individual archives are removed.

          -p, --skip-primary
               If this option is specified for pmlogger_check then any line
               from the control files for the primary pmlogger will be
               ignored.  This option is intended for environments where
               some system daemon, like systemd(1), is responsible for
               controlling (starting, stopping, restarting, etc.) the
               primary pmlogger.

          -p   If this option is specified for pmlogger_daily then the
               status of the daily processing is polled and if the daily
               pmlogger(1) rotation, culling, rewriting, compressing, etc.
               has not been done in the last 24 hours then it is done now.
               The intent is to have pmlogger_daily called regularly with
               the -p option (at 30 mins past the hour, every hour in the
               default cron(8) set up) to ensure daily processing happens
               as soon as possible if it was missed at the regularly
               scheduled time (which is 00:10 by default), e.g. if the
               system was down or suspended at that time.  With this option
               pmlogger_daily simply exits if the previous day's processing
               has already been done.  The -K and -p options to
               pmlogger_daily are mutually exclusive.

          -q, --quick
               If this option is specified for pmlogger_check then the
               script will ``quickstart'' avoiding any optional processing
               like file compression.

          -r, --norewrite
               This command line option acts as an override and prevents
               all archive rewriting with pmlogrewrite(1) independent of
               the presence of any rewriting rule files or directories.

          -R, --rewriteall
               Sometimes PMDA changes require all archives to be rewritten,
               not just the ones involved in any current merging.  This is
               required for example after a PCP upgrade where a new version
               of an existing PMDA has revised metadata.  The -R command
               line forces this universal-style of rewriting.  The -R
               option to pmlogger_daily is mutually exclusive with both the
               -r and -M options.

          -s size, --rotate=size
               If the PCP ``notices'' file ($PCP_LOG_DIR/NOTICES) is larger
               than 20480 bytes, pmlogger_daily will rename the file with a
               ``.old'' suffix, and start a new ``notices'' file.  The
               rotate threshold may be changed from 20480 to size bytes
               using the -s option.

          -s, --stop
               Use of this option provides the reverse pmlogger_check
               functionality, allowing the set of pmlogger processes to be
               cleanly shutdown.

          -t period
               To assist with debugging or diagnosing intermittent failures
               the -t option may be used.  This will turn on very verbose
               tracing (-VV) and capture the trace output in a file named
               $PCP_LOG_DIR/pmlogger/daily.datestamp.trace, where datestamp
               is the time pmlogger_daily was run in the format
               YYYYMMDD.HH.MM.  In addition, the period argument will
               ensure that trace files created with -t will be kept for
               period days and then discarded.

          -T, --terse
               This option to pmlogger_check produces less verbose output
               than the default.  This is most suitable for a pmlogger
               ``farm'' where many instances of pmlogger are expected to be
               running.

          -V, --verbose
               The output from the cron execution of the scripts may be
               extended using the -V option to the scripts which will
               enable verbose tracing of their activity.  By default the
               scripts generate no output unless some error or warning
               condition is encountered.  Using -N in conjunction with -V
               maximizes the diagnostic capabilities for debugging.

          -x time, --compress-after=time
               Archive data files can optionally be compressed after some
               period to conserve disk space.  This is particularly useful
               for large numbers of pmlogger processes under the control of
               pmlogger_check.

               time is a time specification in the syntax of
               find-filter(1), so DD[:HH[:MM]].  The optional HH (hours)
               and MM (minutes) parts are 0 if not specified.

               Some special values are recognized for the time, namely 0 to
               apply compression as soon as possible, and forever or never
               to prevent any compression being done.

               If transparent_decompress is enabled when libpcp was built
               (can be checked with the pmconfig(1) -L option), then the
               default behaviour is compression ``as soon as possible''.
               Otherwise the default behaviour is to not compress files
               (which matches the historical default behaviour in earlier
               PCP releases).

               The time can also be set using the $PCP_COMPRESSAFTER
               variable, set in either the environment or in a control
               file.  If both $PCP_COMPRESSAFTER and -x specify different
               values for time then the environment variable value is used
               and a warning is issued.  For important other detailed notes
               concerning volume compression, see the -K and -k options
               (above).

          -X program, --compressor=program
               This option specifies the program to use for compression -
               by default this is xz(1).  The environment variable
               $PCP_COMPRESS may be used as an alternative mechanism to
               define program.  If both $PCP_COMPRESS and -X specify
               different compression programs then the environment variable
               value is used and a warning is issued.

          -Y regex, --regex=regex
               This option allows a regular expression to be specified
               causing files in the set of files matched for compression to
               be omitted - this allows only the data file to be
               compressed, and also prevents the program from attempting to
               compress it more than once.  The default regex is
               ".(index|Z|gz|bz2|zip|xz|lzma|lzo|lz4)$" - such files are
               filtered using the -v option to egrep(1).  The environment
               variable $PCP_COMPRESSREGEX may be used as an alternative
               mechanism to define regex.  If both $PCP_COMPRESSREGEX and
               -Y specify different values for regex then the environment
               variable value is used and a warning is issued.

          -?, --help
               Display usage message and exit.


-------------------------------------------------------------------

::

          Warning: The $PCP_PMLOGGERCONTROL_PATH file and files within the
          $PCP_PMLOGGERCONTROL_PATH.d directory must not be writable by any
          user other than root.

          The control file(s) should be customized according to the
          following rules that define for the current version (1.1) of the
          control file format.

          1.  Lines beginning with a ``#'' are comments.  A special case is
              lines beginning ``#!#''; these are control lines for a
              pmlogger(1) that has been stopped using pmlogctl(1).
          2.  Lines beginning with a ``$'' are assumed to be assignments to
              environment variables in the style of sh(1), and all text
              following the ``$'' will be eval'ed by the script reading the
              control file, and the corresponding variable exported into
              the environment.  This is particularly useful to set and
              export variables into the environment of the administrative
              scripts, e.g.
                  $ PMCD_CONNECT_TIMEOUT=20
          3.  There must be a version line in the initial control file of
              the form:
                  $ version=1.1
          4.  There should be one line in the control file(s) for each
              pmlogger instance of the form:

                  host y|n y|n directory args

          5.  Fields within a line of the control file(s) are usually
              separated by one or more spaces or tabs (although refer to
              the description of the directory field for some important
              exceptions).
          6.  The first field is the name of the host that is the source of
              the performance metrics for this pmlogger instance.
          7.  The second field indicates if this is a primary pmlogger
              instance (y) or not (n).  Since the primary logger must run
              on the local host, and there may be at most one primary
              logger for a particular host, this field can be y for at most
              one pmlogger instance, in which case the host name must be
              the name of the local host.
          8.  The third field indicates if this pmlogger instance needs to
              be started under the control of pmsocks(1) to connect to a
              pmcd through a firewall (y or n).
          9.  The fourth field is a directory name.  All files associated
              with this pmlogger instance will be created in this
              directory, and this will be the current directory for the
              execution of any programs required in the maintenance of
              those archives.  A useful convention is that primary logger
              archives for the local host with hostname myhost are
              maintained in the directory $PCP_ARCHIVE_DIR/myhost (this is
              where the default pmlogger start-up script in $PCP_RC_DIR/pcp
              will create the archives), while archives for the remote host
              mumble are maintained in $PCP_ARCHIVE_DIR/mumble.
          10. The directory field may contain embedded shell syntax that
              will be evaluated by sh(1) to produce the real directory name
              to be used.  The allowed constructs are:
              • Any text (including white space) enclosed with $( and ).
              • Any text (including white space) enclosed with ` and `
                (back quotes).
              • Any text (including white space) enclosed with " and "
                (double quotes).
              • Any word containing a $ (assumed to introduce an
                environment variable name).
          11. All other fields are interpreted as arguments to be passed to
              pmlogger(1).  Most typically this would be the -c option.

          The following sample control lines specify a primary logger on
          the local host (bozo), and non-primary loggers to collect and log
          performance metrics from the hosts wobbly and boing.

          $version=1.1
          bozo   y  n  $PCP_ARCHIVE_DIR/bozo   -c config.default
          wobbly n  n  "/store/wobbly/$(date +%Y)"  -c ./wobbly.config
          boing  n  n  $PCP_ARCHIVE_DIR/boing  -c ./pmlogger.config

          Typical crontab(5) entries for periodic execution of
          pmlogger_daily and pmlogger_check are given in
          $PCP_SYSCONF_DIR/pmlogger/crontab (unless installed by default in
          /etc/cron.d already) and shown below.

          # daily processing of archive logs
          14      0       *       *       *       $PCP_BINADM_DIR/pmlogger_daily
          # every 30 minutes, check pmlogger instances are running
          25,55   *       *       *       *       $PCP_BINADM_DIR/pmlogger_check

          When using systemd(1) on Linux, no crontab entries are needed as
          the timer mechanism provided by systemd is used instead.


---------------------------------------------------

::

          $PCP_PMLOGGERCONTROL_PATH
               the PCP logger control file.  For a new installation this
               file contains no pmlogger(1) control lines (the real control
               files are all in the $PCP_PMLOGGERCONTROL_PATH.d directory),
               but this file is still processed to support any legacy
               configurations therein from earlier PCP releases.
               Warning: this file must not be writable by any user other
               than root.

          $PCP_PMLOGGERCONTROL_PATH.d
               optional directory containing additional PCP logger control
               files, typically one per host
               Warning: the files herein must not be writable by any user
               other than root.

          $PCP_SYSCONF_DIR/pmlogger/crontab
               sample crontab for automated script execution by $PCP_USER
               (or root).  Exists only if the platform does not support the
               /etc/cron.d mechanism.

          $PCP_VAR_DIR/config/pmlogger/config.default
               default pmlogger configuration file location for the local
               primary logger, typically generated automatically by
               pmlogconf(1).

          $PCP_ARCHIVE_DIR/<hostname>
               default location for archives of performance information
               collected from the host hostname

          $PCP_ARCHIVE_DIR/<hostname>/lock
               transient lock file to guarantee mutual exclusion during
               pmlogger administration for the host hostname - if present,
               can be safely removed if neither pmlogger_daily nor
               pmlogger_check are running

          $PCP_ARCHIVE_DIR/<hostname>/Latest
               PCP archive folio created by mkaf(1) for the most recently
               launched archive containing performance metrics from the
               host hostname

          $PCP_LOG_DIR/NOTICES
               PCP ``notices'' file used by pmie(1) and friends

          $PCP_LOG_DIR/pmlogger/pmlogger_check.log
               if the previous execution of pmlogger_check produced any
               output it is saved here.  The normal case is no output in
               which case the file does not exist.

          $PCP_LOG_DIR/pmlogger/pmlogger_daily.log
               if the previous execution of pmlogger_daily produced any
               output it is saved here.  The normal case is no output in
               which case the file does not exist.

          $PCP_ARCHIVE_DIR/<hostname>/SaveLogs
               if this directory exists, then the log file from the -l
               argument of a newly launched pmlogger(1) for hostname will
               be linked into this directory with the name archive.log
               where archive is the basename of the associated pmlogger(1)
               PCP archive files.  This allows the log file to be inspected
               at a later time, even if several pmlogger(1) instances for
               hostname have been launched in the interim.  Because the
               cron-driven PCP archive management scripts run under the uid
               of the user ``pcp'', $PCP_ARCHIVE_DIR/hostname/SaveLogs
               typically needs to be owned by the user ``pcp''.

          $PCP_LOG_DIR/pmlogger/.NeedRewrite
               if this file exists, then this is treated as equivalent to
               using -R on the command line and the file will be removed
               once all rewriting has been done.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          The default behaviour, when pmlogger(1) configuration comes from
          pmlogconf(1), is to regenerate the configuration file and check
          for changes whenever pmlogger(1) is started from pmlogger_check.
          If the PMDA configuration is stable, this is not necessary, and
          setting $PMLOGGER_CHECK_SKIP_LOGCONF to yes disables the
          regeneration and checking.


---------------------------------------------------------------------------------

::

          Earlier versions of pmlogger_daily used find(1) to locate files
          for compressing or culling and the -k and -x options took only
          integer values to mean ``days''.  The semantics of this was quite
          loose given that find(1) offers different precision and semantics
          across platforms.

          The current implementation of pmlogger_daily uses find-filter(1)
          which provides high precision intervals and semantics that are
          relative to the time of execution and are consistent across
          platforms.


---------------------------------------------------------

::

          egrep(1), find-filter(1), PCPIntro(1), pmconfig(1), pmlc(1),
          pmlogconf(1), pmlogctl(1), pmlogger(1), pmlogger_daily_report(1),
          pmlogger_merge(1), pmlogextract(1), pmlogmv(1), pmlogrewrite(1),
          pmsocks(1), systemd(1), xz(1) and cron(8).

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

   Performance Co-Pilot               PCP                 PMLOGGER_CHECK(1)

--------------

Pages that refer to this page:
`find-filter(1) <../man1/find-filter.1.html>`__, 
`pcp-atop(1) <../man1/pcp-atop.1.html>`__, 
`pcp-atopsar(1) <../man1/pcp-atopsar.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmfind_check(1) <../man1/pmfind_check.1.html>`__, 
`pmlc(1) <../man1/pmlc.1.html>`__, 
`pmlogctl(1) <../man1/pmlogctl.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pmlogger_daily_report(1) <../man1/pmlogger_daily_report.1.html>`__, 
`pmlogger_merge(1) <../man1/pmlogger_merge.1.html>`__, 
`pmlogger_rewrite(1) <../man1/pmlogger_rewrite.1.html>`__, 
`pmloglabel(1) <../man1/pmloglabel.1.html>`__, 
`pmsearch(1) <../man1/pmsearch.1.html>`__, 
`pmsnap(1) <../man1/pmsnap.1.html>`__, 
`pmdiscoversetup(3) <../man3/pmdiscoversetup.3.html>`__, 
`LOGARCHIVE(5) <../man5/LOGARCHIVE.5.html>`__

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
