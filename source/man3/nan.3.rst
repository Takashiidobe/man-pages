.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nan(3) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   NAN(3)                  Linux Programmer's Manual                 NAN(3)

NAME
-------------------------------------------------

::

          nan, nanf, nanl - return 'Not a Number'


---------------------------------------------------------

::

          #include <math.h>

          double nan(const char *tagp);
          float nanf(const char *tagp);
          long double nanl(const char *tagp);

          Link with -lm.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          nan(), nanf(), nanl():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          These functions return a representation (determined by tagp) of a
          quiet NaN.  If the implementation does not support quiet NaNs,
          these functions return zero.

          The call nan("char-sequence") is equivalent to:

              strtod("NAN(char-sequence)", NULL);

          Similarly, calls to nanf() and nanl() are equivalent to analogous
          calls to strtof(3) and strtold(3).

          The argument tagp is used in an unspecified manner.  On IEEE 754
          systems, there are many representations of NaN, and tagp selects
          one.  On other systems it may do nothing.


---------------------------------------------------------

::

          These functions first appeared in glibc in version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │nan(), nanf(), nanl()          │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.  See also IEC 559 and the
          appendix with recommended functions in IEEE 754/IEEE 854.


---------------------------------------------------------

::

          isnan(3), strtod(3), math_error(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                         NAN(3)

--------------

Pages that refer to this page: `strtod(3) <../man3/strtod.3.html>`__, 
`math_error(7) <../man7/math_error.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/nan.3.license.html>`__

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
