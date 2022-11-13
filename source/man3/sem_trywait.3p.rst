.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sem_trywait(3p) — Linux manual page
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

   SEM_TRYWAIT(3P)         POSIX Programmer's Manual        SEM_TRYWAIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sem_trywait, sem_wait — lock a semaphore


---------------------------------------------------------

::

          #include <semaphore.h>

          int sem_trywait(sem_t *sem);
          int sem_wait(sem_t *sem);


---------------------------------------------------------------

::

          The sem_trywait() function shall lock the semaphore referenced by
          sem only if the semaphore is currently not locked; that is, if
          the semaphore value is currently positive. Otherwise, it shall
          not lock the semaphore.

          The sem_wait() function shall lock the semaphore referenced by
          sem by performing a semaphore lock operation on that semaphore.
          If the semaphore value is currently zero, then the calling thread
          shall not return from the call to sem_wait() until it either
          locks the semaphore or the call is interrupted by a signal.

          Upon successful return, the state of the semaphore shall be
          locked and shall remain locked until the sem_post() function is
          executed and returns successfully.

          The sem_wait() function is interruptible by the delivery of a
          signal.


-----------------------------------------------------------------

::

          The sem_trywait() and sem_wait() functions shall return zero if
          the calling process successfully performed the semaphore lock
          operation on the semaphore designated by sem.  If the call was
          unsuccessful, the state of the semaphore shall be unchanged, and
          the function shall return a value of -1 and set errno to indicate
          the error.


-----------------------------------------------------

::

          The sem_trywait() function shall fail if:

          EAGAIN The semaphore was already locked, so it cannot be
                 immediately locked by the sem_trywait() operation.

          The sem_trywait() and sem_wait() functions may fail if:

          EDEADLK
                 A deadlock condition was detected.

          EINTR  A signal interrupted this function.

          EINVAL The sem argument does not refer to a valid semaphore.

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

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          semctl(3p), semget(3p), semop(3p), sem_post(3p),
          sem_timedwait(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.291,
          Priority Inversion, Section 4.12, Memory Synchronization,
          semaphore.h(0p)


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

   IEEE/The Open Group               2017                   SEM_TRYWAIT(3P)

--------------

Pages that refer to this page:
`semaphore.h(0p) <../man0/semaphore.h.0p.html>`__, 
`semctl(3p) <../man3/semctl.3p.html>`__, 
`semget(3p) <../man3/semget.3p.html>`__, 
`sem_getvalue(3p) <../man3/sem_getvalue.3p.html>`__, 
`sem_init(3p) <../man3/sem_init.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__, 
`sem_open(3p) <../man3/sem_open.3p.html>`__, 
`sem_post(3p) <../man3/sem_post.3p.html>`__, 
`sem_timedwait(3p) <../man3/sem_timedwait.3p.html>`__, 
`sem_wait(3p) <../man3/sem_wait.3p.html>`__

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
