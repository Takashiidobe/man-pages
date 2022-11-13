.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigsetops(3) — Linux manual page
================================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SIGSETOPS(3)            Linux Programmer's Manual           SIGSETOPS(3)

NAME
-------------------------------------------------

::

          sigemptyset, sigfillset, sigaddset, sigdelset, sigismember -
          POSIX signal set operations


---------------------------------------------------------

::

          #include <signal.h>

          int sigemptyset(sigset_t *set);
          int sigfillset(sigset_t *set);

          int sigaddset(sigset_t *set, int signum);
          int sigdelset(sigset_t *set, int signum);

          int sigismember(const sigset_t *set, int signum);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          sigemptyset(), sigfillset(), sigaddset(), sigdelset(),
          sigismember():
              _POSIX_C_SOURCE


---------------------------------------------------------------

::

          These functions allow the manipulation of POSIX signal sets.

          sigemptyset() initializes the signal set given by set to empty,
          with all signals excluded from the set.

          sigfillset() initializes set to full, including all signals.

          sigaddset() and sigdelset() add and delete respectively signal
          signum from set.

          sigismember() tests whether signum is a member of set.

          Objects of type sigset_t must be initialized by a call to either
          sigemptyset() or sigfillset() before being passed to the
          functions sigaddset(), sigdelset(), and sigismember() or the
          additional glibc functions described below (sigisemptyset(),
          sigandset(), and sigorset()).  The results are undefined if this
          is not done.


-----------------------------------------------------------------

::

          sigemptyset(), sigfillset(), sigaddset(), and sigdelset() return
          0 on success and -1 on error.

          sigismember() returns 1 if signum is a member of set, 0 if signum
          is not a member, and -1 on error.

          On error, these functions set errno to indicate the error.


-----------------------------------------------------

::

          EINVAL signum is not a valid signal.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │sigemptyset(), sigfillset(),          │ Thread safety │ MT-Safe │
          │sigaddset(), sigdelset(),             │               │         │
          │sigismember(), sigisemptyset(),       │               │         │
          │sigorset(), sigandset()               │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          When creating a filled signal set, the glibc sigfillset()
          function does not include the two real-time signals used
          internally by the NPTL threading implementation.  See nptl(7) for
          details.

      Glibc extensions
          If the _GNU_SOURCE feature test macro is defined, then <signal.h>
          exposes three other functions for manipulating signal sets:

          int sigisemptyset(const sigset_t *set);
          int sigorset(sigset_t *dest, const sigset_t *left,
                        const sigset_t *right);
          int sigandset(sigset_t *dest, const sigset_t *left,
                        const sigset_t *right);

          sigisemptyset() returns 1 if set contains no signals, and 0
          otherwise.

          sigorset() places the union of the sets left and right in dest.
          sigandset() places the intersection of the sets left and right in
          dest.  Both functions return 0 on success, and -1 on failure.

          These functions are nonstandard (a few other systems provide
          similar functions) and their use should be avoided in portable
          applications.


---------------------------------------------------------

::

          sigaction(2), sigpending(2), sigprocmask(2), sigsuspend(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                   SIGSETOPS(3)

--------------

Pages that refer to this page:
`sigaction(2) <../man2/sigaction.2.html>`__, 
`signal(2) <../man2/signal.2.html>`__, 
`signalfd(2) <../man2/signalfd.2.html>`__, 
`sigpending(2) <../man2/sigpending.2.html>`__, 
`sigprocmask(2) <../man2/sigprocmask.2.html>`__, 
`sigsuspend(2) <../man2/sigsuspend.2.html>`__, 
`sigwaitinfo(2) <../man2/sigwaitinfo.2.html>`__, 
`pthread_attr_setsigmask_np(3) <../man3/pthread_attr_setsigmask_np.3.html>`__, 
`pthread_sigmask(3) <../man3/pthread_sigmask.3.html>`__, 
`sigwait(3) <../man3/sigwait.3.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/sigsetops.3.license.html>`__

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
