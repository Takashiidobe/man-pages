.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

INFINITY(3) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   INFINITY(3)             Linux Programmer's Manual            INFINITY(3)

NAME
-------------------------------------------------

::

          INFINITY, NAN, HUGE_VAL, HUGE_VALF, HUGE_VALL - floating-point
          constants


---------------------------------------------------------

::

          #define _ISOC99_SOURCE      /* See feature_test_macros(7) */
          #include <math.h>

          INFINITY

          NAN

          HUGE_VAL
          HUGE_VALF
          HUGE_VALL


---------------------------------------------------------------

::

          The macro INFINITY expands to a float constant representing
          positive infinity.

          The macro NAN expands to a float constant representing a quiet
          NaN (when supported).  A quiet NaN is a NaN ("not-a-number") that
          does not raise exceptions when it is used in arithmetic.  The
          opposite is a signaling NaN.  See IEC 60559:1989.

          The macros HUGE_VAL, HUGE_VALF, HUGE_VALL expand to constants of
          types double, float, and long double, respectively, that
          represent a large positive value, possibly positive infinity.


-------------------------------------------------------------------

::

          C99.

          On a glibc system, the macro HUGE_VAL is always available.
          Availability of the NAN macro can be tested using #ifdef NAN, and
          similarly for INFINITY, HUGE_VALF, HUGE_VALL.  They will be
          defined by <math.h> if _ISOC99_SOURCE or _GNU_SOURCE is defined,
          or __STDC_VERSION__ is defined and has a value not less than
          199901L.


---------------------------------------------------------

::

          fpclassify(3), math_error(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2020-12-21                    INFINITY(3)

--------------

Pages that refer to this page:
`fpclassify(3) <../man3/fpclassify.3.html>`__, 
`math_error(7) <../man7/math_error.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/INFINITY.3.license.html>`__

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
