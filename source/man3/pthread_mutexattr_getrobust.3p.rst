.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_mutexattr_getrobust(3p) — Linux manual page
===================================================

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

   PTHREAD_MUTEXATTR_GETROBUST(3P)rogrammer'sTManualMUTEXATTR_GETROBUST(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_mutexattr_getrobust, pthread_mutexattr_setrobust — get
          and set the mutex robust attribute


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_mutexattr_getrobust(const pthread_mutexattr_t *restrict
              attr, int *restrict robust);
          int pthread_mutexattr_setrobust(pthread_mutexattr_t *attr,
              int robust);


---------------------------------------------------------------

::

          The pthread_mutexattr_getrobust() and
          pthread_mutexattr_setrobust() functions, respectively, shall get
          and set the mutex robust attribute. This attribute is set in the
          robust parameter. Valid values for robust include:

          PTHREAD_MUTEX_STALLED
                No special actions are taken if the owner of the mutex is
                terminated while holding the mutex lock. This can lead to
                deadlocks if no other thread can unlock the mutex.
                This is the default value.

          PTHREAD_MUTEX_ROBUST
                If the process containing the owning thread of a robust
                mutex terminates while holding the mutex lock, the next
                thread that acquires the mutex shall be notified about the
                termination by the return value [EOWNERDEAD] from the
                locking function. If the owning thread of a robust mutex
                terminates while holding the mutex lock, the next thread
                that attempts to acquire the mutex may be notified about
                the termination by the return value [EOWNERDEAD].  The
                notified thread can then attempt to make the state
                protected by the mutex consistent again, and if successful
                can mark the mutex state as consistent by calling
                pthread_mutex_consistent().  After a subsequent successful
                call to pthread_mutex_unlock(), the mutex lock shall be
                released and can be used normally by other threads. If the
                mutex is unlocked without a call to
                pthread_mutex_consistent(), it shall be in a permanently
                unusable state and all attempts to lock the mutex shall
                fail with the error [ENOTRECOVERABLE].  The only
                permissible operation on such a mutex is
                pthread_mutex_destroy().

          The behavior is undefined if the value specified by the attr
          argument to pthread_mutexattr_getrobust() or
          pthread_mutexattr_setrobust() does not refer to an initialized
          mutex attributes object.


-----------------------------------------------------------------

::

          Upon successful completion, the pthread_mutexattr_getrobust()
          function shall return zero and store the value of the robust
          attribute of attr into the object referenced by the robust
          parameter. Otherwise, an error value shall be returned to
          indicate the error. If successful, the
          pthread_mutexattr_setrobust() function shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_mutexattr_setrobust() function shall fail if:

          EINVAL The value of robust is invalid.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The actions required to make the state protected by the mutex
          consistent again are solely dependent on the application. If it
          is not possible to make the state of a mutex consistent, robust
          mutexes can be used to notify this situation by calling
          pthread_mutex_unlock() without a prior call to
          pthread_mutex_consistent().

          If the state is declared inconsistent by calling
          pthread_mutex_unlock() without a prior call to
          pthread_mutex_consistent(), a possible approach could be to
          destroy the mutex and then reinitialize it. However, it should be
          noted that this is possible only in certain situations where the
          state protected by the mutex has to be reinitialized and
          coordination achieved with other threads blocked on the mutex,
          because otherwise a call to a locking function with a reference
          to a mutex object invalidated by a call to
          pthread_mutex_destroy() results in undefined behavior.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the attr
          argument to pthread_mutexattr_getrobust() or
          pthread_mutexattr_setrobust() does not refer to an initialized
          mutex attributes object, it is recommended that the function
          should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_mutex_consistent(3p), pthread_mutex_destroy(3p),
          pthread_mutex_lock(3p)

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

   IEEE/The Open Group               2017   PTHREAD_MUTEXATTR_GETROBUST(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_mutexattr_setrobust(3p) <../man3/pthread_mutexattr_setrobust.3p.html>`__, 
`pthread_mutex_consistent(3p) <../man3/pthread_mutex_consistent.3p.html>`__, 
`pthread_mutex_destroy(3p) <../man3/pthread_mutex_destroy.3p.html>`__, 
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
