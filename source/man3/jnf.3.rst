.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

j0(3) — Linux manual page
=========================

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

   J0(3)                   Linux Programmer's Manual                  J0(3)

NAME
-------------------------------------------------

::

          j0, j0f, j0l, j1, j1f, j1l, jn, jnf, jnl - Bessel functions of
          the first kind


---------------------------------------------------------

::

          #include <math.h>

          double j0(double x);
          double j1(double x);
          double jn(int n, double x);

          float j0f(float x);
          float j1f(float x);
          float jnf(int n, float x);

          long double j0l(long double x);
          long double j1l(long double x);
          long double jnl(int n, long double x);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          j0(), j1(), jn():
              _XOPEN_SOURCE
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE

          j0f(), j0l(), j1f(), j1l(), jnf(), jnl():
              _XOPEN_SOURCE >= 600
                  || (_ISOC99_SOURCE && _XOPEN_SOURCE)
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE


---------------------------------------------------------------

::

          The j0() and j1() functions return Bessel functions of x of the
          first kind of orders 0 and 1, respectively.  The jn() function
          returns the Bessel function of x of the first kind of order n.

          The j0f(), j1f(), and jnf(), functions are versions that take and
          return float values.  The j0l(), j1l(), and jnl() functions are
          versions that take and return long double values.


-----------------------------------------------------------------

::

          On success, these functions return the appropriate Bessel value
          of the first kind for x.

          If x is a NaN, a NaN is returned.

          If x is too large in magnitude, or the result underflows, a range
          error occurs, and the return value is 0.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Range error: result underflow, or x is too large in magnitude
                 errno is set to ERANGE.

          These functions do not raise exceptions for fetestexcept(3).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │j0(), j0f(), j0l()                    │ Thread safety │ MT-Safe │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │j1(), j1f(), j1l()                    │ Thread safety │ MT-Safe │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │jn(), jnf(), jnl()                    │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          The functions returning double conform to SVr4, 4.3BSD,
          POSIX.1-2001, and POSIX.1-2008.  The others are nonstandard
          functions that also exist on the BSDs.


-------------------------------------------------

::

          There are errors of up to 2e-16 in the values returned by j0(),
          j1(), and jn() for values of x between -8 and 8.


---------------------------------------------------------

::

          y0(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                          J0(3)

--------------

Pages that refer to this page: `y0(3) <../man3/y0.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/j0.3.license.html>`__

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
