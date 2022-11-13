.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-sched(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OPTIONS FOR PERF SCHED MAP       |                                   |
|  <#OPTIONS_FOR_PERF_SCHED_MAP>`__ |                                   |
| \|                                |                                   |
| `OPT                              |                                   |
| IONS FOR PERF SCHED TIMEHIST <#OP |                                   |
| TIONS_FOR_PERF_SCHED_TIMEHIST>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-SCHED(1)                  perf Manual                 PERF-SCHED(1)

NAME
-------------------------------------------------

::

          perf-sched - Tool to trace/measure scheduler properties
          (latencies)


---------------------------------------------------------

::

          perf sched {record|latency|map|replay|script|timehist}


---------------------------------------------------------------

::

          There are several variants of perf sched:

              'perf sched record <command>' to record the scheduling events
              of an arbitrary workload.

              'perf sched latency' to report the per task scheduling latencies
              and other scheduling properties of the workload.

              'perf sched script' to see a detailed trace of the workload that
               was recorded (aliased to 'perf script' for now).

              'perf sched replay' to simulate the workload that was recorded
              via perf sched record. (this is done by starting up mockup threads
              that mimic the workload based on the events in the trace. These
              threads can then replay the timings (CPU runtime and sleep patterns)
              of the workload as it occurred when it was recorded - and can repeat
              it a number of times, measuring its performance.)

              'perf sched map' to print a textual context-switching outline of
              workload captured via perf sched record.  Columns stand for
              individual CPUs, and the two-letter shortcuts stand for tasks that
              are running on a CPU. A '*' denotes the CPU that had the event, and
              a dot signals an idle CPU.

              'perf sched timehist' provides an analysis of scheduling events.

              Example usage:
                  perf sched record -- sleep 1
                  perf sched timehist

              By default it shows the individual schedule events, including the wait
              time (time between sched-out and next sched-in events for the task), the
              task scheduling delay (time between wakeup and actually running) and run
              time for the task:

                          time    cpu  task name             wait time  sch delay   run time
                                       [tid/pid]                (msec)     (msec)     (msec)
                -------------- ------  --------------------  ---------  ---------  ---------
                  79371.874569 [0011]  gcc[31949]                0.014      0.000      1.148
                  79371.874591 [0010]  gcc[31951]                0.000      0.000      0.024
                  79371.874603 [0010]  migration/10[59]          3.350      0.004      0.011
                  79371.874604 [0011]  <idle>                    1.148      0.000      0.035
                  79371.874723 [0005]  <idle>                    0.016      0.000      1.383
                  79371.874746 [0005]  gcc[31949]                0.153      0.078      0.022
              ...

              Times are in msec.usec.


-------------------------------------------------------

::

          -i, --input=<file>
              Input file name. (default: perf.data unless stdin is a fifo)

          -v, --verbose
              Be more verbose. (show symbol address, etc)

          -D, --dump-raw-trace=
              Display verbose dump of the sched data.

          -f, --force
              Don’t complain, do it.


---------------------------------------------------------------------------------------------

::

          --compact
              Show only CPUs with activity. Helps visualizing on high core
              count systems.

          --cpus
              Show just entries with activities for the given CPUs.

          --color-cpus
              Highlight the given cpus.

          --color-pids
              Highlight the given pids.


-------------------------------------------------------------------------------------------------------

::

          -k, --vmlinux=<file>
              vmlinux pathname

          --kallsyms=<file>
              kallsyms pathname

          -g, --call-graph
              Display call chains if present (default on).

          --max-stack
              Maximum number of functions to display in backtrace, default
              5.

          -C=, --cpu=
              Only show events for the given CPU(s) (comma separated list).

          -p=, --pid=
              Only show events for given process ID (comma separated list).

          -t=, --tid=
              Only show events for given thread ID (comma separated list).

          -s, --summary
              Show only a summary of scheduling by thread with min, max,
              and average run times (in sec) and relative stddev.

          -S, --with-summary
              Show all scheduling events followed by a summary by thread
              with min, max, and average run times (in sec) and relative
              stddev.

          --symfs=<directory>
              Look for files with symbols relative to this directory.

          -V, --cpu-visual
              Show visual aid for sched switches by CPU: i marks idle time,
              s are scheduler events.

          -w, --wakeups
              Show wakeup events.

          -M, --migrations
              Show migration events.

          -n, --next
              Show next task.

          -I, --idle-hist
              Show idle-related events only.

          --time
              Only analyze samples within given time window:
              <start>,<stop>. Times have the format seconds.microseconds.
              If start is not given (i.e., time string is ,x.y) then
              analysis starts at the beginning of the file. If stop time is
              not given (i.e, time string is x.y,) then analysis goes to
              end of file.

          --state
              Show task state when it switched out.


---------------------------------------------------------

::

          perf-record(1)

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

   perf                           2020-01-06                  PERF-SCHED(1)

--------------

Pages that refer to this page: `perf(1) <../man1/perf.1.html>`__

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
