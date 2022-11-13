.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

finite(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FINITE(3)               Linux Programmer's Manual              FINITE(3)

NAME
-------------------------------------------------

::

          finite, finitef, finitel, isinf, isinff, isinfl, isnan, isnanf,
          isnanl - BSD floating-point classification functions


---------------------------------------------------------

::

          #include <math.h>

          int finite(double x);
          int finitef(float x);
          int finitel(long double x);

          int isinf(double x);
          int isinff(float x);
          int isinfl(long double x);

          int isnan(double x);
          int isnanf(float x);
          int isnanl(long double x);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          finite(), finitef(), finitel():
              /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          isinf():
              _XOPEN_SOURCE >= 600 || _ISOC99_SOURCE
                  || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          isinff(), isinfl():
              /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          isnan():
              _XOPEN_SOURCE || _ISOC99_SOURCE
                  || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          isnanf(), isnanl():
              _XOPEN_SOURCE >= 600
                  || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          The finite(), finitef(), and finitel() functions return a nonzero
          value if x is neither infinite nor a "not-a-number" (NaN) value,
          and 0 otherwise.

          The isnan(), isnanf(), and isnanl() functions return a nonzero
          value if x is a NaN value, and 0 otherwise.

          The isinf(), isinff(), and isinfl() functions return 1 if x is
          positive infinity, -1 if x is negative infinity, and 0 otherwise.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │finite(), finitef(), finitel(),       │ Thread safety │ MT-Safe │
          │isinf(), isinff(), isinfl(), isnan(), │               │         │
          │isnanf(), isnanl()                    │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


---------------------------------------------------

::

          Note that these functions are obsolete.  C99 defines macros
          isfinite(), isinf(), and isnan() (for all types) replacing them.
          Further note that the C99 isinf() has weaker guarantees on the
          return value.  See fpclassify(3).


---------------------------------------------------------

::

          fpclassify(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                      FINITE(3)

--------------

Pages that refer to this page:
`fpclassify(3) <../man3/fpclassify.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/finite.3.license.html>`__

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
