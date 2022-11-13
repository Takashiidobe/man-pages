.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_mutex_timedlock(3p) — Linux manual page
===============================================

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

   PTHREAD_MUTEX_TIMEDLOCK(3P)IX Programmer's ManualEAD_MUTEX_TIMEDLOCK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_mutex_timedlock — lock a mutex


---------------------------------------------------------

::

          #include <pthread.h>
          #include <time.h>

          int pthread_mutex_timedlock(pthread_mutex_t *restrict mutex,
              const struct timespec *restrict abstime);


---------------------------------------------------------------

::

          The pthread_mutex_timedlock() function shall lock the mutex
          object referenced by mutex.  If the mutex is already locked, the
          calling thread shall block until the mutex becomes available as
          in the pthread_mutex_lock() function. If the mutex cannot be
          locked without waiting for another thread to unlock the mutex,
          this wait shall be terminated when the specified timeout expires.

          The timeout shall expire when the absolute time specified by
          abstime passes, as measured by the clock on which timeouts are
          based (that is, when the value of that clock equals or exceeds
          abstime), or if the absolute time specified by abstime has
          already been passed at the time of the call.

          The timeout shall be based on the CLOCK_REALTIME clock.  The
          resolution of the timeout shall be the resolution of the clock on
          which it is based. The timespec data type is defined in the
          <time.h> header.

          Under no circumstance shall the function fail with a timeout if
          the mutex can be locked immediately. The validity of the abstime
          parameter need not be checked if the mutex can be locked
          immediately.

          As a consequence of the priority inheritance rules (for mutexes
          initialized with the PRIO_INHERIT protocol), if a timed mutex
          wait is terminated because its timeout expires, the priority of
          the owner of the mutex shall be adjusted as necessary to reflect
          the fact that this thread is no longer among the threads waiting
          for the mutex.

          If mutex is a robust mutex and the process containing the owning
          thread terminated while holding the mutex lock, a call to
          pthread_mutex_timedlock() shall return the error value
          [EOWNERDEAD].  If mutex is a robust mutex and the owning thread
          terminated while holding the mutex lock, a call to
          pthread_mutex_timedlock() may return the error value [EOWNERDEAD]
          even if the process in which the owning thread resides has not
          terminated. In these cases, the mutex is locked by the thread but
          the state it protects is marked as inconsistent. The application
          should ensure that the state is made consistent for reuse and
          when that is complete call pthread_mutex_consistent().  If the
          application is unable to recover the state, it should unlock the
          mutex without a prior call to pthread_mutex_consistent(), after
          which the mutex is marked permanently unusable.

          If mutex does not refer to an initialized mutex object, the
          behavior is undefined.


-----------------------------------------------------------------

::

          If successful, the pthread_mutex_timedlock() function shall
          return zero; otherwise, an error number shall be returned to
          indicate the error.


-----------------------------------------------------

::

          The pthread_mutex_timedlock() function shall fail if:

          EAGAIN The mutex could not be acquired because the maximum number
                 of recursive locks for mutex has been exceeded.

          EDEADLK
                 The mutex type is PTHREAD_MUTEX_ERRORCHECK and the current
                 thread already owns the mutex.

          EINVAL The mutex was created with the protocol attribute having
                 the value PTHREAD_PRIO_PROTECT and the calling thread's
                 priority is higher than the mutex' current priority
                 ceiling.

          EINVAL The process or thread would have blocked, and the abstime
                 parameter specified a nanoseconds field value less than
                 zero or greater than or equal to 1000 million.

          ENOTRECOVERABLE
                 The state protected by the mutex is not recoverable.

          EOWNERDEAD
                 The mutex is a robust mutex and the process containing the
                 previous owning thread terminated while holding the mutex
                 lock. The mutex lock shall be acquired by the calling
                 thread and it is up to the new owner to make the state
                 consistent.

          ETIMEDOUT
                 The mutex could not be locked before the specified timeout
                 expired.

          The pthread_mutex_timedlock() function may fail if:

          EDEADLK
                 A deadlock condition was detected.

          EOWNERDEAD
                 The mutex is a robust mutex and the previous owning thread
                 terminated while holding the mutex lock. The mutex lock
                 shall be acquired by the calling thread and it is up to
                 the new owner to make the state consistent.

          This function shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Applications that have assumed that non-zero return values are
          errors will need updating for use with robust mutexes, since a
          valid return for a thread acquiring a mutex which is protecting a
          currently inconsistent state is [EOWNERDEAD].  Applications that
          do not check the error returns, due to ruling out the possibility
          of such errors arising, should not use robust mutexes. If an
          application is supposed to work with normal and robust mutexes,
          it should check all return values for error conditions and if
          necessary take appropriate action.


-----------------------------------------------------------

::

          Refer to pthread_mutex_lock(3p).


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_mutex_destroy(3p), pthread_mutex_lock(3p), time(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 4.12, Memory
          Synchronization, pthread.h(0p), time.h(0p)


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

   IEEE/The Open Group               2017       PTHREAD_MUTEX_TIMEDLOCK(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`time.h(0p) <../man0/time.h.0p.html>`__, 
`clock_getres(3p) <../man3/clock_getres.3p.html>`__, 
`pthread_mutex_destroy(3p) <../man3/pthread_mutex_destroy.3p.html>`__, 
`pthread_mutex_getprioceiling(3p) <../man3/pthread_mutex_getprioceiling.3p.html>`__, 
`pthread_mutex_lock(3p) <../man3/pthread_mutex_lock.3p.html>`__

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
