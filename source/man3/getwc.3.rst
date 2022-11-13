.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fgetwc(3) — Linux manual page
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

   FGETWC(3)               Linux Programmer's Manual              FGETWC(3)

NAME
-------------------------------------------------

::

          fgetwc, getwc - read a wide character from a FILE stream


---------------------------------------------------------

::

          #include <stdio.h>
          #include <wchar.h>

          wint_t fgetwc(FILE *stream);
          wint_t getwc(FILE *stream);


---------------------------------------------------------------

::

          The fgetwc() function is the wide-character equivalent of the
          fgetc(3) function.  It reads a wide character from stream and
          returns it.  If the end of stream is reached, or if
          ferror(stream) becomes true, it returns WEOF.  If a wide-
          character conversion error occurs, it sets errno to EILSEQ and
          returns WEOF.

          The getwc() function or macro functions identically to fgetwc().
          It may be implemented as a macro, and may evaluate its argument
          more than once.  There is no reason ever to use it.

          For nonlocking counterparts, see unlocked_stdio(3).


-----------------------------------------------------------------

::

          On success, fgetwc() returns the next wide-character from the
          stream.  Otherwise, WEOF is returned, and errno is set to
          indicate the error.


-----------------------------------------------------

::

          Apart from the usual ones, there is

          EILSEQ The data obtained from the input stream does not form a
                 valid character.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fgetwc(), getwc()                     │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.


---------------------------------------------------

::

          The behavior of fgetwc() depends on the LC_CTYPE category of the
          current locale.

          In the absence of additional information passed to the fopen(3)
          call, it is reasonable to expect that fgetwc() will actually read
          a multibyte sequence from the stream and then convert it to a
          wide character.


---------------------------------------------------------

::

          fgetws(3), fputwc(3), ungetwc(3), unlocked_stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      FGETWC(3)

--------------

Pages that refer to this page: `fgetc(3) <../man3/fgetc.3.html>`__, 
`fgetws(3) <../man3/fgetws.3.html>`__, 
`fputwc(3) <../man3/fputwc.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__, 
`getwchar(3) <../man3/getwchar.3.html>`__, 
`ungetwc(3) <../man3/ungetwc.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/fgetwc.3.license.html>`__

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
