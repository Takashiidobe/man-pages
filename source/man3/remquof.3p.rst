.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

remquo(3p) — Linux manual page
==============================

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

   REMQUO(3P)              POSIX Programmer's Manual             REMQUO(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          remquo, remquof, remquol — remainder functions


---------------------------------------------------------

::

          #include <math.h>

          double remquo(double x, double y, int *quo);
          float remquof(float x, float y, int *quo);
          long double remquol(long double x, long double y, int *quo);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The remquo(), remquof(), and remquol() functions shall compute
          the same remainder as the remainder(), remainderf(), and
          remainderl() functions, respectively. In the object pointed to by
          quo, they store a value whose sign is the sign of x/y and whose
          magnitude is congruent modulo 2n to the magnitude of the integral
          quotient of x/y, where n is an implementation-defined integer
          greater than or equal to 3. If y is zero, the value stored in the
          object pointed to by quo is unspecified.

          An application wishing to check for error situations should set
          errno to zero and call feclearexcept(FE_ALL_EXCEPT) before
          calling these functions. On return, if errno is non-zero or
          fetestexcept(FE_INVALID | FE_DIVBYZERO | FE_OVERFLOW |
          FE_UNDERFLOW) is non-zero, an error has occurred.


-----------------------------------------------------------------

::

          These functions shall return x REM y.

          On systems that do not support the IEC 60559 Floating-Point
          option, if y is zero, it is implementation-defined whether a
          domain error occurs or zero is returned.

          If x or y is NaN, a NaN shall be returned.

          If x is ±Inf or y is zero and the other argument is non-NaN, a
          domain error shall occur, and a NaN shall be returned.


-----------------------------------------------------

::

          These functions shall fail if:

          Domain Error
                      The x argument is ±Inf, or the y argument is ±0 and
                      the other argument is non-NaN.

                      If the integer expression (math_errhandling &
                      MATH_ERRNO) is non-zero, then errno shall be set to
                      [EDOM].  If the integer expression (math_errhandling
                      & MATH_ERREXCEPT) is non-zero, then the invalid
                      floating-point exception shall be raised.

          These functions may fail if:

          Domain Error
                      The y argument is zero.

                      If the integer expression (math_errhandling &
                      MATH_ERRNO) is non-zero, then errno shall be set to
                      [EDOM].  If the integer expression (math_errhandling
                      & MATH_ERREXCEPT) is non-zero, then the invalid
                      floating-point exception shall be raised.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          On error, the expressions (math_errhandling & MATH_ERRNO) and
          (math_errhandling & MATH_ERREXCEPT) are independent of each
          other, but at least one of them must be non-zero.


-----------------------------------------------------------

::

          These functions are intended for implementing argument reductions
          which can exploit a few low-order bits of the quotient. Note that
          x may be so large in magnitude relative to y that an exact
          representation of the quotient is not practical.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          feclearexcept(3p), fetestexcept(3p), remainder(3p)

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

   IEEE/The Open Group               2017                        REMQUO(3P)

--------------

Pages that refer to this page: `math.h(0p) <../man0/math.h.0p.html>`__

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
