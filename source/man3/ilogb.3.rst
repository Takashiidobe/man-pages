.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ilogb(3) — Linux manual page
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

   ILOGB(3)                Linux Programmer's Manual               ILOGB(3)

NAME
-------------------------------------------------

::

          ilogb, ilogbf, ilogbl - get integer exponent of a floating-point
          value


---------------------------------------------------------

::

          #include <math.h>

          int ilogb(double x);
          int ilogbf(float x);
          int ilogbl(long double x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          ilogb():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          ilogbf(), ilogbl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions return the exponent part of their argument as a
          signed integer.  When no error occurs, these functions are
          equivalent to the corresponding logb(3) functions, cast to int.


-----------------------------------------------------------------

::

          On success, these functions return the exponent of x, as a signed
          integer.

          If x is zero, then a domain error occurs, and the functions
          return FP_ILOGB0.

          If x is a NaN, then a domain error occurs, and the functions
          return FP_ILOGBNAN.

          If x is negative infinity or positive infinity, then a domain
          error occurs, and the functions return INT_MAX.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Domain error: x is 0 or a NaN
                 An invalid floating-point exception (FE_INVALID) is
                 raised, and errno is set to EDOM (but see BUGS).

          Domain error: x is an infinity
                 An invalid floating-point exception (FE_INVALID) is
                 raised, and errno is set to EDOM (but see BUGS).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │ilogb(), ilogbf(), ilogbl()           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.


-------------------------------------------------

::

          Before version 2.16, the following bugs existed in the glibc
          implementation of these functions:

          *  The domain error case where x is 0 or a NaN did not cause
             errno to be set or (on some architectures) raise a floating-
             point exception.

          *  The domain error case where x is an infinity did not cause
             errno to be set or raise a floating-point exception.


---------------------------------------------------------

::

          log(3), logb(3), significand(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       ILOGB(3)

--------------

Pages that refer to this page: `logb(3) <../man3/logb.3.html>`__, 
`significand(3) <../man3/significand.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/ilogb.3.license.html>`__

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
