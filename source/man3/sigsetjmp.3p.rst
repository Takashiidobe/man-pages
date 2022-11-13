.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigsetjmp(3p) — Linux manual page
=================================

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

   SIGSETJMP(3P)           POSIX Programmer's Manual          SIGSETJMP(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sigsetjmp — set jump point for a non-local goto


---------------------------------------------------------

::

          #include <setjmp.h>

          int sigsetjmp(sigjmp_buf env, int savemask);


---------------------------------------------------------------

::

          The sigsetjmp() function shall be equivalent to the setjmp()
          function, except as follows:

           *  References to setjmp() are equivalent to sigsetjmp().

           *  References to longjmp() are equivalent to siglongjmp().

           *  If the value of the savemask argument is not 0, sigsetjmp()
              shall also save the current signal mask of the calling thread
              as part of the calling environment.


-----------------------------------------------------------------

::

          If the return is from a successful direct invocation, sigsetjmp()
          shall return 0. If the return is from a call to siglongjmp(),
          sigsetjmp() shall return a non-zero value.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The distinction between setjmp()/longjmp() and
          sigsetjmp()/siglongjmp() is only significant for programs which
          use sigaction(), sigprocmask(), or sigsuspend().

          Note that since this function is defined in terms of setjmp(), if
          savemask is zero, it is unspecified whether the signal mask is
          saved.


-----------------------------------------------------------

::

          The ISO C standard specifies various restrictions on the usage of
          the setjmp() macro in order to permit implementors to recognize
          the name in the compiler and not implement an actual function.
          These same restrictions apply to the sigsetjmp() macro.

          There are processors that cannot easily support these calls, but
          this was not considered a sufficient reason to exclude them.

          4.2 BSD, 4.3 BSD, and XSI-conformant systems provide functions
          named _setjmp() and _longjmp() that, together with setjmp() and
          longjmp(), provide the same functionality as sigsetjmp() and
          siglongjmp().  On those systems, setjmp() and longjmp() save and
          restore signal masks, while _setjmp() and _longjmp() do not. On
          System V Release 3 and in corresponding issues of the SVID,
          setjmp() and longjmp() are explicitly defined not to save and
          restore signal masks. In order to permit existing practice in
          both cases, the relation of setjmp() and longjmp() to signal
          masks is not specified, and a new set of functions is defined
          instead.

          The longjmp() and siglongjmp() functions operate as in the
          previous issue provided the matching setjmp() or sigsetjmp() has
          been performed in the same thread. Non-local jumps into contexts
          saved by other threads would be at best a questionable practice
          and were not considered worthy of standardization.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_sigmask(3p), siglongjmp(3p), signal(3p), sigsuspend(3p)

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

   IEEE/The Open Group               2017                     SIGSETJMP(3P)

--------------

Pages that refer to this page:
`setjmp.h(0p) <../man0/setjmp.h.0p.html>`__, 
`longjmp(3p) <../man3/longjmp.3p.html>`__, 
`\_longjmp(3p) <../man3/_longjmp.3p.html>`__, 
`setjmp(3p) <../man3/setjmp.3p.html>`__, 
`sigaltstack(3p) <../man3/sigaltstack.3p.html>`__, 
`siglongjmp(3p) <../man3/siglongjmp.3p.html>`__, 
`sleep(3p) <../man3/sleep.3p.html>`__

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
