.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cabs(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
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

   CABS(3)                 Linux Programmer's Manual                CABS(3)

NAME
-------------------------------------------------

::

          cabs, cabsf, cabsl - absolute value of a complex number


---------------------------------------------------------

::

          #include <complex.h>

          double cabs(double complex z);
          float cabsf(float complex z);
          long double cabsl(long double complex z);

          Link with -lm.


---------------------------------------------------------------

::

          These functions return the absolute value of the complex number
          z.  The result is a real number.


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
          │cabs(), cabsf(), cabsl()              │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          C99, POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          The function is actually an alias for hypot(a, b) (or,
          equivalently, sqrt(a*a + b*b)).


---------------------------------------------------------

::

          abs(3), cimag(3), hypot(3), complex(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                        CABS(3)

--------------

Pages that refer to this page: `abs(3) <../man3/abs.3.html>`__, 
`cacosh(3) <../man3/cacosh.3.html>`__, 
`carg(3) <../man3/carg.3.html>`__, 
`casinh(3) <../man3/casinh.3.html>`__, 
`catanh(3) <../man3/catanh.3.html>`__, 
`ccos(3) <../man3/ccos.3.html>`__, 
`ccosh(3) <../man3/ccosh.3.html>`__, 
`cexp2(3) <../man3/cexp2.3.html>`__, 
`cexp(3) <../man3/cexp.3.html>`__, 
`cimag(3) <../man3/cimag.3.html>`__, 
`clog10(3) <../man3/clog10.3.html>`__, 
`clog2(3) <../man3/clog2.3.html>`__, 
`clog(3) <../man3/clog.3.html>`__,  `conj(3) <../man3/conj.3.html>`__, 
`cpow(3) <../man3/cpow.3.html>`__, 
`cproj(3) <../man3/cproj.3.html>`__, 
`creal(3) <../man3/creal.3.html>`__, 
`csin(3) <../man3/csin.3.html>`__, 
`csinh(3) <../man3/csinh.3.html>`__, 
`csqrt(3) <../man3/csqrt.3.html>`__, 
`ctan(3) <../man3/ctan.3.html>`__, 
`ctanh(3) <../man3/ctanh.3.html>`__, 
`fabs(3) <../man3/fabs.3.html>`__, 
`hypot(3) <../man3/hypot.3.html>`__, 
`complex(7) <../man7/complex.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/cabs.3.license.html>`__

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
