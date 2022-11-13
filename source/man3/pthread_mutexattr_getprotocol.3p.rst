.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_mutexattr_getprotocol(3p) — Linux manual page
=====================================================

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

   PTHREAD_MUTEXATTR_GETPROTOCOL(3P)grammer'sRManualTEXATTR_GETPROTOCOL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_mutexattr_getprotocol, pthread_mutexattr_setprotocol —
          get and set the protocol attribute of the mutex attributes object
          (REALTIME THREADS)


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_mutexattr_getprotocol(const pthread_mutexattr_t
              *restrict attr, int *restrict protocol);
          int pthread_mutexattr_setprotocol(pthread_mutexattr_t *attr,
              int protocol);


---------------------------------------------------------------

::

          The pthread_mutexattr_getprotocol() and
          pthread_mutexattr_setprotocol() functions, respectively, shall
          get and set the protocol attribute of a mutex attributes object
          pointed to by attr which was previously created by the function
          pthread_mutexattr_init().

          The protocol attribute defines the protocol to be followed in
          utilizing mutexes.  The value of protocol may be one of:

          PTHREAD_PRIO_INHERIT
          PTHREAD_PRIO_NONE
          PTHREAD_PRIO_PROTECT

          which are defined in the <pthread.h> header. The default value of
          the attribute shall be PTHREAD_PRIO_NONE.

          When a thread owns a mutex with the PTHREAD_PRIO_NONE protocol
          attribute, its priority and scheduling shall not be affected by
          its mutex ownership.

          When a thread is blocking higher priority threads because of
          owning one or more robust mutexes with the PTHREAD_PRIO_INHERIT
          protocol attribute, it shall execute at the higher of its
          priority or the priority of the highest priority thread waiting
          on any of the robust mutexes owned by this thread and initialized
          with this protocol.

          When a thread is blocking higher priority threads because of
          owning one or more non-robust mutexes with the
          PTHREAD_PRIO_INHERIT protocol attribute, it shall execute at the
          higher of its priority or the priority of the highest priority
          thread waiting on any of the non-robust mutexes owned by this
          thread and initialized with this protocol.

          When a thread owns one or more robust mutexes initialized with
          the PTHREAD_PRIO_PROTECT protocol, it shall execute at the higher
          of its priority or the highest of the priority ceilings of all
          the robust mutexes owned by this thread and initialized with this
          attribute, regardless of whether other threads are blocked on any
          of these robust mutexes or not.

          When a thread owns one or more non-robust mutexes initialized
          with the PTHREAD_PRIO_PROTECT protocol, it shall execute at the
          higher of its priority or the highest of the priority ceilings of
          all the non-robust mutexes owned by this thread and initialized
          with this attribute, regardless of whether other threads are
          blocked on any of these non-robust mutexes or not.

          While a thread is holding a mutex which has been initialized with
          the PTHREAD_PRIO_INHERIT or PTHREAD_PRIO_PROTECT protocol
          attributes, it shall not be subject to being moved to the tail of
          the scheduling queue at its priority in the event that its
          original priority is changed, such as by a call to
          sched_setparam().  Likewise, when a thread unlocks a mutex that
          has been initialized with the PTHREAD_PRIO_INHERIT or
          PTHREAD_PRIO_PROTECT protocol attributes, it shall not be subject
          to being moved to the tail of the scheduling queue at its
          priority in the event that its original priority is changed.

          If a thread simultaneously owns several mutexes initialized with
          different protocols, it shall execute at the highest of the
          priorities that it would have obtained by each of these
          protocols.

          When a thread makes a call to pthread_mutex_lock(), the mutex was
          initialized with the protocol attribute having the value
          PTHREAD_PRIO_INHERIT, when the calling thread is blocked because
          the mutex is owned by another thread, that owner thread shall
          inherit the priority level of the calling thread as long as it
          continues to own the mutex. The implementation shall update its
          execution priority to the maximum of its assigned priority and
          all its inherited priorities.  Furthermore, if this owner thread
          itself becomes blocked on another mutex with the protocol
          attribute having the value PTHREAD_PRIO_INHERIT, the same
          priority inheritance effect shall be propagated to this other
          owner thread, in a recursive manner.

          The behavior is undefined if the value specified by the attr
          argument to pthread_mutexattr_getprotocol() or
          pthread_mutexattr_setprotocol() does not refer to an initialized
          mutex attributes object.


-----------------------------------------------------------------

::

          Upon successful completion, the pthread_mutexattr_getprotocol()
          and pthread_mutexattr_setprotocol() functions shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_mutexattr_setprotocol() function shall fail if:

          ENOTSUP
                 The value specified by protocol is an unsupported value.

          The pthread_mutexattr_getprotocol() and
          pthread_mutexattr_setprotocol() functions may fail if:

          EINVAL The value specified by protocol is invalid.

          EPERM  The caller does not have the privilege to perform the
                 operation.

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

          If an implementation detects that the value specified by the attr
          argument to pthread_mutexattr_getprotocol() or
          pthread_mutexattr_setprotocol() does not refer to an initialized
          mutex attributes object, it is recommended that the function
          should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_cond_destroy(3p), pthread_create(3p),
          pthread_mutex_destroy(3p)

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

   IEEE/The Open Group               2017 PTHREAD_MUTEXATTR_GETPROTOCOL(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_mutexattr_setprotocol(3p) <../man3/pthread_mutexattr_setprotocol.3p.html>`__

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
