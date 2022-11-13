.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_atfork(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_ATFORK(3)       Linux Programmer's Manual      PTHREAD_ATFORK(3)

NAME
-------------------------------------------------

::

          pthread_atfork - register fork handlers


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_atfork(void (*prepare)(void), void (*parent)(void),
                             void (*child)(void));

          Link with -pthread.


---------------------------------------------------------------

::

          The pthread_atfork() function registers fork handlers that are to
          be executed when fork(2) is called by this thread.  The handlers
          are executed in the context of the thread that calls fork(2).

          Three kinds of handler can be registered:

          *  prepare specifies a handler that is executed before fork(2)
             processing starts.

          *  parent specifies a handler that is executed in the parent
             process after fork(2) processing completes.

          *  child specifies a handler that is executed in the child
             process after fork(2) processing completes.

          Any of the three arguments may be NULL if no handler is needed in
          the corresponding phase of fork(2) processing.


-----------------------------------------------------------------

::

          On success, pthread_atfork() returns zero.  On error, it returns
          an error number.  pthread_atfork() may be called multiple times
          by a thread, to register multiple handlers for each phase.  The
          handlers for each phase are called in a specified order: the
          prepare handlers are called in reverse order of registration; the
          parent and child handlers are called in the order of
          registration.


-----------------------------------------------------

::

          ENOMEM Could not allocate memory to record the form handler
                 entry.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          When fork(2) is called in a multithreaded process, only the
          calling thread is duplicated in the child process.  The original
          intention of pthread_atfork() was to allow the calling thread to
          be returned to a consistent state.  For example, at the time of
          the call to fork(2), other threads may have locked mutexes that
          are visible in the user-space memory duplicated in the child.
          Such mutexes would never be unlocked, since the threads that
          placed the locks are not duplicated in the child.  The intent of
          pthread_atfork() was to provide a mechanism whereby the
          application (or a library) could ensure that mutexes and other
          process and thread state would be restored to a consistent state.
          In practice, this task is generally too difficult to be
          practicable.

          After a fork(2) in a multithreaded process returns in the child,
          the child should call only async-signal-safe functions (see
          signal-safety(7)) until such time as it calls execve(2) to
          execute a new program.

          POSIX.1 specifies that pthread_atfork() shall not fail with the
          error EINTR.


---------------------------------------------------------

::

          fork(2), atexit(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-08-13              PTHREAD_ATFORK(3)

--------------

Pages that refer to this page: `clone(2) <../man2/clone.2.html>`__, 
`fork(2) <../man2/fork.2.html>`__, 
`vfork(2) <../man2/vfork.2.html>`__, 
`posix_spawn(3) <../man3/posix_spawn.3.html>`__, 
`system(3) <../man3/system.3.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_atfork.3.license.html>`__

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
