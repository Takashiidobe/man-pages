.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

msgget(3p) — Linux manual page
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

   MSGGET(3P)              POSIX Programmer's Manual             MSGGET(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          msgget — get the XSI message queue identifier


---------------------------------------------------------

::

          #include <sys/msg.h>

          int msgget(key_t key, int msgflg);


---------------------------------------------------------------

::

          The msgget() function operates on XSI message queues (see the
          Base Definitions volume of POSIX.1‐2017, Section 3.226, Message
          Queue).  It is unspecified whether this function interoperates
          with the realtime interprocess communication facilities defined
          in Section 2.8, Realtime.

          The msgget() function shall return the message queue identifier
          associated with the argument key.

          A message queue identifier, associated message queue, and data
          structure (see <sys/msg.h>), shall be created for the argument
          key if one of the following is true:

           *  The argument key is equal to IPC_PRIVATE.

           *  The argument key does not already have a message queue
              identifier associated with it, and (msgflg & IPC_CREAT) is
              non-zero.

          Upon creation, the data structure associated with the new message
          queue identifier shall be initialized as follows:

           *  msg_perm.cuid, msg_perm.uid, msg_perm.cgid, and msg_perm.gid
              shall be set to the effective user ID and effective group ID,
              respectively, of the calling process.

           *  The low-order 9 bits of msg_perm.mode shall be set to the
              low-order 9 bits of msgflg.

           *  msg_qnum, msg_lspid, msg_lrpid, msg_stime, and msg_rtime
              shall be set to 0.

           *  msg_ctime shall be set to the current time, as described in
              Section 2.7.1, IPC General Description.

           *  msg_qbytes shall be set to the system limit.


-----------------------------------------------------------------

::

          Upon successful completion, msgget() shall return a non-negative
          integer, namely a message queue identifier.  Otherwise, it shall
          return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The msgget() function shall fail if:

          EACCES A message queue identifier exists for the argument key,
                 but operation permission as specified by the low-order 9
                 bits of msgflg would not be granted; see Section 2.7, XSI
                 Interprocess Communication.

          EEXIST A message queue identifier exists for the argument key but
                 ((msgflg & IPC_CREAT) && (msgflg & IPC_EXCL)) is non-zero.

          ENOENT A message queue identifier does not exist for the argument
                 key and (msgflg & IPC_CREAT) is 0.

          ENOSPC A message queue identifier is to be created but the
                 system-imposed limit on the maximum number of allowed
                 message queue identifiers system-wide would be exceeded.

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
          Realtime, ftok(3p), mq_close(3p), mq_getattr(3p), mq_notify(3p),
          mq_open(3p), mq_receive(3p), mq_send(3p), mq_setattr(3p),
          mq_unlink(3p), msgctl(3p), msgrcv(3p), msgsnd(3p)

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

   IEEE/The Open Group               2017                        MSGGET(3P)

--------------

Pages that refer to this page:
`sys_msg.h(0p) <../man0/sys_msg.h.0p.html>`__, 
`ftok(3p) <../man3/ftok.3p.html>`__, 
`mq_close(3p) <../man3/mq_close.3p.html>`__, 
`mq_getattr(3p) <../man3/mq_getattr.3p.html>`__, 
`mq_notify(3p) <../man3/mq_notify.3p.html>`__, 
`mq_open(3p) <../man3/mq_open.3p.html>`__, 
`mq_receive(3p) <../man3/mq_receive.3p.html>`__, 
`mq_setattr(3p) <../man3/mq_setattr.3p.html>`__, 
`mq_unlink(3p) <../man3/mq_unlink.3p.html>`__, 
`msgctl(3p) <../man3/msgctl.3p.html>`__, 
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
