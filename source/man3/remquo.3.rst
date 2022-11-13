.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

remquo(3) — Linux manual page
=============================

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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   REMQUO(3)               Linux Programmer's Manual              REMQUO(3)

NAME
-------------------------------------------------

::

          remquo, remquof, remquol - remainder and part of quotient


---------------------------------------------------------

::

          #include <math.h>

          double remquo(double x, double y, int *quo);
          float remquof(float x, float y, int *quo);
          long double remquol(long double x, long double y, int *quo);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          remquo(), remquof(), remquol():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          These functions compute the remainder and part of the quotient
          upon division of x by y.  A few bits of the quotient are stored
          via the quo pointer.  The remainder is returned as the function
          result.

          The value of the remainder is the same as that computed by the
          remainder(3) function.

          The value stored via the quo pointer has the sign of x / y and
          agrees with the quotient in at least the low order 3 bits.

          For example, remquo(29.0, 3.0) returns -1.0 and might store 2.
          Note that the actual quotient might not fit in an integer.


-----------------------------------------------------------------

::

          On success, these functions return the same value as the
          analogous functions described in remainder(3).

          If x or y is a NaN, a NaN is returned.

          If x is an infinity, and y is not a NaN, a domain error occurs,
          and a NaN is returned.

          If y is zero, and x is not a NaN, a domain error occurs, and a
          NaN is returned.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Domain error: x is an infinity or y is 0, and the other argument
          is not a NaN
                 An invalid floating-point exception (FE_INVALID) is
                 raised.

          These functions do not set errno.


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
          │remquo(), remquof(), remquol()        │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          fmod(3), logb(3), remainder(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      REMQUO(3)

--------------

Pages that refer to this page: `fma(3) <../man3/fma.3.html>`__, 
`remainder(3) <../man3/remainder.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/remquo.3.license.html>`__

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
