.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ipc(2) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IPC(2)                  Linux Programmer's Manual                 IPC(2)

NAME
-------------------------------------------------

::

          ipc - System V IPC system calls


---------------------------------------------------------

::

          #include <linux/ipc.h>        /* Definition of needed constants */
          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_ipc, unsigned int call, int first,
                      unsigned long second, unsigned long third, void *ptr,
                      long fifth);

          Note: glibc provides no wrapper for ipc(), necessitating the use
          of syscall(2).


---------------------------------------------------------------

::

          ipc() is a common kernel entry point for the System V IPC calls
          for messages, semaphores, and shared memory.  call determines
          which IPC function to invoke; the other arguments are passed
          through to the appropriate call.

          User-space programs should call the appropriate functions by
          their usual names.  Only standard library implementors and kernel
          hackers need to know about ipc().


-------------------------------------------------------------------

::

          ipc() is Linux-specific, and should not be used in programs
          intended to be portable.


---------------------------------------------------

::

          On some architectures—for example x86-64 and ARM—there is no
          ipc() system call; instead, msgctl(2), semctl(2), shmctl(2), and
          so on really are implemented as separate system calls.


---------------------------------------------------------

::

          msgctl(2), msgget(2), msgrcv(2), msgsnd(2), semctl(2), semget(2),
          semop(2), semtimedop(2), shmat(2), shmctl(2), shmdt(2),
          shmget(2), sysvipc(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                         IPC(2)

--------------

Pages that refer to this page: `semctl(2) <../man2/semctl.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unimplemented(2) <../man2/unimplemented.2.html>`__, 
`seccomp_syscall_resolve_name(3) <../man3/seccomp_syscall_resolve_name.3.html>`__, 
`sysvipc(7) <../man7/sysvipc.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/ipc.2.license.html>`__

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
