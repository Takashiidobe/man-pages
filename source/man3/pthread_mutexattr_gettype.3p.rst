.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_mutexattr_gettype(3p) — Linux manual page
=================================================

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

   PTHREAD_MUTEXATTR_GETTYPE(3P) Programmer's ManualD_MUTEXATTR_GETTYPE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_mutexattr_gettype, pthread_mutexattr_settype — get and
          set the mutex type attribute


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_mutexattr_gettype(const pthread_mutexattr_t *restrict attr,
              int *restrict type);
          int pthread_mutexattr_settype(pthread_mutexattr_t *attr, int type);


---------------------------------------------------------------

::

          The pthread_mutexattr_gettype() and pthread_mutexattr_settype()
          functions, respectively, shall get and set the mutex type
          attribute. This attribute is set in the type parameter to these
          functions. The default value of the type attribute is
          PTHREAD_MUTEX_DEFAULT.

          The type of mutex is contained in the type attribute of the mutex
          attributes. Valid mutex types include:

                 PTHREAD_MUTEX_NORMAL PTHREAD_MUTEX_ERRORCHECK
                 PTHREAD_MUTEX_RECURSIVE PTHREAD_MUTEX_DEFAULT

          The mutex type affects the behavior of calls which lock and
          unlock the mutex. See pthread_mutex_lock(3p) for details. An
          implementation may map PTHREAD_MUTEX_DEFAULT to one of the other
          mutex types.

          The behavior is undefined if the value specified by the attr
          argument to pthread_mutexattr_gettype() or
          pthread_mutexattr_settype() does not refer to an initialized
          mutex attributes object.


-----------------------------------------------------------------

::

          Upon successful completion, the pthread_mutexattr_gettype()
          function shall return zero and store the value of the type
          attribute of attr into the object referenced by the type
          parameter. Otherwise, an error shall be returned to indicate the
          error.

          If successful, the pthread_mutexattr_settype() function shall
          return zero; otherwise, an error number shall be returned to
          indicate the error.


-----------------------------------------------------

::

          The pthread_mutexattr_settype() function shall fail if:

          EINVAL The value type is invalid.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          It is advised that an application should not use a
          PTHREAD_MUTEX_RECURSIVE mutex with condition variables because
          the implicit unlock performed for a pthread_cond_timedwait() or
          pthread_cond_wait() may not actually release the mutex (if it had
          been locked multiple times). If this happens, no other thread can
          satisfy the condition of the predicate.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the attr
          argument to pthread_mutexattr_gettype() or
          pthread_mutexattr_settype() does not refer to an initialized
          mutex attributes object, it is recommended that the function
          should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_cond_timedwait(3p), pthread_mutex_lock(3p)

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

   IEEE/The Open Group               2017     PTHREAD_MUTEXATTR_GETTYPE(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_mutexattr_settype(3p) <../man3/pthread_mutexattr_settype.3p.html>`__

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
