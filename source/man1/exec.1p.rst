.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

exec(1p) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OPERANDS <#OPERANDS>`__ \|       |                                   |
| `STDIN <#STDIN>`__ \|             |                                   |
| `INPUT FILES <#INPUT_FILES>`__ \| |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \|                                |                                   |
| `ASYNCHRONOUS                     |                                   |
|  EVENTS <#ASYNCHRONOUS_EVENTS>`__ |                                   |
| \| `STDOUT <#STDOUT>`__ \|        |                                   |
| `STDERR <#STDERR>`__ \|           |                                   |
| `OUTPUT FILES <#OUTPUT_FILES>`__  |                                   |
| \|                                |                                   |
| `EXTENDED DESCR                   |                                   |
| IPTION <#EXTENDED_DESCRIPTION>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \|                                |                                   |
| `CONSEQUENCES OF ER               |                                   |
| RORS <#CONSEQUENCES_OF_ERRORS>`__ |                                   |
| \|                                |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `RATIONALE <#RATIONALE>`__ \|     |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   EXEC(1P)                POSIX Programmer's Manual               EXEC(1P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          exec — execute commands and open, close, or copy file descriptors


---------------------------------------------------------

::

          exec [command [argument...]]


---------------------------------------------------------------

::

          The exec utility shall open, close, and/or copy file descriptors
          as specified by any redirections as part of the command.

          If exec is specified without command or arguments, and any file
          descriptors with numbers greater than 2 are opened with
          associated redirection statements, it is unspecified whether
          those file descriptors remain open when the shell invokes another
          utility.  Scripts concerned that child shells could misuse open
          file descriptors can always close them explicitly, as shown in
          one of the following examples.

          If exec is specified with command, it shall replace the shell
          with command without creating a new process. If arguments are
          specified, they shall be arguments to command.  Redirection
          affects the current shell execution environment.


-------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          See the DESCRIPTION.


---------------------------------------------------

::

          Not used.


---------------------------------------------------------------

::

          None.


-----------------------------------------------------------------------------------

::

          None.


-------------------------------------------------------------------------------

::

          Default.


-----------------------------------------------------

::

          Not used.


-----------------------------------------------------

::

          The standard error shall be used only for diagnostic messages.


-----------------------------------------------------------------

::

          None.


---------------------------------------------------------------------------------

::

          None.


---------------------------------------------------------------

::

          If command is specified, exec shall not return to the shell;
          rather, the exit status of the process shall be the exit status
          of the program implementing command, which overlaid the shell. If
          command is not found, the exit status shall be 127. If command is
          found, but it is not an executable utility, the exit status shall
          be 126. If a redirection error occurs (see Section 2.8.1,
          Consequences of Shell Errors), the shell shall exit with a value
          in the range 1-125. Otherwise, exec shall return a zero exit
          status.


-------------------------------------------------------------------------------------

::

          Default.

          The following sections are informative.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Open readfile as file descriptor 3 for reading:

              exec 3< readfile

          Open writefile as file descriptor 4 for writing:

              exec 4> writefile

          Make file descriptor 5 a copy of file descriptor 0:

              exec 5<&0

          Close file descriptor 3:

              exec 3<&-

          Cat the file maggie by replacing the current shell with the cat
          utility:

              exec cat maggie


-----------------------------------------------------------

::

          Most historical implementations were not conformant in that:

              foo=bar exec cmd

          did not pass foo to cmd.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.14, Special Built-In Utilities


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                          EXEC(1P)

--------------

