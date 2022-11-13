.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sigwait(3p) — Linux manual page
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

   SIGWAIT(3P)             POSIX Programmer's Manual            SIGWAIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sigwait — wait for queued signals


---------------------------------------------------------

::

          #include <signal.h>

          int sigwait(const sigset_t *restrict set, int *restrict sig);


---------------------------------------------------------------

::

          The sigwait() function shall select a pending signal from set,
          atomically clear it from the system's set of pending signals, and
          return that signal number in the location referenced by sig.  If
          prior to the call to sigwait() there are multiple pending
          instances of a single signal number, it is implementation-defined
          whether upon successful return there are any remaining pending
          signals for that signal number.  If the implementation supports
          queued signals and there are multiple signals queued for the
          signal number selected, the first such queued signal shall cause
          a return from sigwait() and the remainder shall remain queued. If
          no signal in set is pending at the time of the call, the thread
          shall be suspended until one or more becomes pending. The signals
          defined by set shall have been blocked at the time of the call to
          sigwait(); otherwise, the behavior is undefined. The effect of
          sigwait() on the signal actions for the signals in set is
          unspecified.

          If more than one thread is using sigwait() to wait for the same
          signal, no more than one of these threads shall return from
          sigwait() with the signal number. If more than a single thread is
          blocked in sigwait() for a signal when that signal is generated
          for the process, it is unspecified which of the waiting threads
          returns from sigwait().  If the signal is generated for a
          specific thread, as by pthread_kill(), only that thread shall
          return.

          Should any of the multiple pending signals in the range SIGRTMIN
          to SIGRTMAX be selected, it shall be the lowest numbered one. The
          selection order between realtime and non-realtime signals, or
          between multiple pending non-realtime signals, is unspecified.


-----------------------------------------------------------------

::

          Upon successful completion, sigwait() shall store the signal
          number of the received signal at the location referenced by sig
          and return zero. Otherwise, an error number shall be returned to
          indicate the error.


-----------------------------------------------------

::

          The sigwait() function may fail if:

          EINVAL The set argument contains an invalid or unsupported signal
                 number.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          To provide a convenient way for a thread to wait for a signal,
          this volume of POSIX.1‐2017 provides the sigwait() function. For
          most cases where a thread has to wait for a signal, the sigwait()
          function should be quite convenient, efficient, and adequate.

          However, requests were made for a lower-level primitive than
          sigwait() and for semaphores that could be used by threads. After
          some consideration, threads were allowed to use semaphores and
          sem_post() was defined to be async-signal-safe.

          In summary, when it is necessary for code run in response to an
          asynchronous signal to notify a thread, sigwait() should be used
          to handle the signal. Alternatively, if the implementation
          provides semaphores, they also can be used, either following
          sigwait() or from within a signal handling routine previously
          registered with sigaction().


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.4, Signal Concepts, Section 2.8.1, Realtime Signals,
          pause(3p), pthread_sigmask(3p), sigaction(3p), sigpending(3p),
          sigsuspend(3p), sigtimedwait(3p)

          The Base Definitions volume of POSIX.1‐2017, signal.h(0p),
          time.h(0p)


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

   IEEE/The Open Group               2017                       SIGWAIT(3P)

--------------

Pages that refer to this page:
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`sigtimedwait(3p) <../man3/sigtimedwait.3p.html>`__

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
