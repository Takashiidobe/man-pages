.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

complex(7) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   COMPLEX(7)              Linux Programmer's Manual             COMPLEX(7)

NAME
-------------------------------------------------

::

          complex - basics of complex mathematics


---------------------------------------------------------

::

          #include <complex.h>


---------------------------------------------------------------

::

          Complex numbers are numbers of the form z = a+b*i, where a and b
          are real numbers and i = sqrt(-1), so that i*i = -1.

          There are other ways to represent that number.  The pair (a,b) of
          real numbers may be viewed as a point in the plane, given by X-
          and Y-coordinates.  This same point may also be described by
          giving the pair of real numbers (r,phi), where r is the distance
          to the origin O, and phi the angle between the X-axis and the
          line Oz.  Now z = r*exp(i*phi) = r*(cos(phi)+i*sin(phi)).

          The basic operations are defined on z = a+b*i and w = c+d*i as:

          addition: z+w = (a+c) + (b+d)*i

          multiplication: z*w = (a*c - b*d) + (a*d + b*c)*i

          division: z/w = ((a*c + b*d)/(c*c + d*d)) + ((b*c - a*d)/(c*c +
          d*d))*i

          Nearly all math function have a complex counterpart but there are
          some complex-only functions.


---------------------------------------------------------

::

          Your C-compiler can work with complex numbers if it supports the
          C99 standard.  Link with -lm.  The imaginary unit is represented
          by I.

          /* check that exp(i * pi) == -1 */
          #include <math.h>        /* for atan */
          #include <stdio.h>
          #include <complex.h>

          int
          main(void)
          {
              double pi = 4 * atan(1.0);
              double complex z = cexp(I * pi);
              printf("%f + %f * i\n", creal(z), cimag(z));
          }


---------------------------------------------------------

::

          cabs(3), cacos(3), cacosh(3), carg(3), casin(3), casinh(3),
          catan(3), catanh(3), ccos(3), ccosh(3), cerf(3), cexp(3),
          cexp2(3), cimag(3), clog(3), clog10(3), clog2(3), conj(3),
          cpow(3), cproj(3), creal(3), csin(3), csinh(3), csqrt(3),
          ctan(3), ctanh(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     COMPLEX(7)

--------------

Pages that refer to this page: `cabs(3) <../man3/cabs.3.html>`__, 
`cacos(3) <../man3/cacos.3.html>`__, 
`cacosh(3) <../man3/cacosh.3.html>`__, 
`carg(3) <../man3/carg.3.html>`__, 
`casin(3) <../man3/casin.3.html>`__, 
`casinh(3) <../man3/casinh.3.html>`__, 
`catan(3) <../man3/catan.3.html>`__, 
`catanh(3) <../man3/catanh.3.html>`__, 
`ccos(3) <../man3/ccos.3.html>`__, 
`ccosh(3) <../man3/ccosh.3.html>`__, 
`cexp2(3) <../man3/cexp2.3.html>`__, 
`cexp(3) <../man3/cexp.3.html>`__, 
`cimag(3) <../man3/cimag.3.html>`__, 
`clog10(3) <../man3/clog10.3.html>`__, 
`clog2(3) <../man3/clog2.3.html>`__, 
`clog(3) <../man3/clog.3.html>`__,  `conj(3) <../man3/conj.3.html>`__, 
`cpow(3) <../man3/cpow.3.html>`__, 
`cproj(3) <../man3/cproj.3.html>`__, 
`creal(3) <../man3/creal.3.html>`__, 
`csin(3) <../man3/csin.3.html>`__, 
`csinh(3) <../man3/csinh.3.html>`__, 
`csqrt(3) <../man3/csqrt.3.html>`__, 
`ctan(3) <../man3/ctan.3.html>`__,  `ctanh(3) <../man3/ctanh.3.html>`__

--------------

`Copyright and license for this manual
page <../man7/complex.7.license.html>`__

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
