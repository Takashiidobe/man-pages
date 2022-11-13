.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mbtowc(3) — Linux manual page
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

   MBTOWC(3)               Linux Programmer's Manual              MBTOWC(3)

NAME
-------------------------------------------------

::

          mbtowc - convert a multibyte sequence to a wide character


---------------------------------------------------------

::

          #include <stdlib.h>

          int mbtowc(wchar_t *restrict pwc, const char *restrict s, size_t n);


---------------------------------------------------------------

::

          The main case for this function is when s is not NULL and pwc is
          not NULL.  In this case, the mbtowc() function inspects at most n
          bytes of the multibyte string starting at s, extracts the next
          complete multibyte character, converts it to a wide character and
          stores it at *pwc.  It updates an internal shift state known only
          to the mbtowc() function.  If s does not point to a null byte
          ('\0'), it returns the number of bytes that were consumed from s,
          otherwise it returns 0.

          If the n bytes starting at s do not contain a complete multibyte
          character, or if they contain an invalid multibyte sequence,
          mbtowc() returns -1.  This can happen even if n >= MB_CUR_MAX, if
          the multibyte string contains redundant shift sequences.

          A different case is when s is not NULL but pwc is NULL.  In this
          case, the mbtowc() function behaves as above, except that it does
          not store the converted wide character in memory.

          A third case is when s is NULL.  In this case, pwc and n are
          ignored.  The mbtowc() function resets the shift state, only
          known to this function, to the initial state, and returns nonzero
          if the encoding has nontrivial shift state, or zero if the
          encoding is stateless.


-----------------------------------------------------------------

::

          If s is not NULL, the mbtowc() function returns the number of
          consumed bytes starting at s, or 0 if s points to a null byte, or
          -1 upon failure.

          If s is NULL, the mbtowc() function returns nonzero if the
          encoding has nontrivial shift state, or zero if the encoding is
          stateless.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │mbtowc()                       │ Thread safety │ MT-Unsafe race │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of mbtowc() depends on the LC_CTYPE category of the
          current locale.

          This function is not multithread safe.  The function mbrtowc(3)
          provides a better interface to the same functionality.


---------------------------------------------------------

::

          MB_CUR_MAX(3), mblen(3), mbrtowc(3), mbstowcs(3), wcstombs(3),
          wctomb(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      MBTOWC(3)

--------------

Pages that refer to this page: `btowc(3) <../man3/btowc.3.html>`__, 
`MB_CUR_MAX(3) <../man3/MB_CUR_MAX.3.html>`__, 
`mbstowcs(3) <../man3/mbstowcs.3.html>`__, 
`wcstombs(3) <../man3/wcstombs.3.html>`__, 
`wctomb(3) <../man3/wctomb.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/mbtowc.3.license.html>`__

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
