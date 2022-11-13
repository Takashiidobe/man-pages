.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigpending(2) — Linux manual page
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
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SIGPENDING(2)           Linux Programmer's Manual          SIGPENDING(2)

NAME
-------------------------------------------------

::

          sigpending, rt_sigpending - examine pending signals


---------------------------------------------------------

::

          #include <signal.h>

          int sigpending(sigset_t *set);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          sigpending():
              _POSIX_C_SOURCE


---------------------------------------------------------------

::

          sigpending() returns the set of signals that are pending for
          delivery to the calling thread (i.e., the signals which have been
          raised while blocked).  The mask of pending signals is returned
          in set.


-----------------------------------------------------------------

::

          sigpending() returns 0 on success.  On failure, -1 is returned
          and errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT set points to memory which is not a valid part of the
                 process address space.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          See sigsetops(3) for details on manipulating signal sets.

          If a signal is both blocked and has a disposition of "ignored",
          it is not added to the mask of pending signals when generated.

          The set of signals that is pending for a thread is the union of
          the set of signals that is pending for that thread and the set of
          signals that is pending for the process as a whole; see
          signal(7).

          A child created via fork(2) initially has an empty pending signal
          set; the pending signal set is preserved across an execve(2).

      C library/kernel differences
          The original Linux system call was named sigpending().  However,
          with the addition of real-time signals in Linux 2.2, the fixed-
          size, 32-bit sigset_t argument supported by that system call was
          no longer fit for purpose.  Consequently, a new system call,
          rt_sigpending(), was added to support an enlarged sigset_t type.
          The new system call takes a second argument, size_t sigsetsize,
          which specifies the size in bytes of the signal set in set.  The
          glibc sigpending() wrapper function hides these details from us,
          transparently calling rt_sigpending() when the kernel provides
          it.


-------------------------------------------------

::

          In versions of glibc up to and including 2.2.1, there is a bug in
          the wrapper function for sigpending() which means that
          information about pending real-time signals is not correctly
          returned.


---------------------------------------------------------

::

          kill(2), sigaction(2), signal(2), sigprocmask(2), sigsuspend(2),
          sigsetops(3), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  SIGPENDING(2)

--------------

Pages that refer to this page: `clone(2) <../man2/clone.2.html>`__, 
`fork(2) <../man2/fork.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`signal(2) <../man2/signal.2.html>`__, 
`sigprocmask(2) <../man2/sigprocmask.2.html>`__, 
`sigwaitinfo(2) <../man2/sigwaitinfo.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`pthread_kill(3) <../man3/pthread_kill.3.html>`__, 
`pthread_sigmask(3) <../man3/pthread_sigmask.3.html>`__, 
`sigsetops(3) <../man3/sigsetops.3.html>`__, 
`sigwait(3) <../man3/sigwait.3.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/sigpending.2.license.html>`__

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
