.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nextup(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NEXTUP(3)               Linux Programmer's Manual              NEXTUP(3)

NAME
-------------------------------------------------

::

          nextup, nextupf, nextupl, nextdown, nextdownf, nextdownl - return
          next floating-point number toward positive/negative infinity


---------------------------------------------------------

::

          #define _GNU_SOURCE     /* See feature_test_macros(7) */
          #include <math.h>

          double nextup(double x);
          float nextupf(float x);
          long double nextupl(long double x);

          double nextdown(double x);
          float nextdownf(float x);
          long double nextdownl(long double x);

          Link with -lm.


---------------------------------------------------------------

::

          The nextup(), nextupf(), and nextupl() functions return the next
          representable floating-point number greater than x.

          If x is the smallest representable negative number in the
          corresponding type, these functions return -0.  If x is 0, the
          returned value is the smallest representable positive number of
          the corresponding type.

          If x is positive infinity, the returned value is positive
          infinity.  If x is negative infinity, the returned value is the
          largest representable finite negative number of the corresponding
          type.

          If x is Nan, the returned value is NaN.

          The value returned by nextdown(x) is -nextup(-x), and similarly
          for the other types.


-----------------------------------------------------------------

::

          See DESCRIPTION.


---------------------------------------------------------

::

          These functions first appeared in glibc in version 2.24.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │nextup(), nextupf(), nextupl(),       │ Thread safety │ MT-Safe │
          │nextdown(), nextdownf(), nextdownl()  │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are described in IEEE Std 754-2008 - Standard for
          Floating-Point Arithmetic and ISO/IEC TS 18661.


---------------------------------------------------------

::

          nearbyint(3), nextafter(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      NEXTUP(3)

--------------

`Copyright and license for this manual
page <../man3/nextup.3.license.html>`__

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
