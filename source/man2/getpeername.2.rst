.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getpeername(2) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETPEERNAME(2)          Linux Programmer's Manual         GETPEERNAME(2)

NAME
-------------------------------------------------

::

          getpeername - get name of connected peer socket


---------------------------------------------------------

::

          #include <sys/socket.h>

          int getpeername(int sockfd, struct sockaddr *restrict addr,
                          socklen_t *restrict addrlen);


---------------------------------------------------------------

::

          getpeername() returns the address of the peer connected to the
          socket sockfd, in the buffer pointed to by addr.  The addrlen
          argument should be initialized to indicate the amount of space
          pointed to by addr.  On return it contains the actual size of the
          name returned (in bytes).  The name is truncated if the buffer
          provided is too small.

          The returned address is truncated if the buffer provided is too
          small; in this case, addrlen will return a value greater than was
          supplied to the call.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  The argument sockfd is not a valid file descriptor.

          EFAULT The addr argument points to memory not in a valid part of
                 the process address space.

          EINVAL addrlen is invalid (e.g., is negative).

          ENOBUFS
                 Insufficient resources were available in the system to
                 perform the operation.

          ENOTCONN
                 The socket is not connected.

          ENOTSOCK
                 The file descriptor sockfd does not refer to a socket.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.4BSD (getpeername() first
          appeared in 4.2BSD).


---------------------------------------------------

::

          For background on the socklen_t type, see accept(2).

          For stream sockets, once a connect(2) has been performed, either
          socket can call getpeername() to obtain the address of the peer
          socket.  On the other hand, datagram sockets are connectionless.
          Calling connect(2) on a datagram socket merely sets the peer
          address for outgoing datagrams sent with write(2) or recv(2).
          The caller of connect(2) can use getpeername() to obtain the peer
          address that it earlier set for the socket.  However, the peer
          socket is unaware of this information, and calling getpeername()
          on the peer socket will return no useful information (unless a
          connect(2) call was also executed on the peer).  Note also that
          the receiver of a datagram can obtain the address of the sender
          when using recvfrom(2).


---------------------------------------------------------

::

          accept(2), bind(2), getsockname(2), ip(7), socket(7), unix(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 GETPEERNAME(2)

--------------

Pages that refer to this page: `socket(2) <../man2/socket.2.html>`__, 
`socketcall(2) <../man2/socketcall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`getnameinfo(3) <../man3/getnameinfo.3.html>`__, 
`crypttab(5) <../man5/crypttab.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getpeername.2.license.html>`__

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
