.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

feraiseexcept(3p) — Linux manual page
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

   FERAISEEXCEPT(3P)       POSIX Programmer's Manual      FERAISEEXCEPT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          feraiseexcept — raise floating-point exception


---------------------------------------------------------

::

          #include <fenv.h>

          int feraiseexcept(int excepts);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The feraiseexcept() function shall attempt to raise the supported
          floating-point exceptions represented by the excepts argument.
          The order in which these floating-point exceptions are raised is
          unspecified, except that if the excepts argument represents IEC
          60559 valid coincident floating-point exceptions for atomic
          operations (namely overflow and inexact, or underflow and
          inexact), then overflow or underflow shall be raised before
          inexact.  Whether the feraiseexcept() function additionally
          raises the inexact floating-point exception whenever it raises
          the overflow or underflow floating-point exception is
          implementation-defined.


-----------------------------------------------------------------

::

          If the argument is zero or if all the specified exceptions were
          successfully raised, feraiseexcept() shall return zero.
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

          The effect is intended to be similar to that of floating-point
          exceptions raised by arithmetic operations. Hence, enabled traps
          for floating-point exceptions raised by this function are taken.


-----------------------------------------------------------

::

          Raising overflow or underflow is allowed to also raise inexact
          because on some architectures the only practical way to raise an
          exception is to execute an instruction that has the exception as
          a side-effect. The function is not restricted to accept only
          valid coincident expressions for atomic operations, so the
          function can be used to raise exceptions accrued over several
          operations.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          feclearexcept(3p), fegetexceptflag(3p), fetestexcept(3p)

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

   IEEE/The Open Group               2017                 FERAISEEXCEPT(3P)

--------------

Pages that refer to this page: `fenv.h(0p) <../man0/fenv.h.0p.html>`__, 
`feclearexcept(3p) <../man3/feclearexcept.3p.html>`__, 
`fegetexceptflag(3p) <../man3/fegetexceptflag.3p.html>`__, 
`fetestexcept(3p) <../man3/fetestexcept.3p.html>`__

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
