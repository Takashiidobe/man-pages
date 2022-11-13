.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

atanh(3) — Linux manual page
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
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ATANH(3)                Linux Programmer's Manual               ATANH(3)

NAME
-------------------------------------------------

::

          atanh, atanhf, atanhl - inverse hyperbolic tangent function


---------------------------------------------------------

::

          #include <math.h>

          double atanh(double x);
          float atanhf(float x);
          long double atanhl(long double x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          atanh():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          atanhf(), atanhl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions calculate the inverse hyperbolic tangent of x;
          that is the value whose hyperbolic tangent is x.


-----------------------------------------------------------------

::

          On success, these functions return the inverse hyperbolic tangent
          of x.

          If x is a NaN, a NaN is returned.

          If x is +0 (-0), +0 (-0) is returned.

          If x is +1 or -1, a pole error occurs, and the functions return
          HUGE_VAL, HUGE_VALF, or HUGE_VALL, respectively, with the
          mathematically correct sign.

          If the absolute value of x is greater than 1, a domain error
          occurs, and a NaN is returned.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Domain error: x less than -1 or greater than +1
                 errno is set to EDOM.  An invalid floating-point exception
                 (FE_INVALID) is raised.

          Pole error: x is +1 or -1
                 errno is set to ERANGE (but see BUGS).  A divide-by-zero
                 floating-point exception (FE_DIVBYZERO) is raised.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │atanh(), atanhf(), atanhl()           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.

          The variant returning double also conforms to SVr4, 4.3BSD.


-------------------------------------------------

::

          In glibc 2.9 and earlier, when a pole error occurs, errno is set
          to EDOM instead of the POSIX-mandated ERANGE.  Since version
          2.10, glibc does the right thing.


---------------------------------------------------------

::

          acosh(3), asinh(3), catanh(3), cosh(3), sinh(3), tanh(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       ATANH(3)

--------------

Pages that refer to this page: `acosh(3) <../man3/acosh.3.html>`__, 
`asinh(3) <../man3/asinh.3.html>`__, 
`catanh(3) <../man3/catanh.3.html>`__, 
`cosh(3) <../man3/cosh.3.html>`__,  `sinh(3) <../man3/sinh.3.html>`__, 
`tanh(3) <../man3/tanh.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/atanh.3.license.html>`__

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
