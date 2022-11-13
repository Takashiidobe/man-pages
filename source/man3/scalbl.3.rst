.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

scalb(3) — Linux manual page
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

   SCALB(3)                Linux Programmer's Manual               SCALB(3)

NAME
-------------------------------------------------

::

          scalb, scalbf, scalbl - multiply floating-point number by
          integral power of radix (OBSOLETE)


---------------------------------------------------------

::

          #include <math.h>

          double scalb(double x, double exp);
          float scalbf(float x, float exp);
          long double scalbl(long double x, long double exp);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          scalb():
              _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          scalbf(), scalbl():
              _XOPEN_SOURCE >= 600
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions multiply their first argument x by FLT_RADIX
          (probably 2) to the power of exp, that is:

              x * FLT_RADIX ** exp

          The definition of FLT_RADIX can be obtained by including
          <float.h>.


-----------------------------------------------------------------

::

          On success, these functions return x * FLT_RADIX ** exp.

          If x or exp is a NaN, a NaN is returned.

          If x is positive infinity (negative infinity), and exp is not
          negative infinity, positive infinity (negative infinity) is
          returned.

          If x is +0 (-0), and exp is not positive infinity, +0 (-0) is
          returned.

          If x is zero, and exp is positive infinity, a domain error
          occurs, and a NaN is returned.

          If x is an infinity, and exp is negative infinity, a domain error
          occurs, and a NaN is returned.

          If the result overflows, a range error occurs, and the functions
          return HUGE_VAL, HUGE_VALF, or HUGE_VALL, respectively, with a
          sign the same as x.

          If the result underflows, a range error occurs, and the functions
          return zero, with a sign the same as x.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Domain error: x is 0, and exp is positive infinity, or x is
          positive infinity and exp is negative infinity and the other
          argument is not a NaN
                 errno is set to EDOM.  An invalid floating-point exception
                 (FE_INVALID) is raised.

          Range error, overflow
                 errno is set to ERANGE.  An overflow floating-point
                 exception (FE_OVERFLOW) is raised.

          Range error, underflow
                 errno is set to ERANGE.  An underflow floating-point
                 exception (FE_UNDERFLOW) is raised.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │scalb(), scalbf(), scalbl()           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          scalb() is specified in POSIX.1-2001, but marked obsolescent.
          POSIX.1-2008 removes the specification of scalb(), recommending
          the use of scalbln(3), scalblnf(3), or scalblnl(3) instead.  The
          scalb() function is from 4.3BSD.

          scalbf() and scalbl() are unstandardized; scalbf() is
          nevertheless present on several other systems


-------------------------------------------------

::

          Before glibc 2.20, these functions did not set errno for domain
          and range errors.


---------------------------------------------------------

::

          ldexp(3), scalbln(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       SCALB(3)

--------------

Pages that refer to this page: `scalbln(3) <../man3/scalbln.3.html>`__, 
`significand(3) <../man3/significand.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/scalb.3.license.html>`__

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
