.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_barrier_destroy(3p) — Linux manual page
===============================================

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

   PTHREAD_BARRIER_DESTROY(3P)IX Programmer's ManualEAD_BARRIER_DESTROY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_barrier_destroy, pthread_barrier_init — destroy and
          initialize a barrier object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_barrier_destroy(pthread_barrier_t *barrier);
          int pthread_barrier_init(pthread_barrier_t *restrict barrier,
              const pthread_barrierattr_t *restrict attr, unsigned count);


---------------------------------------------------------------

::

          The pthread_barrier_destroy() function shall destroy the barrier
          referenced by barrier and release any resources used by the
          barrier. The effect of subsequent use of the barrier is undefined
          until the barrier is reinitialized by another call to
          pthread_barrier_init().  An implementation may use this function
          to set barrier to an invalid value. The results are undefined if
          pthread_barrier_destroy() is called when any thread is blocked on
          the barrier, or if this function is called with an uninitialized
          barrier.

          The pthread_barrier_init() function shall allocate any resources
          required to use the barrier referenced by barrier and shall
          initialize the barrier with attributes referenced by attr.  If
          attr is NULL, the default barrier attributes shall be used; the
          effect is the same as passing the address of a default barrier
          attributes object. The results are undefined if
          pthread_barrier_init() is called when any thread is blocked on
          the barrier (that is, has not returned from the
          pthread_barrier_wait() call). The results are undefined if a
          barrier is used without first being initialized. The results are
          undefined if pthread_barrier_init() is called specifying an
          already initialized barrier.

          The count argument specifies the number of threads that must call
          pthread_barrier_wait() before any of them successfully return
          from the call. The value specified by count must be greater than
          zero.

          If the pthread_barrier_init() function fails, the barrier shall
          not be initialized and the contents of barrier are undefined.

          See Section 2.9.9, Synchronization Object Copies and Alternative
          Mappings for further requirements.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_barrier_init() function shall fail if:

          EAGAIN The system lacks the necessary resources to initialize
                 another barrier.

          EINVAL The value specified by count is equal to zero.

          ENOMEM Insufficient memory exists to initialize the barrier.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the
          barrier argument to pthread_barrier_destroy() does not refer to
          an initialized barrier object, it is recommended that the
          function should fail and report an [EINVAL] error.

          If an implementation detects that the value specified by the attr
          argument to pthread_barrier_init() does not refer to an
          initialized barrier attributes object, it is recommended that the
          function should fail and report an [EINVAL] error.

          If an implementation detects that the value specified by the
          barrier argument to pthread_barrier_destroy() or
          pthread_barrier_init() refers to a barrier that is in use (for
          example, in a pthread_barrier_wait() call) by another thread, or
          detects that the value specified by the barrier argument to
          pthread_barrier_init() refers to an already initialized barrier
          object, it is recommended that the function should fail and
          report an [EBUSY] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_barrier_wait(3p)

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

   IEEE/The Open Group               2017       PTHREAD_BARRIER_DESTROY(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_barrierattr_getpshared(3p) <../man3/pthread_barrierattr_getpshared.3p.html>`__, 
`pthread_barrier_wait(3p) <../man3/pthread_barrier_wait.3p.html>`__

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
