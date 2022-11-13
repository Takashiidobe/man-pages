.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_rwlock_timedrdlock(3p) — Linux manual page
==================================================

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

   PTHREAD_RWLOCK_TIMEDRDLOCK(3P)Programmer'sPManual_RWLOCK_TIMEDRDLOCK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_rwlock_timedrdlock — lock a read-write lock for reading


---------------------------------------------------------

::

          #include <pthread.h>
          #include <time.h>

          int pthread_rwlock_timedrdlock(pthread_rwlock_t *restrict rwlock,
              const struct timespec *restrict abstime);


---------------------------------------------------------------

::

          The pthread_rwlock_timedrdlock() function shall apply a read lock
          to the read-write lock referenced by rwlock as in the
          pthread_rwlock_rdlock() function. However, if the lock cannot be
          acquired without waiting for other threads to unlock the lock,
          this wait shall be terminated when the specified timeout expires.
          The timeout shall expire when the absolute time specified by
          abstime passes, as measured by the clock on which timeouts are
          based (that is, when the value of that clock equals or exceeds
          abstime), or if the absolute time specified by abstime has
          already been passed at the time of the call.

          The timeout shall be based on the CLOCK_REALTIME clock.  The
          resolution of the timeout shall be the resolution of the
          CLOCK_REALTIME clock. The timespec data type is defined in the
          <time.h> header. Under no circumstances shall the function fail
          with a timeout if the lock can be acquired immediately. The
          validity of the abstime parameter need not be checked if the lock
          can be immediately acquired.

          If a signal that causes a signal handler to be executed is
          delivered to a thread blocked on a read-write lock via a call to
          pthread_rwlock_timedrdlock(), upon return from the signal handler
          the thread shall resume waiting for the lock as if it was not
          interrupted.

          The calling thread may deadlock if at the time the call is made
          it holds a write lock on rwlock.  The results are undefined if
          this function is called with an uninitialized read-write lock.


-----------------------------------------------------------------

::

          The pthread_rwlock_timedrdlock() function shall return zero if
          the lock for reading on the read-write lock object referenced by
          rwlock is acquired. Otherwise, an error number shall be returned
          to indicate the error.


-----------------------------------------------------

::

          The pthread_rwlock_timedrdlock() function shall fail if:

          ETIMEDOUT
                 The lock could not be acquired before the specified
                 timeout expired.

          The pthread_rwlock_timedrdlock() function may fail if:

          EAGAIN The read lock could not be acquired because the maximum
                 number of read locks for lock would be exceeded.

          EDEADLK
                 A deadlock condition was detected or the calling thread
                 already holds a write lock on rwlock.

          EINVAL The abstime nanosecond value is less than zero or greater
                 than or equal to 1000 million.

          This function shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Applications using this function may be subject to priority
          inversion, as discussed in the Base Definitions volume of
          POSIX.1‐2017, Section 3.291, Priority Inversion.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the
          rwlock argument to pthread_rwlock_timedrdlock() does not refer to
          an initialized read-write lock object, it is recommended that the
          function should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_rwlock_destroy(3p), pthread_rwlock_rdlock(3p),
          pthread_rwlock_timedwrlock(3p), pthread_rwlock_trywrlock(3p),
          pthread_rwlock_unlock(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.291,
          Priority Inversion, Section 4.12, Memory Synchronization,
          pthread.h(0p), time.h(0p)


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

   IEEE/The Open Group               2017    PTHREAD_RWLOCK_TIMEDRDLOCK(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`time.h(0p) <../man0/time.h.0p.html>`__, 
`pthread_rwlock_destroy(3p) <../man3/pthread_rwlock_destroy.3p.html>`__, 
`pthread_rwlock_rdlock(3p) <../man3/pthread_rwlock_rdlock.3p.html>`__, 
`pthread_rwlock_timedwrlock(3p) <../man3/pthread_rwlock_timedwrlock.3p.html>`__, 
`pthread_rwlock_trywrlock(3p) <../man3/pthread_rwlock_trywrlock.3p.html>`__, 
`pthread_rwlock_unlock(3p) <../man3/pthread_rwlock_unlock.3p.html>`__

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
