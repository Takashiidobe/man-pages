.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_barrier_wait(3p) — Linux manual page
============================================

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

   PTHREAD_BARRIER_WAIT(3P)POSIX Programmer's ManualTHREAD_BARRIER_WAIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_barrier_wait — synchronize at a barrier


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_barrier_wait(pthread_barrier_t *barrier);


---------------------------------------------------------------

::

          The pthread_barrier_wait() function shall synchronize
          participating threads at the barrier referenced by barrier.  The
          calling thread shall block until the required number of threads
          have called pthread_barrier_wait() specifying the barrier.

          When the required number of threads have called
          pthread_barrier_wait() specifying the barrier, the constant
          PTHREAD_BARRIER_SERIAL_THREAD shall be returned to one
          unspecified thread and zero shall be returned to each of the
          remaining threads. At this point, the barrier shall be reset to
          the state it had as a result of the most recent
          pthread_barrier_init() function that referenced it.

          The constant PTHREAD_BARRIER_SERIAL_THREAD is defined in
          <pthread.h> and its value shall be distinct from any other value
          returned by pthread_barrier_wait().

          The results are undefined if this function is called with an
          uninitialized barrier.

          If a signal is delivered to a thread blocked on a barrier, upon
          return from the signal handler the thread shall resume waiting at
          the barrier if the barrier wait has not completed (that is, if
          the required number of threads have not arrived at the barrier
          during the execution of the signal handler); otherwise, the
          thread shall continue as normal from the completed barrier wait.
          Until the thread in the signal handler returns from it, it is
          unspecified whether other threads may proceed past the barrier
          once they have all reached it.

          A thread that has blocked on a barrier shall not prevent any
          unblocked thread that is eligible to use the same processing
          resources from eventually making forward progress in its
          execution. Eligibility for processing resources shall be
          determined by the scheduling policy.


-----------------------------------------------------------------

::

          Upon successful completion, the pthread_barrier_wait() function
          shall return PTHREAD_BARRIER_SERIAL_THREAD for a single
          (arbitrary) thread synchronized at the barrier and zero for each
          of the other threads. Otherwise, an error number shall be
          returned to indicate the error.


-----------------------------------------------------

::

          This function shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          Applications using this function may be subject to priority
          inversion, as discussed in the Base Definitions volume of
          POSIX.1‐2017, Section 3.291, Priority Inversion.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the
          barrier argument to pthread_barrier_wait() does not refer to an
          initialized barrier object, it is recommended that the function
          should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_barrier_destroy(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.291,
          Priority Inversion, Section 4.12, Memory Synchronization,
          pthread.h(0p)


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

   IEEE/The Open Group               2017          PTHREAD_BARRIER_WAIT(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_barrier_destroy(3p) <../man3/pthread_barrier_destroy.3p.html>`__

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
