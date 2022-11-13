.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

drand48(3p) — Linux manual page
===============================

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

   DRAND48(3P)             POSIX Programmer's Manual            DRAND48(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          drand48, erand48, jrand48, lcong48, lrand48, mrand48, nrand48,
          seed48, srand48 — generate uniformly distributed pseudo-random
          numbers


---------------------------------------------------------

::

          #include <stdlib.h>

          double drand48(void);
          double erand48(unsigned short xsubi[3]);
          long jrand48(unsigned short xsubi[3]);
          void lcong48(unsigned short param[7]);
          long lrand48(void);
          long mrand48(void);
          long nrand48(unsigned short xsubi[3]);
          unsigned short *seed48(unsigned short seed16v[3]);
          void srand48(long seedval);


---------------------------------------------------------------

::

          This family of functions shall generate pseudo-random numbers
          using a linear congruential algorithm and 48-bit integer
          arithmetic.

          The drand48() and erand48() functions shall return non-negative,
          double-precision, floating-point values, uniformly distributed
          over the interval [0.0,1.0).

          The lrand48() and nrand48() functions shall return non-negative,
          long integers, uniformly distributed over the interval [0,231).

          The mrand48() and jrand48() functions shall return signed long
          integers uniformly distributed over the interval [-231,231).

          The srand48(), seed48(), and lcong48() functions are
          initialization entry points, one of which should be invoked
          before either drand48(), lrand48(), or mrand48() is called.
          (Although it is not recommended practice, constant default
          initializer values shall be supplied automatically if drand48(),
          lrand48(), or mrand48() is called without a prior call to an
          initialization entry point.) The erand48(), nrand48(), and
          jrand48() functions do not require an initialization entry point
          to be called first.

          All the routines work by generating a sequence of 48-bit integer
          values, X_i , according to the linear congruential formula:

                 Xn+1 = (aX_n +c)mod m        n≥ 0

          The parameter m=2^48; hence 48-bit integer arithmetic is
          performed. Unless lcong48() is invoked, the multiplier value a
          and the addend value c are given by:

                 a = 5DEECE66D16 = 2736731631558

                 c = B16 = 138

          The value returned by any of the drand48(), erand48(), jrand48(),
          lrand48(), mrand48(), or nrand48() functions is computed by first
          generating the next 48-bit X_i in the sequence. Then the
          appropriate number of bits, according to the type of data item to
          be returned, are copied from the high-order (leftmost) bits of
          X_i and transformed into the returned value.

          The drand48(), lrand48(), and mrand48() functions store the last
          48-bit X_i generated in an internal buffer; that is why the
          application shall ensure that these are initialized prior to
          being invoked. The erand48(), nrand48(), and jrand48() functions
          require the calling program to provide storage for the successive
          X_i values in the array specified as an argument when the
          functions are invoked. That is why these routines do not have to
          be initialized; the calling program merely has to place the
          desired initial value of X_i into the array and pass it as an
          argument.  By using different arguments, erand48(), nrand48(),
          and jrand48() allow separate modules of a large program to
          generate several independent streams of pseudo-random numbers;
          that is, the sequence of numbers in each stream shall not depend
          upon how many times the routines are called to generate numbers
          for the other streams.

          The initializer function srand48() sets the high-order 32 bits of
          X_i to the low-order 32 bits contained in its argument. The low-
          order 16 bits of X_i are set to the arbitrary value 330E_16 .

          The initializer function seed48() sets the value of X_i to the
          48-bit value specified in the argument array. The low-order 16
          bits of X_i are set to the low-order 16 bits of seed16v[0].  The
          mid-order 16 bits of X_i are set to the low-order 16 bits of
          seed16v[1].  The high-order 16 bits of X_i are set to the low-
          order 16 bits of seed16v[2].  In addition, the previous value of
          X_i is copied into a 48-bit internal buffer, used only by
          seed48(), and a pointer to this buffer is the value returned by
          seed48().  This returned pointer, which can just be ignored if
          not needed, is useful if a program is to be restarted from a
          given point at some future time—use the pointer to get at and
          store the last X_i value, and then use this value to reinitialize
          via seed48() when the program is restarted.

          The initializer function lcong48() allows the user to specify the
          initial X_i , the multiplier value a, and the addend value c.
          Argument array elements param[0-2] specify X_i , param[3-5]
          specify the multiplier a, and param[6] specifies the 16-bit
          addend c. After lcong48() is called, a subsequent call to either
          srand48() or seed48() shall restore the standard multiplier and
          addend values, a and c, specified above.

          The drand48(), lrand48(), and mrand48() functions need not be
          thread-safe.


-----------------------------------------------------------------

::

          As described in the DESCRIPTION above.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          These functions should be avoided whenever non-trivial
          requirements (including safety) have to be fulfilled.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          initstate(3p), rand(3p)

          The Base Definitions volume of POSIX.1‐2017, stdlib.h(0p)


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

   IEEE/The Open Group               2017                       DRAND48(3P)

--------------

Pages that refer to this page:
`stdlib.h(0p) <../man0/stdlib.h.0p.html>`__, 
`erand48(3p) <../man3/erand48.3p.html>`__, 
`initstate(3p) <../man3/initstate.3p.html>`__, 
`jrand48(3p) <../man3/jrand48.3p.html>`__, 
`lcong48(3p) <../man3/lcong48.3p.html>`__, 
`lrand48(3p) <../man3/lrand48.3p.html>`__, 
`mrand48(3p) <../man3/mrand48.3p.html>`__, 
`nrand48(3p) <../man3/nrand48.3p.html>`__, 
`rand(3p) <../man3/rand.3p.html>`__, 
`seed48(3p) <../man3/seed48.3p.html>`__, 
`srand48(3p) <../man3/srand48.3p.html>`__

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
