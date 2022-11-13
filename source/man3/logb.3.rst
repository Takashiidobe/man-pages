.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

logb(3) — Linux manual page
===========================

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

   LOGB(3)                 Linux Programmer's Manual                LOGB(3)

NAME
-------------------------------------------------

::

          logb, logbf, logbl - get exponent of a floating-point value


---------------------------------------------------------

::

          #include <math.h>

          double logb(double x);
          float logbf(float x);
          long double logbl(long double x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          logb():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          logbf(), logbl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions extract the exponent from the internal floating-
          point representation of x and return it as a floating-point
          value.  The integer constant FLT_RADIX, defined in <float.h>,
          indicates the radix used for the system's floating-point
          representation.  If FLT_RADIX is 2, logb(x) is equal to
          floor(log2(x)), except that it is probably faster.

          If x is subnormal, logb() returns the exponent x would have if it
          were normalized.


-----------------------------------------------------------------

::

          On success, these functions return the exponent of x.

          If x is a NaN, a NaN is returned.

          If x is zero, then a pole error occurs, and the functions return
          -HUGE_VAL, -HUGE_VALF, or -HUGE_VALL, respectively.

          If x is negative infinity or positive infinity, then positive
          infinity is returned.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Pole error: x is 0
                 A divide-by-zero floating-point exception (FE_DIVBYZERO)
                 is raised.

          These functions do not set errno.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │logb(), logbf(), logbl()              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          ilogb(3), log(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                        LOGB(3)

--------------

Pages that refer to this page: `ilogb(3) <../man3/ilogb.3.html>`__, 
`remquo(3) <../man3/remquo.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/logb.3.license.html>`__

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
