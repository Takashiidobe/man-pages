.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gcvt(3) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GCVT(3)                 Linux Programmer's Manual                GCVT(3)

NAME
-------------------------------------------------

::

          gcvt - convert a floating-point number to a string


---------------------------------------------------------

::

          #include <stdlib.h>

          char *gcvt(double number, int ndigit, char *buf);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          gcvt():
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

          The gcvt() function converts number to a minimal length null-
          terminated ASCII string and stores the result in buf.  It
          produces ndigit significant digits in either printf(3) F format
          or E format.


-----------------------------------------------------------------

::

          The gcvt() function returns buf.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │gcvt()                                │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          Marked as LEGACY in POSIX.1-2001.  POSIX.1-2008 removes the
          specification of gcvt(), recommending the use of sprintf(3)
          instead (though snprintf(3) may be preferable).


---------------------------------------------------------

::

          ecvt(3), fcvt(3), sprintf(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                        GCVT(3)

--------------

Pages that refer to this page: `ecvt(3) <../man3/ecvt.3.html>`__, 
`qecvt(3) <../man3/qecvt.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/gcvt.3.license.html>`__

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
