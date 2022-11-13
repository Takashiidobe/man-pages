.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mbsrtowcs(3) — Linux manual page
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

   MBSRTOWCS(3)            Linux Programmer's Manual           MBSRTOWCS(3)

NAME
-------------------------------------------------

::

          mbsrtowcs - convert a multibyte string to a wide-character string


---------------------------------------------------------

::

          #include <wchar.h>

          size_t mbsrtowcs(wchar_t *restrict dest, const char **restrict src,
                           size_t len, mbstate_t *restrict ps);


---------------------------------------------------------------

::

          If dest is not NULL, the mbsrtowcs() function converts the
          multibyte string *src to a wide-character string starting at
          dest.  At most len wide characters are written to dest.  The
          shift state *ps is updated.  The conversion is effectively
          performed by repeatedly calling mbrtowc(dest, *src, n, ps) where
          n is some positive number, as long as this call succeeds, and
          then incrementing dest by one and *src by the number of bytes
          consumed.  The conversion can stop for three reasons:

          1. An invalid multibyte sequence has been encountered.  In this
             case, *src is left pointing to the invalid multibyte sequence,
             (size_t) -1 is returned, and errno is set to EILSEQ.

          2. len non-L'\0' wide characters have been stored at dest.  In
             this case, *src is left pointing to the next multibyte
             sequence to be converted, and the number of wide characters
             written to dest is returned.

          3. The multibyte string has been completely converted, including
             the terminating null wide character ('\0'), which has the side
             effect of bringing back *ps to the initial state.  In this
             case, *src is set to NULL, and the number of wide characters
             written to dest, excluding the terminating null wide
             character, is returned.

          If dest is NULL, len is ignored, and the conversion proceeds as
          above, except that the converted wide characters are not written
          out to memory, and that no length limit exists.

          In both of the above cases, if ps is NULL, a static anonymous
          state known only to the mbsrtowcs() function is used instead.

          The programmer must ensure that there is room for at least len
          wide characters at dest.


-----------------------------------------------------------------

::

          The mbsrtowcs() function returns the number of wide characters
          that make up the converted part of the wide-character string, not
          including the terminating null wide character.  If an invalid
          multibyte sequence was encountered, (size_t) -1 is returned, and
          errno set to EILSEQ.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────┬───────────────┬───────────────────────────────────┐
          │Interface   │ Attribute     │ Value                             │
          ├────────────┼───────────────┼───────────────────────────────────┤
          │mbsrtowcs() │ Thread safety │ MT-Unsafe race:mbsrtowcs/!ps      │
          └────────────┴───────────────┴───────────────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of mbsrtowcs() depends on the LC_CTYPE category of
          the current locale.

          Passing NULL as ps is not multithread safe.


---------------------------------------------------------

::

          iconv(3), mbrtowc(3), mbsinit(3), mbsnrtowcs(3), mbstowcs(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   MBSRTOWCS(3)

--------------

Pages that refer to this page: `mbrtowc(3) <../man3/mbrtowc.3.html>`__, 
`mbsinit(3) <../man3/mbsinit.3.html>`__, 
`mbsnrtowcs(3) <../man3/mbsnrtowcs.3.html>`__, 
`mbstowcs(3) <../man3/mbstowcs.3.html>`__, 
`unicode(7) <../man7/unicode.7.html>`__, 
`utf-8(7) <../man7/utf-8.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/mbsrtowcs.3.license.html>`__

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
