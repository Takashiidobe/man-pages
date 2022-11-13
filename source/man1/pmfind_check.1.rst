.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmfind_check(1) — Linux manual page
===================================

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

   PMFIND_CHECK(1)          General Commands Manual         PMFIND_CHECK(1)

NAME
-------------------------------------------------

::

          pmfind_check - administration of Performance Co-Pilot discovery


---------------------------------------------------------

::

          $PCP_BINADM_DIR/pmfind_check [-CNV?]  [-l logfile]


---------------------------------------------------------------

::

          This shell script is used to integrate the Performance Co-Pilot
          (see PCPIntro(1)) collector service discovery mechanisms with
          pmie(1) and pmlogger(1) service administration, such that
          multiple collector hosts can be monitored from a single
          centralized host.  It is important to note that the pmfind
          service is tightly integrated with the pmie and pmlogger
          services, and these must also be enabled if the services are to
          be started for each collector system that pmfind discovers.

          pmfind_check is designed to be enabled via a service management
          daemon such as systemd(1) on Linux.  It is run from a system
          timer (either by systemd or by cron on other systems).  Once per
          timer interval pmfind attempts discovery of PCP collector
          systems.  For each unique system found pmfind_check creates
          pmie_check and pmlogger_check control file entries, such that
          these latter process can manage one pmie and pmlogger service for
          each discovered collector system.

          When run through systemd these processes will be launched
          immediately because systemd monitors the service control files
          for changes.  With systemd one may also initiate an immediate
          service discovery with pmfind and pmfind_check by modifying the
          $PCP_SYSCONF_DIR/pmfind directory in any way.

          When run from cron the next (also timer-based) invocation of
          pmie_check or pmlogger_check will start and manage the associated
          pmie and pmlogger processes.

          The control file entries created by pmfind_check follow the
          convention of individual files for each collector host.  The
          files are named using the (unique) source identifier that pmfind
          calculates.  This identifier is a hash calculated based on (non-
          optional) context labels available from every collector host, and
          is the same source identifier reported and used by pminfo(1) and
          pmseries(1).


-------------------------------------------------------

::

          The available command line options are:

          -C, --containers
               This option causes pmfind_check to query each discovered
               collector system for running containers as well, which will
               then be individually monitored.

          -l file, --logfile=file
               In order to ensure that mail is not unintentionally sent
               when these scripts are run from cron(8) diagnostics are
               always sent to log files.  By default, this file is
               $PCP_LOG_DIR/pmfind/pmfind_check.log but this can be changed
               using the -l option.  If this log file already exists when
               the script starts, it will be renamed with a .prev suffix
               (overwriting any log file saved earlier) before diagnostics
               are generated to the new log file.

          -N, --showme
               This option enables a ``show me'' mode, where the programs
               actions are echoed, but not executed, in the style of ``make
               -n''.  Using -N in conjunction with -V maximizes the
               diagnostic capabilities for debugging.

          -V, --verbose
               The output from the cron execution of the scripts may be
               extended using the -V option to the scripts which will
               enable verbose tracing of their activity.  By default the
               scripts generate no output unless some error or warning
               condition is encountered.  Using -N in conjunction with -V
               maximizes the diagnostic capabilities for debugging.

          -?, --help
               Display usage message and exit.


-------------------------------------------------------------------

::

          The command line options passed to pmie and pmlogger can be
          customized via the $PCP_SYSCONFIG_DIR/pmfind configuration file.

          Refer to the pmie_check and pmlogger_check manual pages for
          details of the control file format generated by pmfind_check.

          By default, each collector system pmie logfile will be created in
          $PCP_LOG_DIR/pmie/source and pmlogger archives will be created
          below $PCP_ARCHIVE_DIR/source.  This is consistent with the way
          pmie(1) and pmlogger(1) maintain their activity logs and archive
          files.

          Typical crontab(5) entries for periodic execution of pmfind_check
          are given in $PCP_SYSCONF_DIR/pmfind/crontab (unless installed by
          default in /etc/cron.d already) and shown below.

          # every minute, discover remote PCP services
          *       *       *       *       *       $PCP_BINADM_DIR/pmfind_check
          When using systemd(1) on Linux, no crontab entries are needed as
          the timer and path mechanisms provided by systemd are used
          instead.


---------------------------------------------------

::

          $PCP_PMIECONTROL_PATH.d
               PCP inference engine control files for each discovered
               metric source, typically one per host or container.
               Warning: this files herein must not be writable by any user
               other than root.

          $PCP_PMLOGGERCONTROL_PATH.d
               PCP logger control files for each discovered metric source,
               typically one per host or container.
               Warning: this files herein must not be writable by any user
               other than root.

          $PCP_SYSCONFIG_DIR/pmfind
               default pmie and pmlogger command line arguments, and other
               parameters passed to pmfind.

          $PCP_SYSCONF_DIR/pmfind/crontab
               sample crontab for automated script execution by root -
               exists only if the platform does not support the /etc/cron.d
               mechanism.


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

          PCPIntro(1), pmcd(1), pmfind(1), pmie(1), pmie_check(1),
          pminfo(1), pmlogger(1), pmlogger_check(1), pmseries(1),
          systemd(1), crontab(5), and cron(8).

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

   Performance Co-Pilot               PCP                   PMFIND_CHECK(1)

--------------

Pages that refer to this page:
`pcpcompat(1) <../man1/pcpcompat.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__

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
