.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_rwlock_destroy(3p) — Linux manual page
==============================================

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

   PTHREAD_RWLOCK_DESTROY(3P)SIX Programmer's ManualREAD_RWLOCK_DESTROY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_rwlock_destroy, pthread_rwlock_init — destroy and
          initialize a read-write lock object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_rwlock_destroy(pthread_rwlock_t *rwlock);
          int pthread_rwlock_init(pthread_rwlock_t *restrict rwlock,
              const pthread_rwlockattr_t *restrict attr);
          pthread_rwlock_t rwlock = PTHREAD_RWLOCK_INITIALIZER;


---------------------------------------------------------------

::

          The pthread_rwlock_destroy() function shall destroy the read-
          write lock object referenced by rwlock and release any resources
          used by the lock. The effect of subsequent use of the lock is
          undefined until the lock is reinitialized by another call to
          pthread_rwlock_init().  An implementation may cause
          pthread_rwlock_destroy() to set the object referenced by rwlock
          to an invalid value. Results are undefined if
          pthread_rwlock_destroy() is called when any thread holds rwlock.
          Attempting to destroy an uninitialized read-write lock results in
          undefined behavior.

          The pthread_rwlock_init() function shall allocate any resources
          required to use the read-write lock referenced by rwlock and
          initializes the lock to an unlocked state with attributes
          referenced by attr.  If attr is NULL, the default read-write lock
          attributes shall be used; the effect is the same as passing the
          address of a default read-write lock attributes object. Once
          initialized, the lock can be used any number of times without
          being reinitialized. Results are undefined if
          pthread_rwlock_init() is called specifying an already initialized
          read-write lock. Results are undefined if a read-write lock is
          used without first being initialized.

          If the pthread_rwlock_init() function fails, rwlock shall not be
          initialized and the contents of rwlock are undefined.

          See Section 2.9.9, Synchronization Object Copies and Alternative
          Mappings for further requirements.

          In cases where default read-write lock attributes are
          appropriate, the macro PTHREAD_RWLOCK_INITIALIZER can be used to
          initialize read-write locks. The effect shall be equivalent to
          dynamic initialization by a call to pthread_rwlock_init() with
          the attr parameter specified as NULL, except that no error checks
          are performed.

          The behavior is undefined if the value specified by the attr
          argument to pthread_rwlock_init() does not refer to an
          initialized read-write lock attributes object.


-----------------------------------------------------------------

::

          If successful, the pthread_rwlock_destroy() and
          pthread_rwlock_init() functions shall return zero; otherwise, an
          error number shall be returned to indicate the error.


-----------------------------------------------------

::

          The pthread_rwlock_init() function shall fail if:

          EAGAIN The system lacked the necessary resources (other than
                 memory) to initialize another read-write lock.

          ENOMEM Insufficient memory exists to initialize the read-write
                 lock.

          EPERM  The caller does not have the privilege to perform the
                 operation.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Applications using these and related read-write lock functions
          may be subject to priority inversion, as discussed in the Base
          Definitions volume of POSIX.1‐2017, Section 3.291, Priority
          Inversion.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the
          rwlock argument to pthread_rwlock_destroy() does not refer to an
          initialized read-write lock object, it is recommended that the
          function should fail and report an [EINVAL] error.

          If an implementation detects that the value specified by the attr
          argument to pthread_rwlock_init() does not refer to an
          initialized read-write lock attributes object, it is recommended
          that the function should fail and report an [EINVAL] error.

          If an implementation detects that the value specified by the
          rwlock argument to pthread_rwlock_destroy() or
          pthread_rwlock_init() refers to a locked read-write lock object,
          or detects that the value specified by the rwlock argument to
          pthread_rwlock_init() refers to an already initialized read-write
          lock object, it is recommended that the function should fail and
          report an [EBUSY] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_rwlock_rdlock(3p), pthread_rwlock_timedrdlock(3p),
          pthread_rwlock_timedwrlock(3p), pthread_rwlock_trywrlock(3p),
          pthread_rwlock_unlock(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.291,
          Priority Inversion, pthread.h(0p)


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

   IEEE/The Open Group               2017        PTHREAD_RWLOCK_DESTROY(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_rwlockattr_destroy(3p) <../man3/pthread_rwlockattr_destroy.3p.html>`__, 
`pthread_rwlockattr_getpshared(3p) <../man3/pthread_rwlockattr_getpshared.3p.html>`__, 
`pthread_rwlock_rdlock(3p) <../man3/pthread_rwlock_rdlock.3p.html>`__, 
`pthread_rwlock_timedrdlock(3p) <../man3/pthread_rwlock_timedrdlock.3p.html>`__, 
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
