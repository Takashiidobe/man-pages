.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sys_sem.h(0p) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   sys_sem.h(0P)           POSIX Programmer's Manual          sys_sem.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sys/sem.h — XSI semaphore facility


---------------------------------------------------------

::

          #include <sys/sem.h>


---------------------------------------------------------------

::

          The <sys/sem.h> header shall define the following symbolic
          constant for use as a semaphore operation flag:

          SEM_UNDO    Set up adjust on exit entry.

          The <sys/sem.h> header shall define the following symbolic
          constants for use as commands for the semctl() function:

          GETNCNT     Get semncnt.

          GETPID      Get sempid.

          GETVAL      Get semval.

          GETALL      Get all cases of semval.

          GETZCNT     Get semzcnt.

          SETVAL      Set semval.

          SETALL      Set all cases of semval.

          The <sys/sem.h> header shall define the semid_ds structure, which
          shall include the following members:

              struct ipc_perm  sem_perm  Operation permission structure.
              unsigned short   sem_nsems Number of semaphores in set.
              time_t           sem_otime Last semop() time.
              time_t           sem_ctime Last time changed by semctl().

          The <sys/sem.h> header shall define the pid_t, size_t, and time_t
          types as described in <sys/types.h>.

          A semaphore shall be represented by an anonymous structure, which
          shall include the following members:

              unsigned short  semval   Semaphore value.
              pid_t           sempid   Process ID of last operation.
              unsigned short  semncnt  Number of processes waiting for semval
                                       to become greater than current value.
              unsigned short  semzcnt  Number of processes waiting for semval
                                       to become 0.

          The <sys/sem.h> header shall define the sembuf structure, which
          shall include the following members:

              unsigned short  sem_num   Semaphore number.
              short           sem_op    Semaphore operation.
              short           sem_flg   Operation flags.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int   semctl(int, int, int, ...);
              int   semget(key_t, int, int);
              int   semop(int, struct sembuf *, size_t);

          In addition, the <sys/sem.h> header shall include the <sys/ipc.h>
          header.

          The following sections are informative.


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

          sys_ipc.h(0p), sys_types.h(0p)

          The System Interfaces volume of POSIX.1‐2017, semctl(3p),
          semget(3p), semop(3p)


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

   IEEE/The Open Group               2017                     sys_sem.h(0P)

--------------

Pages that refer to this page: `semctl(3p) <../man3/semctl.3p.html>`__, 
`semget(3p) <../man3/semget.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__

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
