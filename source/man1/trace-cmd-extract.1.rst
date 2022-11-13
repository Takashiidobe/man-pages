.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

trace-cmd-extract(1) — Linux manual page
========================================

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

   TRACE-CMD-EXTRACT(1)                                TRACE-CMD-EXTRACT(1)

NAME
-------------------------------------------------

::

          trace-cmd-extract - extract out the data from the Ftrace Linux
          tracer.


---------------------------------------------------------

::

          trace-cmd extract [OPTIONS]


---------------------------------------------------------------

::

          The trace-cmd(1) extract is usually used after trace-cmd-start(1)
          and trace-cmd-stop(1). It can be used after the Ftrace tracer has
          been started manually through the Ftrace pseudo file system.

          The extract command creates a trace.dat file that can be used by
          trace-cmd-report(1) to read from. It reads the kernel internal
          ring buffer to produce the trace.dat file.


-------------------------------------------------------

::

          -p plugin
              Although extract does not start any traces, some of the
              plugins require just reading the output in ASCII format.
              These are the latency tracers, since the latency tracers have
              a separate internal buffer. The plugin option is therefore
              only necessary for the wakeup, wakeup-rt, irqsoff, preemptoff
              and preemptirqsoff plugins.

                  With out this option, the extract command will extract from the internal
                  Ftrace buffers.

          -O option
              If a latency tracer is being extracted, and the -p option is
              used, then there are some Ftrace options that can change the
              format. This will update those options before extracting. To
              see the list of options see trace-cmd-list. To enable an
              option, write its name, to disable the option append the
              characters no to it. For example: noprint-parent will disable
              the print-parent option that prints the parent function in
              printing a function event.

          -o outputfile
              By default, the extract command will create a trace.dat file.
              This option will change where the file is written to.

          -s
              Extract from the snapshot buffer (if the kernel supports it).

          --date
              This is the same as the trace-cmd-record(1) --date option,
              but it does cause the extract routine to disable all tracing.
              That is, the end of the extract will perform something
              similar to trace-cmd-reset(1).

          -B buffer-name
              If the kernel supports multiple buffers, this will extract
              the trace for only the given buffer. It does not affect any
              other buffer. This may be used multiple times to specify
              different buffers. When this option is used, the top level
              instance will not be extracted unless -t is given.

          -a
              Extract all existing buffer instances. When this option is
              used, the top level instance will not be extracted unless -t
              is given.

          -t
              Extracts the top level instance buffer. Without the -B or -a
              option this is the same as the default. But if -B or -a is
              used, this is required if the top level instance buffer
              should also be extracted.


---------------------------------------------------------

::

          trace-cmd(1), trace-cmd-record(1), trace-cmd-report(1),
          trace-cmd-start(1), trace-cmd-stop(1), trace-cmd-reset(1),
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

                                  05/27/2020           TRACE-CMD-EXTRACT(1)

--------------

Pages that refer to this page:
`trace-cmd(1) <../man1/trace-cmd.1.html>`__, 
`trace-cmd-check-events(1) <../man1/trace-cmd-check-events.1.html>`__, 
`trace-cmd-clear(1) <../man1/trace-cmd-clear.1.html>`__, 
`trace-cmd-hist(1) <../man1/trace-cmd-hist.1.html>`__, 
`trace-cmd-list(1) <../man1/trace-cmd-list.1.html>`__, 
`trace-cmd-listen(1) <../man1/trace-cmd-listen.1.html>`__, 
`trace-cmd-mem(1) <../man1/trace-cmd-mem.1.html>`__, 
`trace-cmd-options(1) <../man1/trace-cmd-options.1.html>`__, 
`trace-cmd-record(1) <../man1/trace-cmd-record.1.html>`__, 
`trace-cmd-report(1) <../man1/trace-cmd-report.1.html>`__, 
`trace-cmd-reset(1) <../man1/trace-cmd-reset.1.html>`__, 
`trace-cmd-restore(1) <../man1/trace-cmd-restore.1.html>`__, 
`trace-cmd-set(1) <../man1/trace-cmd-set.1.html>`__, 
`trace-cmd-show(1) <../man1/trace-cmd-show.1.html>`__, 
`trace-cmd-snapshot(1) <../man1/trace-cmd-snapshot.1.html>`__, 
`trace-cmd-split(1) <../man1/trace-cmd-split.1.html>`__, 
`trace-cmd-stack(1) <../man1/trace-cmd-stack.1.html>`__, 
`trace-cmd-start(1) <../man1/trace-cmd-start.1.html>`__, 
`trace-cmd-stat(1) <../man1/trace-cmd-stat.1.html>`__, 
`trace-cmd-stop(1) <../man1/trace-cmd-stop.1.html>`__, 
`trace-cmd.dat(5) <../man5/trace-cmd.dat.5.html>`__

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
