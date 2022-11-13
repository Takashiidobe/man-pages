.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdalogger(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INSTALLATION <#INSTALLATION>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDALOGGER(1)            General Commands Manual           PMDALOGGER(1)

NAME
-------------------------------------------------

::

          pmdalogger - log file performance metrics domain agent (PMDA)


---------------------------------------------------------

::

          $PCP_PMDAS_DIR/logger/pmdalogger [-d domain] [-l logfile] [-m
          memory] [-s interval] [-U username] [configfile]


---------------------------------------------------------------

::

          pmdalogger is a configurable log file monitoring Performance
          Metrics Domain Agent (PMDA).  It can be seen as analogous to the
          -f option to tail(1) and converts each new log line into a
          performance event.  It was the first PMDA to make extensive use
          of event metrics, which can be consumed by client tools like
          pmevent(1).

          The logger PMDA exports both event-style metrics reflecting
          timestamped event records for text logged to a file (or set of
          files or output from a process), as well as the more orthodox
          sample-style metrics such as event counts and throughput size
          values.

          The PMDA is configured via a configfile which contains one line
          for each source of events (file or process).  This file is setup
          by the Install script described in the later section on
          ``INSTALLATION'' of the PMDA.

          A brief description of the pmdalogger command line options
          follows:

          -d   It is absolutely crucial that the performance metrics domain
               number specified here is unique and consistent.  That is,
               domain should be different for every PMDA on the one host,
               and the same domain number should be used for the same PMDA
               on all hosts.

          -l   Location of the log file.  By default, a log file named
               logger.log is written in the current directory of pmcd(1)
               when pmdalogger is started, i.e.  $PCP_LOG_DIR/pmcd.  If the
               log file cannot be created or is not writable, output is
               written to the standard error instead.

          -m   Limit the physical memory used by the PMDA to buffer event
               records to maxsize bytes.  As log events arrive at the PMDA,
               they must be buffered until individual client tools request
               the next batch since their previous batch of events.  The
               default maximum is 2 megabytes.

          -s   Sets the polling interval for detecting newly arrived log
               lines.  Mirrors the same option from the tail(1) command.

          -U   User account under which to run the agent.  The default is
               the unprivileged "pcp" account in current versions of PCP,
               but in older versions the superuser account ("root") was
               used by default.


-----------------------------------------------------------------

::

          If you want access to the names, help text and values for the
          logger performance metrics, do the following as root:

               # cd $PCP_PMDAS_DIR/logger
               # ./Install

          This is an interactive installation process which prompts for
          each log file path to be monitored (or command to be run), a
          metric instance name to identify it, and whether access should be
          restricted (refer to the -x option to pmevent(1) for further
          details).

          If you want to undo the installation, do the following as root:

               # cd $PCP_PMDAS_DIR/logger
               # ./Remove

          pmdalogger is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


---------------------------------------------------

::

          $PCP_PMCDCONF_PATH
                 command line options used to launch pmdalogger
          $PCP_PMDAS_DIR/logger/logger.conf
                 default configuration file for the logger metrics
          $PCP_PMDAS_DIR/logger/help
                 default help text file for the logger metrics
          $PCP_PMDAS_DIR/logger/Install
                 installation script for the pmdalogger agent
          $PCP_PMDAS_DIR/logger/Remove
                 undo installation script for the pmdalogger agent
          $PCP_LOG_DIR/pmcd/logger.log
                 default log file for error messages and other information
                 from pmdalogger


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

          PCPIntro(1), pmevent(1), pmcd(1), tail(1), pcp.conf(5) and
          pcp.env(5).

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

   Performance Co-Pilot               PCP                     PMDALOGGER(1)

--------------

Pages that refer to this page: `pmda(3) <../man3/pmda.3.html>`__

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
