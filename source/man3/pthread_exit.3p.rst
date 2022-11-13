.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_exit(3p) — Linux manual page
====================================

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

   PTHREAD_EXIT(3P)        POSIX Programmer's Manual       PTHREAD_EXIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_exit — thread termination


---------------------------------------------------------

::

          #include <pthread.h>

          void pthread_exit(void *value_ptr);


---------------------------------------------------------------

::

          The pthread_exit() function shall terminate the calling thread
          and make the value value_ptr available to any successful join
          with the terminating thread. Any cancellation cleanup handlers
          that have been pushed and not yet popped shall be popped in the
          reverse order that they were pushed and then executed. After all
          cancellation cleanup handlers have been executed, if the thread
          has any thread-specific data, appropriate destructor functions
          shall be called in an unspecified order. Thread termination does
          not release any application visible process resources, including,
          but not limited to, mutexes and file descriptors, nor does it
          perform any process-level cleanup actions, including, but not
          limited to, calling any atexit() routines that may exist.

          An implicit call to pthread_exit() is made when a thread other
          than the thread in which main() was first invoked returns from
          the start routine that was used to create it. The function's
          return value shall serve as the thread's exit status.

          The behavior of pthread_exit() is undefined if called from a
          cancellation cleanup handler or destructor function that was
          invoked as a result of either an implicit or explicit call to
          pthread_exit().

          After a thread has terminated, the result of access to local
          (auto) variables of the thread is undefined. Thus, references to
          local variables of the exiting thread should not be used for the
          pthread_exit() value_ptr parameter value.

          The process shall exit with an exit status of 0 after the last
          thread has been terminated. The behavior shall be as if the
          implementation called exit() with a zero argument at thread
          termination time.


-----------------------------------------------------------------

::

          The pthread_exit() function cannot return to its caller.


-----------------------------------------------------

::

          No errors are defined.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The normal mechanism by which a thread terminates is to return
          from the routine that was specified in the pthread_create() call
          that started it. The pthread_exit() function provides the
          capability for a thread to terminate without requiring a return
          from the start routine of that thread, thereby providing a
          function analogous to exit().

          Regardless of the method of thread termination, any cancellation
          cleanup handlers that have been pushed and not yet popped are
          executed, and the destructors for any existing thread-specific
          data are executed. This volume of POSIX.1‐2017 requires that
          cancellation cleanup handlers be popped and called in order.
          After all cancellation cleanup handlers have been executed,
          thread-specific data destructors are called, in an unspecified
          order, for each item of thread-specific data that exists in the
          thread. This ordering is necessary because cancellation cleanup
          handlers may rely on thread-specific data.

          As the meaning of the status is determined by the application
          (except when the thread has been canceled, in which case it is
          PTHREAD_CANCELED), the implementation has no idea what an illegal
          status value is, which is why no address error checking is done.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          exit(3p), pthread_create(3p), pthread_join(3p)

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

   IEEE/The Open Group               2017                  PTHREAD_EXIT(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_cancel(3p) <../man3/pthread_cancel.3p.html>`__, 
`pthread_create(3p) <../man3/pthread_create.3p.html>`__

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
