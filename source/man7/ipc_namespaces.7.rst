.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ipc_namespaces(7) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IPC_NAMESPACES(7)       Linux Programmer's Manual      IPC_NAMESPACES(7)

NAME
-------------------------------------------------

::

          ipc_namespaces - overview of Linux IPC namespaces


---------------------------------------------------------------

::

          IPC namespaces isolate certain IPC resources, namely, System V
          IPC objects (see sysvipc(7)) and (since Linux 2.6.30) POSIX
          message queues (see mq_overview(7)).  The common characteristic
          of these IPC mechanisms is that IPC objects are identified by
          mechanisms other than filesystem pathnames.

          Each IPC namespace has its own set of System V IPC identifiers
          and its own POSIX message queue filesystem.  Objects created in
          an IPC namespace are visible to all other processes that are
          members of that namespace, but are not visible to processes in
          other IPC namespaces.

          The following /proc interfaces are distinct in each IPC
          namespace:

          *  The POSIX message queue interfaces in /proc/sys/fs/mqueue.

          *  The System V IPC interfaces in /proc/sys/kernel, namely:
             msgmax, msgmnb, msgmni, sem, shmall, shmmax, shmmni, and
             shm_rmid_forced.

          *  The System V IPC interfaces in /proc/sysvipc.

          When an IPC namespace is destroyed (i.e., when the last process
          that is a member of the namespace terminates), all IPC objects in
          the namespace are automatically destroyed.

          Use of IPC namespaces requires a kernel that is configured with
          the CONFIG_IPC_NS option.


---------------------------------------------------------

::

          nsenter(1), unshare(1), clone(2), setns(2), unshare(2),
          mq_overview(7), namespaces(7), sysvipc(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2019-08-02              IPC_NAMESPACES(7)

--------------

Pages that refer to this page: `nsenter(1) <../man1/nsenter.1.html>`__, 
`unshare(1) <../man1/unshare.1.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`mq_overview(7) <../man7/mq_overview.7.html>`__, 
`namespaces(7) <../man7/namespaces.7.html>`__, 
`sysvipc(7) <../man7/sysvipc.7.html>`__

--------------

`Copyright and license for this manual
page <../man7/ipc_namespaces.7.license.html>`__

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
