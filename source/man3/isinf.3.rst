.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fpclassify(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   FPCLASSIFY(3)           Linux Programmer's Manual          FPCLASSIFY(3)

NAME
-------------------------------------------------

::

          fpclassify, isfinite, isnormal, isnan, isinf - floating-point
          classification macros


---------------------------------------------------------

::

          #include <math.h>

          int fpclassify(x);
          int isfinite(x);
          int isnormal(x);
          int isnan(x);
          int isinf(x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fpclassify(), isfinite(), isnormal():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L

          isnan():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || _XOPEN_SOURCE
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          isinf():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          Floating point numbers can have special values, such as infinite
          or NaN.  With the macro fpclassify(x) you can find out what type
          x is.  The macro takes any floating-point expression as argument.
          The result is one of the following values:

          FP_NAN x is "Not a Number".

          FP_INFINITE
                 x is either positive infinity or negative infinity.

          FP_ZERO
                 x is zero.

          FP_SUBNORMAL
                 x is too small to be represented in normalized format.

          FP_NORMAL
                 if nothing of the above is correct then it must be a
                 normal floating-point number.

          The other macros provide a short answer to some standard
          questions.

          isfinite(x)
                 returns a nonzero value if
                 (fpclassify(x) != FP_NAN && fpclassify(x) != FP_INFINITE)

          isnormal(x)
                 returns a nonzero value if (fpclassify(x) == FP_NORMAL)

          isnan(x)
                 returns a nonzero value if (fpclassify(x) == FP_NAN)

          isinf(x)
                 returns 1 if x is positive infinity, and -1 if x is
                 negative infinity.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fpclassify(), isfinite(), isnormal(), │ Thread safety │ MT-Safe │
          │isnan(), isinf()                      │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99.

          For isinf(), the standards merely say that the return value is
          nonzero if and only if the argument has an infinite value.


---------------------------------------------------

::

          In glibc 2.01 and earlier, isinf() returns a nonzero value
          (actually: 1) if x is positive infinity or negative infinity.
          (This is all that C99 requires.)


---------------------------------------------------------

::

          finite(3), INFINITY(3), isgreater(3), signbit(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                  FPCLASSIFY(3)

--------------

Pages that refer to this page: `finite(3) <../man3/finite.3.html>`__, 
`INFINITY(3) <../man3/INFINITY.3.html>`__, 
`isgreater(3) <../man3/isgreater.3.html>`__, 
`nan(3) <../man3/nan.3.html>`__, 
`math_error(7) <../man7/math_error.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/fpclassify.3.license.html>`__

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
