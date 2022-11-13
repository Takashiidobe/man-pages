.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

msgctl(3p) — Linux manual page
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

   MSGCTL(3P)              POSIX Programmer's Manual             MSGCTL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          msgctl — XSI message control operations


---------------------------------------------------------

::

          #include <sys/msg.h>

          int msgctl(int msqid, int cmd, struct msqid_ds *buf);


---------------------------------------------------------------

::

          The msgctl() function operates on XSI message queues (see the
          Base Definitions volume of POSIX.1‐2017, Section 3.226, Message
          Queue).  It is unspecified whether this function interoperates
          with the realtime interprocess communication facilities defined
          in Section 2.8, Realtime.

          The msgctl() function shall provide message control operations as
          specified by cmd.  The following values for cmd, and the message
          control operations they specify, are:

          IPC_STAT    Place the current value of each member of the
                      msqid_ds data structure associated with msqid into
                      the structure pointed to by buf.  The contents of
                      this structure are defined in <sys/msg.h>.

          IPC_SET     Set the value of the following members of the
                      msqid_ds data structure associated with msqid to the
                      corresponding value found in the structure pointed to
                      by buf:

                          msg_perm.uid
                          msg_perm.gid
                          msg_perm.mode
                          msg_qbytes

                      Also, the msg_ctime timestamp shall be set to the
                      current time, as described in Section 2.7.1, IPC
                      General Description.

                      IPC_SET can only be executed by a process with
                      appropriate privileges or that has an effective user
                      ID equal to the value of msg_perm.cuid or
                      msg_perm.uid in the msqid_ds data structure
                      associated with msqid.  Only a process with
                      appropriate privileges can raise the value of
                      msg_qbytes.

          IPC_RMID    Remove the message queue identifier specified by
                      msqid from the system and destroy the message queue
                      and msqid_ds data structure associated with it.
                      IPC_RMD can only be executed by a process with
                      appropriate privileges or one that has an effective
                      user ID equal to the value of msg_perm.cuid or
                      msg_perm.uid in the msqid_ds data structure
                      associated with msqid.


-----------------------------------------------------------------

::

          Upon successful completion, msgctl() shall return 0; otherwise,
          it shall return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The msgctl() function shall fail if:

          EACCES The argument cmd is IPC_STAT and the calling process does
                 not have read permission; see Section 2.7, XSI
                 Interprocess Communication.

          EINVAL The value of msqid is not a valid message queue
                 identifier; or the value of cmd is not a valid command.

          EPERM  The argument cmd is IPC_RMID or IPC_SET and the effective
                 user ID of the calling process is not equal to that of a
                 process with appropriate privileges and it is not equal to
                 the value of msg_perm.cuid or msg_perm.uid in the data
                 structure associated with msqid.

          EPERM  The argument cmd is IPC_SET, an attempt is being made to
                 increase to the value of msg_qbytes, and the effective
                 user ID of the calling process does not have appropriate
                 privileges.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The POSIX Realtime Extension defines alternative interfaces for
          interprocess communication (IPC). Application developers who need
          to use IPC should design their applications so that modules using
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
          Realtime, mq_close(3p), mq_getattr(3p), mq_notify(3p),
          mq_open(3p), mq_receive(3p), mq_send(3p), mq_setattr(3p),
          mq_unlink(3p), msgget(3p), msgrcv(3p), msgsnd(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.226,
          Message Queue, sys_msg.h(0p)


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

   IEEE/The Open Group               2017                        MSGCTL(3P)

--------------

Pages that refer to this page:
`sys_msg.h(0p) <../man0/sys_msg.h.0p.html>`__, 
`ipcrm(1p) <../man1/ipcrm.1p.html>`__, 
`mq_close(3p) <../man3/mq_close.3p.html>`__, 
`mq_getattr(3p) <../man3/mq_getattr.3p.html>`__, 
`mq_notify(3p) <../man3/mq_notify.3p.html>`__, 
`mq_open(3p) <../man3/mq_open.3p.html>`__, 
`mq_receive(3p) <../man3/mq_receive.3p.html>`__, 
`mq_setattr(3p) <../man3/mq_setattr.3p.html>`__, 
`mq_unlink(3p) <../man3/mq_unlink.3p.html>`__, 
`msgget(3p) <../man3/msgget.3p.html>`__, 
`msgrcv(3p) <../man3/msgrcv.3p.html>`__, 
`msgsnd(3p) <../man3/msgsnd.3p.html>`__

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
