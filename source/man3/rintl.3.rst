.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rint(3) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RINT(3)                 Linux Programmer's Manual                RINT(3)

NAME
-------------------------------------------------

::

          nearbyint, nearbyintf, nearbyintl, rint, rintf, rintl - round to
          nearest integer


---------------------------------------------------------

::

          #include <math.h>

          double nearbyint(double x);
          float nearbyintf(float x);
          long double nearbyintl(long double x);

          double rint(double x);
          float rintf(float x);
          long double rintl(long double x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          nearbyint(), nearbyintf(), nearbyintl():
              _POSIX_C_SOURCE >= 200112L || _ISOC99_SOURCE

          rint():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          rintf(), rintl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The nearbyint(), nearbyintf(), and nearbyintl() functions round
          their argument to an integer value in floating-point format,
          using the current rounding direction (see fesetround(3)) and
          without raising the inexact exception.  When the current rounding
          direction is to nearest, these functions round halfway cases to
          the even integer in accordance with IEEE-754.

          The rint(), rintf(), and rintl() functions do the same, but will
          raise the inexact exception (FE_INEXACT, checkable via
          fetestexcept(3)) when the result differs in value from the
          argument.


-----------------------------------------------------------------

::

          These functions return the rounded integer value.

          If x is integral, +0, -0, NaN, or infinite, x itself is returned.


-----------------------------------------------------

::

          No errors occur.  POSIX.1-2001 documents a range error for
          overflows, but see NOTES.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │nearbyint(), nearbyintf(),            │ Thread safety │ MT-Safe │
          │nearbyintl(), rint(), rintf(),        │               │         │
          │rintl()                               │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          SUSv2 and POSIX.1-2001 contain text about overflow (which might
          set errno to ERANGE, or raise an FE_OVERFLOW exception).  In
          practice, the result cannot overflow on any current machine, so
          this error-handling stuff is just nonsense.  (More precisely,
          overflow can happen only when the maximum value of the exponent
          is smaller than the number of mantissa bits.  For the IEEE-754
          standard 32-bit and 64-bit floating-point numbers the maximum
          value of the exponent is 128 (respectively, 1024), and the number
          of mantissa bits is 24 (respectively, 53).)

          If you want to store the rounded value in an integer type, you
          probably want to use one of the functions described in lrint(3)
          instead.


---------------------------------------------------------

::

          ceil(3), floor(3), lrint(3), round(3), trunc(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                        RINT(3)

--------------

Pages that refer to this page: `abs(3) <../man3/abs.3.html>`__, 
`ceil(3) <../man3/ceil.3.html>`__,  `fabs(3) <../man3/fabs.3.html>`__, 
`floor(3) <../man3/floor.3.html>`__, 
`lrint(3) <../man3/lrint.3.html>`__, 
`lround(3) <../man3/lround.3.html>`__, 
`nextafter(3) <../man3/nextafter.3.html>`__, 
`nextup(3) <../man3/nextup.3.html>`__, 
`round(3) <../man3/round.3.html>`__, 
`trunc(3) <../man3/trunc.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/rint.3.license.html>`__

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
