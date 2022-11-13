.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-timechart(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `TIMECHAR                         |                                   |
| T OPTIONS <#TIMECHART_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `RE                               |                                   |
| CORD OPTIONS <#RECORD_OPTIONS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-TIMECHART(1)              perf Manual             PERF-TIMECHART(1)

NAME
-------------------------------------------------

::

          perf-timechart - Tool to visualize total system behavior during a
          workload


---------------------------------------------------------

::


---------------------------------------------------------------

::

          There are two variants of perf timechart:

              'perf timechart record <command>' to record the system level events
              of an arbitrary workload. By default timechart records only scheduler
              and CPU events (task switches, running times, CPU power states, etc),
              but it's possible to record IO (disk, network) activity using -I argument.

              'perf timechart' to turn a trace into a Scalable Vector Graphics file,
              that can be viewed with popular SVG viewers such as 'Inkscape'. Depending
              on the events in the perf.data file, timechart will contain scheduler/cpu
              events or IO events.

              In IO mode, every bar has two charts: upper and lower.
              Upper bar shows incoming events (disk reads, ingress network packets).
              Lower bar shows outgoing events (disk writes, egress network packets).
              There are also poll bars which show how much time application spent
              in poll/epoll/select syscalls.


---------------------------------------------------------------------------

::

          -o, --output=
              Select the output file (default: output.svg)

          -i, --input=
              Select the input file (default: perf.data unless stdin is a
              fifo)

          -w, --width=
              Select the width of the SVG file (default: 1000)

          -P, --power-only
              Only output the CPU power section of the diagram

          -T, --tasks-only
              Don’t output processor state transitions

          -p, --process
              Select the processes to display, by name or PID

          -f, --force
              Don’t complain, do it.

          --symfs=<directory>
              Look for files with symbols relative to this directory.

          -n, --proc-num
              Print task info for at least given number of tasks.

          -t, --topology
              Sort CPUs according to topology.

          --highlight=<duration_nsecs|task_name>
              Highlight tasks (using different color) that run more than
              given duration or tasks with given name. If number is given
              it’s interpreted as number of nanoseconds. If non-numeric
              string is given it’s interpreted as task name.

          --io-skip-eagain
              Don’t draw EAGAIN IO events.

          --io-min-time=<nsecs>
              Draw small events as if they lasted min-time. Useful when you
              need to see very small and fast IO. It’s possible to specify
              ms or us suffix to specify time in milliseconds or
              microseconds. Default value is 1ms.

          --io-merge-dist=<nsecs>
              Merge events that are merge-dist nanoseconds apart. Reduces
              number of figures on the SVG and makes it more
              render-friendly. It’s possible to specify ms or us suffix to
              specify time in milliseconds or microseconds. Default value
              is 1us.


---------------------------------------------------------------------

::

          -P, --power-only
              Record only power-related events

          -T, --tasks-only
              Record only tasks-related events

          -I, --io-only
              Record only io-related events

          -g, --callchain
              Do call-graph (stack chain/backtrace) recording


---------------------------------------------------------

::

          $ perf timechart record git pull

              [ perf record: Woken up 13 times to write data ]
              [ perf record: Captured and wrote 4.253 MB perf.data (~185801 samples) ]

          $ perf timechart

              Written 10.2 seconds of trace to output.svg.

          Record system-wide timechart:

              $ perf timechart record

              then generate timechart and highlight 'gcc' tasks:

              $ perf timechart --highlight gcc

          Record system-wide IO events:

              $ perf timechart record -I

              then generate timechart:

              $ perf timechart


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

   perf                           2017-11-16              PERF-TIMECHART(1)

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
