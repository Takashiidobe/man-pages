.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sincos(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SINCOS(3)               Linux Programmer's Manual              SINCOS(3)

NAME
-------------------------------------------------

::

          sincos, sincosf, sincosl - calculate sin and cos simultaneously


---------------------------------------------------------

::

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <math.h>

          void sincos(double x, double *sin, double *cos);
          void sincosf(float x, float *sin, float *cos);
          void sincosl(long double x, long double *sin, long double *cos);

          Link with -lm.


---------------------------------------------------------------

::

          Several applications need sine and cosine of the same angle x.
          These functions compute both at the same time, and store the
          results in *sin and *cos.  Using this function can be more
          efficient than two separate calls to sin(3) and cos(3).

          If x is a NaN, a NaN is returned in *sin and *cos.

          If x is positive infinity or negative infinity, a domain error
          occurs, and a NaN is returned in *sin and *cos.


-----------------------------------------------------------------

::

          These functions return void.


-----------------------------------------------------

::

          See math_error(7) for information on how to determine whether an
          error has occurred when calling these functions.

          The following errors can occur:

          Domain error: x is an infinity
                 errno is set to EDOM (but see BUGS).  An invalid floating-
                 point exception (FE_INVALID) is raised.


---------------------------------------------------------

::

          These functions first appeared in glibc in version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │sincos(), sincosf(), sincosl()        │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are GNU extensions.


---------------------------------------------------

::

          To see the performance advantage of sincos(), it may be necessary
          to disable gcc(1) built-in optimizations, using flags such as:

              cc -O -lm -fno-builtin prog.c


-------------------------------------------------

::

          Before version 2.22, the glibc implementation did not set errno
          to EDOM when a domain error occurred.


---------------------------------------------------------

::

          cos(3), sin(3), tan(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                      SINCOS(3)

--------------

Pages that refer to this page: `cos(3) <../man3/cos.3.html>`__, 
`sin(3) <../man3/sin.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/sincos.3.license.html>`__

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
