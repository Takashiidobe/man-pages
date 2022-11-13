.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigaltstack(3p) — Linux manual page
===================================

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

   SIGALTSTACK(3P)         POSIX Programmer's Manual        SIGALTSTACK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sigaltstack — set and get signal alternate stack context


---------------------------------------------------------

::

          #include <signal.h>

          int sigaltstack(const stack_t *restrict ss, stack_t *restrict oss);


---------------------------------------------------------------

::

          The sigaltstack() function allows a process to define and examine
          the state of an alternate stack for signal handlers for the
          current thread. Signals that have been explicitly declared to
          execute on the alternate stack shall be delivered on the
          alternate stack.

          If ss is not a null pointer, it points to a stack_t structure
          that specifies the alternate signal stack that shall take effect
          upon return from sigaltstack().  The ss_flags member specifies
          the new stack state. If it is set to SS_DISABLE, the stack is
          disabled and ss_sp and ss_size are ignored. Otherwise, the stack
          shall be enabled, and the ss_sp and ss_size members specify the
          new address and size of the stack.

          The range of addresses starting at ss_sp up to but not including
          ss_sp+ss_size is available to the implementation for use as the
          stack. This function makes no assumptions regarding which end is
          the stack base and in which direction the stack grows as items
          are pushed.

          If oss is not a null pointer, upon successful completion it shall
          point to a stack_t structure that specifies the alternate signal
          stack that was in effect prior to the call to sigaltstack().  The
          ss_sp and ss_size members specify the address and size of that
          stack. The ss_flags member specifies the stack's state, and may
          contain one of the following values:

          SS_ONSTACK  The process is currently executing on the alternate
                      signal stack.  Attempts to modify the alternate
                      signal stack while the process is executing on it
                      fail. This flag shall not be modified by processes.

          SS_DISABLE  The alternate signal stack is currently disabled.

          The value SIGSTKSZ is a system default specifying the number of
          bytes that would be used to cover the usual case when manually
          allocating an alternate stack area. The value MINSIGSTKSZ is
          defined to be the minimum stack size for a signal handler. In
          computing an alternate stack size, a program should add that
          amount to its stack requirements to allow for the system
          implementation overhead. The constants SS_ONSTACK, SS_DISABLE,
          SIGSTKSZ, and MINSIGSTKSZ are defined in <signal.h>.

          After a successful call to one of the exec functions, there are
          no alternate signal stacks in the new process image.

          In some implementations, a signal (whether or not indicated to
          execute on the alternate stack) shall always execute on the
          alternate stack if it is delivered while another signal is being
          caught using the alternate stack.

          Use of this function by library threads that are not bound to
          kernel-scheduled entities results in undefined behavior.


-----------------------------------------------------------------

::

          Upon successful completion, sigaltstack() shall return 0;
          otherwise, it shall return -1 and set errno to indicate the
          error.


-----------------------------------------------------

::

          The sigaltstack() function shall fail if:

          EINVAL The ss argument is not a null pointer, and the ss_flags
                 member pointed to by ss contains flags other than
                 SS_DISABLE.

          ENOMEM The size of the alternate stack area is less than
                 MINSIGSTKSZ.

          EPERM  An attempt was made to modify an active stack.

          The following sections are informative.


---------------------------------------------------------

::

      Allocating Memory for an Alternate Stack
          The following example illustrates a method for allocating memory
          for an alternate stack.

              #include <signal.h>
              ...
              if ((sigstk.ss_sp = malloc(SIGSTKSZ)) == NULL)
                  /* Error return. */
              sigstk.ss_size = SIGSTKSZ;
              sigstk.ss_flags = 0;
              if (sigaltstack(&sigstk,(stack_t *)0) < 0)
                  perror("sigaltstack");


---------------------------------------------------------------------------

::

          On some implementations, stack space is automatically extended as
          needed. On those implementations, automatic extension is
          typically not available for an alternate stack. If the stack
          overflows, the behavior is undefined.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.4, Signal Concepts, exec(1p), sigaction(3p),
          sigsetjmp(3p)

          The Base Definitions volume of POSIX.1‐2017, signal.h(0p)


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

   IEEE/The Open Group               2017                   SIGALTSTACK(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`getrlimit(3p) <../man3/getrlimit.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__

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
