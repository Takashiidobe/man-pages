.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sysvipc(7) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SVIPC(7)                Linux Programmer's Manual               SVIPC(7)

NAME
-------------------------------------------------

::

          sysvipc - System V interprocess communication mechanisms


---------------------------------------------------------------

::

          System V IPC is the name given to three interprocess
          communication mechanisms that are widely available on UNIX
          systems: message queues, semaphore, and shared memory.

      Message queues
          System V message queues allow data to be exchanged in units
          called messages.  Each messages can have an associated priority,
          POSIX message queues provide an alternative API for achieving the
          same result; see mq_overview(7).

          The System V message queue API consists of the following system
          calls:

          msgget(2)
                 Create a new message queue or obtain the ID of an existing
                 message queue.  This call returns an identifier that is
                 used in the remaining APIs.

          msgsnd(2)
                 Add a message to a queue.

          msgrcv(2)
                 Remove a message from a queue.

          msgctl(2)
                 Perform various control operations on a queue, including
                 deletion.

      Semaphore sets
          System V semaphores allow processes to synchronize their actions.
          System V semaphores are allocated in groups called sets; each
          semaphore in a set is a counting semaphore.  POSIX semaphores
          provide an alternative API for achieving the same result; see
          sem_overview(7).

          The System V semaphore API consists of the following system
          calls:

          semget(2)
                 Create a new set or obtain the ID of an existing set.
                 This call returns an identifier that is used in the
                 remaining APIs.

          semop(2)
                 Perform operations on the semaphores in a set.

          semctl(2)
                 Perform various control operations on a set, including
                 deletion.

      Shared memory segments
          System V shared memory allows processes to share a region a
          memory (a "segment").  POSIX shared memory is an alternative API
          for achieving the same result; see shm_overview(7).

          The System V shared memory API consists of the following system
          calls:

          shmget(2)
                 Create a new segment or obtain the ID of an existing
                 segment.  This call returns an identifier that is used in
                 the remaining APIs.

          shmat(2)
                 Attach an existing shared memory object into the calling
                 process's address space.

          shmdt(2)
                 Detach a segment from the calling process's address space.

          shmctl(2)
                 Perform various control operations on a segment, including
                 deletion.

      IPC namespaces
          For a discussion of the interaction of System V IPC objects and
          IPC namespaces, see ipc_namespaces(7).


---------------------------------------------------------

::

          ipcmk(1), ipcrm(1), ipcs(1), lsipc(1), ipc(2), msgctl(2),
          msgget(2), msgrcv(2), msgsnd(2), semctl(2), semget(2), semop(2),
          shmat(2), shmctl(2), shmdt(2), shmget(2), ftok(3),
          ipc_namespaces(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-04-11                       SVIPC(7)

--------------

Pages that refer to this page: `ipcmk(1) <../man1/ipcmk.1.html>`__, 
`ipcrm(1) <../man1/ipcrm.1.html>`__, 
`ipcs(1) <../man1/ipcs.1.html>`__, 
`lsipc(1) <../man1/lsipc.1.html>`__, 
`intro(2) <../man2/intro.2.html>`__,  `ipc(2) <../man2/ipc.2.html>`__, 
`msgctl(2) <../man2/msgctl.2.html>`__, 
`msgget(2) <../man2/msgget.2.html>`__, 
`msgop(2) <../man2/msgop.2.html>`__, 
`semctl(2) <../man2/semctl.2.html>`__, 
`semget(2) <../man2/semget.2.html>`__, 
`semop(2) <../man2/semop.2.html>`__, 
`shmctl(2) <../man2/shmctl.2.html>`__, 
`shmget(2) <../man2/shmget.2.html>`__, 
`shmop(2) <../man2/shmop.2.html>`__, 
`ftok(3) <../man3/ftok.3.html>`__,  `proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`ipc_namespaces(7) <../man7/ipc_namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/sysvipc.7.license.html>`__

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
