.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_setcancelstate(3) — Linux manual page
=============================================

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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_SETCANCELSTATE(3)inux Programmer's ManualHREAD_SETCANCELSTATE(3)

NAME
-------------------------------------------------

::

          pthread_setcancelstate, pthread_setcanceltype - set cancelability
          state and type


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_setcancelstate(int state, int *oldstate);
          int pthread_setcanceltype(int type, int *oldtype);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_setcancelstate() sets the cancelability state of the
          calling thread to the value given in state.  The previous
          cancelability state of the thread is returned in the buffer
          pointed to by oldstate.  The state argument must have one of the
          following values:

          PTHREAD_CANCEL_ENABLE
                 The thread is cancelable.  This is the default
                 cancelability state in all new threads, including the
                 initial thread.  The thread's cancelability type
                 determines when a cancelable thread will respond to a
                 cancellation request.

          PTHREAD_CANCEL_DISABLE
                 The thread is not cancelable.  If a cancellation request
                 is received, it is blocked until cancelability is enabled.

          The pthread_setcanceltype() sets the cancelability type of the
          calling thread to the value given in type.  The previous
          cancelability type of the thread is returned in the buffer
          pointed to by oldtype.  The type argument must have one of the
          following values:

          PTHREAD_CANCEL_DEFERRED
                 A cancellation request is deferred until the thread next
                 calls a function that is a cancellation point (see
                 pthreads(7)).  This is the default cancelability type in
                 all new threads, including the initial thread.

                 Even with deferred cancellation, a cancellation point in
                 an asynchronous signal handler may still be acted upon and
                 the effect is as if it was an asynchronous cancellation.

          PTHREAD_CANCEL_ASYNCHRONOUS
                 The thread can be canceled at any time.  (Typically, it
                 will be canceled immediately upon receiving a cancellation
                 request, but the system doesn't guarantee this.)

          The set-and-get operation performed by each of these functions is
          atomic with respect to other threads in the process calling the
          same function.


-----------------------------------------------------------------

::

          On success, these functions return 0; on error, they return a
          nonzero error number.


-----------------------------------------------------

::

          The pthread_setcancelstate() can fail with the following error:

          EINVAL Invalid value for state.

          The pthread_setcanceltype() can fail with the following error:

          EINVAL Invalid value for type.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌────────────────────────────────┬─────────────────────┬─────────┐
          │Interface                       │ Attribute           │ Value   │
          ├────────────────────────────────┼─────────────────────┼─────────┤
          │pthread_setcancelstate(),       │ Thread safety       │ MT-Safe │
          │pthread_setcanceltype()         │                     │         │
          ├────────────────────────────────┼─────────────────────┼─────────┤
          │pthread_setcancelstate(),       │ Async-cancel safety │ AC-Safe │
          │pthread_setcanceltype()         │                     │         │
          └────────────────────────────────┴─────────────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          For details of what happens when a thread is canceled, see
          pthread_cancel(3).

          Briefly disabling cancelability is useful if a thread performs
          some critical action that must not be interrupted by a
          cancellation request.  Beware of disabling cancelability for long
          periods, or around operations that may block for long periods,
          since that will render the thread unresponsive to cancellation
          requests.

      Asynchronous cancelability
          Setting the cancelability type to PTHREAD_CANCEL_ASYNCHRONOUS is
          rarely useful.  Since the thread could be canceled at any time,
          it cannot safely reserve resources (e.g., allocating memory with
          malloc(3)), acquire mutexes, semaphores, or locks, and so on.
          Reserving resources is unsafe because the application has no way
          of knowing what the state of these resources is when the thread
          is canceled; that is, did cancellation occur before the resources
          were reserved, while they were reserved, or after they were
          released?  Furthermore, some internal data structures (e.g., the
          linked list of free blocks managed by the malloc(3) family of
          functions) may be left in an inconsistent state if cancellation
          occurs in the middle of the function call.  Consequently, clean-
          up handlers cease to be useful.

          Functions that can be safely asynchronously canceled are called
          async-cancel-safe functions.  POSIX.1-2001 and POSIX.1-2008
          require only that pthread_cancel(3), pthread_setcancelstate(),
          and pthread_setcanceltype() be async-cancel-safe.  In general,
          other library functions can't be safely called from an
          asynchronously cancelable thread.

          One of the few circumstances in which asynchronous cancelability
          is useful is for cancellation of a thread that is in a pure
          compute-bound loop.

      Portability notes
          The Linux threading implementations permit the oldstate argument
          of pthread_setcancelstate() to be NULL, in which case the
          information about the previous cancelability state is not
          returned to the caller.  Many other implementations also permit a
          NULL oldstat argument, but POSIX.1 does not specify this point,
          so portable applications should always specify a non-NULL value
          in oldstate.  A precisely analogous set of statements applies for
          the oldtype argument of pthread_setcanceltype().


---------------------------------------------------------

::

          See pthread_cancel(3).


---------------------------------------------------------

::

          pthread_cancel(3), pthread_cleanup_push(3),
          pthread_testcancel(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22      PTHREAD_SETCANCELSTATE(3)

--------------

Pages that refer to this page:
`pthread_cancel(3) <../man3/pthread_cancel.3.html>`__, 
`pthread_cleanup_push(3) <../man3/pthread_cleanup_push.3.html>`__, 
`pthread_cleanup_push_defer_np(3) <../man3/pthread_cleanup_push_defer_np.3.html>`__, 
`pthread_kill_other_threads_np(3) <../man3/pthread_kill_other_threads_np.3.html>`__, 
`pthread_testcancel(3) <../man3/pthread_testcancel.3.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_setcancelstate.3.license.html>`__

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
