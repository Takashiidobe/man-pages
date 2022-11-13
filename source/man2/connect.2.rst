.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

connect(2) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CONNECT(2)              Linux Programmer's Manual             CONNECT(2)

NAME
-------------------------------------------------

::

          connect - initiate a connection on a socket


---------------------------------------------------------

::

          #include <sys/socket.h>

          int connect(int sockfd, const struct sockaddr *addr,
                      socklen_t addrlen);


---------------------------------------------------------------

::

          The connect() system call connects the socket referred to by the
          file descriptor sockfd to the address specified by addr.  The
          addrlen argument specifies the size of addr.  The format of the
          address in addr is determined by the address space of the socket
          sockfd; see socket(2) for further details.

          If the socket sockfd is of type SOCK_DGRAM, then addr is the
          address to which datagrams are sent by default, and the only
          address from which datagrams are received.  If the socket is of
          type SOCK_STREAM or SOCK_SEQPACKET, this call attempts to make a
          connection to the socket that is bound to the address specified
          by addr.

          Some protocol sockets (e.g., UNIX domain stream sockets) may
          successfully connect() only once.

          Some protocol sockets (e.g., datagram sockets in the UNIX and
          Internet domains) may use connect() multiple times to change
          their association.

          Some protocol sockets (e.g., TCP sockets as well as datagram
          sockets in the UNIX and Internet domains) may dissolve the
          association by connecting to an address with the sa_family member
          of sockaddr set to AF_UNSPEC; thereafter, the socket can be
          connected to another address.  (AF_UNSPEC is supported on Linux
          since kernel 2.2.)


-----------------------------------------------------------------

::

          If the connection or binding succeeds, zero is returned.  On
          error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          The following are general socket errors only.  There may be other
          domain-specific error codes.

          EACCES For UNIX domain sockets, which are identified by pathname:
                 Write permission is denied on the socket file, or search
                 permission is denied for one of the directories in the
                 path prefix.  (See also path_resolution(7).)

          EACCES, EPERM
                 The user tried to connect to a broadcast address without
                 having the socket broadcast flag enabled or the connection
                 request failed because of a local firewall rule.

                 EACCES can also be returned if an SELinux policy denied a
                 connection (for example, if there is a policy saying that
                 an HTTP proxy can only connect to ports associated with
                 HTTP servers, and the proxy tries to connect to a
                 different port).  dd

          EADDRINUSE
                 Local address is already in use.

          EADDRNOTAVAIL
                 (Internet domain sockets) The socket referred to by sockfd
                 had not previously been bound to an address and, upon
                 attempting to bind it to an ephemeral port, it was
                 determined that all port numbers in the ephemeral port
                 range are currently in use.  See the discussion of
                 /proc/sys/net/ipv4/ip_local_port_range in ip(7).

          EAFNOSUPPORT
                 The passed address didn't have the correct address family
                 in its sa_family field.

          EAGAIN For nonblocking UNIX domain sockets, the socket is
                 nonblocking, and the connection cannot be completed
                 immediately.  For other socket families, there are
                 insufficient entries in the routing cache.

          EALREADY
                 The socket is nonblocking and a previous connection
                 attempt has not yet been completed.

          EBADF  sockfd is not a valid open file descriptor.

          ECONNREFUSED
                 A connect() on a stream socket found no one listening on
                 the remote address.

          EFAULT The socket structure address is outside the user's address
                 space.

          EINPROGRESS
                 The socket is nonblocking and the connection cannot be
                 completed immediately.  (UNIX domain sockets failed with
                 EAGAIN instead.)  It is possible to select(2) or poll(2)
                 for completion by selecting the socket for writing.  After
                 select(2) indicates writability, use getsockopt(2) to read
                 the SO_ERROR option at level SOL_SOCKET to determine
                 whether connect() completed successfully (SO_ERROR is
                 zero) or unsuccessfully (SO_ERROR is one of the usual
                 error codes listed here, explaining the reason for the
                 failure).

          EINTR  The system call was interrupted by a signal that was
                 caught; see signal(7).

          EISCONN
                 The socket is already connected.

          ENETUNREACH
                 Network is unreachable.

          ENOTSOCK
                 The file descriptor sockfd does not refer to a socket.

          EPROTOTYPE
                 The socket type does not support the requested
                 communications protocol.  This error can occur, for
                 example, on an attempt to connect a UNIX domain datagram
                 socket to a stream socket.

          ETIMEDOUT
                 Timeout while attempting connection.  The server may be
                 too busy to accept new connections.  Note that for IP
                 sockets the timeout may be very long when syncookies are
                 enabled on the server.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.4BSD, (connect() first
          appeared in 4.2BSD).


---------------------------------------------------

::

          For background on the socklen_t type, see accept(2).

          If connect() fails, consider the state of the socket as
          unspecified.  Portable applications should close the socket and
          create a new one for reconnecting.


---------------------------------------------------------

::

          An example of the use of connect() is shown in getaddrinfo(3).


---------------------------------------------------------

::

          accept(2), bind(2), getsockname(2), listen(2), socket(2),
          path_resolution(7), selinux(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     CONNECT(2)

--------------

Pages that refer to this page:
`telnet-probe(1) <../man1/telnet-probe.1.html>`__, 
`accept(2) <../man2/accept.2.html>`__, 
`bind(2) <../man2/bind.2.html>`__, 
`getpeername(2) <../man2/getpeername.2.html>`__, 
`listen(2) <../man2/listen.2.html>`__, 
`recv(2) <../man2/recv.2.html>`__, 
`select(2) <../man2/select.2.html>`__, 
`select_tut(2) <../man2/select_tut.2.html>`__, 
`shutdown(2) <../man2/shutdown.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`socketcall(2) <../man2/socketcall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`write(2) <../man2/write.2.html>`__, 
`getaddrinfo(3) <../man3/getaddrinfo.3.html>`__, 
`ldap_get_option(3) <../man3/ldap_get_option.3.html>`__, 
`rtime(3) <../man3/rtime.3.html>`__, 
`slapd-asyncmeta(5) <../man5/slapd-asyncmeta.5.html>`__, 
`slapd-ldap(5) <../man5/slapd-ldap.5.html>`__, 
`slapd-meta(5) <../man5/slapd-meta.5.html>`__, 
`ddp(7) <../man7/ddp.7.html>`__,  `ip(7) <../man7/ip.7.html>`__, 
`netlink(7) <../man7/netlink.7.html>`__, 
`packet(7) <../man7/packet.7.html>`__, 
`sctp(7) <../man7/sctp.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`sock_diag(7) <../man7/sock_diag.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`tcp(7) <../man7/tcp.7.html>`__,  `udp(7) <../man7/udp.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__,  `vsock(7) <../man7/vsock.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/connect.2.license.html>`__

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
