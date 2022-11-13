.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_rwlockattr_destroy(3p) — Linux manual page
==================================================

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

   PTHREAD_RWLOCKATTR_DESTROY(3P)Programmer'sPManual_RWLOCKATTR_DESTROY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_rwlockattr_destroy, pthread_rwlockattr_init — destroy and
          initialize the read-write lock attributes object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_rwlockattr_destroy(pthread_rwlockattr_t *attr);
          int pthread_rwlockattr_init(pthread_rwlockattr_t *attr);


---------------------------------------------------------------

::

          The pthread_rwlockattr_destroy() function shall destroy a read-
          write lock attributes object. A destroyed attr attributes object
          can be reinitialized using pthread_rwlockattr_init(); the results
          of otherwise referencing the object after it has been destroyed
          are undefined. An implementation may cause
          pthread_rwlockattr_destroy() to set the object referenced by attr
          to an invalid value.

          The pthread_rwlockattr_init() function shall initialize a read-
          write lock attributes object attr with the default value for all
          of the attributes defined by the implementation.

          Results are undefined if pthread_rwlockattr_init() is called
          specifying an already initialized attr attributes object.

          After a read-write lock attributes object has been used to
          initialize one or more read-write locks, any function affecting
          the attributes object (including destruction) shall not affect
          any previously initialized read-write locks.

          The behavior is undefined if the value specified by the attr
          argument to pthread_rwlockattr_destroy() does not refer to an
          initialized read-write lock attributes object.


-----------------------------------------------------------------

::

          If successful, the pthread_rwlockattr_destroy() and
          pthread_rwlockattr_init() functions shall return zero; otherwise,
          an error number shall be returned to indicate the error.


-----------------------------------------------------

::

          The pthread_rwlockattr_init() function shall fail if:

          ENOMEM Insufficient memory exists to initialize the read-write
                 lock attributes object.

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
          argument to pthread_rwlockattr_destroy() does not refer to an
          initialized read-write lock attributes object, it is recommended
          that the function should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_rwlock_destroy(3p), pthread_rwlockattr_getpshared(3p)

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

   IEEE/The Open Group               2017    PTHREAD_RWLOCKATTR_DESTROY(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_rwlockattr_getpshared(3p) <../man3/pthread_rwlockattr_getpshared.3p.html>`__, 
`pthread_rwlockattr_init(3p) <../man3/pthread_rwlockattr_init.3p.html>`__

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
