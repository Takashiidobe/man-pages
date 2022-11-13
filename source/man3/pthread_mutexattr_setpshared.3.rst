.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_mutexattr_getpshared(3) — Linux manual page
===================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_MUTEXATTR_GETPSHARED(3)rogrammer'sTManualMUTEXATTR_GETPSHARED(3)

NAME
-------------------------------------------------

::

          pthread_mutexattr_getpshared, pthread_mutexattr_setpshared -
          get/set process-shared mutex attribute


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_mutexattr_getpshared(
                                const pthread_mutexattr_t *restrict attr,
                                int *restrict pshared);
          int pthread_mutexattr_setpshared(pthread_mutexattr_t *attr,
                                int pshared);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          These functions get and set the process-shared attribute in a
          mutex attributes object.  This attribute must be appropriately
          set to ensure correct, efficient operation of a mutex created
          using this attributes object.

          The process-shared attribute can have one of the following
          values:

          PTHREAD_PROCESS_PRIVATE
                 Mutexes created with this attributes object are to be
                 shared only among threads in the same process that
                 initialized the mutex.  This is the default value for the
                 process-shared mutex attribute.

          PTHREAD_PROCESS_SHARED
                 Mutexes created with this attributes object can be shared
                 between any threads that have access to the memory
                 containing the object, including threads in different
                 processes.

          pthread_mutexattr_getpshared() places the value of the process-
          shared attribute of the mutex attributes object referred to by
          attr in the location pointed to by pshared.

          pthread_mutexattr_setpshared() sets the value of the process-
          shared attribute of the mutex attributes object referred to by
          attr to the value specified in pshared.

          If attr does not refer to an initialized mutex attributes object,
          the behavior is undefined.


-----------------------------------------------------------------

::

          On success, these functions return 0.  On error, they return a
          positive error number.


-----------------------------------------------------

::

          pthread_mutexattr_setpshared() can fail with the following
          errors:

          EINVAL The value specified in pshared is invalid.

          ENOTSUP
                 pshared is PTHREAD_PROCESS_SHARED but the implementation
                 does not support process-shared mutexes.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------------

::

          pthread_mutexattr_init(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22PTHREAD_MUTEXATTR_GETPSHARED(3)

--------------

Pages that refer to this page:
`pthread_mutexattr_init(3) <../man3/pthread_mutexattr_init.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_mutexattr_getpshared.3.license.html>`__

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