Pages that refer to this page:
`fcntl.h(0p) <../man0/fcntl.h.0p.html>`__, 
`stdarg.h(0p) <../man0/stdarg.h.0p.html>`__, 
`unistd.h(0p) <../man0/unistd.h.0p.html>`__, 
`awk(1p) <../man1/awk.1p.html>`__,  `c99(1p) <../man1/c99.1p.html>`__, 
`command(1p) <../man1/command.1p.html>`__, 
`fort77(1p) <../man1/fort77.1p.html>`__, 
`make(1p) <../man1/make.1p.html>`__, 
`newgrp(1p) <../man1/newgrp.1p.html>`__, 
`sh(1p) <../man1/sh.1p.html>`__, 
`xargs(1p) <../man1/xargs.1p.html>`__, 
`aio_error(3p) <../man3/aio_error.3p.html>`__, 
`aio_read(3p) <../man3/aio_read.3p.html>`__, 
`aio_return(3p) <../man3/aio_return.3p.html>`__, 
`aio_write(3p) <../man3/aio_write.3p.html>`__, 
`alarm(3p) <../man3/alarm.3p.html>`__, 
`atexit(3p) <../man3/atexit.3p.html>`__, 
`chmod(3p) <../man3/chmod.3p.html>`__, 
`close(3p) <../man3/close.3p.html>`__, 
`confstr(3p) <../man3/confstr.3p.html>`__, 
`environ(3p) <../man3/environ.3p.html>`__, 
`exit(3p) <../man3/exit.3p.html>`__, 
`fcntl(3p) <../man3/fcntl.3p.html>`__, 
`fexecve(3p) <../man3/fexecve.3p.html>`__, 
`fork(3p) <../man3/fork.3p.html>`__, 
`fstatvfs(3p) <../man3/fstatvfs.3p.html>`__, 
`getenv(3p) <../man3/getenv.3p.html>`__, 
`getitimer(3p) <../man3/getitimer.3p.html>`__, 
`getopt(3p) <../man3/getopt.3p.html>`__, 
`getpgid(3p) <../man3/getpgid.3p.html>`__, 
`getpgrp(3p) <../man3/getpgrp.3p.html>`__, 
`getpid(3p) <../man3/getpid.3p.html>`__, 
`getppid(3p) <../man3/getppid.3p.html>`__, 
`getrlimit(3p) <../man3/getrlimit.3p.html>`__, 
`getsid(3p) <../man3/getsid.3p.html>`__, 
`glob(3p) <../man3/glob.3p.html>`__, 
`lio_listio(3p) <../man3/lio_listio.3p.html>`__, 
`mknod(3p) <../man3/mknod.3p.html>`__, 
`mlock(3p) <../man3/mlock.3p.html>`__, 
`mlockall(3p) <../man3/mlockall.3p.html>`__, 
`mmap(3p) <../man3/mmap.3p.html>`__, 
`nice(3p) <../man3/nice.3p.html>`__, 
`open(3p) <../man3/open.3p.html>`__, 
`posix_spawn(3p) <../man3/posix_spawn.3p.html>`__, 
`posix_trace_create(3p) <../man3/posix_trace_create.3p.html>`__, 
`posix_trace_event(3p) <../man3/posix_trace_event.3p.html>`__, 
`posix_trace_eventid_equal(3p) <../man3/posix_trace_eventid_equal.3p.html>`__, 
`posix_typed_mem_open(3p) <../man3/posix_typed_mem_open.3p.html>`__, 
`pthread_atfork(3p) <../man3/pthread_atfork.3p.html>`__, 
`pthread_sigmask(3p) <../man3/pthread_sigmask.3p.html>`__, 
`putenv(3p) <../man3/putenv.3p.html>`__, 
`readdir(3p) <../man3/readdir.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__, 
`setegid(3p) <../man3/setegid.3p.html>`__, 
`setenv(3p) <../man3/setenv.3p.html>`__, 
`seteuid(3p) <../man3/seteuid.3p.html>`__, 
`setgid(3p) <../man3/setgid.3p.html>`__, 
`setlocale(3p) <../man3/setlocale.3p.html>`__, 
`setpgid(3p) <../man3/setpgid.3p.html>`__, 
`setpgrp(3p) <../man3/setpgrp.3p.html>`__, 
`setregid(3p) <../man3/setregid.3p.html>`__, 
`setuid(3p) <../man3/setuid.3p.html>`__, 
`shmat(3p) <../man3/shmat.3p.html>`__, 
`shmdt(3p) <../man3/shmdt.3p.html>`__, 
`shm_open(3p) <../man3/shm_open.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__, 
`sigaltstack(3p) <../man3/sigaltstack.3p.html>`__, 
`sighold(3p) <../man3/sighold.3p.html>`__, 
`signal(3p) <../man3/signal.3p.html>`__, 
`sigpending(3p) <../man3/sigpending.3p.html>`__, 
`system(3p) <../man3/system.3p.html>`__, 
`times(3p) <../man3/times.3p.html>`__, 
`ulimit(3p) <../man3/ulimit.3p.html>`__, 
`umask(3p) <../man3/umask.3p.html>`__, 
`wait(3p) <../man3/wait.3p.html>`__, 
`waitid(3p) <../man3/waitid.3p.html>`__, 
`wordexp(3p) <../man3/wordexp.3p.html>`__

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
