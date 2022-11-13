.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

msgget(2) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MSGGET(2)               Linux Programmer's Manual              MSGGET(2)

NAME
-------------------------------------------------

::

          msgget - get a System V message queue identifier


---------------------------------------------------------

::

          #include <sys/msg.h>

          int msgget(key_t key, int msgflg);


---------------------------------------------------------------

::

          The msgget() system call returns the System V message queue
          identifier associated with the value of the key argument.  It may
          be used either to obtain the identifier of a previously created
          message queue (when msgflg is zero and key does not have the
          value IPC_PRIVATE), or to create a new set.

          A new message queue is created if key has the value IPC_PRIVATE
          or key isn't IPC_PRIVATE, no message queue with the given key key
          exists, and IPC_CREAT is specified in msgflg.

          If msgflg specifies both IPC_CREAT and IPC_EXCL and a message
          queue already exists for key, then msgget() fails with errno set
          to EEXIST.  (This is analogous to the effect of the combination
          O_CREAT | O_EXCL for open(2).)

          Upon creation, the least significant bits of the argument msgflg
          define the permissions of the message queue.  These permission
          bits have the same format and semantics as the permissions
          specified for the mode argument of open(2).  (The execute
          permissions are not used.)

          If a new message queue is created, then its associated data
          structure msqid_ds (see msgctl(2)) is initialized as follows:

          • msg_perm.cuid and msg_perm.uid are set to the effective user ID
            of the calling process.

          • msg_perm.cgid and msg_perm.gid are set to the effective group
            ID of the calling process.

          • The least significant 9 bits of msg_perm.mode are set to the
            least significant 9 bits of msgflg.

          • msg_qnum, msg_lspid, msg_lrpid, msg_stime, and msg_rtime are
            set to 0.

          • msg_ctime is set to the current time.

          • msg_qbytes is set to the system limit MSGMNB.

          If the message queue already exists the permissions are verified,
          and a check is made to see if it is marked for destruction.


-----------------------------------------------------------------

::

          On success, msgget() returns the message queue identifier (a
          nonnegative integer).  On failure, -1 is returned, and errno is
          set to indicate the error.


-----------------------------------------------------

::

          EACCES A message queue exists for key, but the calling process
                 does not have permission to access the queue, and does not
                 have the CAP_IPC_OWNER capability in the user namespace
                 that governs its IPC namespace.

          EEXIST IPC_CREAT and IPC_EXCL were specified in msgflg, but a
                 message queue already exists for key.

          ENOENT No message queue exists for key and msgflg did not specify
                 IPC_CREAT.

          ENOMEM A message queue has to be created but the system does not
                 have enough memory for the new data structure.

          ENOSPC A message queue has to be created but the system limit for
                 the maximum number of message queues (MSGMNI) would be
                 exceeded.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4.


---------------------------------------------------

::

          IPC_PRIVATE isn't a flag field but a key_t type.  If this special
          value is used for key, the system call ignores everything but the
          least significant 9 bits of msgflg and creates a new message
          queue (on success).

          The following is a system limit on message queue resources
          affecting a msgget() call:

          MSGMNI System-wide limit on the number of message queues.  Before
                 Linux 3.19, the default value for this limit was
                 calculated using a formula based on available system
                 memory.  Since Linux 3.19, the default value is 32,000.
                 On Linux, this limit can be read and modified via
                 /proc/sys/kernel/msgmni.

      Linux notes
          Until version 2.3.20, Linux would return EIDRM for a msgget() on
          a message queue scheduled for deletion.


-------------------------------------------------

::

          The name choice IPC_PRIVATE was perhaps unfortunate, IPC_NEW
          would more clearly show its function.


---------------------------------------------------------

::

          msgctl(2), msgrcv(2), msgsnd(2), ftok(3), capabilities(7),
          mq_overview(7), sysvipc(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      MSGGET(2)

--------------

Pages that refer to this page: `ipcrm(1) <../man1/ipcrm.1.html>`__, 
`ipc(2) <../man2/ipc.2.html>`__, 
`msgctl(2) <../man2/msgctl.2.html>`__, 
`msgop(2) <../man2/msgop.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`umask(2) <../man2/umask.2.html>`__, 
`ftok(3) <../man3/ftok.3.html>`__, 
`mq_overview(7) <../man7/mq_overview.7.html>`__, 
`sysvipc(7) <../man7/sysvipc.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/msgget.2.license.html>`__

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
