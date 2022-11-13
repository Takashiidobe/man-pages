.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

trace-cmd-dump(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   TRACE-CMD-DUMP(1)                                      TRACE-CMD-DUMP(1)

NAME
-------------------------------------------------

::

          trace-cmd-dump - show a meta data from a trace file, created by
          trace-cmd record


---------------------------------------------------------

::

          trace-cmd dump [OPTIONS] [input-file]


---------------------------------------------------------------

::

          The trace-cmd(1) dump command will display the meta data from a
          trace file created by trace-cmd record.


-------------------------------------------------------

::

          -i input-file
              By default, trace-cmd dump will read the file trace.dat. But
              the -i option open up the given input-file instead. Note, the
              input file may also be specified as the last item on the
              command line.

          -v, --validate
              Check if the input file is a valid trace file, created by
              trace-cmd.

          --summary
              Print a meta data summary - initial format and a short
              description of each file section. This is the default action,
              if no arguments are specified.

          --head-page
              Print the header page information, stored in the file.

          --head-event
              Print the event header information, stored in the file.

          --ftrace-events
              Print formats of ftrace specific events.

          --systems
              Print information of event systems, stored in the file - name
              and number of events for each system.

          --events
              Print formats of all events, stored in the file.

          --kallsyms
              Print information of the mapping of function addresses to the
              function names.

          --printk
              Print trace_printk() format strings, stored in the file.

          --cmd-lines
              Print mapping a PID to a process name.

          --options
              Print all options, stored in the file.

          --flyrecord
              Print the offset and the size of tracing data per each CPU.

          --all
              Print all meta data from the file.

          --help
              Print usage information.


---------------------------------------------------------

::

          # trace-cmd dump --summary -i trace.dat

              Tracing meta data in file trace.dat:
                     [Initial format]
                             6       [Version]
                             0       [Little endian]
                             8       [Bytes in a long]
                             4096    [Page size, bytes]
                     [Header info, 205 bytes]
                     [Header event, 205 bytes]
                     [Ftrace format, 15 events]
                     [Events format, 2 systems]
                     [Kallsyms, 7144493 bytes]
                     [Trace printk, 2131 bytes]
                     [Saved command lines, 117 bytes]
                     8 [CPUs with tracing data]
                     [12 options]
                     [Flyrecord tracing data]

              # trace-cmd dump --flyrecord -i trace.dat
                      [Flyrecord tracing data]
                               7176192 0      [offset, size of cpu 0]
                               7176192 0      [offset, size of cpu 1]
                               7176192 0      [offset, size of cpu 2]
                               7176192 4096   [offset, size of cpu 3]
                               7180288 4096   [offset, size of cpu 4]
                               7184384 0      [offset, size of cpu 5]
                               7184384 0      [offset, size of cpu 6]
                               7184384 0      [offset, size of cpu 7]

          # trace-cmd dump --summary --systems -i trace.dat

              Tracing meta data in file trace.dat:
                     [Initial format]
                             6       [Version]
                             0       [Little endian]
                             8       [Bytes in a long]
                             4096    [Page size, bytes]
                     [Header info, 205 bytes]
                     [Header event, 205 bytes]
                     [Ftrace format, 15 events]
                     [Events format, 3 systems]
                             sched 23 [system, events]
                             irq 5 [system, events]
                             kvm 70 [system, events]
                     [Kallsyms, 7144493 bytes]
                     [Trace printk, 2131 bytes]
                     [Saved command lines, 157 bytes]
                     8 [CPUs with tracing data]
                     [11 options]
                     [Flyrecord tracing data]

              # trace-cmd dump --summary --systems -i trace.dat
              File trace.dat is a valid trace-cmd file


---------------------------------------------------------

::

          trace-cmd(1), trace-cmd.dat(1)


-----------------------------------------------------

::

          Steven Rostedt <rostedt@goodmis.org[1]>, author of trace-cmd.
          Tzvetomir Stoyanov <tz.stoyanov@gmail.com[2]>, author of this man
          page.


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

           2. tz.stoyanov@gmail.com
              mailto:tz.stoyanov@gmail.com

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

                                  05/27/2020              TRACE-CMD-DUMP(1)

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
