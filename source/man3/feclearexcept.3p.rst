.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

feclearexcept(3p) — Linux manual page
=====================================

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

   FECLEAREXCEPT(3P)       POSIX Programmer's Manual      FECLEAREXCEPT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          feclearexcept — clear floating-point exception


---------------------------------------------------------

::

          #include <fenv.h>

          int feclearexcept(int excepts);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The feclearexcept() function shall attempt to clear the supported
          floating-point exceptions represented by excepts.


-----------------------------------------------------------------

::

          If the argument is zero or if all the specified exceptions were
          successfully cleared, feclearexcept() shall return zero.
          Otherwise, it shall return a non-zero value.


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

          fegetexceptflag(3p), feraiseexcept(3p), fetestexcept(3p)

          The Base Definitions volume of POSIX.1‐2017, fenv.h(0p)


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

   IEEE/The Open Group               2017                 FECLEAREXCEPT(3P)

--------------

Pages that refer to this page: `fenv.h(0p) <../man0/fenv.h.0p.html>`__, 
`acos(3p) <../man3/acos.3p.html>`__, 
`acosh(3p) <../man3/acosh.3p.html>`__, 
`asin(3p) <../man3/asin.3p.html>`__, 
`asinh(3p) <../man3/asinh.3p.html>`__, 
`atan2(3p) <../man3/atan2.3p.html>`__, 
`atan(3p) <../man3/atan.3p.html>`__, 
`atanh(3p) <../man3/atanh.3p.html>`__, 
`ceil(3p) <../man3/ceil.3p.html>`__, 
`cos(3p) <../man3/cos.3p.html>`__, 
`cosh(3p) <../man3/cosh.3p.html>`__, 
`erf(3p) <../man3/erf.3p.html>`__, 
`erfc(3p) <../man3/erfc.3p.html>`__, 
`exp2(3p) <../man3/exp2.3p.html>`__, 
`exp(3p) <../man3/exp.3p.html>`__, 
`expm1(3p) <../man3/expm1.3p.html>`__, 
`fdim(3p) <../man3/fdim.3p.html>`__, 
`fegetexceptflag(3p) <../man3/fegetexceptflag.3p.html>`__, 
`feraiseexcept(3p) <../man3/feraiseexcept.3p.html>`__, 
`fetestexcept(3p) <../man3/fetestexcept.3p.html>`__, 
`floor(3p) <../man3/floor.3p.html>`__, 
`fma(3p) <../man3/fma.3p.html>`__, 
`fmod(3p) <../man3/fmod.3p.html>`__, 
`hypot(3p) <../man3/hypot.3p.html>`__, 
`ilogb(3p) <../man3/ilogb.3p.html>`__, 
`j0(3p) <../man3/j0.3p.html>`__, 
`ldexp(3p) <../man3/ldexp.3p.html>`__, 
`lgamma(3p) <../man3/lgamma.3p.html>`__, 
`llrint(3p) <../man3/llrint.3p.html>`__, 
`llround(3p) <../man3/llround.3p.html>`__, 
`log10(3p) <../man3/log10.3p.html>`__, 
`log1p(3p) <../man3/log1p.3p.html>`__, 
`log2(3p) <../man3/log2.3p.html>`__, 
`log(3p) <../man3/log.3p.html>`__, 
`logb(3p) <../man3/logb.3p.html>`__, 
`lrint(3p) <../man3/lrint.3p.html>`__, 
`lround(3p) <../man3/lround.3p.html>`__, 
`nearbyint(3p) <../man3/nearbyint.3p.html>`__, 
`nextafter(3p) <../man3/nextafter.3p.html>`__, 
`pow(3p) <../man3/pow.3p.html>`__, 
`remainder(3p) <../man3/remainder.3p.html>`__, 
`remquo(3p) <../man3/remquo.3p.html>`__, 
`rint(3p) <../man3/rint.3p.html>`__, 
`round(3p) <../man3/round.3p.html>`__, 
`scalbln(3p) <../man3/scalbln.3p.html>`__, 
`sin(3p) <../man3/sin.3p.html>`__, 
`sinh(3p) <../man3/sinh.3p.html>`__, 
`sqrt(3p) <../man3/sqrt.3p.html>`__, 
`tan(3p) <../man3/tan.3p.html>`__, 
`tanh(3p) <../man3/tanh.3p.html>`__, 
`tgamma(3p) <../man3/tgamma.3p.html>`__, 
`y0(3p) <../man3/y0.3p.html>`__

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
