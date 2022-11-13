.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

log(3) — Linux manual page
==========================

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

   LOG(3)                  Linux Programmer's Manual                 LOG(3)

NAME
-------------------------------------------------

::

          log, logf, logl - natural logarithmic function


---------------------------------------------------------

::

          #include <math.h>

          double log(double x);
          float logf(float x);
          long double logl(long double x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          logf(), logl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions return the natural logarithm of x.


-----------------------------------------------------------------

::

          On success, these functions return the natural logarithm of x.

          If x is a NaN, a NaN is returned.

          If x is 1, the result is +0.

          If x is positive infinity, positive infinity is returned.

          If x is zero, then a pole error occurs, and the functions return
          -HUGE_VAL, -HUGE_VALF, or -HUGE_VALL, respectively.

          If x is negative (including negative infinity), then a domain
          error occurs, and a NaN (not a number) is returned.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Domain error: x is negative
                 errno is set to EDOM.  An invalid floating-point exception
                 (FE_INVALID) is raised.

          Pole error: x is zero
                 errno is set to ERANGE.  A divide-by-zero floating-point
                 exception (FE_DIVBYZERO) is raised.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │log(), logf(), logl()                 │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.

          The variant returning double also conforms to SVr4, 4.3BSD, C89.


-------------------------------------------------

::

          In glibc 2.5 and earlier, taking the log() of a NaN produces a
          bogus invalid floating-point (FE_INVALID) exception.


---------------------------------------------------------

::

          cbrt(3), clog(3), log10(3), log1p(3), log2(3), sqrt(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                         LOG(3)

--------------

Pages that refer to this page: `expm1(3) <../man3/expm1.3.html>`__, 
`ilogb(3) <../man3/ilogb.3.html>`__, 
`log10(3) <../man3/log10.3.html>`__, 
`log1p(3) <../man3/log1p.3.html>`__, 
`log2(3) <../man3/log2.3.html>`__,  `logb(3) <../man3/logb.3.html>`__, 
`matherr(3) <../man3/matherr.3.html>`__, 
`math_error(7) <../man7/math_error.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/log.3.license.html>`__

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
