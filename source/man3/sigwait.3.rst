.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigwait(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SIGWAIT(3)              Linux Programmer's Manual             SIGWAIT(3)

NAME
-------------------------------------------------

::

          sigwait - wait for a signal


---------------------------------------------------------

::

          #include <signal.h>

          int sigwait(const sigset_t *restrict set, int *restrict sig);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          sigwait():
              Since glibc 2.26:
                  _POSIX_C_SOURCE >= 199506L
              Glibc 2.25 and earlier:
                  _POSIX_C_SOURCE


---------------------------------------------------------------

::

          The sigwait() function suspends execution of the calling thread
          until one of the signals specified in the signal set set becomes
          pending.  The function accepts the signal (removes it from the
          pending list of signals), and returns the signal number in sig.

          The operation of sigwait() is the same as sigwaitinfo(2), except
          that:

          * sigwait() returns only the signal number, rather than a
            siginfo_t structure describing the signal.

          * The return values of the two functions are different.


-----------------------------------------------------------------

::

          On success, sigwait() returns 0.  On error, it returns a positive
          error number (listed in ERRORS).


-----------------------------------------------------

::

          EINVAL set contains an invalid signal number.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │sigwait()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          sigwait() is implemented using sigtimedwait(2).

          The glibc implementation of sigwait() silently ignores attempts
          to wait for the two real-time signals that are used internally by
          the NPTL threading implementation.  See nptl(7) for details.


---------------------------------------------------------

::

          See pthread_sigmask(3).


---------------------------------------------------------

::

          sigaction(2), signalfd(2), sigpending(2), sigsuspend(2),
          sigwaitinfo(2), sigsetops(3), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     SIGWAIT(3)

--------------

Pages that refer to this page: `kill(2) <../man2/kill.2.html>`__, 
`signalfd(2) <../man2/signalfd.2.html>`__, 
`sigsuspend(2) <../man2/sigsuspend.2.html>`__, 
`sigwaitinfo(2) <../man2/sigwaitinfo.2.html>`__, 
`pthread_sigmask(3) <../man3/pthread_sigmask.3.html>`__, 
`pthread_sigqueue(3) <../man3/pthread_sigqueue.3.html>`__, 
`sigqueue(3) <../man3/sigqueue.3.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/sigwait.3.license.html>`__

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
