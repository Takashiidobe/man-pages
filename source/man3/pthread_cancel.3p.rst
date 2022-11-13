.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_cancel(3p) — Linux manual page
======================================

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

   PTHREAD_CANCEL(3P)      POSIX Programmer's Manual     PTHREAD_CANCEL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_cancel — cancel execution of a thread


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_cancel(pthread_t thread);


---------------------------------------------------------------

::

          The pthread_cancel() function shall request that thread be
          canceled. The target thread's cancelability state and type
          determines when the cancellation takes effect. When the
          cancellation is acted on, the cancellation cleanup handlers for
          thread shall be called. When the last cancellation cleanup
          handler returns, the thread-specific data destructor functions
          shall be called for thread.  When the last destructor function
          returns, thread shall be terminated.

          The cancellation processing in the target thread shall run
          asynchronously with respect to the calling thread returning from
          pthread_cancel().


-----------------------------------------------------------------

::

          If successful, the pthread_cancel() function shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_cancel() function shall not return an error code of
          [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          Two alternative functions were considered for sending the
          cancellation notification to a thread. One would be to define a
          new SIGCANCEL signal that had the cancellation semantics when
          delivered; the other was to define the new pthread_cancel()
          function, which would trigger the cancellation semantics.

          The advantage of a new signal was that so much of the delivery
          criteria were identical to that used when trying to deliver a
          signal that making cancellation notification a signal was seen as
          consistent. Indeed, many implementations implement cancellation
          using a special signal. On the other hand, there would be no
          signal functions that could be used with this signal except
          pthread_kill(), and the behavior of the delivered cancellation
          signal would be unlike any previously existing defined signal.

          The benefits of a special function include the recognition that
          this signal would be defined because of the similar delivery
          criteria and that this is the only common behavior between a
          cancellation request and a signal. In addition, the cancellation
          delivery mechanism does not have to be implemented as a signal.
          There are also strong, if not stronger, parallels with language
          exception mechanisms than with signals that are potentially
          obscured if the delivery mechanism is visibly closer to signals.

          In the end, it was considered that as there were so many
          exceptions to the use of the new signal with existing signals
          functions it would be misleading. A special function has resolved
          this problem.  This function was carefully defined so that an
          implementation wishing to provide the cancellation functions on
          top of signals could do so.  The special function also means that
          implementations are not obliged to implement cancellation with
          signals.

          If an implementation detects use of a thread ID after the end of
          its lifetime, it is recommended that the function should fail and
          report an [ESRCH] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_exit(3p), pthread_cond_timedwait(3p), pthread_join(3p),
          pthread_setcancelstate(3p)

          The Base Definitions volume of POSIX.1‐2017, pthread.h(0p)


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

   IEEE/The Open Group               2017                PTHREAD_CANCEL(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_cleanup_pop(3p) <../man3/pthread_cleanup_pop.3p.html>`__, 
`pthread_setcancelstate(3p) <../man3/pthread_setcancelstate.3p.html>`__

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
