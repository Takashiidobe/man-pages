.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

isnan(3p) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ISNAN(3P)               POSIX Programmer's Manual              ISNAN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          isnan — test for a NaN


---------------------------------------------------------

::

          #include <math.h>

          int isnan(real-floating x);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The isnan() macro shall determine whether its argument value is a
          NaN. First, an argument represented in a format wider than its
          semantic type is converted to its semantic type. Then
          determination is based on the type of the argument.


-----------------------------------------------------------------

::

          The isnan() macro shall return a non-zero value if and only if
          its argument has a NaN value.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fpclassify(3p), isfinite(3p), isinf(3p), isnormal(3p),
          signbit(3p)

          The Base Definitions volume of POSIX.1‐2017, math.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                         ISNAN(3P)

--------------

Pages that refer to this page: `math.h(0p) <../man0/math.h.0p.html>`__, 
`acos(3p) <../man3/acos.3p.html>`__, 
`asin(3p) <../man3/asin.3p.html>`__, 
`atan2(3p) <../man3/atan2.3p.html>`__, 
`atan(3p) <../man3/atan.3p.html>`__, 
`ceil(3p) <../man3/ceil.3p.html>`__, 
`cos(3p) <../man3/cos.3p.html>`__, 
`cosh(3p) <../man3/cosh.3p.html>`__, 
`erf(3p) <../man3/erf.3p.html>`__, 
`erfc(3p) <../man3/erfc.3p.html>`__, 
`exp2(3p) <../man3/exp2.3p.html>`__, 
`exp(3p) <../man3/exp.3p.html>`__, 
`fabs(3p) <../man3/fabs.3p.html>`__, 
`floor(3p) <../man3/floor.3p.html>`__, 
`fmod(3p) <../man3/fmod.3p.html>`__, 
`fpclassify(3p) <../man3/fpclassify.3p.html>`__, 
`frexp(3p) <../man3/frexp.3p.html>`__, 
`hypot(3p) <../man3/hypot.3p.html>`__, 
`isfinite(3p) <../man3/isfinite.3p.html>`__, 
`isinf(3p) <../man3/isinf.3p.html>`__, 
`isnormal(3p) <../man3/isnormal.3p.html>`__, 
`j0(3p) <../man3/j0.3p.html>`__, 
`ldexp(3p) <../man3/ldexp.3p.html>`__, 
`lgamma(3p) <../man3/lgamma.3p.html>`__, 
`log10(3p) <../man3/log10.3p.html>`__, 
`log(3p) <../man3/log.3p.html>`__, 
`modf(3p) <../man3/modf.3p.html>`__, 
`pow(3p) <../man3/pow.3p.html>`__, 
`rint(3p) <../man3/rint.3p.html>`__, 
`signbit(3p) <../man3/signbit.3p.html>`__, 
`sin(3p) <../man3/sin.3p.html>`__, 
`sinh(3p) <../man3/sinh.3p.html>`__, 
`sqrt(3p) <../man3/sqrt.3p.html>`__, 
`tan(3p) <../man3/tan.3p.html>`__, 
`tanh(3p) <../man3/tanh.3p.html>`__,  `y0(3p) <../man3/y0.3p.html>`__

--------------

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
