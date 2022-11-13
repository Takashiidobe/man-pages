.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_create(3p) — Linux manual page
======================================

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

   PTHREAD_CREATE(3P)      POSIX Programmer's Manual     PTHREAD_CREATE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_create — thread creation


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_create(pthread_t *restrict thread,
              const pthread_attr_t *restrict attr,
              void *(*start_routine)(void*), void *restrict arg);


---------------------------------------------------------------

::

          The pthread_create() function shall create a new thread, with
          attributes specified by attr, within a process. If attr is NULL,
          the default attributes shall be used. If the attributes specified
          by attr are modified later, the thread's attributes shall not be
          affected.  Upon successful completion, pthread_create() shall
          store the ID of the created thread in the location referenced by
          thread.

          The thread is created executing start_routine with arg as its
          sole argument. If the start_routine returns, the effect shall be
          as if there was an implicit call to pthread_exit() using the
          return value of start_routine as the exit status. Note that the
          thread in which main() was originally invoked differs from this.
          When it returns from main(), the effect shall be as if there was
          an implicit call to exit() using the return value of main() as
          the exit status.

          The signal state of the new thread shall be initialized as
          follows:

           *  The signal mask shall be inherited from the creating thread.

           *  The set of signals pending for the new thread shall be empty.

          The thread-local current locale and the alternate stack shall not
          be inherited.

          The floating-point environment shall be inherited from the
          creating thread.

          If pthread_create() fails, no new thread is created and the
          contents of the location referenced by thread are undefined.

          If _POSIX_THREAD_CPUTIME is defined, the new thread shall have a
          CPU-time clock accessible, and the initial value of this clock
          shall be set to zero.

          The behavior is undefined if the value specified by the attr
          argument to pthread_create() does not refer to an initialized
          thread attributes object.


-----------------------------------------------------------------

::

          If successful, the pthread_create() function shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_create() function shall fail if:

          EAGAIN The system lacked the necessary resources to create
                 another thread, or the system-imposed limit on the total
                 number of threads in a process {PTHREAD_THREADS_MAX} would
                 be exceeded.

          EPERM  The caller does not have appropriate privileges to set the
                 required scheduling parameters or scheduling policy.

          The pthread_create() function shall not return an error code of
          [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          There is no requirement on the implementation that the ID of the
          created thread be available before the newly created thread
          starts executing. The calling thread can obtain the ID of the
          created thread through the thread argument of the
          pthread_create() function, and the newly created thread can
          obtain its ID by a call to pthread_self().


-----------------------------------------------------------

::

          A suggested alternative to pthread_create() would be to define
          two separate operations: create and start. Some applications
          would find such behavior more natural. Ada, in particular,
          separates the ``creation'' of a task from its ``activation''.

          Splitting the operation was rejected by the standard developers
          for many reasons:

           *  The number of calls required to start a thread would increase
              from one to two and thus place an additional burden on
              applications that do not require the additional
              synchronization. The second call, however, could be avoided
              by the additional complication of a start-up state attribute.

           *  An extra state would be introduced: ``created but not
              started''. This would require the standard to specify the
              behavior of the thread operations when the target has not yet
              started executing.

           *  For those applications that require such behavior, it is
              possible to simulate the two separate steps with the
              facilities that are currently provided. The start_routine()
              can synchronize by waiting on a condition variable that is
              signaled by the start operation.

          An Ada implementor can choose to create the thread at either of
          two points in the Ada program: when the task object is created,
          or when the task is activated (generally at a ``begin''). If the
          first approach is adopted, the start_routine() needs to wait on a
          condition variable to receive the order to begin ``activation''.
          The second approach requires no such condition variable or extra
          synchronization. In either approach, a separate Ada task control
          block would need to be created when the task object is created to
          hold rendezvous queues, and so on.

          An extension of the preceding model would be to allow the state
          of the thread to be modified between the create and start. This
          would allow the thread attributes object to be eliminated. This
          has been rejected because:

           *  All state in the thread attributes object has to be able to
              be set for the thread. This would require the definition of
              functions to modify thread attributes. There would be no
              reduction in the number of function calls required to set up
              the thread. In fact, for an application that creates all
              threads using identical attributes, the number of function
              calls required to set up the threads would be dramatically
              increased. Use of a thread attributes object permits the
              application to make one set of attribute setting function
              calls.  Otherwise, the set of attribute setting function
              calls needs to be made for each thread creation.

           *  Depending on the implementation architecture, functions to
              set thread state would require kernel calls, or for other
              implementation reasons would not be able to be implemented as
              macros, thereby increasing the cost of thread creation.

           *  The ability for applications to segregate threads by class
              would be lost.

          Another suggested alternative uses a model similar to that for
          process creation, such as ``thread fork''. The fork semantics
          would provide more flexibility and the ``create'' function can be
          implemented simply by doing a thread fork followed immediately by
          a call to the desired ``start routine'' for the thread. This
          alternative has these problems:

           *  For many implementations, the entire stack of the calling
              thread would need to be duplicated, since in many
              architectures there is no way to determine the size of the
              calling frame.

           *  Efficiency is reduced since at least some part of the stack
              has to be copied, even though in most cases the thread never
              needs the copied context, since it merely calls the desired
              start routine.

          If an implementation detects that the value specified by the attr
          argument to pthread_create() does not refer to an initialized
          thread attributes object, it is recommended that the function
          should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fork(3p), pthread_exit(3p), pthread_join(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 4.12, Memory
          Synchronization, pthread.h(0p)


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

   IEEE/The Open Group               2017                PTHREAD_CREATE(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_attr_destroy(3p) <../man3/pthread_attr_destroy.3p.html>`__, 
`pthread_attr_getdetachstate(3p) <../man3/pthread_attr_getdetachstate.3p.html>`__, 
`pthread_attr_getinheritsched(3p) <../man3/pthread_attr_getinheritsched.3p.html>`__, 
`pthread_attr_getschedparam(3p) <../man3/pthread_attr_getschedparam.3p.html>`__, 
`pthread_attr_getschedpolicy(3p) <../man3/pthread_attr_getschedpolicy.3p.html>`__, 
`pthread_attr_getscope(3p) <../man3/pthread_attr_getscope.3p.html>`__, 
`pthread_attr_getstack(3p) <../man3/pthread_attr_getstack.3p.html>`__, 
`pthread_attr_getstacksize(3p) <../man3/pthread_attr_getstacksize.3p.html>`__, 
`pthread_condattr_destroy(3p) <../man3/pthread_condattr_destroy.3p.html>`__, 
`pthread_condattr_getclock(3p) <../man3/pthread_condattr_getclock.3p.html>`__, 
`pthread_condattr_getpshared(3p) <../man3/pthread_condattr_getpshared.3p.html>`__, 
`pthread_equal(3p) <../man3/pthread_equal.3p.html>`__, 
`pthread_exit(3p) <../man3/pthread_exit.3p.html>`__, 
`pthread_join(3p) <../man3/pthread_join.3p.html>`__, 
`pthread_mutexattr_destroy(3p) <../man3/pthread_mutexattr_destroy.3p.html>`__, 
`pthread_mutexattr_getprioceiling(3p) <../man3/pthread_mutexattr_getprioceiling.3p.html>`__, 
`pthread_mutexattr_getprotocol(3p) <../man3/pthread_mutexattr_getprotocol.3p.html>`__, 
`pthread_mutexattr_getpshared(3p) <../man3/pthread_mutexattr_getpshared.3p.html>`__, 
`pthread_self(3p) <../man3/pthread_self.3p.html>`__

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
