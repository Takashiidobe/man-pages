.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lgamma(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LGAMMA(3)               Linux Programmer's Manual              LGAMMA(3)

NAME
-------------------------------------------------

::

          lgamma, lgammaf, lgammal, lgamma_r, lgammaf_r, lgammal_r, signgam
          - log gamma function


---------------------------------------------------------

::

          #include <math.h>

          double lgamma(double x);
          float lgammaf(float x);
          long double lgammal(long double x);

          double lgamma_r(double x, int *signp);
          float lgammaf_r(float x, int *signp);
          long double lgammal_r(long double x, int *signp);

          extern int signgam;

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          lgamma():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L || _XOPEN_SOURCE
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          lgammaf(), lgammal():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          lgamma_r(), lgammaf_r(), lgammal_r():
              /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          signgam:
              _XOPEN_SOURCE
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          For the definition of the Gamma function, see tgamma(3).

          The lgamma(), lgammaf(), and lgammal() functions return the
          natural logarithm of the absolute value of the Gamma function.
          The sign of the Gamma function is returned in the external
          integer signgam declared in <math.h>.  It is 1 when the Gamma
          function is positive or zero, -1 when it is negative.

          Since using a constant location signgam is not thread-safe, the
          functions lgamma_r(), lgammaf_r(), and lgammal_r() have been
          introduced; they return the sign via the argument signp.


-----------------------------------------------------------------

::

          On success, these functions return the natural logarithm of
          Gamma(x).

          If x is a NaN, a NaN is returned.

          If x is 1 or 2, +0 is returned.

          If x is positive infinity or negative infinity, positive infinity
          is returned.

          If x is a nonpositive integer, a pole error occurs, and the
          functions return +HUGE_VAL, +HUGE_VALF, or +HUGE_VALL,
          respectively.

          If the result overflows, a range error occurs, and the functions
          return HUGE_VAL, HUGE_VALF, or HUGE_VALL, respectively, with the
          correct mathematical sign.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Pole error: x is a nonpositive integer
                 errno is set to ERANGE (but see BUGS).  A divide-by-zero
                 floating-point exception (FE_DIVBYZERO) is raised.

          Range error: result overflow
                 errno is set to ERANGE.  An overflow floating-point
                 exception (FE_OVERFLOW) is raised.


-------------------------------------------------------------------

::

          The lgamma() functions are specified in C99, POSIX.1-2001, and
          POSIX.1-2008.  signgam is specified in POSIX.1-2001 and
          POSIX.1-2008, but not in C99.  The lgamma_r() functions are
          nonstandard, but present on several other systems.


-------------------------------------------------

::

          In glibc 2.9 and earlier, when a pole error occurs, errno is set
          to EDOM; instead of the POSIX-mandated ERANGE.  Since version
          2.10, glibc does the right thing.


---------------------------------------------------------

::

          tgamma(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      LGAMMA(3)

--------------

Pages that refer to this page: `gamma(3) <../man3/gamma.3.html>`__, 
`tgamma(3) <../man3/tgamma.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/lgamma.3.license.html>`__

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
