.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ecvt(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ATTRIBUTES <#ATTRIBUTES>`__   |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ECVT(3)                 Linux Programmer's Manual                ECVT(3)

NAME
-------------------------------------------------

::

          ecvt, fcvt - convert a floating-point number to a string


---------------------------------------------------------

::

          #include <stdlib.h>

          char *ecvt(double number, int ndigits, int *restrict decpt,
                     int *restrict sign);
          char *fcvt(double number, int ndigits, int *restrict decpt,
                     int *restrict sign);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          ecvt(), fcvt():
              Since glibc 2.17
                  (_XOPEN_SOURCE >= 500 && ! (_POSIX_C_SOURCE >= 200809L))
                      || /* Glibc >= 2.20 */ _DEFAULT_SOURCE
                      || /* Glibc <= 2.19 */ _SVID_SOURCE
              Glibc versions 2.12 to 2.16:
                  (_XOPEN_SOURCE >= 500 && ! (_POSIX_C_SOURCE >= 200112L))
                      || _SVID_SOURCE
              Before glibc 2.12:
                  _SVID_SOURCE || _XOPEN_SOURCE >= 500


---------------------------------------------------------------

::

          The ecvt() function converts number to a null-terminated string
          of ndigits digits (where ndigits is reduced to a system-specific
          limit determined by the precision of a double), and returns a
          pointer to the string.  The high-order digit is nonzero, unless
          number is zero.  The low order digit is rounded.  The string
          itself does not contain a decimal point; however, the position of
          the decimal point relative to the start of the string is stored
          in *decpt.  A negative value for *decpt means that the decimal
          point is to the left of the start of the string.  If the sign of
          number is negative, *sign is set to a nonzero value, otherwise it
          is set to 0.  If number is zero, it is unspecified whether *decpt
          is 0 or 1.

          The fcvt() function is identical to ecvt(), except that ndigits
          specifies the number of digits after the decimal point.


-----------------------------------------------------------------

::

          Both the ecvt() and fcvt() functions return a pointer to a static
          string containing the ASCII representation of number.  The static
          string is overwritten by each call to ecvt() or fcvt().


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────┬───────────────┬─────────────────────┐
          │Interface                 │ Attribute     │ Value               │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │ecvt()                    │ Thread safety │ MT-Unsafe race:ecvt │
          ├──────────────────────────┼───────────────┼─────────────────────┤
          │fcvt()                    │ Thread safety │ MT-Unsafe race:fcvt │
          └──────────────────────────┴───────────────┴─────────────────────┘


-------------------------------------------------------------------

::

          SVr2; marked as LEGACY in POSIX.1-2001.  POSIX.1-2008 removes the
          specifications of ecvt() and fcvt(), recommending the use of
          sprintf(3) instead (though snprintf(3) may be preferable).


---------------------------------------------------

::

          Not all locales use a point as the radix character ("decimal
          point").


---------------------------------------------------------

::

          ecvt_r(3), gcvt(3), qecvt(3), setlocale(3), sprintf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                        ECVT(3)

--------------

Pages that refer to this page: `ecvt_r(3) <../man3/ecvt_r.3.html>`__, 
`gcvt(3) <../man3/gcvt.3.html>`__,  `qecvt(3) <../man3/qecvt.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/ecvt.3.license.html>`__

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
