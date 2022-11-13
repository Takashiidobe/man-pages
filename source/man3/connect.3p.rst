.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

connect(3p) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
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

   CONNECT(3P)             POSIX Programmer's Manual            CONNECT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          connect — connect a socket


---------------------------------------------------------

::

          #include <sys/socket.h>

          int connect(int socket, const struct sockaddr *address,
              socklen_t address_len);


---------------------------------------------------------------

::

          The connect() function shall attempt to make a connection on a
          connection-mode socket or to set or reset the peer address of a
          connectionless-mode socket. The function takes the following
          arguments:

          socket      Specifies the file descriptor associated with the
                      socket.

          address     Points to a sockaddr structure containing the peer
                      address. The length and format of the address depend
                      on the address family of the socket.

          address_len Specifies the length of the sockaddr structure
                      pointed to by the address argument.

          If the socket has not already been bound to a local address,
          connect() shall bind it to an address which, unless the socket's
          address family is AF_UNIX, is an unused local address.

          If the initiating socket is not connection-mode, then connect()
          shall set the socket's peer address, and no connection is made.
          For SOCK_DGRAM sockets, the peer address identifies where all
          datagrams are sent on subsequent send() functions, and limits the
          remote sender for subsequent recv() functions. If the sa_family
          member of address is AF_UNSPEC, the socket's peer address shall
          be reset. Note that despite no connection being made, the term
          ``connected'' is used to describe a connectionless-mode socket
          for which a peer address has been set.

          If the initiating socket is connection-mode, then connect() shall
          attempt to establish a connection to the address specified by the
          address argument. If the connection cannot be established
          immediately and O_NONBLOCK is not set for the file descriptor for
          the socket, connect() shall block for up to an unspecified
          timeout interval until the connection is established. If the
          timeout interval expires before the connection is established,
          connect() shall fail and the connection attempt shall be aborted.
          If connect() is interrupted by a signal that is caught while
          blocked waiting to establish a connection, connect() shall fail
          and set errno to [EINTR], but the connection request shall not be
          aborted, and the connection shall be established asynchronously.

          If the connection cannot be established immediately and
          O_NONBLOCK is set for the file descriptor for the socket,
          connect() shall fail and set errno to [EINPROGRESS], but the
          connection request shall not be aborted, and the connection shall
          be established asynchronously. Subsequent calls to connect() for
          the same socket, before the connection is established, shall fail
          and set errno to [EALREADY].

          When the connection has been established asynchronously,
          pselect(), select(), and poll() shall indicate that the file
          descriptor for the socket is ready for writing.

          The socket in use may require the process to have appropriate
          privileges to use the connect() function.


-----------------------------------------------------------------

::

          Upon successful completion, connect() shall return 0; otherwise,
          -1 shall be returned and errno set to indicate the error.


-----------------------------------------------------

::

          The connect() function shall fail if:

          EADDRNOTAVAIL
                 The specified address is not available from the local
                 machine.

          EAFNOSUPPORT
                 The specified address is not a valid address for the
                 address family of the specified socket.

          EALREADY
                 A connection request is already in progress for the
                 specified socket.

          EBADF  The socket argument is not a valid file descriptor.

          ECONNREFUSED
                 The target address was not listening for connections or
                 refused the connection request.

          EINPROGRESS
                 O_NONBLOCK is set for the file descriptor for the socket
                 and the connection cannot be immediately established; the
                 connection shall be established asynchronously.

          EINTR  The attempt to establish a connection was interrupted by
                 delivery of a signal that was caught; the connection shall
                 be established asynchronously.

          EISCONN
                 The specified socket is connection-mode and is already
                 connected.

          ENETUNREACH
                 No route to the network is present.

          ENOTSOCK
                 The socket argument does not refer to a socket.

          EPROTOTYPE
                 The specified address has a different type than the socket
                 bound to the specified peer address.

          ETIMEDOUT
                 The attempt to connect timed out before a connection was
                 made.

          If the address family of the socket is AF_UNIX, then connect()
          shall fail if:

          EIO    An I/O error occurred while reading from or writing to the
                 file system.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the pathname in address.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of the pathname does not name an existing file
                 or the pathname is an empty string.

          ENOTDIR
                 A component of the path prefix of the pathname in address
                 names an existing file that is neither a directory nor a
                 symbolic link to a directory, or the pathname in address
                 contains at least one non-<slash> character and ends with
                 one or more trailing <slash> characters and the last
                 pathname component names an existing file that is neither
                 a directory nor a symbolic link to a directory.

          The connect() function may fail if:

          EACCES Search permission is denied for a component of the path
                 prefix; or write access to the named socket is denied.

          EADDRINUSE
                 Attempt to establish a connection that uses addresses that
                 are already in use.

          ECONNRESET
                 Remote host reset the connection request.

          EHOSTUNREACH
                 The destination host cannot be reached (probably because
                 the host is down or a remote router cannot reach it).

          EINVAL The address_len argument is not a valid length for the
                 address family; or invalid address family in the sockaddr
                 structure.

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the pathname in address.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          ENETDOWN
                 The local network interface used to reach the destination
                 is down.

          ENOBUFS
                 No buffer space is available.

          EOPNOTSUPP
                 The socket is listening and cannot be connected.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          If connect() fails, the state of the socket is unspecified.
          Conforming applications should close the file descriptor and
          create a new socket before attempting to reconnect.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          accept(3p), bind(3p), close(3p), getsockname(3p), poll(3p),
          pselect(3p), send(3p), shutdown(3p), socket(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_socket.h(0p)


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

   IEEE/The Open Group               2017                       CONNECT(3P)

--------------

Pages that refer to this page:
`netinet_in.h(0p) <../man0/netinet_in.h.0p.html>`__, 
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`accept(3p) <../man3/accept.3p.html>`__, 
`bind(3p) <../man3/bind.3p.html>`__, 
`freeaddrinfo(3p) <../man3/freeaddrinfo.3p.html>`__, 
`listen(3p) <../man3/listen.3p.html>`__, 
`pselect(3p) <../man3/pselect.3p.html>`__, 
`send(3p) <../man3/send.3p.html>`__, 
`socket(3p) <../man3/socket.3p.html>`__

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
