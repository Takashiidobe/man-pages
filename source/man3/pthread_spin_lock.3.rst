.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_spin_lock(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_SPIN_LOCK(3)    Linux Programmer's Manual   PTHREAD_SPIN_LOCK(3)

NAME
-------------------------------------------------

::

          pthread_spin_lock, pthread_spin_trylock, pthread_spin_unlock -
          lock and unlock a spin lock


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_spin_lock(pthread_spinlock_t *lock);
          int pthread_spin_trylock(pthread_spinlock_t *lock);
          int pthread_spin_unlock(pthread_spinlock_t *lock);

          Compile and link with -pthread.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          pthread_spin_lock(), pthread_spin_trylock():
              _POSIX_C_SOURCE >= 200112L


---------------------------------------------------------------

::

          The pthread_spin_lock() function locks the spin lock referred to
          by lock.  If the spin lock is currently unlocked, the calling
          thread acquires the lock immediately.  If the spin lock is
          currently locked by another thread, the calling thread spins,
          testing the lock until it becomes available, at which point the
          calling thread acquires the lock.

          Calling pthread_spin_lock() on a lock that is already held by the
          caller or a lock that has not been initialized with
          pthread_spin_init(3) results in undefined behavior.

          The pthread_spin_trylock() function is like pthread_spin_lock(),
          except that if the spin lock referred to by lock is currently
          locked, then, instead of spinning, the call returns immediately
          with the error EBUSY.

          The pthread_spin_unlock() function unlocks the spin lock referred
          to lock.  If any threads are spinning on the lock, one of those
          threads will then acquire the lock.

          Calling pthread_spin_unlock() on a lock that is not held by the
          caller results in undefined behavior.


-----------------------------------------------------------------

::

          On success, these functions return zero.  On failure, they return
          an error number.


-----------------------------------------------------

::

          pthread_spin_lock() may fail with the following errors:

          EDEADLOCK
                 The system detected a deadlock condition.

          pthread_spin_trylock() fails with the following errors:

          EBUSY  The spin lock is currently locked by another thread.


---------------------------------------------------------

::

          These functions first appeared in glibc in version 2.2.


-------------------------------------------------------------------

::

          POSIX.1-2001.


---------------------------------------------------

::

          Applying any of the functions described on this page to an
          uninitialized spin lock results in undefined behavior.

          Carefully read NOTES in pthread_spin_init(3).


---------------------------------------------------------

::

          pthread_spin_destroy(3), pthread_spin_init(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22           PTHREAD_SPIN_LOCK(3)

--------------

Pages that refer to this page:
`pthread_spin_init(3) <../man3/pthread_spin_init.3.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_spin_lock.3.license.html>`__

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
