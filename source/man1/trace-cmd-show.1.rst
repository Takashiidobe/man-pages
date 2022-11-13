.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

trace-cmd-show(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `COPYING <#COPYING>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   TRACE-CMD-SHOW(1)                                      TRACE-CMD-SHOW(1)

NAME
-------------------------------------------------

::

          trace-cmd-show - show the contents of the Ftrace Linux kernel
          tracing buffer.


---------------------------------------------------------

::

          trace-cmd show [OPTIONS]


---------------------------------------------------------------

::

          The trace-cmd(1) show displays the contents of one of the Ftrace
          Linux kernel tracing files: trace, snapshot, or trace_pipe. It is
          basically the equivalent of doing:

              cat /sys/kernel/debug/tracing/trace


-------------------------------------------------------

::

          -p
              Instead of displaying the contents of the "trace" file, use
              the "trace_pipe" file. The difference between the two is that
              the "trace" file is static. That is, if tracing is stopped,
              the "trace" file will show the same contents each time.

                  The "trace_pipe" file is a consuming read, where a read of the file
                  will consume the output of what was read and it will not read the
                  same thing a second time even if tracing is stopped. This file
                  als will block. If no data is available, trace-cmd show will stop
                  and wait for data to appear.

          -s
              Instead of reading the "trace" file, read the snapshot file.
              The snapshot is made by an application writing into it and
              the kernel will perform as swap between the currently active
              buffer and the current snapshot buffer. If no more swaps are
              made, the snapshot will remain static. This is not a
              consuming read.

          -c cpu
              Read only the trace file for a specified CPU.

          -f
              Display the full path name of the file that is being
              displayed.

          -B buf
              If a buffer instance was created, then the -B option will
              access the files associated with the given buffer.

          --tracing_on
              Show if tracing is on for the given instance.

          --current_tracer
              Show what the current tracer is.

          --buffer_size
              Show the current buffer size (per-cpu)

          --buffer_total_size
              Show the total size of all buffers.

          --ftrace_filter
              Show what function filters are set.

          --ftrace_notrace
              Show what function disabled filters are set.

          --ftrace_pid
              Show the PIDs the function tracer is limited to (if any).

          --graph_function
              Show the functions that will be graphed.

          --graph_notrace
              Show the functions that will not be graphed.

          --cpumask
              Show the mask of CPUs that tracing will trace.


---------------------------------------------------------

::

          trace-cmd(1), trace-cmd-record(1), trace-cmd-report(1),
          trace-cmd-start(1), trace-cmd-extract(1), trace-cmd-reset(1),
          trace-cmd-split(1), trace-cmd-list(1), trace-cmd-listen(1)


-----------------------------------------------------

::

          Written by Steven Rostedt, <rostedt@goodmis.org[1]>


-----------------------------------------------------------

::

          git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git


-------------------------------------------------------

::

          Copyright (C) 2010 Red Hat, Inc. Free use of this software is
          granted under the terms of the GNU Public License (GPL).


---------------------------------------------------

::

           1. rostedt@goodmis.org
              mailto:rostedt@goodmis.org

COLOPHON
---------------------------------------------------------

::

          This page is part of the trace-cmd (a front-end for Ftrace)
          project.  Information about the project can be found at [unknown
          -- if you know, please contact man-pages@man7.org] If you have a
          bug report for this manual page, send it to Steven Rostedt
          <rostedt@goodmis.org>.  This page was obtained from the project's
          upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-20.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  05/27/2020              TRACE-CMD-SHOW(1)

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
