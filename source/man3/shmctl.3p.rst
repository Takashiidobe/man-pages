.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

shmctl(3p) — Linux manual page
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

   SHMCTL(3P)              POSIX Programmer's Manual             SHMCTL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          shmctl — XSI shared memory control operations


---------------------------------------------------------

::

          #include <sys/shm.h>

          int shmctl(int shmid, int cmd, struct shmid_ds *buf);


---------------------------------------------------------------

::

          The shmctl() function operates on XSI shared memory (see the Base
          Definitions volume of POSIX.1‐2017, Section 3.346, Shared Memory
          Object).  It is unspecified whether this function interoperates
          with the realtime interprocess communication facilities defined
          in Section 2.8, Realtime.

          The shmctl() function provides a variety of shared memory control
          operations as specified by cmd.  The following values for cmd are
          available:

          IPC_STAT    Place the current value of each member of the
                      shmid_ds data structure associated with shmid into
                      the structure pointed to by buf.  The contents of the
                      structure are defined in <sys/shm.h>.

          IPC_SET     Set the value of the following members of the
                      shmid_ds data structure associated with shmid to the
                      corresponding value found in the structure pointed to
                      by buf:

                          shm_perm.uid
                          shm_perm.gid
                          shm_perm.mode    Low-order nine bits.

                      Also, the shm_ctime timestamp shall be set to the
                      current time, as described in Section 2.7.1, IPC
                      General Description.

                      IPC_SET can only be executed by a process that has an
                      effective user ID equal to either that of a process
                      with appropriate privileges or to the value of
                      shm_perm.cuid or shm_perm.uid in the shmid_ds data
                      structure associated with shmid.

          IPC_RMID    Remove the shared memory identifier specified by
                      shmid from the system and destroy the shared memory
                      segment and shmid_ds data structure associated with
                      it. IPC_RMID can only be executed by a process that
                      has an effective user ID equal to either that of a
                      process with appropriate privileges or to the value
                      of shm_perm.cuid or shm_perm.uid in the shmid_ds data
                      structure associated with shmid.


-----------------------------------------------------------------

::

          Upon successful completion, shmctl() shall return 0; otherwise,
          it shall return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The shmctl() function shall fail if:

          EACCES The argument cmd is equal to IPC_STAT and the calling
                 process does not have read permission; see Section 2.7,
                 XSI Interprocess Communication.

          EINVAL The value of shmid is not a valid shared memory
                 identifier, or the value of cmd is not a valid command.

          EPERM  The argument cmd is equal to IPC_RMID or IPC_SET and the
                 effective user ID of the calling process is not equal to
                 that of a process with appropriate privileges and it is
                 not equal to the value of shm_perm.cuid or shm_perm.uid in
                 the data structure associated with shmid.

          The shmctl() function may fail if:

          EOVERFLOW
                 The cmd argument is IPC_STAT and the gid or uid value is
                 too large to be stored in the structure pointed to by the
                 buf argument.

          The following sections are informative.


---------------------------------------------------------

::

          None.


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

          None.


---------------------------------------------------------

::

          Section 2.7, XSI Interprocess Communication, Section 2.8,
          Realtime, shmat(3p), shmdt(3p), shmget(3p), shm_open(3p),
          shm_unlink(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.346,
          Shared Memory Object, sys_shm.h(0p)


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

   IEEE/The Open Group               2017                        SHMCTL(3P)

--------------

Pages that refer to this page:
`sys_shm.h(0p) <../man0/sys_shm.h.0p.html>`__, 
`ipcrm(1p) <../man1/ipcrm.1p.html>`__, 
`shmat(3p) <../man3/shmat.3p.html>`__, 
`shmdt(3p) <../man3/shmdt.3p.html>`__, 
`shmget(3p) <../man3/shmget.3p.html>`__, 
`shm_open(3p) <../man3/shm_open.3p.html>`__, 
`shm_unlink(3p) <../man3/shm_unlink.3p.html>`__

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
