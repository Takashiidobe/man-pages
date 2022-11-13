.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

trace-cmd(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
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

   TRACE-CMD(1)                                                TRACE-CMD(1)

NAME
-------------------------------------------------

::

          trace-cmd - interacts with Ftrace Linux kernel internal tracer


---------------------------------------------------------

::

          trace-cmd COMMAND [OPTIONS]


---------------------------------------------------------------

::

          The trace-cmd(1) command interacts with the Ftrace tracer that is
          built inside the Linux kernel. It interfaces with the Ftrace
          specific files found in the debugfs file system under the tracing
          directory. A COMMAND must be specified to tell trace-cmd what to
          do.


---------------------------------------------------------

::

              record  - record a live trace and write a trace.dat file to the
                        local disk or to the network.

              report  - reads a trace.dat file and converts the binary data to a
                        ASCII text readable format.

              hist    - show a histogram of the events.

              stat    - show tracing (ftrace) status of the running system

              options - list the plugin options that are available to *report*

              start   - start the tracing without recording to a trace.dat file.

              stop    - stop tracing (only disables recording, overhead of tracer
                        is still in effect)

              restart - restart tracing from a previous stop (only effects recording)

              extract - extract the data from the kernel buffer and create a trace.dat
                        file.

              reset   - disables all tracing and gives back the system performance.
                        (clears all data from the kernel buffers)

              split   - splits a trace.dat file into smaller files.

              list    - list the available plugins or events that can be recorded.

              listen  - open up a port to listen for remote tracing connections.

              restore - restore the data files of a crashed run of trace-cmd record

              stack   - run and display the stack tracer

              check-events - parse format strings for all trace events and return
                             whether all formats are parseable


-------------------------------------------------------

::

          -h, --help
              Display the help text.

          Other options see the man page for the corresponding command.


---------------------------------------------------------

::

          trace-cmd-record(1), trace-cmd-report(1), trace-cmd-hist(1),
          trace-cmd-start(1), trace-cmd-stop(1), trace-cmd-extract(1),
          trace-cmd-reset(1), trace-cmd-restore(1), trace-cmd-stack(1),
          trace-cmd-split(1), trace-cmd-list(1), trace-cmd-listen(1),
          trace-cmd.dat(5), trace-cmd-check-events(1) trace-cmd-stat(1)


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

                                  05/27/2020                   TRACE-CMD(1)

--------------

Pages that refer to this page: `strace(1) <../man1/strace.1.html>`__, 
`trace-cmd-check-events(1) <../man1/trace-cmd-check-events.1.html>`__, 
`trace-cmd-clear(1) <../man1/trace-cmd-clear.1.html>`__, 
`trace-cmd-dump(1) <../man1/trace-cmd-dump.1.html>`__, 
`trace-cmd-extract(1) <../man1/trace-cmd-extract.1.html>`__, 
`trace-cmd-hist(1) <../man1/trace-cmd-hist.1.html>`__, 
`trace-cmd-list(1) <../man1/trace-cmd-list.1.html>`__, 
`trace-cmd-listen(1) <../man1/trace-cmd-listen.1.html>`__, 
`trace-cmd-mem(1) <../man1/trace-cmd-mem.1.html>`__, 
`trace-cmd-options(1) <../man1/trace-cmd-options.1.html>`__, 
`trace-cmd-profile(1) <../man1/trace-cmd-profile.1.html>`__, 
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
`trace-cmd-stream(1) <../man1/trace-cmd-stream.1.html>`__, 
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
