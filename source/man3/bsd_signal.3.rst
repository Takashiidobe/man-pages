.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bsd_signal(3) — Linux manual page
=================================

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

   BSD_SIGNAL(3)           Linux Programmer's Manual          BSD_SIGNAL(3)

NAME
-------------------------------------------------

::

          bsd_signal - signal handling with BSD semantics


---------------------------------------------------------

::

          #include <signal.h>

          typedef void (*sighandler_t)(int);

          sighandler_t bsd_signal(int signum, sighandler_t handler);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          bsd_signal():
              Since glibc 2.26:
                  _XOPEN_SOURCE >= 500
                      && ! (_POSIX_C_SOURCE >= 200809L)
              Glibc 2.25 and earlier:
                  _XOPEN_SOURCE


---------------------------------------------------------------

::

          The bsd_signal() function takes the same arguments, and performs
          the same task, as signal(2).

          The difference between the two is that bsd_signal() is guaranteed
          to provide reliable signal semantics, that is: a) the disposition
          of the signal is not reset to the default when the handler is
          invoked; b) delivery of further instances of the signal is
          blocked while the signal handler is executing; and c) if the
          handler interrupts a blocking system call, then the system call
          is automatically restarted.  A portable application cannot rely
          on signal(2) to provide these guarantees.


-----------------------------------------------------------------

::

          The bsd_signal() function returns the previous value of the
          signal handler, or SIG_ERR on error.


-----------------------------------------------------

::

          As for signal(2).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │bsd_signal()                          │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          4.2BSD, POSIX.1-2001.  POSIX.1-2008 removes the specification of
          bsd_signal(), recommending the use of sigaction(2) instead.


---------------------------------------------------

::

          Use of bsd_signal() should be avoided; use sigaction(2) instead.

          On modern Linux systems, bsd_signal() and signal(2) are
          equivalent.  But on older systems, signal(2) provided unreliable
          signal semantics; see signal(2) for details.

          The use of sighandler_t is a GNU extension; this type is defined
          only if the _GNU_SOURCE feature test macro is defined.


---------------------------------------------------------

::

          sigaction(2), signal(2), sysv_signal(3), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                  BSD_SIGNAL(3)

--------------

Pages that refer to this page: `signal(2) <../man2/signal.2.html>`__, 
`sysv_signal(3) <../man3/sysv_signal.3.html>`__, 
`signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/bsd_signal.3.license.html>`__

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
