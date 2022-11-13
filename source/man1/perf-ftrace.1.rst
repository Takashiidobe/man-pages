.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-ftrace(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-FTRACE(1)                 perf Manual                PERF-FTRACE(1)

NAME
-------------------------------------------------

::

          perf-ftrace - simple wrapper for kernel's ftrace functionality


---------------------------------------------------------

::

          perf ftrace <command>


---------------------------------------------------------------

::

          The perf ftrace command is a simple wrapper of kernel’s ftrace
          functionality. It only supports single thread tracing currently
          and just reads trace_pipe in text and then write it to stdout.

          The following options apply to perf ftrace.


-------------------------------------------------------

::

          -t, --tracer=
              Tracer to use when neither -G nor -F option is not specified:
              function_graph or function.

          -v, --verbose
              Increase the verbosity level.

          -F, --funcs
              List available functions to trace. It accepts a pattern to
              only list interested functions.

          -p, --pid=
              Trace on existing process id (comma separated list).

          --tid=
              Trace on existing thread id (comma separated list).

          -D, --delay
              Time (ms) to wait before starting tracing after program
              start.

          -a, --all-cpus
              Force system-wide collection. Scripts run without a <command>
              normally use -a by default, while scripts run with a
              <command> normally don’t - this option allows the latter to
              be run in system-wide mode.

          -C, --cpu=
              Only trace for the list of CPUs provided. Multiple CPUs can
              be provided as a comma separated list with no space like:
              0,1. Ranges of CPUs are specified with -: 0-2. Default is to
              trace on all online CPUs.

          -m, --buffer-size
              Set the size of per-cpu tracing buffer, <size> is expected to
              be a number with appended unit character - B/K/M/G.

          --inherit
              Trace children processes spawned by our target.

          -T, --trace-funcs=
              Select function tracer and set function filter on the given
              function (or a glob pattern). Multiple functions can be given
              by using this option more than once. The function argument
              also can be a glob pattern. It will be passed to
              set_ftrace_filter in tracefs.

          -N, --notrace-funcs=
              Select function tracer and do not trace functions given by
              the argument. Like -T option, this can be used more than once
              to specify multiple functions (or glob patterns). It will be
              passed to set_ftrace_notrace in tracefs.

          --func-opts
              List of options allowed to set: call-graph - Display kernel
              stack trace for function tracer. irq-info - Display irq
              context info for function tracer.

          -G, --graph-funcs=
              Select function_graph tracer and set graph filter on the
              given function (or a glob pattern). This is useful to trace
              for functions executed from the given function. This can be
              used more than once to specify multiple functions. It will be
              passed to set_graph_function in tracefs.

          -g, --nograph-funcs=
              Select function_graph tracer and set graph notrace filter on
              the given function (or a glob pattern). Like -G option, this
              is useful for the function_graph tracer only and disables
              tracing for function executed from the given function. This
              can be used more than once to specify multiple functions. It
              will be passed to set_graph_notrace in tracefs.

          --graph-opts
              List of options allowed to set: nosleep-time - Measure on-CPU
              time only for function_graph tracer. noirqs - Ignore
              functions that happen inside interrupt. verbose - Show
              process names, PIDs, timestamps, etc. thresh=<n> - Setup
              trace duration threshold in microseconds. depth=<n> - Set max
              depth for function graph tracer to follow.


---------------------------------------------------------

::

          perf-record(1), perf-trace(1)

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

   perf                           2021-03-06                 PERF-FTRACE(1)

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
