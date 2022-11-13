.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

scalbln(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SCALBLN(3)              Linux Programmer's Manual             SCALBLN(3)

NAME
-------------------------------------------------

::

          scalbn, scalbnf, scalbnl, scalbln, scalblnf, scalblnl - multiply
          floating-point number by integral power of radix


---------------------------------------------------------

::

          #include <math.h>

          double scalbln(double x, long exp);
          float scalblnf(float x, long exp);
          long double scalblnl(long double x, long exp);

          double scalbn(double x, int exp);
          float scalbnf(float x, int exp);
          long double scalbnl(long double x, int exp);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          scalbln(), scalblnf(), scalblnl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE

          scalbn(), scalbnf(), scalbnl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
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

          If x is a NaN, a NaN is returned.

          If x is positive infinity (negative infinity), positive infinity
          (negative infinity) is returned.

          If x is +0 (-0), +0 (-0) is returned.

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

          Range error, overflow
                 An overflow floating-point exception (FE_OVERFLOW) is
                 raised.

          Range error, underflow
                 errno is set to ERANGE.  An underflow floating-point
                 exception (FE_UNDERFLOW) is raised.


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
          │scalbn(), scalbnf(), scalbnl(),       │ Thread safety │ MT-Safe │
          │scalbln(), scalblnf(), scalblnl()     │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          These functions differ from the obsolete functions described in
          scalb(3) in the type of their second argument.  The functions
          described on this page have a second argument of an integral
          type, while those in scalb(3) have a second argument of type
          double.

          If FLT_RADIX equals 2 (which is usual), then scalbn() is
          equivalent to ldexp(3).


-------------------------------------------------

::

          Before glibc 2.20, these functions did not set errno for range
          errors.


---------------------------------------------------------

::

          ldexp(3), scalb(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                     SCALBLN(3)

--------------

Pages that refer to this page: `ldexp(3) <../man3/ldexp.3.html>`__, 
`scalb(3) <../man3/scalb.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/scalbln.3.license.html>`__

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
