.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

siginterrupt(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SIGINTERRUPT(3)         Linux Programmer's Manual        SIGINTERRUPT(3)

NAME
-------------------------------------------------

::

          siginterrupt - allow signals to interrupt system calls


---------------------------------------------------------

::

          #include <signal.h>

          int siginterrupt(int sig, int flag);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          siginterrupt():
              _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200809L
                  || /* Glibc <= 2.19: */ _BSD_SOURCE


---------------------------------------------------------------

::

          The siginterrupt() function changes the restart behavior when a
          system call is interrupted by the signal sig.  If the flag
          argument is false (0), then system calls will be restarted if
          interrupted by the specified signal sig.  This is the default
          behavior in Linux.

          If the flag argument is true (1) and no data has been
          transferred, then a system call interrupted by the signal sig
          will return -1 and errno will be set to EINTR.

          If the flag argument is true (1) and data transfer has started,
          then the system call will be interrupted and will return the
          actual amount of data transferred.


-----------------------------------------------------------------

::

          The siginterrupt() function returns 0 on success.  It returns -1
          if the signal number sig is invalid, with errno set to indicate
          the error.


-----------------------------------------------------

::

          EINVAL The specified signal number is invalid.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────┬───────────────┬────────────────────────────────┐
          │Interface      │ Attribute     │ Value                          │
          ├───────────────┼───────────────┼────────────────────────────────┤
          │siginterrupt() │ Thread safety │ MT-Unsafe const:sigintr        │
          └───────────────┴───────────────┴────────────────────────────────┘


-------------------------------------------------------------------

::

          4.3BSD, POSIX.1-2001.  POSIX.1-2008 marks siginterrupt() as
          obsolete, recommending the use of sigaction(2) with the
          SA_RESTART flag instead.


---------------------------------------------------------

::

          signal(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                SIGINTERRUPT(3)

--------------

Pages that refer to this page:
`sigaction(2) <../man2/sigaction.2.html>`__, 
`signal(2) <../man2/signal.2.html>`__

--------------

`Copyright and license for this manual
page <../man3/siginterrupt.3.license.html>`__

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
