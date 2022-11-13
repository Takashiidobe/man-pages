.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

signal(3p) — Linux manual page
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

   SIGNAL(3P)              POSIX Programmer's Manual             SIGNAL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          signal — signal management


---------------------------------------------------------

::

          #include <signal.h>

          void (*signal(int sig, void (*func)(int)))(int);


---------------------------------------------------------------

::

          The functionality described on this reference page is aligned
          with the ISO C standard. Any conflict between the requirements
          described here and the ISO C standard is unintentional. This
          volume of POSIX.1‐2017 defers to the ISO C standard.

          The signal() function chooses one of three ways in which receipt
          of the signal number sig is to be subsequently handled. If the
          value of func is SIG_DFL, default handling for that signal shall
          occur.  If the value of func is SIG_IGN, the signal shall be
          ignored.  Otherwise, the application shall ensure that func
          points to a function to be called when that signal occurs. An
          invocation of such a function because of a signal, or
          (recursively) of any further functions called by that invocation
          (other than functions in the standard library), is called a
          ``signal handler''.

          When a signal occurs, and func points to a function, it is
          implementation-defined whether the equivalent of a:

              signal(sig, SIG_DFL);

          is executed or the implementation prevents some implementation-
          defined set of signals (at least including sig) from occurring
          until the current signal handling has completed. (If the value of
          sig is SIGILL, the implementation may alternatively define that
          no action is taken.) Next the equivalent of:

              (*func)(sig);

          is executed. If and when the function returns, if the value of
          sig was SIGFPE, SIGILL, or SIGSEGV or any other implementation-
          defined value corresponding to a computational exception, the
          behavior is undefined. Otherwise, the program shall resume
          execution at the point it was interrupted. The ISO C standard
          places a restriction on applications relating to the use of
          raise() from signal handlers.  This restriction does not apply to
          POSIX applications, as POSIX.1‐2008 requires raise() to be async-
          signal-safe (see Section 2.4.3, Signal Actions).

          If the process is multi-threaded, or if the process is single-
          threaded and a signal handler is executed other than as the
          result of:

           *  The process calling abort(), raise(), kill(), pthread_kill(),
              or sigqueue() to generate a signal that is not blocked

           *  A pending signal being unblocked and being delivered before
              the call that unblocked it returns

          the behavior is undefined if the signal handler refers to any
          object other than errno with static storage duration other than
          by assigning a value to an object declared as volatile
          sig_atomic_t, or if the signal handler calls any function defined
          in this standard other than one of the functions listed in
          Section 2.4, Signal Concepts.

          At program start-up, the equivalent of:

              signal(sig, SIG_IGN);

          is executed for some signals, and the equivalent of:

              signal(sig, SIG_DFL);

          is executed for all other signals (see exec).

          The signal() function shall not change the setting of errno if
          successful.


-----------------------------------------------------------------

::

          If the request can be honored, signal() shall return the value of
          func for the most recent call to signal() for the specified
          signal sig.  Otherwise, SIG_ERR shall be returned and a positive
          value shall be stored in errno.


-----------------------------------------------------

::

          The signal() function shall fail if:

          EINVAL The sig argument is not a valid signal number or an
                 attempt is made to catch a signal that cannot be caught or
                 ignore a signal that cannot be ignored.

          The signal() function may fail if:

          EINVAL An attempt was made to set the action to SIG_DFL for a
                 signal that cannot be caught or ignored (or both).

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The sigaction() function provides a more comprehensive and
          reliable mechanism for controlling signals; new applications
          should use sigaction() rather than signal().


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.4, Signal Concepts, exec(1p), pause(3p), raise(3p),
          sigaction(3p), sigsuspend(3p), waitid(3p)

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

   IEEE/The Open Group               2017                        SIGNAL(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`stropts.h(0p) <../man0/stropts.h.0p.html>`__, 
`nohup(1p) <../man1/nohup.1p.html>`__, 
`sh(1p) <../man1/sh.1p.html>`__, 
`abort(3p) <../man3/abort.3p.html>`__, 
`fork(3p) <../man3/fork.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__, 
`sighold(3p) <../man3/sighold.3p.html>`__, 
`sigsetjmp(3p) <../man3/sigsetjmp.3p.html>`__

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
