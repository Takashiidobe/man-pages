.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigsuspend(3p) — Linux manual page
==================================

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

   SIGSUSPEND(3P)          POSIX Programmer's Manual         SIGSUSPEND(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sigsuspend — wait for a signal


---------------------------------------------------------

::

          #include <signal.h>

          int sigsuspend(const sigset_t *sigmask);


---------------------------------------------------------------

::

          The sigsuspend() function shall replace the current signal mask
          of the calling thread with the set of signals pointed to by
          sigmask and then suspend the thread until delivery of a signal
          whose action is either to execute a signal-catching function or
          to terminate the process. This shall not cause any other signals
          that may have been pending on the process to become pending on
          the thread.

          If the action is to terminate the process then sigsuspend() shall
          never return. If the action is to execute a signal-catching
          function, then sigsuspend() shall return after the signal-
          catching function returns, with the signal mask restored to the
          set that existed prior to the sigsuspend() call.

          It is not possible to block signals that cannot be ignored. This
          is enforced by the system without causing an error to be
          indicated.


-----------------------------------------------------------------

::

          Since sigsuspend() suspends thread execution indefinitely, there
          is no successful completion return value. If a return occurs, -1
          shall be returned and errno set to indicate the error.


-----------------------------------------------------

::

          The sigsuspend() function shall fail if:

          EINTR  A signal is caught by the calling process and control is
                 returned from the signal-catching function.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Normally, at the beginning of a critical code section, a
          specified set of signals is blocked using the sigprocmask()
          function. When the thread has completed the critical section and
          needs to wait for the previously blocked signal(s), it pauses by
          calling sigsuspend() with the mask that was returned by the
          sigprocmask() call.


-----------------------------------------------------------

::

          Code which wants to avoid the ambiguity of the signal mask for
          thread cancellation handlers can install an additional
          cancellation handler which resets the signal mask to the expected
          value.

              void cleanup(void *arg)
              {
                  sigset_t *ss = (sigset_t *) arg;
                  pthread_sigmask(SIG_SETMASK, ss, NULL);
              }

              int call_sigsuspend(const sigset_t *mask)
              {
                  sigset_t oldmask;
                  int result;
                  pthread_sigmask(SIG_SETMASK, NULL, &oldmask);
                  pthread_cleanup_push(cleanup, &oldmask);
                  result = sigsuspend(sigmask);
                  pthread_cleanup_pop(0);
                  return result;
              }


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.4, Signal Concepts, pause(3p), sigaction(3p),
          sigaddset(3p), sigdelset(3p), sigemptyset(3p), sigfillset(3p)

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

   IEEE/The Open Group               2017                    SIGSUSPEND(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`pause(3p) <../man3/pause.3p.html>`__, 
`pthread_sigmask(3p) <../man3/pthread_sigmask.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__, 
`sigaddset(3p) <../man3/sigaddset.3p.html>`__, 
`sigdelset(3p) <../man3/sigdelset.3p.html>`__, 
`sigemptyset(3p) <../man3/sigemptyset.3p.html>`__, 
`sigfillset(3p) <../man3/sigfillset.3p.html>`__, 
`sighold(3p) <../man3/sighold.3p.html>`__, 
`sigismember(3p) <../man3/sigismember.3p.html>`__, 
`siglongjmp(3p) <../man3/siglongjmp.3p.html>`__, 
`signal(3p) <../man3/signal.3p.html>`__, 
`sigsetjmp(3p) <../man3/sigsetjmp.3p.html>`__, 
`sigtimedwait(3p) <../man3/sigtimedwait.3p.html>`__, 
`sigwait(3p) <../man3/sigwait.3p.html>`__

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
