.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cacosh(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CACOSH(3)               Linux Programmer's Manual              CACOSH(3)

NAME
-------------------------------------------------

::

          cacosh, cacoshf, cacoshl - complex arc hyperbolic cosine


---------------------------------------------------------

::

          #include <complex.h>

          double complex cacosh(double complex z);
          float complex cacoshf(float complex z);
          long double complex cacoshl(long double complex z);

          Link with -lm.


---------------------------------------------------------------

::

          These functions calculate the complex arc hyperbolic cosine of z.
          If y = cacosh(z), then z = ccosh(y).  The imaginary part of y is
          chosen in the interval [-pi,pi].  The real part of y is chosen
          nonnegative.

          One has:

              cacosh(z) = 2 * clog(csqrt((z + 1) / 2) + csqrt((z - 1) / 2))


---------------------------------------------------------

::

          These functions first appeared in glibc in version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │cacosh(), cacoshf(), cacoshl()        │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          /* Link with "-lm" */

          #include <complex.h>
          #include <stdlib.h>
          #include <unistd.h>
          #include <stdio.h>

          int
          main(int argc, char *argv[])
          {
              double complex z, c, f;

              if (argc != 3) {
                  fprintf(stderr, "Usage: %s <real> <imag>\n", argv[0]);
                  exit(EXIT_FAILURE);
              }

              z = atof(argv[1]) + atof(argv[2]) * I;

              c = cacosh(z);
              printf("cacosh() = %6.3f %6.3f*i\n", creal(c), cimag(c));

              f = 2 * clog(csqrt((z + 1)/2) + csqrt((z - 1)/2));
              printf("formula  = %6.3f %6.3f*i\n", creal(f2), cimag(f2));

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          acosh(3), cabs(3), ccosh(3), cimag(3), complex(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      CACOSH(3)

--------------

Pages that refer to this page: `acosh(3) <../man3/acosh.3.html>`__, 
`ccosh(3) <../man3/ccosh.3.html>`__, 
`complex(7) <../man7/complex.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/cacosh.3.license.html>`__

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
