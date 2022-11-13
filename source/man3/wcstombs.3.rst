.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wcstombs(3) — Linux manual page
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

   WCSTOMBS(3)             Linux Programmer's Manual            WCSTOMBS(3)

NAME
-------------------------------------------------

::

          wcstombs - convert a wide-character string to a multibyte string


---------------------------------------------------------

::

          #include <stdlib.h>

          size_t wcstombs(char *restrict dest, const wchar_t *restrict src,
                          size_t n);


---------------------------------------------------------------

::

          If dest is not NULL, the wcstombs() function converts the wide-
          character string src to a multibyte string starting at dest.  At
          most n bytes are written to dest.  The sequence of characters
          placed in dest begins in the initial shift state.  The conversion
          can stop for three reasons:

          1. A wide character has been encountered that can not be
             represented as a multibyte sequence (according to the current
             locale).  In this case, (size_t) -1 is returned.

          2. The length limit forces a stop.  In this case, the number of
             bytes written to dest is returned, but the shift state at this
             point is lost.

          3. The wide-character string has been completely converted,
             including the terminating null wide character (L'\0').  In
             this case, the conversion ends in the initial shift state.
             The number of bytes written to dest, excluding the terminating
             null byte ('\0'), is returned.

          The programmer must ensure that there is room for at least n
          bytes at dest.

          If dest is NULL, n is ignored, and the conversion proceeds as
          above, except that the converted bytes are not written out to
          memory, and no length limit exists.

          In order to avoid the case 2 above, the programmer should make
          sure n is greater than or equal to wcstombs(NULL,src,0)+1.


-----------------------------------------------------------------

::

          The wcstombs() function returns the number of bytes that make up
          the converted part of a multibyte sequence, not including the
          terminating null byte.  If a wide character was encountered which
          could not be converted, (size_t) -1 is returned.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │wcstombs()                            │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of wcstombs() depends on the LC_CTYPE category of
          the current locale.

          The function wcsrtombs(3) provides a better interface to the same
          functionality.


---------------------------------------------------------

::

          mblen(3), mbstowcs(3), mbtowc(3), wcsrtombs(3), wctomb(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                    WCSTOMBS(3)

--------------

Pages that refer to this page:
`MB_CUR_MAX(3) <../man3/MB_CUR_MAX.3.html>`__, 
`mbstowcs(3) <../man3/mbstowcs.3.html>`__, 
`mbtowc(3) <../man3/mbtowc.3.html>`__, 
`wcsrtombs(3) <../man3/wcsrtombs.3.html>`__, 
`wctomb(3) <../man3/wctomb.3.html>`__, 
`locale(7) <../man7/locale.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/wcstombs.3.license.html>`__

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
