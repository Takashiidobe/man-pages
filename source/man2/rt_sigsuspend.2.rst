.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigsuspend(2) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SIGSUSPEND(2)           Linux Programmer's Manual          SIGSUSPEND(2)

NAME
-------------------------------------------------

::

          sigsuspend, rt_sigsuspend - wait for a signal


---------------------------------------------------------

::

          #include <signal.h>

          int sigsuspend(const sigset_t *mask);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          sigsuspend():
              _POSIX_C_SOURCE


---------------------------------------------------------------

::

          sigsuspend() temporarily replaces the signal mask of the calling
          thread with the mask given by mask and then suspends the thread
          until delivery of a signal whose action is to invoke a signal
          handler or to terminate a process.

          If the signal terminates the process, then sigsuspend() does not
          return.  If the signal is caught, then sigsuspend() returns after
          the signal handler returns, and the signal mask is restored to
          the state before the call to sigsuspend().

          It is not possible to block SIGKILL or SIGSTOP; specifying these
          signals in mask, has no effect on the thread's signal mask.


-----------------------------------------------------------------

::

          sigsuspend() always returns -1, with errno set to indicate the
          error (normally, EINTR).


-----------------------------------------------------

::

          EFAULT mask points to memory which is not a valid part of the
                 process address space.

          EINTR  The call was interrupted by a signal; signal(7).


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          Normally, sigsuspend() is used in conjunction with sigprocmask(2)
          in order to prevent delivery of a signal during the execution of
          a critical code section.  The caller first blocks the signals
          with sigprocmask(2).  When the critical code has completed, the
          caller then waits for the signals by calling sigsuspend() with
          the signal mask that was returned by sigprocmask(2) (in the
          oldset argument).

          See sigsetops(3) for details on manipulating signal sets.

      C library/kernel differences
          The original Linux system call was named sigsuspend().  However,
          with the addition of real-time signals in Linux 2.2, the fixed-
          size, 32-bit sigset_t type supported by that system call was no
          longer fit for purpose.  Consequently, a new system call,
          rt_sigsuspend(), was added to support an enlarged sigset_t type.
          The new system call takes a second argument, size_t sigsetsize,
          which specifies the size in bytes of the signal set in mask.
          This argument is currently required to have the value
          sizeof(sigset_t) (or the error EINVAL results).  The glibc
          sigsuspend() wrapper function hides these details from us,
          transparently calling rt_sigsuspend() when the kernel provides
          it.


---------------------------------------------------------

::

          kill(2), pause(2), sigaction(2), signal(2), sigprocmask(2),
          sigwaitinfo(2), sigsetops(3), sigwait(3), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  SIGSUSPEND(2)

--------------

Pages that refer to this page: `pause(2) <../man2/pause.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`signal(2) <../man2/signal.2.html>`__, 
`sigpending(2) <../man2/sigpending.2.html>`__, 
`sigprocmask(2) <../man2/sigprocmask.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`sigpause(3) <../man3/sigpause.3.html>`__, 
`sigset(3) <../man3/sigset.3.html>`__, 
`sigsetops(3) <../man3/sigsetops.3.html>`__, 
`sigwait(3) <../man3/sigwait.3.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/sigsuspend.2.license.html>`__

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
