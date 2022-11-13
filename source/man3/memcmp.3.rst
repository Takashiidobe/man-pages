.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

memcmp(3) — Linux manual page
=============================

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

   MEMCMP(3)               Linux Programmer's Manual              MEMCMP(3)

NAME
-------------------------------------------------

::

          memcmp - compare memory areas


---------------------------------------------------------

::

          #include <string.h>

          int memcmp(const void *s1, const void *s2, size_t n);


---------------------------------------------------------------

::

          The memcmp() function compares the first n bytes (each
          interpreted as unsigned char) of the memory areas s1 and s2.


-----------------------------------------------------------------

::

          The memcmp() function returns an integer less than, equal to, or
          greater than zero if the first n bytes of s1 is found,
          respectively, to be less than, to match, or be greater than the
          first n bytes of s2.

          For a nonzero return value, the sign is determined by the sign of
          the difference between the first pair of bytes (interpreted as
          unsigned char) that differ in s1 and s2.

          If n is zero, the return value is zero.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │memcmp()                              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99, SVr4, 4.3BSD.


---------------------------------------------------

::

          Do not use memcmp() to compare security critical data, such as
          cryptographic secrets, because the required CPU time depends on
          the number of equal bytes.  Instead, a function that performs
          comparisons in constant time is required.  Some operating systems
          provide such a function (e.g., NetBSD's consttime_memequal()),
          but no such function is specified in POSIX.  On Linux, it may be
          necessary to implement such a function oneself.


---------------------------------------------------------

::

          bcmp(3), bstring(3), strcasecmp(3), strcmp(3), strcoll(3),
          strncasecmp(3), strncmp(3), wmemcmp(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      MEMCMP(3)

--------------

Pages that refer to this page: `bcmp(3) <../man3/bcmp.3.html>`__, 
`bstring(3) <../man3/bstring.3.html>`__, 
`strcasecmp(3) <../man3/strcasecmp.3.html>`__, 
`strcmp(3) <../man3/strcmp.3.html>`__, 
`strcoll(3) <../man3/strcoll.3.html>`__, 
`strxfrm(3) <../man3/strxfrm.3.html>`__, 
`wmemcmp(3) <../man3/wmemcmp.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/memcmp.3.license.html>`__

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
