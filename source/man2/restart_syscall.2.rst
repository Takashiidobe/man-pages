.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

restart_syscall(2) — Linux manual page
======================================

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

   RESTART_SYSCALL(2)      Linux Programmer's Manual     RESTART_SYSCALL(2)

NAME
-------------------------------------------------

::

          restart_syscall - restart a system call after interruption by a
          stop signal


---------------------------------------------------------

::

          long restart_syscall(void);

          Note: There is no glibc wrapper for this system call; see NOTES.


---------------------------------------------------------------

::

          The restart_syscall() system call is used to restart certain
          system calls after a process that was stopped by a signal (e.g.,
          SIGSTOP or SIGTSTP) is later resumed after receiving a SIGCONT
          signal.  This system call is designed only for internal use by
          the kernel.

          restart_syscall() is used for restarting only those system calls
          that, when restarted, should adjust their time-related
          parameters—namely poll(2) (since Linux 2.6.24), nanosleep(2)
          (since Linux 2.6), clock_nanosleep(2) (since Linux 2.6), and
          futex(2), when employed with the FUTEX_WAIT (since Linux 2.6.22)
          and FUTEX_WAIT_BITSET (since Linux 2.6.31) operations.
          restart_syscall() restarts the interrupted system call with a
          time argument that is suitably adjusted to account for the time
          that has already elapsed (including the time where the process
          was stopped by a signal).  Without the restart_syscall()
          mechanism, restarting these system calls would not correctly
          deduct the already elapsed time when the process continued
          execution.


-----------------------------------------------------------------

::

          The return value of restart_syscall() is the return value of
          whatever system call is being restarted.


-----------------------------------------------------

::

          errno is set as per the errors for whatever system call is being
          restarted by restart_syscall().


---------------------------------------------------------

::

          The restart_syscall() system call is present since Linux 2.6.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------

::

          There is no glibc wrapper for this system call, because it is
          intended for use only by the kernel and should never be called by
          applications.

          The kernel uses restart_syscall() to ensure that when a system
          call is restarted after a process has been stopped by a signal
          and then resumed by SIGCONT, then the time that the process spent
          in the stopped state is counted against the timeout interval
          specified in the original system call.  In the case of system
          calls that take a timeout argument and automatically restart
          after a stop signal plus SIGCONT, but which do not have the
          restart_syscall() mechanism built in, then, after the process
          resumes execution, the time that the process spent in the stop
          state is not counted against the timeout value.  Notable examples
          of system calls that suffer this problem are ppoll(2), select(2),
          and pselect(2).

          From user space, the operation of restart_syscall() is largely
          invisible: to the process that made the system call that is
          restarted, it appears as though that system call executed and
          returned in the usual fashion.


---------------------------------------------------------

::

          sigaction(2), sigreturn(2), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22             RESTART_SYSCALL(2)

--------------

Pages that refer to this page:
`clock_nanosleep(2) <../man2/clock_nanosleep.2.html>`__, 
`futex(2) <../man2/futex.2.html>`__, 
`nanosleep(2) <../man2/nanosleep.2.html>`__, 
`poll(2) <../man2/poll.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`select(2) <../man2/select.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`sigreturn(2) <../man2/sigreturn.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/restart_syscall.2.license.html>`__

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
