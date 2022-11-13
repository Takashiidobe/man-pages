.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fputwc(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FPUTWC(3)               Linux Programmer's Manual              FPUTWC(3)

NAME
-------------------------------------------------

::

          fputwc, putwc - write a wide character to a FILE stream


---------------------------------------------------------

::

          #include <stdio.h>
          #include <wchar.h>

          wint_t fputwc(wchar_t wc, FILE *stream);
          wint_t putwc(wchar_t wc, FILE *stream);


---------------------------------------------------------------

::

          The fputwc() function is the wide-character equivalent of the
          fputc(3) function.  It writes the wide character wc to stream.
          If ferror(stream) becomes true, it returns WEOF.  If a wide-
          character conversion error occurs, it sets errno to EILSEQ and
          returns WEOF.  Otherwise, it returns wc.

          The putwc() function or macro functions identically to fputwc().
          It may be implemented as a macro, and may evaluate its argument
          more than once.  There is no reason ever to use it.

          For nonlocking counterparts, see unlocked_stdio(3).


-----------------------------------------------------------------

::

          On success, fputwc() function returns wc.  Otherwise, WEOF is
          returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          Apart from the usual ones, there is

          EILSEQ Conversion of wc to the stream's encoding fails.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fputwc(), putwc()                     │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of fputwc() depends on the LC_CTYPE category of the
          current locale.

          In the absence of additional information passed to the fopen(3)
          call, it is reasonable to expect that fputwc() will actually
          write the multibyte sequence corresponding to the wide character
          wc.


---------------------------------------------------------

::

          fgetwc(3), fputws(3), unlocked_stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      FPUTWC(3)

--------------

Pages that refer to this page:
`curs_add_wch(3x) <../man3/curs_add_wch.3x.html>`__, 
`fgetwc(3) <../man3/fgetwc.3.html>`__, 
`fputws(3) <../man3/fputws.3.html>`__, 
`puts(3) <../man3/puts.3.html>`__, 
`putwchar(3) <../man3/putwchar.3.html>`__, 
`wprintf(3) <../man3/wprintf.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/fputwc.3.license.html>`__

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
