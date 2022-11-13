.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-daemon(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| START COMMAND <#START_COMMAND>`__ |                                   |
| \|                                |                                   |
| `STOP COMMAND <#STOP_COMMAND>`__  |                                   |
| \|                                |                                   |
| `SI                               |                                   |
| GNAL COMMAND <#SIGNAL_COMMAND>`__ |                                   |
| \|                                |                                   |
| `PING COMMAND <#PING_COMMAND>`__  |                                   |
| \| `CONFIG FILE <#CONFIG_FILE>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-DAEMON(1)                 perf Manual                PERF-DAEMON(1)

NAME
-------------------------------------------------

::

          perf-daemon - Run record sessions on background


---------------------------------------------------------

::

          perf daemon
          perf daemon [<options>]
          perf daemon start  [<options>]
          perf daemon stop   [<options>]
          perf daemon signal [<options>]
          perf daemon ping   [<options>]


---------------------------------------------------------------

::

          This command allows to run simple daemon process that starts and
          monitors configured record sessions.

          You can imagine perf daemon of background process with several
          perf record child tasks, like:

              # ps axjf
              ...
                   1  916507 ... perf daemon start
              916507  916508 ...  \_ perf record --control=fifo:control,ack -m 10M -e cycles --overwrite --switch-output -a
              916507  916509 ...  \_ perf record --control=fifo:control,ack -m 20M -e sched:* --overwrite --switch-output -a

          Not every perf record session is suitable for running under
          daemon. User need perf session that either produces data on
          query, like the flight recorder sessions in above example or
          session that is configured to produce data periodically, like
          with --switch-output configuration for time and size.

          Each session is started with control setup (with perf record
          --control options).

          Sessions are configured through config file, see CONFIG FILE
          section with EXAMPLES.


-------------------------------------------------------

::

          -v, --verbose
              Be more verbose.

          --config=<PATH>
              Config file path. If not provided, perf will check system and
              default locations (/etc/perfconfig, $HOME/.perfconfig).

          --base=<PATH>
              Base directory path. Each daemon instance is running on top
              of base directory. Only one instance of server can run on top
              of one directory at the time.

          All generic options are available also under commands.


-------------------------------------------------------------------

::

          The start command creates the daemon process.

          -f, --foreground
              Do not put the process in background.


-----------------------------------------------------------------

::

          The stop command stops all the session and the daemon process.


---------------------------------------------------------------------

::

          The signal command sends signal to configured sessions.

          --session
              Send signal to specific session.


-----------------------------------------------------------------

::

          The ping command sends control ping to configured sessions.

          --session
              Send ping to specific session.


---------------------------------------------------------------

::

          The daemon is configured within standard perf config file by
          following new variables:

          daemon.base: Base path for daemon data. All sessions data are
          stored under this path.

          session-<NAME>.run: Defines new record session. The value is
          record’s command line without the record keyword.

          Each perf record session is run in daemon.base/<NAME> directory.


---------------------------------------------------------

::

          Example with 2 record sessions:

              # cat ~/.perfconfig
              [daemon]
              base=/opt/perfdata

              [session-cycles]
              run = -m 10M -e cycles --overwrite --switch-output -a

              [session-sched]
              run = -m 20M -e sched:* --overwrite --switch-output -a

          Starting the daemon:

              # perf daemon start

          Check sessions:

              # perf daemon
              [603349:daemon] base: /opt/perfdata
              [603350:cycles] perf record -m 10M -e cycles --overwrite --switch-output -a
              [603351:sched] perf record -m 20M -e sched:* --overwrite --switch-output -a

          First line is daemon process info with configured daemon base.

          Check sessions with more info:

              # perf daemon -v
              [603349:daemon] base: /opt/perfdata
                output:  /opt/perfdata/output
                lock:    /opt/perfdata/lock
                up:      1 minutes
              [603350:cycles] perf record -m 10M -e cycles --overwrite --switch-output -a
                base:    /opt/perfdata/session-cycles
                output:  /opt/perfdata/session-cycles/output
                control: /opt/perfdata/session-cycles/control
                ack:     /opt/perfdata/session-cycles/ack
                up:      1 minutes
              [603351:sched] perf record -m 20M -e sched:* --overwrite --switch-output -a
                base:    /opt/perfdata/session-sched
                output:  /opt/perfdata/session-sched/output
                control: /opt/perfdata/session-sched/control
                ack:     /opt/perfdata/session-sched/ack
                up:      1 minutes

          The base path is daemon/session base. The lock file is daemon’s
          lock file guarding that no other daemon is running on top of the
          base. The output file is perf record output for specific session.
          The control and ack files are perf control files. The up number
          shows minutes daemon/session is running.

          Make sure control session is online:

              # perf daemon ping
              OK   cycles
              OK   sched

          Send USR2 signal to session cycles to generate perf.data file:

              # perf daemon signal --session cycles
              signal 12 sent to session 'cycles [603452]'

              # tail -2  /opt/perfdata/session-cycles/output
              [ perf record: dump data: Woken up 1 times ]
              [ perf record: Dump perf.data.2020123017013149 ]

          Send USR2 signal to all sessions:

              # perf daemon signal
              signal 12 sent to session 'cycles [603452]'
              signal 12 sent to session 'sched [603453]'

              # tail -2  /opt/perfdata/session-cycles/output
              [ perf record: dump data: Woken up 1 times ]
              [ perf record: Dump perf.data.2020123017024689 ]
              # tail -2  /opt/perfdata/session-sched/output
              [ perf record: dump data: Woken up 1 times ]
              [ perf record: Dump perf.data.2020123017024713 ]

          Stop daemon:

              # perf daemon stop


---------------------------------------------------------

::

          perf-record(1), perf-config(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the perf (Performance analysis tools for
          Linux (in Linux source tree)) project.  Information about the
          project can be found at 
          ⟨https://perf.wiki.kernel.org/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, send it to
          linux-kernel@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-26.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   perf                           2021-02-11                 PERF-DAEMON(1)

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
