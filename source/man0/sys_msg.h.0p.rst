.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sys_msg.h(0p) — Linux manual page
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

   sys_msg.h(0P)           POSIX Programmer's Manual          sys_msg.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sys/msg.h — XSI message queue structures


---------------------------------------------------------

::

          #include <sys/msg.h>


---------------------------------------------------------------

::

          The <sys/msg.h> header shall define the following data types
          through typedef:

          msgqnum_t     Used for the number of messages in the message
                        queue.

          msglen_t      Used for the number of bytes allowed in a message
                        queue.

          These types shall be unsigned integer types that are able to
          store values at least as large as a type unsigned short.

          The <sys/msg.h> header shall define the following symbolic
          constant as a message operation flag:

          MSG_NOERROR   No error if big message.

          The <sys/msg.h> header shall define the msqid_ds structure, which
          shall include the following members:

              struct ipc_perm msg_perm   Operation permission structure.
              msgqnum_t       msg_qnum   Number of messages currently on queue.
              msglen_t        msg_qbytes Maximum number of bytes allowed on queue.
              pid_t           msg_lspid  Process ID of last msgsnd().
              pid_t           msg_lrpid  Process ID of last msgrcv().
              time_t          msg_stime  Time of last msgsnd().
              time_t          msg_rtime  Time of last msgrcv().
              time_t          msg_ctime  Time of last change.

          The <sys/msg.h> header shall define the pid_t, size_t, ssize_t,
          and time_t types as described in <sys/types.h>.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int       msgctl(int, int, struct msqid_ds *);
              int       msgget(key_t, int);
              ssize_t   msgrcv(int, void *, size_t, long, int);
              int       msgsnd(int, const void *, size_t, int);

          In addition, the <sys/msg.h> header shall include the <sys/ipc.h>
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

          The System Interfaces volume of POSIX.1‐2017, msgctl(3p),
          msgget(3p), msgrcv(3p), msgsnd(3p)


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

   IEEE/The Open Group               2017                     sys_msg.h(0P)

--------------

Pages that refer to this page: `msgctl(3p) <../man3/msgctl.3p.html>`__, 
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
