.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\_exit(2) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   _EXIT(2)                Linux Programmer's Manual               _EXIT(2)

NAME
-------------------------------------------------

::

          _exit, _Exit - terminate the calling process


---------------------------------------------------------

::

          #include <unistd.h>

          noreturn void _exit(int status);

          #include <stdlib.h>

          noreturn void _Exit(int status);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          _Exit():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          _exit() terminates the calling process "immediately".  Any open
          file descriptors belonging to the process are closed.  Any
          children of the process are inherited by init(1) (or by the
          nearest "subreaper" process as defined through the use of the
          prctl(2) PR_SET_CHILD_SUBREAPER operation).  The process's parent
          is sent a SIGCHLD signal.

          The value status & 0xFF is returned to the parent process as the
          process's exit status, and can be collected by the parent using
          one of the wait(2) family of calls.

          The function _Exit() is equivalent to _exit().


-----------------------------------------------------------------

::

          These functions do not return.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.  The function _Exit()
          was introduced by C99.


---------------------------------------------------

::

          For a discussion on the effects of an exit, the transmission of
          exit status, zombie processes, signals sent, and so on, see
          exit(3).

          The function _exit() is like exit(3), but does not call any
          functions registered with atexit(3) or on_exit(3).  Open stdio(3)
          streams are not flushed.  On the other hand, _exit() does close
          open file descriptors, and this may cause an unknown delay,
          waiting for pending output to finish.  If the delay is undesired,
          it may be useful to call functions like tcflush(3) before calling
          _exit().  Whether any pending I/O is canceled, and which pending
          I/O may be canceled upon _exit(), is implementation-dependent.

      C library/kernel differences
          In glibc up to version 2.3, the _exit() wrapper function invoked
          the kernel system call of the same name.  Since glibc 2.3, the
          wrapper function invokes exit_group(2), in order to terminate all
          of the threads in a process.

          The raw _exit() system call terminates only the calling thread,
          and actions such as reparenting child processes or sending
          SIGCHLD to the parent process are performed only if this is the
          last thread in the thread group.


---------------------------------------------------------

::

          execve(2), exit_group(2), fork(2), kill(2), wait(2), wait4(2),
          waitpid(2), atexit(3), exit(3), on_exit(3), termios(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       _EXIT(2)

--------------

Pages that refer to this page: `clone(2) <../man2/clone.2.html>`__, 
`exit_group(2) <../man2/exit_group.2.html>`__, 
`fork(2) <../man2/fork.2.html>`__,  `kill(2) <../man2/kill.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`seccomp(2) <../man2/seccomp.2.html>`__, 
`setsid(2) <../man2/setsid.2.html>`__, 
`shmop(2) <../man2/shmop.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`vfork(2) <../man2/vfork.2.html>`__, 
`wait(2) <../man2/wait.2.html>`__, 
`atexit(3) <../man3/atexit.3.html>`__, 
`daemon(3) <../man3/daemon.3.html>`__, 
`exit(3) <../man3/exit.3.html>`__, 
`on_exit(3) <../man3/on_exit.3.html>`__, 
`pmgetconfig(3) <../man3/pmgetconfig.3.html>`__, 
`pmnomem(3) <../man3/pmnomem.3.html>`__, 
`system(3) <../man3/system.3.html>`__, 
`persistent-keyring(7) <../man7/persistent-keyring.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`user-keyring(7) <../man7/user-keyring.7.html>`__, 
`user-session-keyring(7) <../man7/user-session-keyring.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/_exit.2.license.html>`__

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
