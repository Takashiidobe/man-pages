.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_rwlockattr_setkind_np(3) — Linux manual page
====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_RWLOCKATTR_SETKIND_NP(3)FunctionsTManualRWLOCKATTR_SETKIND_NP(3)

NAME
-------------------------------------------------

::

          pthread_rwlockattr_setkind_np, pthread_rwlockattr_getkind_np -
          set/get the read-write lock kind of the thread read-write lock
          attribute object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_rwlockattr_setkind_np(pthread_rwlockattr_t *attr,
                                 int pref);
          int pthread_rwlockattr_getkind_np(
                                 const pthread_rwlockattr_t *restrict attr,
                                 int *restrict pref);

          Compile and link with -pthread.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          pthread_rwlockattr_setkind_np(), pthread_rwlockattr_getkind_np():
              _XOPEN_SOURCE >= 500 || _POSIX_C_SOURCE >= 200809L


---------------------------------------------------------------

::

          The pthread_rwlockattr_setkind_np() function sets the "lock kind"
          attribute of the read-write lock attribute object referred to by
          attr to the value specified in pref.  The argument pref may be
          set to one of the following:

          PTHREAD_RWLOCK_PREFER_READER_NP
                 This is the default.  A thread may hold multiple read
                 locks; that is, read locks are recursive.  According to
                 The Single Unix Specification, the behavior is unspecified
                 when a reader tries to place a lock, and there is no write
                 lock but writers are waiting.  Giving preference to the
                 reader, as is set by PTHREAD_RWLOCK_PREFER_READER_NP,
                 implies that the reader will receive the requested lock,
                 even if a writer is waiting.  As long as there are
                 readers, the writer will be starved.

          PTHREAD_RWLOCK_PREFER_WRITER_NP
                 This is intended as the write lock analog of
                 PTHREAD_RWLOCK_PREFER_READER_NP.  This is ignored by glibc
                 because the POSIX requirement to support recursive read
                 locks would cause this option to create trivial deadlocks;
                 instead use PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP
                 which ensures the application developer will not take
                 recursive read locks thus avoiding deadlocks.

          PTHREAD_RWLOCK_PREFER_WRITER_NONRECURSIVE_NP
                 Setting the lock kind to this avoids writer starvation as
                 long as any read locking is not done in a recursive
                 fashion.

          The pthread_rwlockattr_getkind_np() function returns the value of
          the lock kind attribute of the read-write lock attribute object
          referred to by attr in the pointer pref.


-----------------------------------------------------------------

::

          On success, these functions return 0.  Given valid pointer
          arguments, pthread_rwlockattr_getkind_np() always succeeds.  On
          error, pthread_rwlockattr_setkind_np() returns a nonzero error
          number.


-----------------------------------------------------

::

          EINVAL pref specifies an unsupported value.


---------------------------------------------------------

::

          The pthread_rwlockattr_getkind_np() and
          pthread_rwlockattr_setkind_np() functions first appeared in glibc
          2.1.


-------------------------------------------------------------------

::

          These functions are non-standard GNU extensions; hence the suffix
          "_np" (nonportable) in the names.


---------------------------------------------------------

::

          pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux Programmer's Manual      2021-03-22PTHREAD_RWLOCKATTR_SETKIND_NP(3)

--------------

Pages that refer to this page: `pthreads(7) <../man7/pthreads.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_rwlockattr_setkind_np.3.license.html>`__

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
