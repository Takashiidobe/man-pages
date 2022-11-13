.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

puts(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PUTS(3)                 Linux Programmer's Manual                PUTS(3)

NAME
-------------------------------------------------

::

          fputc, fputs, putc, putchar, puts - output of characters and
          strings


---------------------------------------------------------

::

          #include <stdio.h>

          int fputc(int c, FILE *stream);
          int putc(int c, FILE *stream);
          int putchar(int c);

          int fputs(const char *restrict s, FILE *restrict stream);
          int puts(const char *s);


---------------------------------------------------------------

::

          fputc() writes the character c, cast to an unsigned char, to
          stream.

          putc() is equivalent to fputc() except that it may be implemented
          as a macro which evaluates stream more than once.

          putchar(c) is equivalent to putc(c, stdout).

          fputs() writes the string s to stream, without its terminating
          null byte ('\0').

          puts() writes the string s and a trailing newline to stdout.

          Calls to the functions described here can be mixed with each
          other and with calls to other output functions from the stdio
          library for the same output stream.

          For nonlocking counterparts, see unlocked_stdio(3).


-----------------------------------------------------------------

::

          fputc(), putc(), and putchar() return the character written as an
          unsigned char cast to an int or EOF on error.

          puts() and fputs() return a nonnegative number on success, or EOF
          on error.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fputc(), fputs(), putc(), putchar(),  │ Thread safety │ MT-Safe │
          │puts()                                │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C89, C99.


-------------------------------------------------

::

          It is not advisable to mix calls to output functions from the
          stdio library with low-level calls to write(2) for the file
          descriptor associated with the same output stream; the results
          will be undefined and very probably not what you want.


---------------------------------------------------------

::

          write(2), ferror(3), fgets(3), fopen(3), fputwc(3), fputws(3),
          fseek(3), fwrite(3), putwchar(3), scanf(3), unlocked_stdio(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                        PUTS(3)

--------------

Pages that refer to this page:
`curs_addch(3x) <../man3/curs_addch.3x.html>`__, 
`curs_termcap(3x) <../man3/curs_termcap.3x.html>`__, 
`curs_terminfo(3x) <../man3/curs_terminfo.3x.html>`__, 
`fgetc(3) <../man3/fgetc.3.html>`__, 
`flockfile(3) <../man3/flockfile.3.html>`__, 
`fputwc(3) <../man3/fputwc.3.html>`__, 
`fputws(3) <../man3/fputws.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__,  `getw(3) <../man3/getw.3.html>`__, 
`printf(3) <../man3/printf.3.html>`__, 
`putwchar(3) <../man3/putwchar.3.html>`__, 
`setbuf(3) <../man3/setbuf.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/puts.3.license.html>`__

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
