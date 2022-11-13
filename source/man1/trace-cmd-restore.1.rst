.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

trace-cmd-restore(1) — Linux manual page
========================================

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

   TRACE-CMD-RESTORE(1)                                TRACE-CMD-RESTORE(1)

NAME
-------------------------------------------------

::

          trace-cmd-restore - restore a failed trace record


---------------------------------------------------------

::

          trace-cmd restore [OPTIONS] [command] cpu-file [cpu-file ...]


---------------------------------------------------------------

::

          The trace-cmd(1) restore command will restore a crashed
          trace-cmd-record(1) file. If for some reason a trace-cmd record
          fails, it will leave a the per-cpu data files and not create the
          final trace.dat file. The trace-cmd restore will append the files
          to create a working trace.dat file that can be read with
          trace-cmd-report(1).

          When trace-cmd record runs, it spawns off a process per CPU and
          writes to a per cpu file usually called trace.dat.cpuX, where X
          represents the CPU number that it is tracing. If the -o option
          was used in the trace-cmd record, then the CPU data files will
          have that name instead of the trace.dat name. If a unexpected
          crash occurs before the tracing is finished, then the per CPU
          files will still exist but there will not be any trace.dat file
          to read from. trace-cmd restore will allow you to create a
          trace.dat file with the existing data files.


-------------------------------------------------------

::

          -c
              Create a partial trace.dat file from the machine, to be used
              with a full trace-cmd restore at another time. This option is
              useful for embedded devices. If a server contains the cpu
              files of a crashed trace-cmd record (or trace-cmd listen),
              trace-cmd restore can be executed on the embedded device with
              the -c option to get all the stored information of that
              embedded device. Then the file created could be copied to the
              server to run the trace-cmd restore there with the cpu files.

                  If *-o* is not specified, then the file created will be called
                  'trace-partial.dat'. This is because the file is not a full version
                  of something that trace-cmd-report(1) could use.

          -t tracing_dir
              Used with -c, it overrides the location to read the events
              from. By default, tracing information is read from the
              debugfs/tracing directory.  -t will use that location
              instead. This can be useful if the trace.dat file to create
              is from another machine. Just tar -cvf events.tar
              debugfs/tracing and copy and untar that file locally, and use
              that directory instead.

          -k kallsyms
              Used with -c, it overrides where to read the kallsyms file
              from. By default, /proc/kallsyms is used.  -k will override
              the file to read the kallsyms from. This can be useful if the
              trace.dat file to create is from another machine. Just copy
              the /proc/kallsyms file locally, and use -k to point to that
              file.

          -o output'
              By default, trace-cmd restore will create a trace.dat file
              (or trace-partial.dat if -c is specified). You can specify a
              different file to write to with the -o option.

          -i input
              By default, trace-cmd restore will read the information of
              the current system to create the initial data stored in the
              trace.dat file. If the crash was on another machine, then
              that machine should have the trace-cmd restore run with the
              -c option to create the trace.dat partial file. Then that
              file can be copied to the current machine where trace-cmd
              restore will use -i to load that file instead of reading from
              the current system.


---------------------------------------------------------

::

          If a crash happened on another box, you could run:

              $ trace-cmd restore -c -o box-partial.dat

          Then on the server that has the cpu files:

              $ trace-cmd restore -i box-partial.dat trace.dat.cpu0 trace.dat.cpu1

          This would create a trace.dat file for the embedded box.


---------------------------------------------------------

::

          trace-cmd(1), trace-cmd-record(1), trace-cmd-report(1),
          trace-cmd-start(1), trace-cmd-stop(1), trace-cmd-extract(1),
          trace-cmd-reset(1), trace-cmd-split(1), trace-cmd-list(1),
          trace-cmd-listen(1)


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

                                  05/27/2020           TRACE-CMD-RESTORE(1)

--------------

Pages that refer to this page:
`trace-cmd(1) <../man1/trace-cmd.1.html>`__

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
