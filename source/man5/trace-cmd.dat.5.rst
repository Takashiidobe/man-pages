.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

trace-cmd.dat(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `IN                               |                                   |
| ITIAL FORMAT <#INITIAL_FORMAT>`__ |                                   |
| \|                                |                                   |
| `HEADER INF                       |                                   |
| O FORMAT <#HEADER_INFO_FORMAT>`__ |                                   |
| \|                                |                                   |
| `FTRACE EVENT F                   |                                   |
| ORMATS <#FTRACE_EVENT_FORMATS>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| EVENT FORMATS <#EVENT_FORMATS>`__ |                                   |
| \|                                |                                   |
| `KALLSYMS INFOR                   |                                   |
| MATION <#KALLSYMS_INFORMATION>`__ |                                   |
| \|                                |                                   |
| `TRACE_PRINTK INFORMATI           |                                   |
| ON <#TRACE_PRINTK_INFORMATION>`__ |                                   |
| \|                                |                                   |
| `PROCESS INFO                     |                                   |
| RMATION <#PROCESS_INFORMATION>`__ |                                   |
| \|                                |                                   |
| `REST OF TRACE-CMD HEAD           |                                   |
| ER <#REST_OF_TRACE-CMD_HEADER>`__ |                                   |
| \| `CPU DATA <#CPU_DATA>`__ \|    |                                   |
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

   TRACE-CMD.DAT(5)                                        TRACE-CMD.DAT(5)

NAME
-------------------------------------------------

::

          trace-cmd.dat - trace-cmd file format


---------------------------------------------------------------

::

          The trace-cmd(1) utility produces a "trace.dat" file. The file
          may also be named anything depending if the user specifies a
          different output name, but it must have a certain binary format.
          The file is used by trace-cmd to save kernel traces into it and
          be able to extract the trace from it at a later point (see
          trace-cmd-report(1)).


---------------------------------------------------------------------

::

              The first three bytes contain the magic value:

              0x17 0x08  0x44

              The next 7 bytes contain the characters:

              "tracing"

              The next set of characters contain a null '\0' terminated string
              that contains the version of the file (for example):

              "6\0"

              The next 1 byte contains the flags for the file endianess:

              0 = little endian
              1 = big endian

              The next byte contains the number of bytes per "long" value:

              4 - 32-bit long values
              8 - 64-bit long values

              Note: This is the long size of the target's userspace. Not the
              kernel space size.

              [ Now all numbers are written in file defined endianess. ]

              The next 4 bytes are a 32-bit word that defines what the traced
              host machine page size was.


-----------------------------------------------------------------------------

::

              Directly after the initial format comes information about the
              trace headers recorded from the target box.

              The next 12 bytes contain the string:

              "header_page\0"

              The next 8 bytes are a 64-bit word containing the size of the
              page header information stored next.

              The next set of data is of the size read from the previous 8 bytes,
              and contains the data retrieved from debugfs/tracing/events/header_page.

              Note: The size of the second field \fBcommit\fR contains the target
              kernel long size. For example:

              field: local_t commit;        offset:8;       \fBsize:8;\fR   signed:1;

              shows the kernel has a 64-bit long.

              The next 13 bytes contain the string:

              "header_event\0"

              The next 8 bytes are a 64-bit word containing the size of the
              event header information stored next.

              The next set of data is of the size read from the previous 8 bytes
              and contains the data retrieved from debugfs/tracing/events/header_event.

              This data allows the trace-cmd tool to know if the ring buffer format
              of the kernel made any changes.


---------------------------------------------------------------------------------

::

              Directly after the header information comes the information about
              the Ftrace specific events. These are the events used by the Ftrace plugins
              and are not enabled by the event tracing.

              The next 4 bytes contain a 32-bit word of the number of Ftrace event
              format files that are stored in the file.

              For the number of times defined by the previous 4 bytes is the
              following:

              8 bytes for the size of the Ftrace event format file.

              The Ftrace event format file copied from the target machine:
              debugfs/tracing/events/ftrace/<event>/format


-------------------------------------------------------------------

::

              Directly after the Ftrace formats comes the information about
              the event layout.

              The next 4 bytes are a 32-bit word containing the number of
              event systems that are stored in the file. These are the
              directories in debugfs/tracing/events excluding the \fBftrace\fR
              directory.

              For the number of times defined by the previous 4 bytes is the
              following:

              A null-terminated string containing the system name.

              4 bytes containing a 32-bit word containing the number
              of events within the system.

              For the number of times defined in the previous 4 bytes is the
              following:

              8 bytes for the size of the event format file.

              The event format file copied from the target machine:
              debugfs/tracing/events/<system>/<event>/format


---------------------------------------------------------------------------------

::

              Directly after the event formats comes the information of the mapping
              of function addresses to the function names.

              The next 4 bytes are a 32-bit word containing the size of the
              data holding the function mappings.

              The next set of data is of the size defined by the previous 4 bytes
              and contains the information from the target machine's file:
              /proc/kallsyms


-----------------------------------------------------------------------------------------

::

              If a developer used trace_printk() within the kernel, it may
              store the format string outside the ring buffer.
              This information can be found in:
              debugfs/tracing/printk_formats

              The next 4 bytes are a 32-bit word containing the size of the
              data holding the printk formats.

              The next set of data is of the size defined by the previous 4 bytes
              and contains the information from debugfs/tracing/printk_formats.


-------------------------------------------------------------------------------

::

              Directly after the trace_printk formats comes the information mapping
              a PID to a process name.

              The next 8 bytes contain a 64-bit word that holds the size of the
              data mapping the PID to a process name.

              The next set of data is of the size defined by the previous 8 bytes
              and contains the information from debugfs/tracing/saved_cmdlines.


-----------------------------------------------------------------------------------------

::

              Directly after the process information comes the last bit of the
              trace.dat file header.

              The next 4 bytes are a 32-bit word defining the number of CPUs that
              were discovered on the target machine (and has matching trace data
              for it).

              The next 10 bytes are one of the following:

              "options  \0"

              "latency  \0"

              "flyrecord\0"

              If it is "options  \0" then:

              The next 2 bytes are a 16-bit word defining the current option.
              If the the value is zero then there are no more options.

              Otherwise, the next 4 bytes contain a 32-bit word containing the
              option size. If the reader does not know how to handle the option
              it can simply skip it. Currently there are no options defined,
              but this is here to extend the data.

              The next option will be directly after the previous option, and
              the options ends with a zero in the option type field.

              The next 10 bytes after the options are one of the following:

              "latency  \0"

              "flyrecord\0"

              which would follow the same as if options were not present.

              If the value is "latency  \0", then the rest of the file is
              simply ASCII text that was taken from the target's:
              debugfs/tracing/trace

              If the value is "flyrecord\0", the following is present:

              For the number of CPUs that were read earlier, the
              following is present:

              8 bytes that are a 64-bit word containing the offset into the file
              that holds the data for the CPU.

              8 bytes that are a 64-bit word containing the size of the CPU
              data at that offset.


---------------------------------------------------------

::

              The CPU data is located in the part of the file that is specified
              in the end of the header. Padding is placed between the header and
              the CPU data, placing the CPU data at a page aligned (target page) position
              in the file.

              This data is copied directly from the Ftrace ring buffer and is of the
              same format as the ring buffer specified by the event header files
              loaded in the header format file.

              The trace-cmd tool will try to \fBmmap(2)\fR the data page by page with the
              target's page size if possible. If it fails to mmap, it will just read the
              data instead.


---------------------------------------------------------

::

          trace-cmd(1), trace-cmd-record(1), trace-cmd-report(1),
          trace-cmd-start(1), trace-cmd-stop(1), trace-cmd-extract(1),
          trace-cmd-reset(1), trace-cmd-split(1), trace-cmd-list(1),
          trace-cmd-listen(1), trace-cmd.dat(5)


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

                                  05/16/2020               TRACE-CMD.DAT(5)

--------------

Pages that refer to this page:
`trace-cmd(1) <../man1/trace-cmd.1.html>`__, 
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
