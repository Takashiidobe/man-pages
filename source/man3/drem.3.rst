.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

remainder(3) — Linux manual page
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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   REMAINDER(3)            Linux Programmer's Manual           REMAINDER(3)

NAME
-------------------------------------------------

::

          drem, dremf, dreml, remainder, remainderf, remainderl - floating-
          point remainder function


---------------------------------------------------------

::

          #include <math.h>

          /* The C99 versions */
          double remainder(double x, double y);
          float remainderf(float x, float y);
          long double remainderl(long double x, long double y);

          /* Obsolete synonyms */
          double drem(double x, double y);
          float dremf(float x, float y);
          long double dreml(long double x, long double y);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          remainder():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          remainderf(), remainderl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L
                  || /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE

          drem(), dremf(), dreml():
              /* Since glibc 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          These functions compute the remainder of dividing x by y.  The
          return value is x-n*y, where n is the value x / y, rounded to the
          nearest integer.  If the absolute value of x-n*y is 0.5, n is
          chosen to be even.

          These functions are unaffected by the current rounding mode (see
          fenv(3)).

          The drem() function does precisely the same thing.


-----------------------------------------------------------------

::

          On success, these functions return the floating-point remainder,
          x-n*y.  If the return value is 0, it has the sign of x.

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

          Domain error: x is an infinity and y is not a NaN
                 errno is set to EDOM (but see BUGS).  An invalid floating-
                 point exception (FE_INVALID) is raised.

                 These functions do not set errno for this case.

          Domain error: y is zero
                 errno is set to EDOM.  An invalid floating-point exception
                 (FE_INVALID) is raised.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │drem(), dremf(), dreml(),             │ Thread safety │ MT-Safe │
          │remainder(), remainderf(),            │               │         │
          │remainderl()                          │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          The functions remainder(), remainderf(), and remainderl() are
          specified in C99, POSIX.1-2001, and POSIX.1-2008.

          The function drem() is from 4.3BSD.  The float and long double
          variants dremf() and dreml() exist on some systems, such as Tru64
          and glibc2.  Avoid the use of these functions in favor of
          remainder() etc.


-------------------------------------------------

::

          Before glibc 2.15, the call

              remainder(nan(""), 0);

          returned a NaN, as expected, but wrongly caused a domain error.
          Since glibc 2.15, a silent NaN (i.e., no domain error) is
          returned.

          Before glibc 2.15, errno was not set to EDOM for the domain error
          that occurs when x is an infinity and y is not a NaN.


---------------------------------------------------------

::

          The call "remainder(29.0, 3.0)" returns -1.


---------------------------------------------------------

::

          div(3), fmod(3), remquo(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                   REMAINDER(3)

--------------

Pages that refer to this page: `div(3) <../man3/div.3.html>`__, 
`fma(3) <../man3/fma.3.html>`__,  `fmod(3) <../man3/fmod.3.html>`__, 
`remquo(3) <../man3/remquo.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/remainder.3.license.html>`__

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
