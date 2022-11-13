.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sem_init(3p) — Linux manual page
================================

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

   SEM_INIT(3P)            POSIX Programmer's Manual           SEM_INIT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sem_init — initialize an unnamed semaphore


---------------------------------------------------------

::

          #include <semaphore.h>

          int sem_init(sem_t *sem, int pshared, unsigned value);


---------------------------------------------------------------

::

          The sem_init() function shall initialize the unnamed semaphore
          referred to by sem.  The value of the initialized semaphore shall
          be value.  Following a successful call to sem_init(), the
          semaphore may be used in subsequent calls to sem_wait(),
          sem_timedwait(), sem_trywait(), sem_post(), and sem_destroy().
          This semaphore shall remain usable until the semaphore is
          destroyed.

          If the pshared argument has a non-zero value, then the semaphore
          is shared between processes; in this case, any process that can
          access the semaphore sem can use sem for performing sem_wait(),
          sem_timedwait(), sem_trywait(), sem_post(), and sem_destroy()
          operations.

          If the pshared argument is zero, then the semaphore is shared
          between threads of the process; any thread in this process can
          use sem for performing sem_wait(), sem_timedwait(),
          sem_trywait(), sem_post(), and sem_destroy() operations.

          See Section 2.9.9, Synchronization Object Copies and Alternative
          Mappings for further requirements.

          Attempting to initialize an already initialized semaphore results
          in undefined behavior.


-----------------------------------------------------------------

::

          Upon successful completion, the sem_init() function shall
          initialize the semaphore in sem and return 0. Otherwise, it shall
          return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The sem_init() function shall fail if:

          EINVAL The value argument exceeds {SEM_VALUE_MAX}.

          ENOSPC A resource required to initialize the semaphore has been
                 exhausted, or the limit on semaphores ({SEM_NSEMS_MAX})
                 has been reached.

          EPERM  The process lacks appropriate privileges to initialize the
                 semaphore.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          sem_destroy(3p), sem_post(3p), sem_timedwait(3p), sem_trywait(3p)

          The Base Definitions volume of POSIX.1‐2017, semaphore.h(0p)


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

   IEEE/The Open Group               2017                      SEM_INIT(3P)

--------------

Pages that refer to this page:
`semaphore.h(0p) <../man0/semaphore.h.0p.html>`__, 
`sem_close(3p) <../man3/sem_close.3p.html>`__, 
`semctl(3p) <../man3/semctl.3p.html>`__, 
`sem_destroy(3p) <../man3/sem_destroy.3p.html>`__, 
`semget(3p) <../man3/semget.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__

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
