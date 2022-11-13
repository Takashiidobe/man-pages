.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_spin_lock(3p) — Linux manual page
=========================================

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

   PTHREAD_SPIN_LOCK(3P)   POSIX Programmer's Manual  PTHREAD_SPIN_LOCK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_spin_lock, pthread_spin_trylock — lock a spin lock object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_spin_lock(pthread_spinlock_t *lock);
          int pthread_spin_trylock(pthread_spinlock_t *lock);


---------------------------------------------------------------

::

          The pthread_spin_lock() function shall lock the spin lock
          referenced by lock.  The calling thread shall acquire the lock if
          it is not held by another thread. Otherwise, the thread shall
          spin (that is, shall not return from the pthread_spin_lock()
          call) until the lock becomes available. The results are undefined
          if the calling thread holds the lock at the time the call is
          made. The pthread_spin_trylock() function shall lock the spin
          lock referenced by lock if it is not held by any thread.
          Otherwise, the function shall fail.

          The results are undefined if any of these functions is called
          with an uninitialized spin lock.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_spin_lock() function may fail if:

          EDEADLK
                 A deadlock condition was detected.

          The pthread_spin_trylock() function shall fail if:

          EBUSY  A thread currently holds the lock.

          These functions shall not return an error code of [EINTR].

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

          If an implementation detects that the value specified by the lock
          argument to pthread_spin_lock() or pthread_spin_trylock() does
          not refer to an initialized spin lock object, it is recommended
          that the function should fail and report an [EINVAL] error.

          If an implementation detects that the value specified by the lock
          argument to pthread_spin_lock() refers to a spin lock object for
          which the calling thread already holds the lock, it is
          recommended that the function should fail and report an [EDEADLK]
          error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_spin_destroy(3p), pthread_spin_unlock(3p)

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

   IEEE/The Open Group               2017             PTHREAD_SPIN_LOCK(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_spin_destroy(3p) <../man3/pthread_spin_destroy.3p.html>`__, 
`pthread_spin_unlock(3p) <../man3/pthread_spin_unlock.3p.html>`__

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
