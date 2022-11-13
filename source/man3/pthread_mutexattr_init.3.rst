.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_mutexattr_init(3) — Linux manual page
=============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_MUTEXATTR_INIT(3)inux Programmer's ManualHREAD_MUTEXATTR_INIT(3)

NAME
-------------------------------------------------

::

          pthread_mutexattr_init, pthread_mutexattr_destroy - initialize
          and destroy a mutex attributes object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_mutexattr_init(pthread_mutexattr_t *attr);
          int pthread_mutexattr_destroy(pthread_mutexattr_t *attr);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_mutexattr_init() function initializes the mutex
          attributes object pointed to by attr with default values for all
          attributes defined by the implementation.

          The results of initializing an already initialized mutex
          attributes object are undefined.

          The pthread_mutexattr_destroy() function destroys a mutex
          attribute object (making it uninitialized).  Once a mutex
          attributes object has been destroyed, it can be reinitialized
          with pthread_mutexattr_init().

          The results of destroying an uninitialized mutex attributes
          object are undefined.


-----------------------------------------------------------------

::

          On success, these functions return 0.  On error, they return a
          positive error number.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          Subsequent changes to a mutex attributes object do not affect
          mutex that have already been initialized using that object.


---------------------------------------------------------

::

          pthread_mutex_init(3), pthread_mutexattr_getpshared(3),
          pthread_mutexattr_getrobust(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2019-10-10      PTHREAD_MUTEXATTR_INIT(3)

--------------

Pages that refer to this page:
`pthread_mutexattr_getpshared(3) <../man3/pthread_mutexattr_getpshared.3.html>`__, 
`pthread_mutexattr_setrobust(3) <../man3/pthread_mutexattr_setrobust.3.html>`__, 
`pthread_mutex_consistent(3) <../man3/pthread_mutex_consistent.3.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_mutexattr_init.3.license.html>`__

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
