.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

atan2(3p) — Linux manual page
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

   ATAN2(3P)               POSIX Programmer's Manual              ATAN2(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          atan2, atan2f, atan2l — arc tangent functions


---------------------------------------------------------

::

          #include <math.h>

          double atan2(double y, double x);
          float atan2f(float y, float x);
          long double atan2l(long double y, long double x);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          These functions shall compute the principal value of the arc
          tangent of y/x, using the signs of both arguments to determine
          the quadrant of the return value.

          An application wishing to check for error situations should set
          errno to zero and call feclearexcept(FE_ALL_EXCEPT) before
          calling these functions. On return, if errno is non-zero or
          fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW |
          FE_UNDERFLOW) is non-zero, an error has occurred.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return the arc
          tangent of y/x in the range [-π,π] radians.

          If y is ±0 and x is < 0, ±π shall be returned.

          If y is ±0 and x is > 0, ±0 shall be returned.

          If y is < 0 and x is ±0, -π/2 shall be returned.

          If y is > 0 and x is ±0, π/2 shall be returned.

          If x is 0, a pole error shall not occur.

          If either x or y is NaN, a NaN shall be returned.

          If the correct value would cause underflow, a range error may
          occur, and atan(), atan2f(), and atan2l() shall return an
          implementation-defined value no greater in magnitude than
          DBL_MIN, FLT_MIN, and LDBL_MIN, respectively.

          If the IEC 60559 Floating-Point option is supported, y/x should
          be returned.

          If y is ±0 and x is -0, ±π shall be returned.

          If y is ±0 and x is +0, ±0 shall be returned.

          For finite values of ±y > 0, if x is -Inf, ±π shall be returned.

          For finite values of ±y > 0, if x is +Inf, ±0 shall be returned.

          For finite values of x, if y is ±Inf, ±π/2 shall be returned.

          If y is ±Inf and x is -Inf, ±3π/4 shall be returned.

          If y is ±Inf and x is +Inf, ±π/4 shall be returned.

          If both arguments are 0, a domain error shall not occur.


-----------------------------------------------------

::

          These functions may fail if:

          Range Error The result underflows.

                      If the integer expression (math_errhandling &
                      MATH_ERRNO) is non-zero, then errno shall be set to
                      [ERANGE].  If the integer expression
                      (math_errhandling & MATH_ERREXCEPT) is non-zero, then
                      the underflow floating-point exception shall be
                      raised.

          The following sections are informative.


---------------------------------------------------------

::

      Converting Cartesian to Polar Coordinates System
          The function below uses atan2() to convert a 2d vector expressed
          in cartesian coordinates (x,y) to the polar coordinates
          (rho,theta).  There are other ways to compute the angle theta,
          using asin() acos(), or atan().  However, atan2() presents here
          two advantages:

           *  The angle's quadrant is automatically determined.

           *  The singular cases (0,y) are taken into account.

          Finally, this example uses hypot() rather than sqrt() since it is
          better for special cases; see hypot() for more information.

              #include <math.h>

              void
              cartesian_to_polar(const double x, const double y,
                                 double *rho, double *theta
                  )
              {
                  *rho   = hypot (x,y); /* better than sqrt(x*x+y*y) */
                  *theta = atan2 (y,x);
              }


---------------------------------------------------------------------------

::

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

          acos(3p), asin(3p), atan(3p), feclearexcept(3p),
          fetestexcept(3p), hypot(3p), isnan(3p), sqrt(3p), tan(3p)

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

   IEEE/The Open Group               2017                         ATAN2(3P)

--------------

Pages that refer to this page: `math.h(0p) <../man0/math.h.0p.html>`__, 
`atan(3p) <../man3/atan.3p.html>`__, 
`hypot(3p) <../man3/hypot.3p.html>`__

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
