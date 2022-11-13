.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mbrlen(3) — Linux manual page
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

   MBRLEN(3)               Linux Programmer's Manual              MBRLEN(3)

NAME
-------------------------------------------------

::

          mbrlen - determine number of bytes in next multibyte character


---------------------------------------------------------

::

          #include <wchar.h>

          size_t mbrlen(const char *restrict s, size_t n,
                        mbstate_t *restrict ps);


---------------------------------------------------------------

::

          The mbrlen() function inspects at most n bytes of the multibyte
          string starting at s and extracts the next complete multibyte
          character.  It updates the shift state *ps.  If the multibyte
          character is not the null wide character, it returns the number
          of bytes that were consumed from s.  If the multibyte character
          is the null wide character, it resets the shift state *ps to the
          initial state and returns 0.

          If the n bytes starting at s do not contain a complete multibyte
          character, mbrlen() returns (size_t) -2.  This can happen even if
          n >= MB_CUR_MAX, if the multibyte string contains redundant shift
          sequences.

          If the multibyte string starting at s contains an invalid
          multibyte sequence before the next complete character, mbrlen()
          returns (size_t) -1 and sets errno to EILSEQ.  In this case, the
          effects on *ps are undefined.

          If ps is NULL, a static anonymous state known only to the
          mbrlen() function is used instead.


-----------------------------------------------------------------

::

          The mbrlen() function returns the number of bytes parsed from the
          multibyte sequence starting at s, if a non-null wide character
          was recognized.  It returns 0, if a null wide character was
          recognized.  It returns (size_t) -1 and sets errno to EILSEQ, if
          an invalid multibyte sequence was encountered.  It returns
          (size_t) -2 if it couldn't parse a complete multibyte character,
          meaning that n should be increased.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────────────┬───────────────┬───────────────────────────┐
          │Interface           │ Attribute     │ Value                     │
          ├────────────────────┼───────────────┼───────────────────────────┤
          │mbrlen()            │ Thread safety │ MT-Unsafe race:mbrlen/!ps │
          └────────────────────┴───────────────┴───────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of mbrlen() depends on the LC_CTYPE category of the
          current locale.


---------------------------------------------------------

::

          mbrtowc(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      MBRLEN(3)

--------------

Pages that refer to this page: `mblen(3) <../man3/mblen.3.html>`__, 
`mbsinit(3) <../man3/mbsinit.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/mbrlen.3.license.html>`__

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
