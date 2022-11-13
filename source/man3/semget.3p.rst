.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semget(3p) — Linux manual page
==============================

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

   SEMGET(3P)              POSIX Programmer's Manual             SEMGET(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          semget — get set of XSI semaphores


---------------------------------------------------------

::

          #include <sys/sem.h>

          int semget(key_t key, int nsems, int semflg);


---------------------------------------------------------------

::

          The semget() function operates on XSI semaphores (see the Base
          Definitions volume of POSIX.1‐2017, Section 4.17, Semaphore).  It
          is unspecified whether this function interoperates with the
          realtime interprocess communication facilities defined in Section
          2.8, Realtime.

          The semget() function shall return the semaphore identifier
          associated with key.

          A semaphore identifier with its associated semid_ds data
          structure and its associated set of nsems semaphores (see
          <sys/sem.h>) is created for key if one of the following is true:

           *  The argument key is equal to IPC_PRIVATE.

           *  The argument key does not already have a semaphore identifier
              associated with it and (semflg &IPC_CREAT) is non-zero.

          Upon creation, the semid_ds data structure associated with the
          new semaphore identifier is initialized as follows:

           *  In the operation permissions structure sem_perm.cuid,
              sem_perm.uid, sem_perm.cgid, and sem_perm.gid shall be set to
              the effective user ID and effective group ID, respectively,
              of the calling process.

           *  The low-order 9 bits of sem_perm.mode shall be set to the
              low-order 9 bits of semflg.

           *  The variable sem_nsems shall be set to the value of nsems.

           *  The variable sem_otime shall be set to 0 and sem_ctime shall
              be set to the current time, as described in Section 2.7.1,
              IPC General Description.

           *  The data structure associated with each semaphore in the set
              need not be initialized. The semctl() function with the
              command SETVAL or SETALL can be used to initialize each
              semaphore.


-----------------------------------------------------------------

::

          Upon successful completion, semget() shall return a non-negative
          integer, namely a semaphore identifier; otherwise, it shall
          return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The semget() function shall fail if:

          EACCES A semaphore identifier exists for key, but operation
                 permission as specified by the low-order 9 bits of semflg
                 would not be granted; see Section 2.7, XSI Interprocess
                 Communication.

          EEXIST A semaphore identifier exists for the argument key but
                 ((semflg &IPC_CREAT) &&(semflg &IPC_EXCL)) is non-zero.

          EINVAL The value of nsems is either less than or equal to 0 or
                 greater than the system-imposed limit, or a semaphore
                 identifier exists for the argument key, but the number of
                 semaphores in the set associated with it is less than
                 nsems and nsems is not equal to 0.

          ENOENT A semaphore identifier does not exist for the argument key
                 and (semflg &IPC_CREAT) is equal to 0.

          ENOSPC A semaphore identifier is to be created but the system-
                 imposed limit on the maximum number of allowed semaphores
                 system-wide would be exceeded.

          The following sections are informative.


---------------------------------------------------------

::

          Refer to semop(3p).


---------------------------------------------------------------------------

::

          The POSIX Realtime Extension defines alternative interfaces for
          interprocess communication. Application developers who need to
          use IPC should design their applications so that modules using
          the IPC routines described in Section 2.7, XSI Interprocess
          Communication can be easily modified to use the alternative
          interfaces.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          A future version may require that the value of the semval,
          sempid, semncnt, and semzcnt members of all semaphores in a
          semaphore set be initialized to zero when a call to semget()
          creates a semaphore set. Many semaphore implementations already
          do this and it greatly simplifies what an application must do to
          initialize a semaphore set.


---------------------------------------------------------

::

          Section 2.7, XSI Interprocess Communication, Section 2.8,
          Realtime, ftok(3p), semctl(3p), semop(3p), sem_close(3p),
          sem_destroy(3p), sem_getvalue(3p), sem_init(3p), sem_open(3p),
          sem_post(3p), sem_trywait(3p), sem_unlink(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 4.17,
          Semaphore, sys_sem.h(0p)


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

   IEEE/The Open Group               2017                        SEMGET(3P)

--------------

Pages that refer to this page:
`sys_sem.h(0p) <../man0/sys_sem.h.0p.html>`__, 
`ipcs(1p) <../man1/ipcs.1p.html>`__, 
`ftok(3p) <../man3/ftok.3p.html>`__, 
`sem_close(3p) <../man3/sem_close.3p.html>`__, 
`semctl(3p) <../man3/semctl.3p.html>`__, 
`sem_destroy(3p) <../man3/sem_destroy.3p.html>`__, 
`sem_getvalue(3p) <../man3/sem_getvalue.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__, 
`sem_open(3p) <../man3/sem_open.3p.html>`__, 
`sem_post(3p) <../man3/sem_post.3p.html>`__, 
`sem_timedwait(3p) <../man3/sem_timedwait.3p.html>`__, 
`sem_trywait(3p) <../man3/sem_trywait.3p.html>`__, 
`sem_unlink(3p) <../man3/sem_unlink.3p.html>`__, 
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
