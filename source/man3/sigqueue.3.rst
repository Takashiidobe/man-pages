.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigqueue(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SIGQUEUE(3)             Linux Programmer's Manual            SIGQUEUE(3)

NAME
-------------------------------------------------

::

          sigqueue - queue a signal and data to a process


---------------------------------------------------------

::

          #include <signal.h>

          int sigqueue(pid_t pid, int sig, const union sigval value);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          sigqueue():
              _POSIX_C_SOURCE >= 199309L


---------------------------------------------------------------

::

          sigqueue() sends the signal specified in sig to the process whose
          PID is given in pid.  The permissions required to send a signal
          are the same as for kill(2).  As with kill(2), the null signal
          (0) can be used to check if a process with a given PID exists.

          The value argument is used to specify an accompanying item of
          data (either an integer or a pointer value) to be sent with the
          signal, and has the following type:

              union sigval {
                  int   sival_int;
                  void *sival_ptr;
              };

          If the receiving process has installed a handler for this signal
          using the SA_SIGINFO flag to sigaction(2), then it can obtain
          this data via the si_value field of the siginfo_t structure
          passed as the second argument to the handler.  Furthermore, the
          si_code field of that structure will be set to SI_QUEUE.


-----------------------------------------------------------------

::

          On success, sigqueue() returns 0, indicating that the signal was
          successfully queued to the receiving process.  Otherwise, -1 is
          returned and errno is set to indicate the error.


-----------------------------------------------------

::

          EAGAIN The limit of signals which may be queued has been reached.
                 (See signal(7) for further information.)

          EINVAL sig was invalid.

          EPERM  The process does not have permission to send the signal to
                 the receiving process.  For the required permissions, see
                 kill(2).

          ESRCH  No process has a PID matching pid.


---------------------------------------------------------

::

          sigqueue() and the underlying rt_sigqueueinfo(2) system call
          first appeared in Linux 2.2.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │sigqueue()                            │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          If this function results in the sending of a signal to the
          process that invoked it, and that signal was not blocked by the
          calling thread, and no other threads were willing to handle this
          signal (either by having it unblocked, or by waiting for it using
          sigwait(3)), then at least some signal must be delivered to this
          thread before this function returns.

      C library/kernel differences
          On Linux, sigqueue() is implemented using the rt_sigqueueinfo(2)
          system call.  The system call differs in its third argument,
          which is the siginfo_t structure that will be supplied to the
          receiving process's signal handler or returned by the receiving
          process's sigtimedwait(2) call.  Inside the glibc sigqueue()
          wrapper, this argument, uinfo, is initialized as follows:

              uinfo.si_signo = sig;      /* Argument supplied to sigqueue() */
              uinfo.si_code = SI_QUEUE;
              uinfo.si_pid = getpid();   /* Process ID of sender */
              uinfo.si_uid = getuid();   /* Real UID of sender */
              uinfo.si_value = val;      /* Argument supplied to sigqueue() */


---------------------------------------------------------

::

          kill(2), rt_sigqueueinfo(2), sigaction(2), signal(2),
          pthread_sigqueue(3), sigwait(3), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    SIGQUEUE(3)

--------------

Pages that refer to this page: `kill(1) <../man1/kill.1.html>`__, 
`kill(1@@procps-ng) <../man1/kill.1@@procps-ng.html>`__, 
`pgrep(1) <../man1/pgrep.1.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`kill(2) <../man2/kill.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`rt_sigqueueinfo(2) <../man2/rt_sigqueueinfo.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`signal(2) <../man2/signal.2.html>`__, 
`signalfd(2) <../man2/signalfd.2.html>`__, 
`sigprocmask(2) <../man2/sigprocmask.2.html>`__, 
`sigwaitinfo(2) <../man2/sigwaitinfo.2.html>`__, 
`psignal(3) <../man3/psignal.3.html>`__, 
`pthread_sigqueue(3) <../man3/pthread_sigqueue.3.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/sigqueue.3.license.html>`__

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
