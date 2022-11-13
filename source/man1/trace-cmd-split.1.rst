.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

trace-cmd-split(1) — Linux manual page
======================================

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

   TRACE-CMD-SPLIT(1)                                    TRACE-CMD-SPLIT(1)

NAME
-------------------------------------------------

::

          trace-cmd-split - split a trace.dat file into smaller files


---------------------------------------------------------

::

          trace-cmd split [OPTIONS] [start-time [end-time]]


---------------------------------------------------------------

::

          The trace-cmd(1) split is used to break up a trace.dat into small
          files. The start-time specifies where the new file will start at.
          Using trace-cmd-report(1) and copying the time stamp given at a
          particular event, can be used as input for either start-time or
          end-time. The split will stop creating files when it reaches an
          event after end-time. If only the end-time is needed, use 0.0 as
          the start-time.

          If start-time is left out, then the split will start at the
          beginning of the file. If end-time is left out, then split will
          continue to the end unless it meets one of the requirements
          specified by the options.


-------------------------------------------------------

::

          -i file
              If this option is not specified, then the split command will
              look for the file named trace.dat. This options will allow
              the reading of another file other than trace.dat.

          -o file
              By default, the split command will use the input file name as
              a basis of where to write the split files. The output file
              will be the input file with an attached '.#\' to the end:
              trace.dat.1, trace.dat.2, etc.

                  This option will change the name of the base file used.

                  -o file  will create file.1, file.2, etc.

          -s seconds
              This specifies how many seconds should be recorded before the
              new file should stop.

          -m milliseconds
              This specifies how many milliseconds should be recorded
              before the new file should stop.

          -u microseconds
              This specifies how many microseconds should be recorded
              before the new file should stop.

          -e events
              This specifies how many events should be recorded before the
              new file should stop.

          -p pages
              This specifies the number of pages that should be recorded
              before the new file should stop.

                  Note: only one of *-p*, *-e*, *-u*, *-m*, *-s* may be specified at a time.

                  If *-p* is specified, then *-c* is automatically set.

          -r
              This option causes the break up to repeat until end-time is
              reached (or end of the input if end-time is not specified).

                  trace-cmd split -r -e 10000

                  This will break up trace.dat into several smaller files, each with at most
                  10,000 events in it.

          -c
              This option causes the above break up to be per CPU.

                  trace-cmd split -c -p 10

                  This will create a file that has 10 pages per each CPU from the input.

          -C cpu
              This option will split for a single CPU. Only the cpu named
              will be extracted from the file.

                  trace-cmd split -C 1

                  This will split out all the events for cpu 1 in the file.


---------------------------------------------------------

::

          trace-cmd(1), trace-cmd-record(1), trace-cmd-report(1),
          trace-cmd-start(1), trace-cmd-stop(1), trace-cmd-extract(1),
          trace-cmd-reset(1), trace-cmd-list(1), trace-cmd-listen(1)


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

                                  05/27/2020             TRACE-CMD-SPLIT(1)

--------------

Pages that refer to this page:
`trace-cmd(1) <../man1/trace-cmd.1.html>`__, 
`trace-cmd-check-events(1) <../man1/trace-cmd-check-events.1.html>`__, 
`trace-cmd-clear(1) <../man1/trace-cmd-clear.1.html>`__, 
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
