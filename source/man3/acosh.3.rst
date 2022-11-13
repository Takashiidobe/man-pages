.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

acosh(3) — Linux manual page
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

   ACOSH(3)                Linux Programmer's Manual               ACOSH(3)

NAME
-------------------------------------------------

::

          acosh, acoshf, acoshl - inverse hyperbolic cosine function


---------------------------------------------------------

::

          #include <math.h>

          double acosh(double x);
          float acoshf(float x);
          long double acoshl(long double x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          acosh():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          acoshf(), acoshl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions calculate the inverse hyperbolic cosine of x;
          that is the value whose hyperbolic cosine is x.


-----------------------------------------------------------------

::

          On success, these functions return the inverse hyperbolic cosine
          of x.

          If x is a NaN, a NaN is returned.

          If x is +1, +0 is returned.

          If x is positive infinity, positive infinity is returned.

          If x is less than 1, a domain error occurs, and the functions
          return a NaN.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Domain error: x is less than 1
                 errno is set to EDOM.  An invalid floating-point exception
                 (FE_INVALID) is raised.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │acosh(), acoshf(), acoshl()           │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.

          The variant returning double also conforms to SVr4, 4.3BSD.


---------------------------------------------------------

::

          asinh(3), atanh(3), cacosh(3), cosh(3), sinh(3), tanh(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       ACOSH(3)

--------------

Pages that refer to this page: `asinh(3) <../man3/asinh.3.html>`__, 
`atanh(3) <../man3/atanh.3.html>`__, 
`cacosh(3) <../man3/cacosh.3.html>`__, 
`cosh(3) <../man3/cosh.3.html>`__,  `sinh(3) <../man3/sinh.3.html>`__, 
`tanh(3) <../man3/tanh.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/acosh.3.license.html>`__

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
