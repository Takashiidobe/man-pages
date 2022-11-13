.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

listen(2) — Linux manual page
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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LISTEN(2)               Linux Programmer's Manual              LISTEN(2)

NAME
-------------------------------------------------

::

          listen - listen for connections on a socket


---------------------------------------------------------

::

          #include <sys/socket.h>

          int listen(int sockfd, int backlog);


---------------------------------------------------------------

::

          listen() marks the socket referred to by sockfd as a passive
          socket, that is, as a socket that will be used to accept incoming
          connection requests using accept(2).

          The sockfd argument is a file descriptor that refers to a socket
          of type SOCK_STREAM or SOCK_SEQPACKET.

          The backlog argument defines the maximum length to which the
          queue of pending connections for sockfd may grow.  If a
          connection request arrives when the queue is full, the client may
          receive an error with an indication of ECONNREFUSED or, if the
          underlying protocol supports retransmission, the request may be
          ignored so that a later reattempt at connection succeeds.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EADDRINUSE
                 Another socket is already listening on the same port.

          EADDRINUSE
                 (Internet domain sockets) The socket referred to by sockfd
                 had not previously been bound to an address and, upon
                 attempting to bind it to an ephemeral port, it was
                 determined that all port numbers in the ephemeral port
                 range are currently in use.  See the discussion of
                 /proc/sys/net/ipv4/ip_local_port_range in ip(7).

          EBADF  The argument sockfd is not a valid file descriptor.

          ENOTSOCK
                 The file descriptor sockfd does not refer to a socket.

          EOPNOTSUPP
                 The socket is not of a type that supports the listen()
                 operation.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.4BSD (listen() first appeared in
          4.2BSD).


---------------------------------------------------

::

          To accept connections, the following steps are performed:

              1.  A socket is created with socket(2).

              2.  The socket is bound to a local address using bind(2), so
                  that other sockets may be connect(2)ed to it.

              3.  A willingness to accept incoming connections and a queue
                  limit for incoming connections are specified with
                  listen().

              4.  Connections are accepted with accept(2).

          The behavior of the backlog argument on TCP sockets changed with
          Linux 2.2.  Now it specifies the queue length for completely
          established sockets waiting to be accepted, instead of the number
          of incomplete connection requests.  The maximum length of the
          queue for incomplete sockets can be set using
          /proc/sys/net/ipv4/tcp_max_syn_backlog.  When syncookies are
          enabled there is no logical maximum length and this setting is
          ignored.  See tcp(7) for more information.

          If the backlog argument is greater than the value in
          /proc/sys/net/core/somaxconn, then it is silently capped to that
          value.  Since Linux 5.4, the default in this file is 4096; in
          earlier kernels, the default value is 128.  In kernels before
          2.4.25, this limit was a hard coded value, SOMAXCONN, with the
          value 128.


---------------------------------------------------------

::

          See bind(2).


---------------------------------------------------------

::

          accept(2), bind(2), connect(2), socket(2), socket(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      LISTEN(2)

--------------

Pages that refer to this page: `accept(2) <../man2/accept.2.html>`__, 
`bind(2) <../man2/bind.2.html>`__, 
`connect(2) <../man2/connect.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`socketcall(2) <../man2/socketcall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`services(5) <../man5/services.5.html>`__, 
`systemd.socket(5) <../man5/systemd.socket.5.html>`__, 
`epoll(7) <../man7/epoll.7.html>`__,  `ip(7) <../man7/ip.7.html>`__, 
`sctp(7) <../man7/sctp.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`sock_diag(7) <../man7/sock_diag.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`tcp(7) <../man7/tcp.7.html>`__,  `vsock(7) <../man7/vsock.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/listen.2.license.html>`__

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
