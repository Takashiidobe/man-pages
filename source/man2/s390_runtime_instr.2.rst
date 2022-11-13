.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

s390_runtime_instr(2) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   S390_RUNTIME_INSTR(2)      System Calls Manual     S390_RUNTIME_INSTR(2)

NAME
-------------------------------------------------

::

          s390_runtime_instr - enable/disable s390 CPU run-time
          instrumentation


---------------------------------------------------------

::

          #include <asm/runtime_instr.h> /* Definition of S390_* constants */
          #include <sys/syscall.h>       /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_s390_runtime_instr, int command, int signum);

          Note: glibc provides no wrapper for s390_runtime_instr(),
          necessitating the use of syscall(2).


---------------------------------------------------------------

::

          The s390_runtime_instr() system call starts or stops CPU run-time
          instrumentation for the calling thread.

          The command argument controls whether run-time instrumentation is
          started (S390_RUNTIME_INSTR_START, 1) or stopped
          (S390_RUNTIME_INSTR_STOP, 2) for the calling thread.

          The signum argument specifies the number of a real-time signal.
          This argument was used to specify a signal number that should be
          delivered to the thread if the run-time instrumentation buffer
          was full or if the run-time-instrumentation-halted interrupt had
          occurred.  This feature was never used, and in Linux 4.4 support
          for this feature was removed; thus, in current kernels, this
          argument is ignored.


-----------------------------------------------------------------

::

          On success, s390_runtime_instr() returns 0 and enables the thread
          for run-time instrumentation by assigning the thread a default
          run-time instrumentation control block.  The caller can then read
          and modify the control block and start the run-time
          instrumentation.  On error, -1 is returned and errno is set to
          indicate the error.


-----------------------------------------------------

::

          EINVAL The value specified in command is not a valid command.

          EINVAL The value specified in signum is not a real-time signal
                 number.  From Linux 4.4 onwards, the signum argument has
                 no effect, so that an invalid signal number will not
                 result in an error.

          ENOMEM Allocating memory for the run-time instrumentation control
                 block failed.

          EOPNOTSUPP
                 The run-time instrumentation facility is not available.


---------------------------------------------------------

::

          This system call is available since Linux 3.7.


-------------------------------------------------------------------

::

          This Linux-specific system call is available only on the s390
          architecture.  The run-time instrumentation facility is available
          beginning with System z EC12.


---------------------------------------------------

::

          The asm/runtime_instr.h header file is available since Linux
          4.16.

          Starting with Linux 4.4, support for signalling was removed, as
          was the check whether signum is a valid real-time signal.  For
          backwards compatibility with older kernels, it is recommended to
          pass a valid real-time signal number in signum and install a
          handler for that signal.


---------------------------------------------------------

::

          syscall(2), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux Programmer's Manual      2021-03-22          S390_RUNTIME_INSTR(2)

--------------

Pages that refer to this page: `syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/s390_runtime_instr.2.license.html>`__

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
