.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

qecvt(3) — Linux manual page
============================

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

   QECVT(3)                Linux Programmer's Manual               QECVT(3)

NAME
-------------------------------------------------

::

          qecvt, qfcvt, qgcvt - convert a floating-point number to a string


---------------------------------------------------------

::

          #include <stdlib.h>

          char *qecvt(long double number, int ndigits, int *restrict decpt,
                      int *restrict sign);
          char *qfcvt(long double number, int ndigits, int *restrict decpt,
                      int *restrict sign);
          char *qgcvt(long double number, int ndigit, char *buf);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          qecvt(), qfcvt(), qgcvt():
              Since glibc 2.19:
                  _DEFAULT_SOURCE
              In glibc up to and including 2.19:
                  _SVID_SOURCE


---------------------------------------------------------------

::

          The functions qecvt(), qfcvt(), and qgcvt() are identical to
          ecvt(3), fcvt(3), and gcvt(3) respectively, except that they use
          a long double argument number.  See ecvt(3) and gcvt(3).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌─────────────────────────┬───────────────┬──────────────────────┐
          │Interface                │ Attribute     │ Value                │
          ├─────────────────────────┼───────────────┼──────────────────────┤
          │qecvt()                  │ Thread safety │ MT-Unsafe race:qecvt │
          ├─────────────────────────┼───────────────┼──────────────────────┤
          │qfcvt()                  │ Thread safety │ MT-Unsafe race:qfcvt │
          ├─────────────────────────┼───────────────┼──────────────────────┤
          │qgcvt()                  │ Thread safety │ MT-Safe              │
          └─────────────────────────┴───────────────┴──────────────────────┘


-------------------------------------------------------------------

::

          SVr4.  Not seen in most common UNIX implementations, but occurs
          in SunOS.  Supported by glibc.


---------------------------------------------------

::

          These functions are obsolete.  Instead, snprintf(3) is
          recommended.


---------------------------------------------------------

::

          ecvt(3), ecvt_r(3), gcvt(3), sprintf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       QECVT(3)

--------------

Pages that refer to this page: `ecvt(3) <../man3/ecvt.3.html>`__, 
`ecvt_r(3) <../man3/ecvt_r.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/qecvt.3.license.html>`__

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
