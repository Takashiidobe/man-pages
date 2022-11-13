.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_mutex_consistent(3) — Linux manual page
===============================================

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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_MUTEX_CONSISTENT(3)ux Programmer's ManualEAD_MUTEX_CONSISTENT(3)

NAME
-------------------------------------------------

::

          pthread_mutex_consistent - make a robust mutex consistent


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_mutex_consistent(pthread_mutex_t *mutex);

          Compile and link with -pthread.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          pthread_mutex_consistent():
              _POSIX_C_SOURCE >= 200809L


---------------------------------------------------------------

::

          This function makes a robust mutex consistent if it is in an
          inconsistent state.  A mutex can be left in an inconsistent state
          if its owner terminates while holding the mutex, in which case
          the next owner who acquires the mutex will succeed and be
          notified by a return value of EOWNERDEAD from a call to
          pthread_mutex_lock().


-----------------------------------------------------------------

::

          On success, pthread_mutex_consistent() returns 0.  Otherwise, it
          returns a positive error number to indicate the error.


-----------------------------------------------------

::

          EINVAL The mutex is either not robust or is not in an
                 inconsistent state.


---------------------------------------------------------

::

          pthread_mutex_consistent() was added to glibc in version 2.12.


-------------------------------------------------------------------

::

          POSIX.1-2008.


---------------------------------------------------

::

          pthread_mutex_consistent() simply informs the implementation that
          the state (shared data) guarded by the mutex has been restored to
          a consistent state and that normal operations can now be
          performed with the mutex.  It is the application's responsibility
          to ensure that the shared data has been restored to a consistent
          state before calling pthread_mutex_consistent().

          Before the addition of pthread_mutex_consistent() to POSIX, glibc
          defined the following equivalent nonstandard function if
          _GNU_SOURCE was defined:

          int pthread_mutex_consistent_np(const pthread_mutex_t *mutex);

          This GNU-specific API, which first appeared in glibc 2.4, is
          nowadays obsolete and should not be used in new programs; since
          glibc 2.34 it has been marked as deprecated.


---------------------------------------------------------

::

          See pthread_mutexattr_setrobust(3).


---------------------------------------------------------

::

          pthread_mutex_lock(3), pthread_mutexattr_getrobust(3),
          pthread_mutexattr_init(3), pthread_mutexattr_setrobust(3),
          pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27    PTHREAD_MUTEX_CONSISTENT(3)

--------------

Pages that refer to this page:
`pthread_mutexattr_setrobust(3) <../man3/pthread_mutexattr_setrobust.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_mutex_consistent.3.license.html>`__

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
