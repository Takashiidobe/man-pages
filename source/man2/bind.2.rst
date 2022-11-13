.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bind(2) — Linux manual page
===========================

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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BIND(2)                 Linux Programmer's Manual                BIND(2)

NAME
-------------------------------------------------

::

          bind - bind a name to a socket


---------------------------------------------------------

::

          #include <sys/socket.h>

          int bind(int sockfd, const struct sockaddr *addr,
                   socklen_t addrlen);


---------------------------------------------------------------

::

          When a socket is created with socket(2), it exists in a name
          space (address family) but has no address assigned to it.  bind()
          assigns the address specified by addr to the socket referred to
          by the file descriptor sockfd.  addrlen specifies the size, in
          bytes, of the address structure pointed to by addr.
          Traditionally, this operation is called “assigning a name to a
          socket”.

          It is normally necessary to assign a local address using bind()
          before a SOCK_STREAM socket may receive connections (see
          accept(2)).

          The rules used in name binding vary between address families.
          Consult the manual entries in Section 7 for detailed information.
          For AF_INET, see ip(7); for AF_INET6, see ipv6(7); for AF_UNIX,
          see unix(7); for AF_APPLETALK, see ddp(7); for AF_PACKET, see
          packet(7); for AF_X25, see x25(7); and for AF_NETLINK, see
          netlink(7).

          The actual structure passed for the addr argument will depend on
          the address family.  The sockaddr structure is defined as
          something like:

              struct sockaddr {
                  sa_family_t sa_family;
                  char        sa_data[14];
              }

          The only purpose of this structure is to cast the structure
          pointer passed in addr in order to avoid compiler warnings.  See
          EXAMPLES below.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES The address is protected, and the user is not the
                 superuser.

          EADDRINUSE
                 The given address is already in use.

          EADDRINUSE
                 (Internet domain sockets) The port number was specified as
                 zero in the socket address structure, but, upon attempting
                 to bind to an ephemeral port, it was determined that all
                 port numbers in the ephemeral port range are currently in
                 use.  See the discussion of
                 /proc/sys/net/ipv4/ip_local_port_range ip(7).

          EBADF  sockfd is not a valid file descriptor.

          EINVAL The socket is already bound to an address.

          EINVAL addrlen is wrong, or addr is not a valid address for this
                 socket's domain.

          ENOTSOCK
                 The file descriptor sockfd does not refer to a socket.

          The following errors are specific to UNIX domain (AF_UNIX)
          sockets:

          EACCES Search permission is denied on a component of the path
                 prefix.  (See also path_resolution(7).)

          EADDRNOTAVAIL
                 A nonexistent interface was requested or the requested
                 address was not local.

          EFAULT addr points outside the user's accessible address space.

          ELOOP  Too many symbolic links were encountered in resolving
                 addr.

          ENAMETOOLONG
                 addr is too long.

          ENOENT A component in the directory prefix of the socket pathname
                 does not exist.

          ENOMEM Insufficient kernel memory was available.

          ENOTDIR
                 A component of the path prefix is not a directory.

          EROFS  The socket inode would reside on a read-only filesystem.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.4BSD (bind() first appeared
          in 4.2BSD).


---------------------------------------------------

::

          For background on the socklen_t type, see accept(2).


-------------------------------------------------

::

          The transparent proxy options are not described.


---------------------------------------------------------

::

          An example of the use of bind() with Internet domain sockets can
          be found in getaddrinfo(3).

          The following example shows how to bind a stream socket in the
          UNIX (AF_UNIX) domain, and accept connections:

          #include <sys/socket.h>
          #include <sys/un.h>
          #include <stdlib.h>
          #include <stdio.h>
          #include <string.h>

          #define MY_SOCK_PATH "/somepath"
          #define LISTEN_BACKLOG 50

          #define handle_error(msg) \
              do { perror(msg); exit(EXIT_FAILURE); } while (0)

          int
          main(int argc, char *argv[])
          {
              int sfd, cfd;
              struct sockaddr_un my_addr, peer_addr;
              socklen_t peer_addr_size;

              sfd = socket(AF_UNIX, SOCK_STREAM, 0);
              if (sfd == -1)
                  handle_error("socket");

              memset(&my_addr, 0, sizeof(my_addr));
              my_addr.sun_family = AF_UNIX;
              strncpy(my_addr.sun_path, MY_SOCK_PATH,
                      sizeof(my_addr.sun_path) - 1);

              if (bind(sfd, (struct sockaddr *) &my_addr,
                      sizeof(my_addr)) == -1)
                  handle_error("bind");

              if (listen(sfd, LISTEN_BACKLOG) == -1)
                  handle_error("listen");

              /* Now we can accept incoming connections one
                 at a time using accept(2). */

              peer_addr_size = sizeof(peer_addr);
              cfd = accept(sfd, (struct sockaddr *) &peer_addr,
                           &peer_addr_size);
              if (cfd == -1)
                  handle_error("accept");

              /* Code to deal with incoming connection(s)... */

              /* When no longer required, the socket pathname, MY_SOCK_PATH
                 should be deleted using unlink(2) or remove(3). */
          }


---------------------------------------------------------

::

          accept(2), connect(2), getsockname(2), listen(2), socket(2),
          getaddrinfo(3), getifaddrs(3), ip(7), ipv6(7),
          path_resolution(7), socket(7), unix(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        BIND(2)

--------------

Pages that refer to this page: `accept(2) <../man2/accept.2.html>`__, 
`connect(2) <../man2/connect.2.html>`__, 
`getpeername(2) <../man2/getpeername.2.html>`__, 
`getsockname(2) <../man2/getsockname.2.html>`__, 
`listen(2) <../man2/listen.2.html>`__, 
`pidfd_getfd(2) <../man2/pidfd_getfd.2.html>`__, 
`seccomp_unotify(2) <../man2/seccomp_unotify.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`socketcall(2) <../man2/socketcall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`bindresvport(3) <../man3/bindresvport.3.html>`__, 
`getaddrinfo(3) <../man3/getaddrinfo.3.html>`__, 
`getifaddrs(3) <../man3/getifaddrs.3.html>`__, 
`if_nameindex(3) <../man3/if_nameindex.3.html>`__, 
`sctp_bindx(3) <../man3/sctp_bindx.3.html>`__, 
`services(5) <../man5/services.5.html>`__, 
`systemd.socket(5) <../man5/systemd.socket.5.html>`__, 
`ddp(7) <../man7/ddp.7.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`ip(7) <../man7/ip.7.html>`__,  `ipv6(7) <../man7/ipv6.7.html>`__, 
`netlink(7) <../man7/netlink.7.html>`__, 
`packet(7) <../man7/packet.7.html>`__, 
`raw(7) <../man7/raw.7.html>`__,  `sctp(7) <../man7/sctp.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`sock_diag(7) <../man7/sock_diag.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`tcp(7) <../man7/tcp.7.html>`__,  `udp(7) <../man7/udp.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__,  `vsock(7) <../man7/vsock.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/bind.2.license.html>`__

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
