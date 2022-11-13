.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

end(3) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   END(3)                  Linux Programmer's Manual                 END(3)

NAME
-------------------------------------------------

::

          etext, edata, end - end of program segments


---------------------------------------------------------

::

          extern etext;
          extern edata;
          extern end;


---------------------------------------------------------------

::

          The addresses of these symbols indicate the end of various
          program segments:

          etext  This is the first address past the end of the text segment
                 (the program code).

          edata  This is the first address past the end of the initialized
                 data segment.

          end    This is the first address past the end of the
                 uninitialized data segment (also known as the BSS
                 segment).


-------------------------------------------------------------------

::

          Although these symbols have long been provided on most UNIX
          systems, they are not standardized; use with caution.


---------------------------------------------------

::

          The program must explicitly declare these symbols; they are not
          defined in any header file.

          On some systems the names of these symbols are preceded by
          underscores, thus: _etext, _edata, and _end.  These symbols are
          also defined for programs compiled on Linux.

          At the start of program execution, the program break will be
          somewhere near &end (perhaps at the start of the following page).
          However, the break will change as memory is allocated via brk(2)
          or malloc(3).  Use sbrk(2) with an argument of zero to find the
          current value of the program break.


---------------------------------------------------------

::

          When run, the program below produces output such as the
          following:

              $ ./a.out
              First address past:
                  program text (etext)       0x8048568
                  initialized data (edata)   0x804a01c
                  uninitialized data (end)   0x804a024

      Program source

          #include <stdio.h>
          #include <stdlib.h>

          extern char etext, edata, end; /* The symbols must have some type,
                                             or "gcc -Wall" complains */

          int
          main(int argc, char *argv[])
          {
              printf("First address past:\n");
              printf("    program text (etext)      %10p\n", &etext);
              printf("    initialized data (edata)  %10p\n", &edata);
              printf("    uninitialized data (end)  %10p\n", &end);

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          objdump(1), readelf(1), sbrk(2), elf(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2020-06-09                         END(3)

--------------

Pages that refer to this page: `brk(2) <../man2/brk.2.html>`__

--------------

`Copyright and license for this manual
page <../man3/end.3.license.html>`__

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
