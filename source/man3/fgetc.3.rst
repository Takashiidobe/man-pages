.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fgetc(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FGETC(3)                Linux Programmer's Manual               FGETC(3)

NAME
-------------------------------------------------

::

          fgetc, fgets, getc, getchar, ungetc - input of characters and
          strings


---------------------------------------------------------

::

          #include <stdio.h>

          int fgetc(FILE *stream);
          int getc(FILE *stream);
          int getchar(void);

          char *fgets(char *restrict s, int size, FILE *restrict stream);

          int ungetc(int c, FILE *stream);


---------------------------------------------------------------

::

          fgetc() reads the next character from stream and returns it as an
          unsigned char cast to an int, or EOF on end of file or error.

          getc() is equivalent to fgetc() except that it may be implemented
          as a macro which evaluates stream more than once.

          getchar() is equivalent to getc(stdin).

          fgets() reads in at most one less than size characters from
          stream and stores them into the buffer pointed to by s.  Reading
          stops after an EOF or a newline.  If a newline is read, it is
          stored into the buffer.  A terminating null byte ('\0') is stored
          after the last character in the buffer.

          ungetc() pushes c back to stream, cast to unsigned char, where it
          is available for subsequent read operations.  Pushed-back
          characters will be returned in reverse order; only one pushback
          is guaranteed.

          Calls to the functions described here can be mixed with each
          other and with calls to other input functions from the stdio
          library for the same input stream.

          For nonlocking counterparts, see unlocked_stdio(3).


-----------------------------------------------------------------

::

          fgetc(), getc(), and getchar() return the character read as an
          unsigned char cast to an int or EOF on end of file or error.

          fgets() returns s on success, and NULL on error or when end of
          file occurs while no characters have been read.

          ungetc() returns c on success, or EOF on error.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fgetc(), fgets(), getc(), getchar(),  │ Thread safety │ MT-Safe │
          │ungetc()                              │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99.

          It is not advisable to mix calls to input functions from the
          stdio library with low-level calls to read(2) for the file
          descriptor associated with the input stream; the results will be
          undefined and very probably not what you want.


---------------------------------------------------------

::

          read(2), write(2), ferror(3), fgetwc(3), fgetws(3), fopen(3),
          fread(3), fseek(3), getline(3), gets(3), getwchar(3), puts(3),
          scanf(3), ungetwc(3), unlocked_stdio(3), feature_test_macros(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       FGETC(3)

--------------

Pages that refer to this page: `fgetwc(3) <../man3/fgetwc.3.html>`__, 
`fgetws(3) <../man3/fgetws.3.html>`__, 
`flockfile(3) <../man3/flockfile.3.html>`__, 
`fpurge(3) <../man3/fpurge.3.html>`__, 
`fseek(3) <../man3/fseek.3.html>`__, 
`getline(3) <../man3/getline.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__,  `getw(3) <../man3/getw.3.html>`__, 
`getwchar(3) <../man3/getwchar.3.html>`__, 
`puts(3) <../man3/puts.3.html>`__, 
`rpmatch(3) <../man3/rpmatch.3.html>`__, 
`scanf(3) <../man3/scanf.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`ungetwc(3) <../man3/ungetwc.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/fgetc.3.license.html>`__

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
