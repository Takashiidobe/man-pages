.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

MAX(3) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MAX(3)                  Linux Programmer's Manual                 MAX(3)

NAME
-------------------------------------------------

::

          MAX, MIN - maximum or minimum of two values


---------------------------------------------------------

::

          #include <sys/param.h>

          MAX(a, b);
          MIN(a, b);


---------------------------------------------------------------

::

          These macros return the maximum or minimum of a and b.


-----------------------------------------------------------------

::

          These macros return the value of one of their arguments, possibly
          converted to a different type (see BUGS).


-----------------------------------------------------

::

          These macros may raise the "invalid" floating-point exception
          when any of the arguments is NaN.


-------------------------------------------------------------------

::

          These nonstandard macros are present in glibc and the BSDs.


---------------------------------------------------

::

          If either of the arguments is of a floating-point type, you might
          prefer to use fmax(3) or fmin(3), which can handle NaN.

          The arguments may be evaluated more than once, or not at all.

          Some UNIX systems might provide these macros in a different
          header, or not at all.


-------------------------------------------------

::

          Due to the usual arithmetic conversions, the result of these
          macros may be very different from either of the arguments.  To
          avoid this, ensure that both arguments have the same type.


---------------------------------------------------------

::

          #include <stdio.h>
          #include <stdlib.h>
          #include <sys/param.h>

          int
          main(int argc, char *argv[])
          {
              int a, b, x;

              if (argc != 3) {
                  fprintf(stderr, "Usage: %s <num> <num>\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              a = atoi(argv[1]);
              b = atoi(argv[2]);
              x = MAX(a, b);
              printf("MAX(%d, %d) is %d\n", a, b, x);

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          fmax(3), fmin(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-11-01                         MAX(3)

--------------

`Copyright and license for this manual
page <../man3/MAX.3.license.html>`__

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
