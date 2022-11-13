.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

longjmp(3p) — Linux manual page
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

   LONGJMP(3P)             POSIX Programmer's Manual            LONGJMP(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          longjmp — non-local goto


---------------------------------------------------------

::

          #include <setjmp.h>

          void longjmp(jmp_buf env, int val);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The longjmp() function shall restore the environment saved by the
          most recent invocation of setjmp() in the same process, with the
          corresponding jmp_buf argument. If the most recent invocation of
          setjmp() with the corresponding jmp_buf occurred in another
          thread, or if there is no such invocation, or if the function
          containing the invocation of setjmp() has terminated execution in
          the interim, or if the invocation of setjmp() was within the
          scope of an identifier with variably modified type and execution
          has left that scope in the interim, the behavior is undefined.
          It is unspecified whether longjmp() restores the signal mask,
          leaves the signal mask unchanged, or restores it to its value at
          the time setjmp() was called.

          All accessible objects have values, and all other components of
          the abstract machine have state (for example, floating-point
          status flags and open files), as of the time longjmp() was
          called, except that the values of objects of automatic storage
          duration are unspecified if they meet all the following
          conditions:

           *  They are local to the function containing the corresponding
              setjmp() invocation.

           *  They do not have volatile-qualified type.

           *  They are changed between the setjmp() invocation and
              longjmp() call.

          Although longjmp() is an async-signal-safe function, if it is
          invoked from a signal handler which interrupted a non-async-
          signal-safe function or equivalent (such as the processing
          equivalent to exit() performed after a return from the initial
          call to main()), the behavior of any subsequent call to a non-
          async-signal-safe function or equivalent is undefined.

          The effect of a call to longjmp() where initialization of the
          jmp_buf structure was not performed in the calling thread is
          undefined.


-----------------------------------------------------------------

::

          After longjmp() is completed, program execution continues as if
          the corresponding invocation of setjmp() had just returned the
          value specified by val.  The longjmp() function shall not cause
          setjmp() to return 0; if val is 0, setjmp() shall return 1.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Applications whose behavior depends on the value of the signal
          mask should not use longjmp() and setjmp(), since their effect on
          the signal mask is unspecified, but should instead use the
          siglongjmp() and sigsetjmp() functions (which can save and
          restore the signal mask under application control).

          It is recommended that applications do not call longjmp() or
          siglongjmp() from signal handlers. To avoid undefined behavior
          when calling these functions from a signal handler, the
          application needs to ensure one of the following two things:

           1. After the call to longjmp() or siglongjmp() the process only
              calls async-signal-safe functions and does not return from
              the initial call to main().

           2. Any signal whose handler calls longjmp() or siglongjmp() is
              blocked during every call to a non-async-signal-safe
              function, and no such calls are made after returning from the
              initial call to main().


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          setjmp(3p), sigaction(3p), siglongjmp(3p), sigsetjmp(3p)

          The Base Definitions volume of POSIX.1‐2017, setjmp.h(0p)


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

   IEEE/The Open Group               2017                       LONGJMP(3P)

--------------

Pages that refer to this page:
`setjmp.h(0p) <../man0/setjmp.h.0p.html>`__, 
`exit(3p) <../man3/exit.3p.html>`__, 
`ftw(3p) <../man3/ftw.3p.html>`__, 
`\_longjmp(3p) <../man3/_longjmp.3p.html>`__, 
`setjmp(3p) <../man3/setjmp.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__, 
`siglongjmp(3p) <../man3/siglongjmp.3p.html>`__

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
