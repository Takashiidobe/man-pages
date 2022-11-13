.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

catanh(3) — Linux manual page
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

   CATANH(3)               Linux Programmer's Manual              CATANH(3)

NAME
-------------------------------------------------

::

          catanh, catanhf, catanhl - complex arc tangents hyperbolic


---------------------------------------------------------

::

          #include <complex.h>

          double complex catanh(double complex z);
          float complex catanhf(float complex z);
          long double complex catanhl(long double complex z);

          Link with -lm.


---------------------------------------------------------------

::

          These functions calculate the complex arc hyperbolic tangent of
          z.  If y = catanh(z), then z = ctanh(y).  The imaginary part of y
          is chosen in the interval [-pi/2,pi/2].

          One has:

              catanh(z) = 0.5 * (clog(1 + z) - clog(1 - z))


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
          │catanh(), catanhf(), catanhl()        │ Thread safety │ MT-Safe │
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

              c = catanh(z);
              printf("catanh() = %6.3f %6.3f*i\n", creal(c), cimag(c));

              f = 0.5 * (clog(1 + z) - clog(1 - z));
              printf("formula  = %6.3f %6.3f*i\n", creal(f2), cimag(f2));

              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          atanh(3), cabs(3), cimag(3), ctanh(3), complex(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      CATANH(3)

--------------

Pages that refer to this page: `atanh(3) <../man3/atanh.3.html>`__, 
`ctanh(3) <../man3/ctanh.3.html>`__, 
`complex(7) <../man7/complex.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/catanh.3.license.html>`__

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
