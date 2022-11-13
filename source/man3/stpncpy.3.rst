.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stpncpy(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STPNCPY(3)              Linux Programmer's Manual             STPNCPY(3)

NAME
-------------------------------------------------

::

          stpncpy - copy a fixed-size string, returning a pointer to its
          end


---------------------------------------------------------

::

          #include <string.h>

          char *stpncpy(char *restrict dest, const char *restrict src, size_t n);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          stpncpy():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          The stpncpy() function copies at most n characters from the
          string pointed to by src, including the terminating null byte
          ('\0'), to the array pointed to by dest.  Exactly n characters
          are written at dest.  If the length strlen(src) is smaller than
          n, the remaining characters in the array pointed to by dest are
          filled with null bytes ('\0'), If the length strlen(src) is
          greater than or equal to n, the string pointed to by dest will
          not be null-terminated.

          The strings may not overlap.

          The programmer must ensure that there is room for at least n
          characters at dest.


-----------------------------------------------------------------

::

          stpncpy() returns a pointer to the terminating null byte in dest,
          or, if dest is not null-terminated, dest+n.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │stpncpy()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          This function was added to POSIX.1-2008.  Before that, it was a
          GNU extension.  It first appeared in version 1.07 of the GNU C
          library in 1993.


---------------------------------------------------------

::

          strncpy(3), wcpncpy(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     STPNCPY(3)

--------------

Pages that refer to this page: `stpcpy(3) <../man3/stpcpy.3.html>`__, 
`strcpy(3) <../man3/strcpy.3.html>`__, 
`wcpncpy(3) <../man3/wcpncpy.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/stpncpy.3.license.html>`__

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
