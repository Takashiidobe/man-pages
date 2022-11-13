.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

socketcall(2) — Linux manual page
=================================

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

   SOCKETCALL(2)           Linux Programmer's Manual          SOCKETCALL(2)

NAME
-------------------------------------------------

::

          socketcall - socket system calls


---------------------------------------------------------

::

          #include <linux/net.h>        /* Definition of SYS_* constants */
          #include <sys/syscall.h>      /* Definition of SYS_socketcall */
          #include <unistd.h>

          int syscall(SYS_socketcall, int call, unsigned long *args);

          Note: glibc provides no wrapper for socketcall(), necessitating
          the use of syscall(2).


---------------------------------------------------------------

::

          socketcall() is a common kernel entry point for the socket system
          calls.  call determines which socket function to invoke.  args
          points to a block containing the actual arguments, which are
          passed through to the appropriate call.

          User programs should call the appropriate functions by their
          usual names.  Only standard library implementors and kernel
          hackers need to know about socketcall().

          call              Man page
          SYS_SOCKET        socket(2)
          SYS_BIND          bind(2)
          SYS_CONNECT       connect(2)
          SYS_LISTEN        listen(2)
          SYS_ACCEPT        accept(2)
          SYS_GETSOCKNAME   getsockname(2)
          SYS_GETPEERNAME   getpeername(2)
          SYS_SOCKETPAIR    socketpair(2)
          SYS_SEND          send(2)
          SYS_RECV          recv(2)
          SYS_SENDTO        sendto(2)
          SYS_RECVFROM      recvfrom(2)
          SYS_SHUTDOWN      shutdown(2)
          SYS_SETSOCKOPT    setsockopt(2)
          SYS_GETSOCKOPT    getsockopt(2)
          SYS_SENDMSG       sendmsg(2)
          SYS_RECVMSG       recvmsg(2)
          SYS_ACCEPT4       accept4(2)
          SYS_RECVMMSG      recvmmsg(2)
          SYS_SENDMMSG      sendmmsg(2)


-------------------------------------------------------------------

::

          This call is specific to Linux, and should not be used in
          programs intended to be portable.


---------------------------------------------------

::

          On some architectures—for example, x86-64 and ARM—there is no
          socketcall() system call; instead socket(2), accept(2), bind(2),
          and so on really are implemented as separate system calls.

          On x86-32, socketcall() was historically the only entry point for
          the sockets API.  However, starting in Linux 4.3, direct system
          calls are provided on x86-32 for the sockets API.  This
          facilitates the creation of seccomp(2) filters that filter
          sockets system calls (for new user-space binaries that are
          compiled to use the new entry points) and also provides a (very)
          small performance improvement.


---------------------------------------------------------

::

          accept(2), bind(2), connect(2), getpeername(2), getsockname(2),
          getsockopt(2), listen(2), recv(2), recvfrom(2), recvmsg(2),
          send(2), sendmsg(2), sendto(2), setsockopt(2), shutdown(2),
          socket(2), socketpair(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  SOCKETCALL(2)

--------------

Pages that refer to this page:
`syscalls(2) <../man2/syscalls.2.html>`__, 
`seccomp_syscall_resolve_name(3) <../man3/seccomp_syscall_resolve_name.3.html>`__

--------------

`Copyright and license for this manual
page <../man2/socketcall.2.license.html>`__

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
