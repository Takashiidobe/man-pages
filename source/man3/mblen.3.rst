.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mblen(3) — Linux manual page
============================

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

   MBLEN(3)                Linux Programmer's Manual               MBLEN(3)

NAME
-------------------------------------------------

::

          mblen - determine number of bytes in next multibyte character


---------------------------------------------------------

::

          #include <stdlib.h>

          int mblen(const char *s, size_t n);


---------------------------------------------------------------

::

          If s is not NULL, the mblen() function inspects at most n bytes
          of the multibyte string starting at s and extracts the next
          complete multibyte character.  It uses a static anonymous shift
          state known only to the mblen() function.  If the multibyte
          character is not the null wide character, it returns the number
          of bytes that were consumed from s.  If the multibyte character
          is the null wide character, it returns 0.

          If the n bytes starting at s do not contain a complete multibyte
          character, mblen() returns -1.  This can happen even if n is
          greater than or equal to MB_CUR_MAX, if the multibyte string
          contains redundant shift sequences.

          If the multibyte string starting at s contains an invalid
          multibyte sequence before the next complete character, mblen()
          also returns -1.

          If s is NULL, the mblen() function resets the shift state, known
          to only this function, to the initial state, and returns nonzero
          if the encoding has nontrivial shift state, or zero if the
          encoding is stateless.


-----------------------------------------------------------------

::

          The mblen() function returns the number of bytes parsed from the
          multibyte sequence starting at s, if a non-null wide character
          was recognized.  It returns 0, if a null wide character was
          recognized.  It returns -1, if an invalid multibyte sequence was
          encountered or if it couldn't parse a complete multibyte
          character.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │mblen()                        │ Thread safety │ MT-Unsafe race │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of mblen() depends on the LC_CTYPE category of the
          current locale.

          The function mbrlen(3) provides a better interface to the same
          functionality.


---------------------------------------------------------

::

          mbrlen(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       MBLEN(3)

--------------

Pages that refer to this page:
`MB_CUR_MAX(3) <../man3/MB_CUR_MAX.3.html>`__, 
`mbstowcs(3) <../man3/mbstowcs.3.html>`__, 
`mbtowc(3) <../man3/mbtowc.3.html>`__, 
`wcstombs(3) <../man3/wcstombs.3.html>`__, 
`wctomb(3) <../man3/wctomb.3.html>`__, 
`locale(7) <../man7/locale.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/mblen.3.license.html>`__

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
