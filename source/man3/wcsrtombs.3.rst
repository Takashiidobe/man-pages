.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wcsrtombs(3) — Linux manual page
================================

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

   WCSRTOMBS(3)            Linux Programmer's Manual           WCSRTOMBS(3)

NAME
-------------------------------------------------

::

          wcsrtombs - convert a wide-character string to a multibyte string


---------------------------------------------------------

::

          #include <wchar.h>

          size_t wcsrtombs(char *restrict dest, const wchar_t **restrict src,
                           size_t len, mbstate_t *restrict ps);


---------------------------------------------------------------

::

          If dest is not NULL, the wcsrtombs() function converts the wide-
          character string *src to a multibyte string starting at dest.  At
          most len bytes are written to dest.  The shift state *ps is
          updated.  The conversion is effectively performed by repeatedly
          calling wcrtomb(dest, *src, ps), as long as this call succeeds,
          and then incrementing dest by the number of bytes written and
          *src by one.  The conversion can stop for three reasons:

          1. A wide character has been encountered that can not be
             represented as a multibyte sequence (according to the current
             locale).  In this case, *src is left pointing to the invalid
             wide character, (size_t) -1 is returned, and errno is set to
             EILSEQ.

          2. The length limit forces a stop.  In this case, *src is left
             pointing to the next wide character to be converted, and the
             number of bytes written to dest is returned.

          3. The wide-character string has been completely converted,
             including the terminating null wide character (L'\0'), which
             has the side effect of bringing back *ps to the initial state.
             In this case, *src is set to NULL, and the number of bytes
             written to dest, excluding the terminating null byte ('\0'),
             is returned.

          If dest is NULL, len is ignored, and the conversion proceeds as
          above, except that the converted bytes are not written out to
          memory, and that no length limit exists.

          In both of the above cases, if ps is NULL, a static anonymous
          state known only to the wcsrtombs() function is used instead.

          The programmer must ensure that there is room for at least len
          bytes at dest.


-----------------------------------------------------------------

::

          The wcsrtombs() function returns the number of bytes that make up
          the converted part of multibyte sequence, not including the
          terminating null byte.  If a wide character was encountered which
          could not be converted, (size_t) -1 is returned, and errno set to
          EILSEQ.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────┬───────────────┬───────────────────────────────────┐
          │Interface   │ Attribute     │ Value                             │
          ├────────────┼───────────────┼───────────────────────────────────┤
          │wcsrtombs() │ Thread safety │ MT-Unsafe race:wcsrtombs/!ps      │
          └────────────┴───────────────┴───────────────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of wcsrtombs() depends on the LC_CTYPE category of
          the current locale.

          Passing NULL as ps is not multithread safe.


---------------------------------------------------------

::

          iconv(3), mbsinit(3), wcrtomb(3), wcsnrtombs(3), wcstombs(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   WCSRTOMBS(3)

--------------

Pages that refer to this page: `mbsinit(3) <../man3/mbsinit.3.html>`__, 
`wcrtomb(3) <../man3/wcrtomb.3.html>`__, 
`wcsnrtombs(3) <../man3/wcsnrtombs.3.html>`__, 
`wcstombs(3) <../man3/wcstombs.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/wcsrtombs.3.license.html>`__

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
