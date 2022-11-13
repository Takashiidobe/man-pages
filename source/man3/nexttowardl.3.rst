.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nextafter(3) — Linux manual page
================================

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

   NEXTAFTER(3)            Linux Programmer's Manual           NEXTAFTER(3)

NAME
-------------------------------------------------

::

          nextafter, nextafterf, nextafterl, nexttoward, nexttowardf,
          nexttowardl - floating-point number manipulation


---------------------------------------------------------

::

          #include <math.h>

          double nextafter(double x, double y);
          float nextafterf(float x, float y);
          long double nextafterl(long double x, long double y);

          double nexttoward(double x, long double y);
          float nexttowardf(float x, long double y);
          long double nexttowardl(long double x, long double y);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          nextafter():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          nextafterf(), nextafterl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          nexttoward(), nexttowardf(), nexttowardl():
              _XOPEN_SOURCE >= 600 || _ISOC99_SOURCE
                  || _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          The nextafter(), nextafterf(), and nextafterl() functions return
          the next representable floating-point value following x in the
          direction of y.  If y is less than x, these functions will return
          the largest representable number less than x.

          If x equals y, the functions return y.

          The nexttoward(), nexttowardf(), and nexttowardl() functions do
          the same as the corresponding nextafter() functions, except that
          they have a long double second argument.


-----------------------------------------------------------------

::

          On success, these functions return the next representable
          floating-point value after x in the direction of y.

          If x equals y, then y (cast to the same type as x) is returned.

          If x or y is a NaN, a NaN is returned.

          If x is finite, and the result would overflow, a range error
          occurs, and the functions return HUGE_VAL, HUGE_VALF, or
          HUGE_VALL, respectively, with the correct mathematical sign.

          If x is not equal to y, and the correct function result would be
          subnormal, zero, or underflow, a range error occurs, and either
          the correct value (if it can be represented), or 0.0, is
          returned.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Range error: result overflow
                 errno is set to ERANGE.  An overflow floating-point
                 exception (FE_OVERFLOW) is raised.

          Range error: result is subnormal or underflows
                 errno is set to ERANGE.  An underflow floating-point
                 exception (FE_UNDERFLOW) is raised.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │nextafter(), nextafterf(),            │ Thread safety │ MT-Safe │
          │nextafterl(), nexttoward(),           │               │         │
          │nexttowardf(), nexttowardl()          │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.  This function is defined in IEC
          559 (and the appendix with recommended functions in IEEE 754/IEEE
          854).


-------------------------------------------------

::

          In glibc version 2.5 and earlier, these functions do not raise an
          underflow floating-point (FE_UNDERFLOW) exception when an
          underflow occurs.

          Before glibc version 2.23 these functions did not set errno.


---------------------------------------------------------

::

          nearbyint(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   NEXTAFTER(3)

--------------

Pages that refer to this page: `nextup(3) <../man3/nextup.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/nextafter.3.license.html>`__

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
