.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sysv_signal(3) — Linux manual page
==================================

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

   SYSV_SIGNAL(3)          Linux Programmer's Manual         SYSV_SIGNAL(3)

NAME
-------------------------------------------------

::

          sysv_signal - signal handling with System V semantics


---------------------------------------------------------

::

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <signal.h>

          typedef void (*sighandler_t)(int);

          sighandler_t sysv_signal(int signum, sighandler_t handler);


---------------------------------------------------------------

::

          The sysv_signal() function takes the same arguments, and performs
          the same task, as signal(2).

          However sysv_signal() provides the System V unreliable signal
          semantics, that is: a) the disposition of the signal is reset to
          the default when the handler is invoked; b) delivery of further
          instances of the signal is not blocked while the signal handler
          is executing; and c) if the handler interrupts (certain) blocking
          system calls, then the system call is not automatically
          restarted.


-----------------------------------------------------------------

::

          The sysv_signal() function returns the previous value of the
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
          │sysv_signal()                         │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          This function is nonstandard.


---------------------------------------------------

::

          Use of sysv_signal() should be avoided; use sigaction(2) instead.

          On older Linux systems, sysv_signal() and signal(2) were
          equivalent.  But on newer systems, signal(2) provides reliable
          signal semantics; see signal(2) for details.

          The use of sighandler_t is a GNU extension; this type is defined
          only if the _GNU_SOURCE feature test macro is defined.


---------------------------------------------------------

::

          sigaction(2), signal(2), bsd_signal(3), signal(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                 SYSV_SIGNAL(3)

--------------

Pages that refer to this page: `signal(2) <../man2/signal.2.html>`__, 
`bsd_signal(3) <../man3/bsd_signal.3.html>`__, 
`signal(7) <../man7/signal.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/sysv_signal.3.license.html>`__

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
