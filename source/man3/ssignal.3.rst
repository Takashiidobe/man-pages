.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gsignal(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GSIGNAL(3)              Linux Programmer's Manual             GSIGNAL(3)

NAME
-------------------------------------------------

::

          gsignal, ssignal - software signal facility


---------------------------------------------------------

::

          #include <signal.h>

          typedef void (*sighandler_t)(int);

          int gsignal(int signum);

          sighandler_t ssignal(int signum, sighandler_t action);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          gsignal(), ssignal():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              Glibc 2.19 and earlier:
                  _SVID_SOURCE


---------------------------------------------------------------

::

          Don't use these functions under Linux.  Due to a historical
          mistake, under Linux these functions are aliases for raise(3) and
          signal(2), respectively.

          Elsewhere, on System V-like systems, these functions implement
          software signaling, entirely independent of the classical
          signal(2) and kill(2) functions.  The function ssignal() defines
          the action to take when the software signal with number signum is
          raised using the function gsignal(), and returns the previous
          such action or SIG_DFL.  The function gsignal() does the
          following: if no action (or the action SIG_DFL) was specified for
          signum, then it does nothing and returns 0.  If the action
          SIG_IGN was specified for signum, then it does nothing and
          returns 1.  Otherwise, it resets the action to SIG_DFL and calls
          the action function with argument signum, and returns the value
          returned by that function.  The range of possible values signum
          varies (often 1–15 or 1–17).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────┬───────────────┬─────────────────┐
          │Interface                     │ Attribute     │ Value           │
          ├──────────────────────────────┼───────────────┼─────────────────┤
          │gsignal()                     │ Thread safety │ MT-Safe         │
          ├──────────────────────────────┼───────────────┼─────────────────┤
          │ssignal()                     │ Thread safety │ MT-Safe sigintr │
          └──────────────────────────────┴───────────────┴─────────────────┘


-------------------------------------------------------------------

::

          These functions are available under AIX, DG/UX, HP-UX, SCO,
          Solaris, Tru64.  They are called obsolete under most of these
          systems, and are broken under glibc.  Some systems also have
          gsignal_r() and ssignal_r().


---------------------------------------------------------

::

          kill(2), signal(2), raise(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     GSIGNAL(3)

--------------

`Copyright and license for this manual
page <../man3/gsignal.3.license.html>`__

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
