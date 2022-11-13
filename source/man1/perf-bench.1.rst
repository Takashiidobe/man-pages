.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-bench(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CO                               |                                   |
| MMON OPTIONS <#COMMON_OPTIONS>`__ |                                   |
| \| `SUBSYSTEM <#SUBSYSTEM>`__ \|  |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-BENCH(1)                  perf Manual                 PERF-BENCH(1)

NAME
-------------------------------------------------

::

          perf-bench - General framework for benchmark suites


---------------------------------------------------------

::

          perf bench [<common options>] <subsystem> <suite> [<options>]


---------------------------------------------------------------

::

          This perf bench command is a general framework for benchmark
          suites.


---------------------------------------------------------------------

::

          -r, --repeat=
              Specify amount of times to repeat the run (default 10).

          -f, --format=
              Specify format style. Current available format styles are:

          default
              Default style. This is mainly for human reading.

              .ft C
              % perf bench sched pipe                      # with no style specified
              (executing 1000000 pipe operations between two tasks)
                      Total time:5.855 sec
                              5.855061 usecs/op
                              170792 ops/sec
              .ft

          simple
              This simple style is friendly for automated processing by
              scripts.

              .ft C
              % perf bench --format=simple sched pipe      # specified simple
              5.988
              .ft


-----------------------------------------------------------

::

          sched
              Scheduler and IPC mechanisms.

          syscall
              System call performance (throughput).

          mem
              Memory access performance.

          numa
              NUMA scheduling and MM benchmarks.

          futex
              Futex stressing benchmarks.

          epoll
              Eventpoll (epoll) stressing benchmarks.

          internals
              Benchmark internal perf functionality.

          all
              All benchmark subsystems.

      SUITES FOR sched
          messaging
              Suite for evaluating performance of scheduler and IPC
              mechanisms. Based on hackbench by Rusty Russell.

          Options of messaging
              -p, --pipe
                  Use pipe() instead of socketpair()

              -t, --thread
                  Be multi thread instead of multi process

              -g, --group=
                  Specify number of groups

              -l, --nr_loops=
                  Specify number of loops

          Example of messaging
                  .ft C
                  % perf bench sched messaging                 # run with default
                  options (20 sender and receiver processes per group)
                  (10 groups == 400 processes run)

                        Total time:0.308 sec

                  % perf bench sched messaging -t -g 20        # be multi-thread, with 20 groups
                  (20 sender and receiver threads per group)
                  (20 groups == 800 threads run)

                        Total time:0.582 sec
                  .ft

              pipe
                  Suite for pipe() system call. Based on pipe-test-1m.c by
                  Ingo Molnar.

          Options of pipe
              -l, --loop=
                  Specify number of loops.

          Example of pipe
                  .ft C
                  % perf bench sched pipe
                  (executing 1000000 pipe operations between two tasks)

                          Total time:8.091 sec
                                  8.091833 usecs/op
                                  123581 ops/sec

                  % perf bench sched pipe -l 1000              # loop 1000
                  (executing 1000 pipe operations between two tasks)

                          Total time:0.016 sec
                                  16.948000 usecs/op
                                  59004 ops/sec
                  .ft

      SUITES FOR syscall
          basic
              Suite for evaluating performance of core system call
              throughput (both usecs/op and ops/sec metrics). This uses a
              single thread simply doing getppid(2), which is a simple
              syscall where the result is not cached by glibc.

      SUITES FOR mem
          memcpy
              Suite for evaluating performance of simple memory copy in
              various ways.

          Options of memcpy
              -l, --size
                  Specify size of memory to copy (default: 1MB). Available
                  units are B, KB, MB, GB and TB (case insensitive).

              -f, --function
                  Specify function to copy (default: default). Available
                  functions are depend on the architecture. On x86-64,
                  x86-64-unrolled, x86-64-movsq and x86-64-movsb are
                  supported.

              -l, --nr_loops
                  Repeat memcpy invocation this number of times.

              -c, --cycles
                  Use perf’s cpu-cycles event instead of gettimeofday
                  syscall.

              memset
                  Suite for evaluating performance of simple memory set in
                  various ways.

          Options of memset
              -l, --size
                  Specify size of memory to set (default: 1MB). Available
                  units are B, KB, MB, GB and TB (case insensitive).

              -f, --function
                  Specify function to set (default: default). Available
                  functions are depend on the architecture. On x86-64,
                  x86-64-unrolled, x86-64-stosq and x86-64-stosb are
                  supported.

              -l, --nr_loops
                  Repeat memset invocation this number of times.

              -c, --cycles
                  Use perf’s cpu-cycles event instead of gettimeofday
                  syscall.

      SUITES FOR numa
          mem
              Suite for evaluating NUMA workloads.

      SUITES FOR futex
          hash
              Suite for evaluating hash tables.

          wake
              Suite for evaluating wake calls.

          wake-parallel
              Suite for evaluating parallel wake calls.

          requeue
              Suite for evaluating requeue calls.

          lock-pi
              Suite for evaluating futex lock_pi calls.

      SUITES FOR epoll
          wait
              Suite for evaluating concurrent epoll_wait calls.

          ctl
              Suite for evaluating multiple epoll_ctl calls.

      SUITES FOR internals
          synthesize
              Suite for evaluating perf’s event synthesis performance.


---------------------------------------------------------

::

          perf(1)

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

   perf                           2020-07-28                  PERF-BENCH(1)

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
