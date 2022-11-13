.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_rwlock_rdlock(3p) — Linux manual page
=============================================

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

   PTHREAD_RWLOCK_RDLOCK(3P)OSIX Programmer's ManualHREAD_RWLOCK_RDLOCK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_rwlock_rdlock, pthread_rwlock_tryrdlock — lock a read-
          write lock object for reading


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_rwlock_rdlock(pthread_rwlock_t *rwlock);
          int pthread_rwlock_tryrdlock(pthread_rwlock_t *rwlock);


---------------------------------------------------------------

::

          The pthread_rwlock_rdlock() function shall apply a read lock to
          the read-write lock referenced by rwlock.  The calling thread
          acquires the read lock if a writer does not hold the lock and
          there are no writers blocked on the lock.

          If the Thread Execution Scheduling option is supported, and the
          threads involved in the lock are executing with the scheduling
          policies SCHED_FIFO or SCHED_RR, the calling thread shall not
          acquire the lock if a writer holds the lock or if writers of
          higher or equal priority are blocked on the lock; otherwise, the
          calling thread shall acquire the lock.

          If the Thread Execution Scheduling option is supported, and the
          threads involved in the lock are executing with the
          SCHED_SPORADIC scheduling policy, the calling thread shall not
          acquire the lock if a writer holds the lock or if writers of
          higher or equal priority are blocked on the lock; otherwise, the
          calling thread shall acquire the lock.

          If the Thread Execution Scheduling option is not supported, it is
          implementation-defined whether the calling thread acquires the
          lock when a writer does not hold the lock and there are writers
          blocked on the lock. If a writer holds the lock, the calling
          thread shall not acquire the read lock. If the read lock is not
          acquired, the calling thread shall block until it can acquire the
          lock. The calling thread may deadlock if at the time the call is
          made it holds a write lock.

          A thread may hold multiple concurrent read locks on rwlock (that
          is, successfully call the pthread_rwlock_rdlock() function n
          times). If so, the application shall ensure that the thread
          performs matching unlocks (that is, it calls the
          pthread_rwlock_unlock() function n times).

          The maximum number of simultaneous read locks that an
          implementation guarantees can be applied to a read-write lock
          shall be implementation-defined. The pthread_rwlock_rdlock()
          function may fail if this maximum would be exceeded.

          The pthread_rwlock_tryrdlock() function shall apply a read lock
          as in the pthread_rwlock_rdlock() function, with the exception
          that the function shall fail if the equivalent
          pthread_rwlock_rdlock() call would have blocked the calling
          thread. In no case shall the pthread_rwlock_tryrdlock() function
          ever block; it always either acquires the lock or fails and
          returns immediately.

          Results are undefined if any of these functions are called with
          an uninitialized read-write lock.

          If a signal is delivered to a thread waiting for a read-write
          lock for reading, upon return from the signal handler the thread
          resumes waiting for the read-write lock for reading as if it was
          not interrupted.


-----------------------------------------------------------------

::

          If successful, the pthread_rwlock_rdlock() function shall return
          zero; otherwise, an error number shall be returned to indicate
          the error.

          The pthread_rwlock_tryrdlock() function shall return zero if the
          lock for reading on the read-write lock object referenced by
          rwlock is acquired. Otherwise, an error number shall be returned
          to indicate the error.


-----------------------------------------------------

::

          The pthread_rwlock_tryrdlock() function shall fail if:

          EBUSY  The read-write lock could not be acquired for reading
                 because a writer holds the lock or a writer with the
                 appropriate priority was blocked on it.

          The pthread_rwlock_rdlock() and pthread_rwlock_tryrdlock()
          functions may fail if:

          EAGAIN The read lock could not be acquired because the maximum
                 number of read locks for rwlock has been exceeded.

          The pthread_rwlock_rdlock() function may fail if:

          EDEADLK
                 A deadlock condition was detected or the current thread
                 already owns the read-write lock for writing.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Applications using these functions may be subject to priority
          inversion, as discussed in the Base Definitions volume of
          POSIX.1‐2017, Section 3.291, Priority Inversion.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the
          rwlock argument to pthread_rwlock_rdlock() or
          pthread_rwlock_tryrdlock() does not refer to an initialized read-
          write lock object, it is recommended that the function should
          fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_rwlock_destroy(3p), pthread_rwlock_timedrdlock(3p),
          pthread_rwlock_timedwrlock(3p), pthread_rwlock_trywrlock(3p),
          pthread_rwlock_unlock(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.291,
          Priority Inversion, Section 4.12, Memory Synchronization,
          pthread.h(0p)


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

   IEEE/The Open Group               2017         PTHREAD_RWLOCK_RDLOCK(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_rwlock_destroy(3p) <../man3/pthread_rwlock_destroy.3p.html>`__, 
`pthread_rwlock_timedrdlock(3p) <../man3/pthread_rwlock_timedrdlock.3p.html>`__, 
`pthread_rwlock_timedwrlock(3p) <../man3/pthread_rwlock_timedwrlock.3p.html>`__, 
`pthread_rwlock_tryrdlock(3p) <../man3/pthread_rwlock_tryrdlock.3p.html>`__, 
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
