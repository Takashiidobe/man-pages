.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semctl(3p) — Linux manual page
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

   SEMCTL(3P)              POSIX Programmer's Manual             SEMCTL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          semctl — XSI semaphore control operations


---------------------------------------------------------

::

          #include <sys/sem.h>

          int semctl(int semid, int semnum, int cmd, ...);


---------------------------------------------------------------

::

          The semctl() function operates on XSI semaphores (see the Base
          Definitions volume of POSIX.1‐2017, Section 4.17, Semaphore).  It
          is unspecified whether this function interoperates with the
          realtime interprocess communication facilities defined in Section
          2.8, Realtime.

          The semctl() function provides a variety of semaphore control
          operations as specified by cmd.  The fourth argument is optional
          and depends upon the operation requested. If required, it is of
          type union semun, which the application shall explicitly declare:

              union semun {
                  int val;
                  struct semid_ds *buf;
                  unsigned short  *array;
              } arg;

          Each operation shall be performed atomically.

          The following semaphore control operations as specified by cmd
          are executed with respect to the semaphore specified by semid and
          semnum.  The level of permission required for each operation is
          shown with each command; see Section 2.7, XSI Interprocess
          Communication.  The symbolic names for the values of cmd are
          defined in the <sys/sem.h> header:

          GETVAL      Return the value of semval; see <sys/sem.h>.
                      Requires read permission.

          SETVAL      Set the value of semval to arg.val, where arg is the
                      value of the fourth argument to semctl().  When this
                      command is successfully executed, the semadj value
                      corresponding to the specified semaphore in all
                      processes is cleared. Also, the sem_ctime timestamp
                      shall be set to the current time, as described in
                      Section 2.7.1, IPC General Description.  Requires
                      alter permission; see Section 2.7, XSI Interprocess
                      Communication.

          GETPID      Return the value of sempid.  Requires read
                      permission.

          GETNCNT     Return the value of semncnt.  Requires read
                      permission.

          GETZCNT     Return the value of semzcnt.  Requires read
                      permission.

          The following values of cmd operate on each semval in the set of
          semaphores:

          GETALL      Return the value of semval for each semaphore in the
                      semaphore set and place into the array pointed to by
                      arg.array, where arg is the fourth argument to
                      semctl().  Requires read permission.

          SETALL      Set the value of semval for each semaphore in the
                      semaphore set according to the array pointed to by
                      arg.array, where arg is the fourth argument to
                      semctl().  When this command is successfully
                      executed, the semadj values corresponding to each
                      specified semaphore in all processes are cleared.
                      Also, the sem_ctime timestamp shall be set to the
                      current time, as described in Section 2.7.1, IPC
                      General Description.  Requires alter permission.

          The following values of cmd are also available:

          IPC_STAT    Place the current value of each member of the
                      semid_ds data structure associated with semid into
                      the structure pointed to by arg.buf, where arg is the
                      fourth argument to semctl().  The contents of this
                      structure are defined in <sys/sem.h>.  Requires read
                      permission.

          IPC_SET     Set the value of the following members of the
                      semid_ds data structure associated with semid to the
                      corresponding value found in the structure pointed to
                      by arg.buf, where arg is the fourth argument to
                      semctl():

                          sem_perm.uid
                          sem_perm.gid
                          sem_perm.mode

                      The mode bits specified in Section 2.7.1, IPC General
                      Description are copied into the corresponding bits of
                      the sem_perm.mode associated with semid.  The stored
                      values of any other bits are unspecified. The
                      sem_ctime timestamp shall be set to the current time,
                      as described in Section 2.7.1, IPC General
                      Description.

                      This command can only be executed by a process that
                      has an effective user ID equal to either that of a
                      process with appropriate privileges or to the value
                      of sem_perm.cuid or sem_perm.uid in the semid_ds data
                      structure associated with semid.

          IPC_RMID    Remove the semaphore identifier specified by semid
                      from the system and destroy the set of semaphores and
                      semid_ds data structure associated with it. This
                      command can only be executed by a process that has an
                      effective user ID equal to either that of a process
                      with appropriate privileges or to the value of
                      sem_perm.cuid or sem_perm.uid in the semid_ds data
                      structure associated with semid.


-----------------------------------------------------------------

::

          If successful, the value returned by semctl() depends on cmd as
          follows:

          GETVAL      The value of semval.

          GETPID      The value of sempid.

          GETNCNT     The value of semncnt.

          GETZCNT     The value of semzcnt.

          All others  0.

          Otherwise, semctl() shall return -1 and set errno to indicate the
          error.


-----------------------------------------------------

::

          The semctl() function shall fail if:

          EACCES Operation permission is denied to the calling process; see
                 Section 2.7, XSI Interprocess Communication.

          EINVAL The value of semid is not a valid semaphore identifier, or
                 the value of semnum is less than 0 or greater than or
                 equal to sem_nsems, or the value of cmd is not a valid
                 command.

          EPERM  The argument cmd is equal to IPC_RMID or IPC_SET and the
                 effective user ID of the calling process is not equal to
                 that of a process with appropriate privileges and it is
                 not equal to the value of sem_perm.cuid or sem_perm.uid in
                 the data structure associated with semid.

          ERANGE The argument cmd is equal to SETVAL or SETALL and the
                 value to which semval is to be set is greater than the
                 system-imposed maximum.

          The following sections are informative.


---------------------------------------------------------

::

          Refer to semop(3p).


---------------------------------------------------------------------------

::

          The fourth parameter in the SYNOPSIS section is now specified as
          "..." in order to avoid a clash with the ISO C standard when
          referring to the union semun (as defined in Issue 3) and for
          backwards-compatibility.

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

          None.


---------------------------------------------------------

::

          Section 2.7, XSI Interprocess Communication, Section 2.8,
          Realtime, semget(3p), semop(3p), sem_close(3p), sem_destroy(3p),
          sem_getvalue(3p), sem_init(3p), sem_open(3p), sem_post(3p),
          sem_trywait(3p), sem_unlink(3p)

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

   IEEE/The Open Group               2017                        SEMCTL(3P)

--------------

Pages that refer to this page:
`sys_sem.h(0p) <../man0/sys_sem.h.0p.html>`__, 
`ipcrm(1p) <../man1/ipcrm.1p.html>`__, 
`sem_close(3p) <../man3/sem_close.3p.html>`__, 
`sem_destroy(3p) <../man3/sem_destroy.3p.html>`__, 
`semget(3p) <../man3/semget.3p.html>`__, 
`sem_getvalue(3p) <../man3/sem_getvalue.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__, 
`sem_open(3p) <../man3/sem_open.3p.html>`__, 
`sem_post(3p) <../man3/sem_post.3p.html>`__, 
`sem_timedwait(3p) <../man3/sem_timedwait.3p.html>`__, 
`sem_trywait(3p) <../man3/sem_trywait.3p.html>`__, 
`sem_unlink(3p) <../man3/sem_unlink.3p.html>`__

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
