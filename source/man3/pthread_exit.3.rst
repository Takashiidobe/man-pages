.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_exit(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_EXIT(3)         Linux Programmer's Manual        PTHREAD_EXIT(3)

NAME
-------------------------------------------------

::

          pthread_exit - terminate calling thread


---------------------------------------------------------

::

          #include <pthread.h>

          noreturn void pthread_exit(void *retval);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_exit() function terminates the calling thread and
          returns a value via retval that (if the thread is joinable) is
          available to another thread in the same process that calls
          pthread_join(3).

          Any clean-up handlers established by pthread_cleanup_push(3) that
          have not yet been popped, are popped (in the reverse of the order
          in which they were pushed) and executed.  If the thread has any
          thread-specific data, then, after the clean-up handlers have been
          executed, the corresponding destructor functions are called, in
          an unspecified order.

          When a thread terminates, process-shared resources (e.g.,
          mutexes, condition variables, semaphores, and file descriptors)
          are not released, and functions registered using atexit(3) are
          not called.

          After the last thread in a process terminates, the process
          terminates as by calling exit(3) with an exit status of zero;
          thus, process-shared resources are released and functions
          registered using atexit(3) are called.


-----------------------------------------------------------------

::

          This function does not return to the caller.


-----------------------------------------------------

::

          This function always succeeds.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_exit()                        │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          Performing a return from the start function of any thread other
          than the main thread results in an implicit call to
          pthread_exit(), using the function's return value as the thread's
          exit status.

          To allow other threads to continue execution, the main thread
          should terminate by calling pthread_exit() rather than exit(3).

          The value pointed to by retval should not be located on the
          calling thread's stack, since the contents of that stack are
          undefined after the thread terminates.


-------------------------------------------------

::

          Currently, there are limitations in the kernel implementation
          logic for wait(2)ing on a stopped thread group with a dead thread
          group leader.  This can manifest in problems such as a locked
          terminal if a stop signal is sent to a foreground process whose
          thread group leader has already called pthread_exit().


---------------------------------------------------------

::

          pthread_create(3), pthread_join(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                PTHREAD_EXIT(3)

--------------

Pages that refer to this page: `prctl(2) <../man2/prctl.2.html>`__, 
`pthread_cancel(3) <../man3/pthread_cancel.3.html>`__, 
`pthread_cleanup_push(3) <../man3/pthread_cleanup_push.3.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`pthread_detach(3) <../man3/pthread_detach.3.html>`__, 
`pthread_join(3) <../man3/pthread_join.3.html>`__, 
`pthread_tryjoin_np(3) <../man3/pthread_tryjoin_np.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_exit.3.license.html>`__

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
