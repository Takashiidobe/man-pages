.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ffs(3) — Linux manual page
==========================

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

   FFS(3)                  Linux Programmer's Manual                 FFS(3)

NAME
-------------------------------------------------

::

          ffs, ffsl, ffsll - find first bit set in a word


---------------------------------------------------------

::

          #include <strings.h>

          int ffs(int i);

          #include <string.h>

          int ffsl(long i);
          int ffsll(long long i);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          ffs():
              Since glibc 2.12:
                  _XOPEN_SOURCE >= 700
                      || ! (_POSIX_C_SOURCE >= 200809L)
                      || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                      || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE
              Before glibc 2.12:
                  none

          ffsl(), ffsll():
              Since glibc 2.27:
                  _DEFAULT_SOURCE
              Before glibc 2.27:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          The ffs() function returns the position of the first (least
          significant) bit set in the word i.  The least significant bit is
          position 1 and the most significant position is, for example, 32
          or 64.  The functions ffsll() and ffsl() do the same but take
          arguments of possibly different size.


-----------------------------------------------------------------

::

          These functions return the position of the first bit set, or 0 if
          no bits are set in i.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │ffs(), ffsl(), ffsll()                │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          ffs(): POSIX.1-2001, POSIX.1-2008, 4.3BSD.

          The ffsl() and ffsll() functions are glibc extensions.


---------------------------------------------------

::

          BSD systems have a prototype in <string.h>.


---------------------------------------------------------

::

          memchr(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                         FFS(3)

--------------

Pages that refer to this page: `memchr(3) <../man3/memchr.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/ffs.3.license.html>`__

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
