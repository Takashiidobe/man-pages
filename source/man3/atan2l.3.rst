.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

atan2(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ATAN2(3)                Linux Programmer's Manual               ATAN2(3)

NAME
-------------------------------------------------

::

          atan2, atan2f, atan2l - arc tangent function of two variables


---------------------------------------------------------

::

          #include <math.h>

          double atan2(double y, double x);
          float atan2f(float y, float x);
          long double atan2l(long double y, long double x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          atan2f(), atan2l():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions calculate the principal value of the arc tangent
          of y/x, using the signs of the two arguments to determine the
          quadrant of the result.


-----------------------------------------------------------------

::

          On success, these functions return the principal value of the arc
          tangent of y/x in radians; the return value is in the range
          [-pi, pi].

          If y is +0 (-0) and x is less than 0, +pi (-pi) is returned.

          If y is +0 (-0) and x is greater than 0, +0 (-0) is returned.

          If y is less than 0 and x is +0 or -0, -pi/2 is returned.

          If y is greater than 0 and x is +0 or -0, pi/2 is returned.

          If either x or y is NaN, a NaN is returned.

          If y is +0 (-0) and x is -0, +pi (-pi) is returned.

          If y is +0 (-0) and x is +0, +0 (-0) is returned.

          If y is a finite value greater (less) than 0, and x is negative
          infinity, +pi (-pi) is returned.

          If y is a finite value greater (less) than 0, and x is positive
          infinity, +0 (-0) is returned.

          If y is positive infinity (negative infinity), and x is finite,
          pi/2 (-pi/2) is returned.

          If y is positive infinity (negative infinity) and x is negative
          infinity, +3*pi/4 (-3*pi/4) is returned.

          If y is positive infinity (negative infinity) and x is positive
          infinity, +pi/4 (-pi/4) is returned.


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
          │atan2(), atan2f(), atan2l()           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.

          The variant returning double also conforms to SVr4, 4.3BSD, C89.


---------------------------------------------------------

::

          acos(3), asin(3), atan(3), carg(3), cos(3), sin(3), tan(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       ATAN2(3)

--------------

Pages that refer to this page: `acos(3) <../man3/acos.3.html>`__, 
`asin(3) <../man3/asin.3.html>`__,  `atan(3) <../man3/atan.3.html>`__, 
`cos(3) <../man3/cos.3.html>`__,  `sin(3) <../man3/sin.3.html>`__, 
`tan(3) <../man3/tan.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/atan2.3.license.html>`__

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
