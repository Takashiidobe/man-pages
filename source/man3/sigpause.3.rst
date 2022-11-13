.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigpause(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
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

   SIGPAUSE(3)             Linux Programmer's Manual            SIGPAUSE(3)

NAME
-------------------------------------------------

::

          sigpause - atomically release blocked signals and wait for
          interrupt


---------------------------------------------------------

::

          #include <signal.h>

          int sigpause(int sigmask);  /* BSD (but see NOTES) */

          int sigpause(int sig);      /* System V / UNIX 95 */


---------------------------------------------------------------

::

          Don't use this function.  Use sigsuspend(2) instead.

          The function sigpause() is designed to wait for some signal.  It
          changes the process's signal mask (set of blocked signals), and
          then waits for a signal to arrive.  Upon arrival of a signal, the
          original signal mask is restored.


-----------------------------------------------------------------

::

          If sigpause() returns, it was interrupted by a signal and the
          return value is -1 with errno set to EINTR.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │sigpause()                            │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          The System V version of sigpause() is standardized in
          POSIX.1-2001.  It is also specified in POSIX.1-2008, where it is
          marked obsolete.


---------------------------------------------------

::

      History
          The classical BSD version of this function appeared in 4.2BSD.
          It sets the process's signal mask to sigmask.  UNIX 95
          standardized the incompatible System V version of this function,
          which removes only the specified signal sig from the process's
          signal mask.  The unfortunate situation with two incompatible
          functions with the same name was solved by the sigsuspend(2)
          function, that takes a sigset_t * argument (instead of an int).

      Linux notes
          On Linux, this routine is a system call only on the Sparc
          (sparc64) architecture.

          Glibc uses the BSD version if the _BSD_SOURCE feature test macro
          is defined and none of _POSIX_SOURCE, _POSIX_C_SOURCE,
          _XOPEN_SOURCE, _GNU_SOURCE, or _SVID_SOURCE is defined.
          Otherwise, the System V version is used, and feature test macros
          must be defined as follows to obtain the declaration:

          *  Since glibc 2.26: _XOPEN_SOURCE >= 500

          *  Glibc 2.25 and earlier: _XOPEN_SOURCE

          Since glibc 2.19, only the System V version is exposed by
          <signal.h>; applications that formerly used the BSD sigpause()
          should be amended to use sigsuspend(2).


---------------------------------------------------------

::

          kill(2), sigaction(2), sigprocmask(2), sigsuspend(2),
          sigblock(3), sigvec(3), feature_test_macros(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    SIGPAUSE(3)

--------------

Pages that refer to this page: `sigset(3) <../man3/sigset.3.html>`__, 
`sigvec(3) <../man3/sigvec.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/sigpause.3.license.html>`__

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
