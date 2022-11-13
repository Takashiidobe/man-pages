.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

abs(3) — Linux manual page
==========================

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

   ABS(3)                  Linux Programmer's Manual                 ABS(3)

NAME
-------------------------------------------------

::

          abs, labs, llabs, imaxabs - compute the absolute value of an
          integer


---------------------------------------------------------

::

          #include <stdlib.h>

          int abs(int j);
          long labs(long j);
          long long llabs(long long j);

          #include <inttypes.h>

          intmax_t imaxabs(intmax_t j);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          llabs():
              _ISOC99_SOURCE || _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          The abs() function computes the absolute value of the integer
          argument j.  The labs(), llabs(), and imaxabs() functions compute
          the absolute value of the argument j of the appropriate integer
          type for the function.


-----------------------------------------------------------------

::

          Returns the absolute value of the integer argument, of the
          appropriate integer type for the function.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │abs(), labs(), llabs(), imaxabs()     │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, C99, SVr4, 4.3BSD.  C89 only includes
          the abs() and labs() functions; the functions llabs() and
          imaxabs() were added in C99.


---------------------------------------------------

::

          Trying to take the absolute value of the most negative integer is
          not defined.

          The llabs() function is included in glibc since version 2.0.  The
          imaxabs() function is included in glibc since version 2.1.1.

          For llabs() to be declared, it may be necessary to define
          _ISOC99_SOURCE or _ISOC9X_SOURCE (depending on the version of
          glibc) before including any standard headers.

          By default, GCC handles abs(), labs(), and (since GCC 3.0)
          llabs() and imaxabs() as built-in functions.


---------------------------------------------------------

::

          cabs(3), ceil(3), fabs(3), floor(3), rint(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                         ABS(3)

--------------

Pages that refer to this page: `cabs(3) <../man3/cabs.3.html>`__, 
`div(3) <../man3/div.3.html>`__,  `fabs(3) <../man3/fabs.3.html>`__, 
`strtoimax(3) <../man3/strtoimax.3.html>`__, 
`wcstoimax(3) <../man3/wcstoimax.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/abs.3.license.html>`__

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
