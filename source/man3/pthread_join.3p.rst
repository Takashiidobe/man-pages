.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_join(3p) — Linux manual page
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

   PTHREAD_JOIN(3P)        POSIX Programmer's Manual       PTHREAD_JOIN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_join — wait for thread termination


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_join(pthread_t thread, void **value_ptr);


---------------------------------------------------------------

::

          The pthread_join() function shall suspend execution of the
          calling thread until the target thread terminates, unless the
          target thread has already terminated. On return from a successful
          pthread_join() call with a non-NULL value_ptr argument, the value
          passed to pthread_exit() by the terminating thread shall be made
          available in the location referenced by value_ptr.  When a
          pthread_join() returns successfully, the target thread has been
          terminated. The results of multiple simultaneous calls to
          pthread_join() specifying the same target thread are undefined.
          If the thread calling pthread_join() is canceled, then the target
          thread shall not be detached.

          It is unspecified whether a thread that has exited but remains
          unjoined counts against {PTHREAD_THREADS_MAX}.

          The behavior is undefined if the value specified by the thread
          argument to pthread_join() does not refer to a joinable thread.

          The behavior is undefined if the value specified by the thread
          argument to pthread_join() refers to the calling thread.


-----------------------------------------------------------------

::

          If successful, the pthread_join() function shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_join() function may fail if:

          EDEADLK
                 A deadlock was detected.

          The pthread_join() function shall not return an error code of
          [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          An example of thread creation and deletion follows:

              typedef struct {
                  int *ar;
                  long n;
              } subarray;

              void *
              incer(void *arg)
              {
                  long i;

                  for (i = 0; i < ((subarray *)arg)->n; i++)
                      ((subarray *)arg)->ar[i]++;
              }

              int main(void)
              {
                  int        ar[1000000];
                  pthread_t  th1, th2;
                  subarray   sb1, sb2;

                  sb1.ar = &ar[0];
                  sb1.n  = 500000;
                  (void) pthread_create(&th1, NULL, incer, &sb1);

                  sb2.ar = &ar[500000];
                  sb2.n  = 500000;
                  (void) pthread_create(&th2, NULL, incer, &sb2);

                  (void) pthread_join(th1, NULL);
                  (void) pthread_join(th2, NULL);
                  return 0;
              }


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The pthread_join() function is a convenience that has proven
          useful in multi-threaded applications. It is true that a
          programmer could simulate this function if it were not provided
          by passing extra state as part of the argument to the
          start_routine().  The terminating thread would set a flag to
          indicate termination and broadcast a condition that is part of
          that state; a joining thread would wait on that condition
          variable. While such a technique would allow a thread to wait on
          more complex conditions (for example, waiting for multiple
          threads to terminate), waiting on individual thread termination
          is considered widely useful. Also, including the pthread_join()
          function in no way precludes a programmer from coding such
          complex waits. Thus, while not a primitive, including
          pthread_join() in this volume of POSIX.1‐2017 was considered
          valuable.

          The pthread_join() function provides a simple mechanism allowing
          an application to wait for a thread to terminate. After the
          thread terminates, the application may then choose to clean up
          resources that were used by the thread. For instance, after
          pthread_join() returns, any application-provided stack storage
          could be reclaimed.

          The pthread_join() or pthread_detach() function should eventually
          be called for every thread that is created with the detachstate
          attribute set to PTHREAD_CREATE_JOINABLE so that storage
          associated with the thread may be reclaimed.

          The interaction between pthread_join() and cancellation is well-
          defined for the following reasons:

           *  The pthread_join() function, like all other non-async-cancel-
              safe functions, can only be called with deferred
              cancelability type.

           *  Cancellation cannot occur in the disabled cancelability
              state.

          Thus, only the default cancelability state need be considered. As
          specified, either the pthread_join() call is canceled, or it
          succeeds, but not both. The difference is obvious to the
          application, since either a cancellation handler is run or
          pthread_join() returns. There are no race conditions since
          pthread_join() was called in the deferred cancelability state.

          If an implementation detects that the value specified by the
          thread argument to pthread_join() does not refer to a joinable
          thread, it is recommended that the function should fail and
          report an [EINVAL] error.

          If an implementation detects that the value specified by the
          thread argument to pthread_join() refers to the calling thread,
          it is recommended that the function should fail and report an
          [EDEADLK] error.

          If an implementation detects use of a thread ID after the end of
          its lifetime, it is recommended that the function should fail and
          report an [ESRCH] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_create(3p), wait(3p)

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

   IEEE/The Open Group               2017                  PTHREAD_JOIN(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_cancel(3p) <../man3/pthread_cancel.3p.html>`__, 
`pthread_create(3p) <../man3/pthread_create.3p.html>`__, 
`pthread_detach(3p) <../man3/pthread_detach.3p.html>`__, 
`pthread_exit(3p) <../man3/pthread_exit.3p.html>`__

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
