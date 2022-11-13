.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

frexp(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   FREXP(3)                Linux Programmer's Manual               FREXP(3)

NAME
-------------------------------------------------

::

          frexp, frexpf, frexpl - convert floating-point number to
          fractional and integral components


---------------------------------------------------------

::

          #include <math.h>

          double frexp(double x, int *exp);
          float frexpf(float x, int *exp);
          long double frexpl(long double x, int *exp);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          frexpf(), frexpl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions are used to split the number x into a normalized
          fraction and an exponent which is stored in exp.


-----------------------------------------------------------------

::

          These functions return the normalized fraction.  If the argument
          x is not zero, the normalized fraction is x times a power of two,
          and its absolute value is always in the range 1/2 (inclusive) to
          1 (exclusive), that is, [0.5,1).

          If x is zero, then the normalized fraction is zero and zero is
          stored in exp.

          If x is a NaN, a NaN is returned, and the value of *exp is
          unspecified.

          If x is positive infinity (negative infinity), positive infinity
          (negative infinity) is returned, and the value of *exp is
          unspecified.


-----------------------------------------------------

::

          No errors occur.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │frexp(), frexpf(), frexpl()           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.

          The variant returning double also conforms to SVr4, 4.3BSD, C89.


---------------------------------------------------------

::

          The program below produces results such as the following:

              $ ./a.out 2560
              frexp(2560, &e) = 0.625: 0.625 * 2^12 = 2560
              $ ./a.out -4
              frexp(-4, &e) = -0.5: -0.5 * 2^3 = -4

      Program source

          #include <math.h>
          #include <float.h>
          #include <stdio.h>
          #include <stdlib.h>

          int
          main(int argc, char *argv[])
          {
              double x, r;
              int exp;

              x = strtod(argv[1], NULL);
              r = frexp(x, &exp);

              printf("frexp(%g, &e) = %g: %g * %d^%d = %g\n",
                     x, r, r, FLT_RADIX, exp, x);
              exit(EXIT_SUCCESS);
          }


---------------------------------------------------------

::

          ldexp(3), modf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       FREXP(3)

--------------

Pages that refer to this page: `ldexp(3) <../man3/ldexp.3.html>`__, 
`modf(3) <../man3/modf.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/frexp.3.license.html>`__

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
