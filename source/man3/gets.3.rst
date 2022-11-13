.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gets(3) — Linux manual page
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

   GETS(3)                 Linux Programmer's Manual                GETS(3)

NAME
-------------------------------------------------

::

          gets - get a string from standard input (DEPRECATED)


---------------------------------------------------------

::

          #include <stdio.h>

          char *gets(char *s);


---------------------------------------------------------------

::

          Never use this function.

          gets() reads a line from stdin into the buffer pointed to by s
          until either a terminating newline or EOF, which it replaces with
          a null byte ('\0').  No check for buffer overrun is performed
          (see BUGS below).


-----------------------------------------------------------------

::

          gets() returns s on success, and NULL on error or when end of
          file occurs while no characters have been read.  However, given
          the lack of buffer overrun checking, there can be no guarantees
          that the function will even return.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │gets()                                │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C89, C99, POSIX.1-2001.

          LSB deprecates gets().  POSIX.1-2008 marks gets() obsolescent.
          ISO C11 removes the specification of gets() from the C language,
          and since version 2.16, glibc header files don't expose the
          function declaration if the _ISOC11_SOURCE feature test macro is
          defined.


-------------------------------------------------

::

          Never use gets().  Because it is impossible to tell without
          knowing the data in advance how many characters gets() will read,
          and because gets() will continue to store characters past the end
          of the buffer, it is extremely dangerous to use.  It has been
          used to break computer security.  Use fgets() instead.

          For more information, see CWE-242 (aka "Use of Inherently
          Dangerous Function") at
          http://cwe.mitre.org/data/definitions/242.html


---------------------------------------------------------

::

          read(2), write(2), ferror(3), fgetc(3), fgets(3), fgetwc(3),
          fgetws(3), fopen(3), fread(3), fseek(3), getline(3), getwchar(3),
          puts(3), scanf(3), ungetwc(3), unlocked_stdio(3),
          feature_test_macros(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                        GETS(3)

--------------

Pages that refer to this page: `fgetc(3) <../man3/fgetc.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`feature_test_macros(7) <../man7/feature_test_macros.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/gets.3.license.html>`__

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
