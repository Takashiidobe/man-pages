.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

tan(3p) — Linux manual page
===========================

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

   TAN(3P)                 POSIX Programmer's Manual                TAN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          tan, tanf, tanl — tangent function


---------------------------------------------------------

::

          #include <math.h>

          double tan(double x);
          float tanf(float x);
          long double tanl(long double x);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          These functions shall compute the tangent of their argument x,
          measured in radians.

          An application wishing to check for error situations should set
          errno to zero and call feclearexcept(FE_ALL_EXCEPT) before
          calling these functions. On return, if errno is non-zero or
          fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW |
          FE_UNDERFLOW) is non-zero, an error has occurred.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return the
          tangent of x.

          If the correct value would cause underflow, and is not
          representable, a range error may occur, and tan(), tanf(), and
          tanl() shall return 0.0, or (if IEC 60559 Floating-Point is not
          supported) an implementation-defined value no greater in
          magnitude than DBL_MIN, FLT_MIN, and LDBL_MIN, respectively.

          If x is NaN, a NaN shall be returned.

          If x is ±0, x shall be returned.

          If x is subnormal, a range error may occur
          and x should be returned.

          If x is not returned, tan(), tanf(), and tanl() shall return an
          implementation-defined value no greater in magnitude than
          DBL_MIN, FLT_MIN, and LDBL_MIN, respectively.

          If x is ±Inf, a domain error shall occur, and either a NaN (if
          supported), or an implementation-defined value shall be returned.

          If the correct value would cause underflow, and is representable,
          a range error may occur and the correct value shall be returned.

          If the correct value would cause overflow, a range error shall
          occur and tan(), tanf(), and tanl() shall return ±HUGE_VAL,
          ±HUGE_VALF, and ±HUGE_VALL, respectively, with the same sign as
          the correct value of the function.


-----------------------------------------------------

::

          These functions shall fail if:

          Domain Error
                      The value of x is ±Inf.

                      If the integer expression (math_errhandling &
                      MATH_ERRNO) is non-zero, then errno shall be set to
                      [EDOM].  If the integer expression (math_errhandling
                      & MATH_ERREXCEPT) is non-zero, then the invalid
                      floating-point exception shall be raised.

          Range Error The result overflows

                      If the integer expression (math_errhandling &
                      MATH_ERRNO) is non-zero, then errno shall be set to
                      [ERANGE].  If the integer expression
                      (math_errhandling & MATH_ERREXCEPT) is non-zero, then
                      the overflow floating-point exception shall be
                      raised.

          These functions may fail if:

          Range Error The result underflows, or the value of x is
                      subnormal.

                      If the integer expression (math_errhandling &
                      MATH_ERRNO) is non-zero, then errno shall be set to
                      [ERANGE].  If the integer expression
                      (math_errhandling & MATH_ERREXCEPT) is non-zero, then
                      the underflow floating-point exception shall be
                      raised.

          The following sections are informative.


---------------------------------------------------------

::

      Taking the Tangent of a 45-Degree Angle
              #include <math.h>
              ...
              double radians = 45.0 * M_PI / 180;
              double result;
              ...
              result = tan (radians);


---------------------------------------------------------------------------

::

          There are no known floating-point representations such that for a
          normal argument, tan(x) is either overflow or underflow.

          These functions may lose accuracy when their argument is near a
          multiple of π/2 or is far from 0.0.

          On error, the expressions (math_errhandling & MATH_ERRNO) and
          (math_errhandling & MATH_ERREXCEPT) are independent of each
          other, but at least one of them must be non-zero.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          atan(3p), feclearexcept(3p), fetestexcept(3p), isnan(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 4.20,
          Treatment of Error Conditions for Mathematical Functions,
          math.h(0p)


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

   IEEE/The Open Group               2017                           TAN(3P)

--------------

Pages that refer to this page: `math.h(0p) <../man0/math.h.0p.html>`__, 
`atan2(3p) <../man3/atan2.3p.html>`__, 
`atan(3p) <../man3/atan.3p.html>`__, 
`cos(3p) <../man3/cos.3p.html>`__, 
`tanh(3p) <../man3/tanh.3p.html>`__, 
`tanl(3p) <../man3/tanl.3p.html>`__

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
