.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mbrtowc(3) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MBRTOWC(3)              Linux Programmer's Manual             MBRTOWC(3)

NAME
-------------------------------------------------

::

          mbrtowc - convert a multibyte sequence to a wide character


---------------------------------------------------------

::

          #include <wchar.h>

          size_t mbrtowc(wchar_t *restrict pwc, const char *restrict s, size_t n,
                         mbstate_t *restrict ps);


---------------------------------------------------------------

::

          The main case for this function is when s is not NULL and pwc is
          not NULL.  In this case, the mbrtowc() function inspects at most
          n bytes of the multibyte string starting at s, extracts the next
          complete multibyte character, converts it to a wide character and
          stores it at *pwc.  It updates the shift state *ps.  If the
          converted wide character is not L'\0' (the null wide character),
          it returns the number of bytes that were consumed from s.  If the
          converted wide character is L'\0', it resets the shift state *ps
          to the initial state and returns 0.

          If the n bytes starting at s do not contain a complete multibyte
          character, mbrtowc() returns (size_t) -2.  This can happen even
          if n >= MB_CUR_MAX, if the multibyte string contains redundant
          shift sequences.

          If the multibyte string starting at s contains an invalid
          multibyte sequence before the next complete character, mbrtowc()
          returns (size_t) -1 and sets errno to EILSEQ.  In this case, the
          effects on *ps are undefined.

          A different case is when s is not NULL but pwc is NULL.  In this
          case, the mbrtowc() function behaves as above, except that it
          does not store the converted wide character in memory.

          A third case is when s is NULL.  In this case, pwc and n are
          ignored.  If the conversion state represented by *ps denotes an
          incomplete multibyte character conversion, the mbrtowc() function
          returns (size_t) -1, sets errno to EILSEQ, and leaves *ps in an
          undefined state.  Otherwise, the mbrtowc() function puts *ps in
          the initial state and returns 0.

          In all of the above cases, if ps is NULL, a static anonymous
          state known only to the mbrtowc() function is used instead.
          Otherwise, *ps must be a valid mbstate_t object.  An mbstate_t
          object a can be initialized to the initial state by zeroing it,
          for example using

              memset(&a, 0, sizeof(a));


-----------------------------------------------------------------

::

          The mbrtowc() function returns the number of bytes parsed from
          the multibyte sequence starting at s, if a non-L'\0' wide
          character was recognized.  It returns 0, if a L'\0' wide
          character was recognized.  It returns (size_t) -1 and sets errno
          to EILSEQ, if an invalid multibyte sequence was encountered.  It
          returns (size_t) -2 if it couldn't parse a complete multibyte
          character, meaning that n should be increased.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────┬───────────────┬────────────────────────────┐
          │Interface          │ Attribute     │ Value                      │
          ├───────────────────┼───────────────┼────────────────────────────┤
          │mbrtowc()          │ Thread safety │ MT-Unsafe race:mbrtowc/!ps │
          └───────────────────┴───────────────┴────────────────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of mbrtowc() depends on the LC_CTYPE category of the
          current locale.


---------------------------------------------------------

::

          mbsinit(3), mbsrtowcs(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                     MBRTOWC(3)

--------------

Pages that refer to this page: `btowc(3) <../man3/btowc.3.html>`__, 
`mbrlen(3) <../man3/mbrlen.3.html>`__, 
`mbsinit(3) <../man3/mbsinit.3.html>`__, 
`mbsnrtowcs(3) <../man3/mbsnrtowcs.3.html>`__, 
`mbsrtowcs(3) <../man3/mbsrtowcs.3.html>`__, 
`mbtowc(3) <../man3/mbtowc.3.html>`__, 
`wprintf(3) <../man3/wprintf.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/mbrtowc.3.license.html>`__

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
