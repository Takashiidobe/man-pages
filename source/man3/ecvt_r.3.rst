.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ecvt_r(3) — Linux manual page
=============================

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

   ECVT_R(3)               Linux Programmer's Manual              ECVT_R(3)

NAME
-------------------------------------------------

::

          ecvt_r, fcvt_r, qecvt_r, qfcvt_r - convert a floating-point
          number to a string


---------------------------------------------------------

::

          #include <stdlib.h>

          int ecvt_r(double number, int ndigits, int *restrict decpt,
                     int *restrict sign, char *restrict buf, size_t len);
          int fcvt_r(double number, int ndigits, int *restrict decpt,
                     int *restrict sign, char *restrict buf, size_t len);

          int qecvt_r(long double number, int ndigits, int *restrict decpt,
                     int *restrict sign, char *restrict buf, size_t len);
          int qfcvt_r(long double number, int ndigits, int *restrict decpt,
                     int *restrict sign, char *restrict buf, size_t len);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          ecvt_r(), fcvt_r(), qecvt_r(), qfcvt_r():
              /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _SVID_SOURCE || _BSD_SOURCE


---------------------------------------------------------------

::

          The functions ecvt_r(), fcvt_r(), qecvt_r(), and qfcvt_r() are
          identical to ecvt(3), fcvt(3), qecvt(3), and qfcvt(3),
          respectively, except that they do not return their result in a
          static buffer, but instead use the supplied buf of size len.  See
          ecvt(3) and qecvt(3).


-----------------------------------------------------------------

::

          These functions return 0 on success, and -1 otherwise.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │ecvt_r(), fcvt_r(), qecvt_r(),        │ Thread safety │ MT-Safe │
          │qfcvt_r()                             │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are GNU extensions.


---------------------------------------------------

::

          These functions are obsolete.  Instead, sprintf(3) is
          recommended.


---------------------------------------------------------

::

          ecvt(3), qecvt(3), sprintf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      ECVT_R(3)

--------------

Pages that refer to this page: `ecvt(3) <../man3/ecvt.3.html>`__, 
`qecvt(3) <../man3/qecvt.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/ecvt_r.3.license.html>`__

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
