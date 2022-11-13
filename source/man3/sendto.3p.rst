.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sendto(3p) — Linux manual page
==============================

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

   SENDTO(3P)              POSIX Programmer's Manual             SENDTO(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sendto — send a message on a socket


---------------------------------------------------------

::

          #include <sys/socket.h>

          ssize_t sendto(int socket, const void *message, size_t length,
              int flags, const struct sockaddr *dest_addr,
              socklen_t dest_len);


---------------------------------------------------------------

::

          The sendto() function shall send a message through a connection-
          mode or connectionless-mode socket.

          If the socket is a connectionless-mode socket, the message shall
          be sent to the address specified by dest_addr if no pre-specified
          peer address has been set. If a peer address has been pre-
          specified, either the message shall be sent to the address
          specified by dest_addr (overriding the pre-specified peer
          address), or the function shall return -1 and set errno to
          [EISCONN].

          If the socket is connection-mode, dest_addr shall be ignored.

          The sendto() function takes the following arguments:

          socket      Specifies the socket file descriptor.

          message     Points to a buffer containing the message to be sent.

          length      Specifies the size of the message in bytes.

          flags       Specifies the type of message transmission. Values of
                      this argument are formed by logically OR'ing zero or
                      more of the following flags:

                      MSG_EOR       Terminates a record (if supported by
                                    the protocol).

                      MSG_OOB       Sends out-of-band data on sockets that
                                    support out-of-band data. The
                                    significance and semantics of out-of-
                                    band data are protocol-specific.

                      MSG_NOSIGNAL  Requests not to send the SIGPIPE signal
                                    if an attempt to send is made on a
                                    stream-oriented socket that is no
                                    longer connected. The [EPIPE] error
                                    shall still be returned.

          dest_addr   Points to a sockaddr structure containing the
                      destination address. The length and format of the
                      address depend on the address family of the socket.

          dest_len    Specifies the length of the sockaddr structure
                      pointed to by the dest_addr argument.

          If the socket protocol supports broadcast and the specified
          address is a broadcast address for the socket protocol, sendto()
          shall fail if the SO_BROADCAST option is not set for the socket.

          The dest_addr argument specifies the address of the target.

          The length argument specifies the length of the message.

          Successful completion of a call to sendto() does not guarantee
          delivery of the message. A return value of -1 indicates only
          locally-detected errors.

          If space is not available at the sending socket to hold the
          message to be transmitted and the socket file descriptor does not
          have O_NONBLOCK set, sendto() shall block until space is
          available. If space is not available at the sending socket to
          hold the message to be transmitted and the socket file descriptor
          does have O_NONBLOCK set, sendto() shall fail.

          The socket in use may require the process to have appropriate
          privileges to use the sendto() function.


-----------------------------------------------------------------

::

          Upon successful completion, sendto() shall return the number of
          bytes sent. Otherwise, -1 shall be returned and errno set to
          indicate the error.


-----------------------------------------------------

::

          The sendto() function shall fail if:

          EAFNOSUPPORT
                 Addresses in the specified address family cannot be used
                 with this socket.

          EAGAIN or EWOULDBLOCK
                 The socket's file descriptor is marked O_NONBLOCK and the
                 requested operation would block.

          EBADF  The socket argument is not a valid file descriptor.

          ECONNRESET
                 A connection was forcibly closed by a peer.

          EINTR  A signal interrupted sendto() before any data was
                 transmitted.

          EMSGSIZE
                 The message is too large to be sent all at once, as the
                 socket requires.

          ENOTCONN
                 The socket is connection-mode but is not connected.

          ENOTSOCK
                 The socket argument does not refer to a socket.

          EOPNOTSUPP
                 The socket argument is associated with a socket that does
                 not support one or more of the values set in flags.

          EPIPE  The socket is shut down for writing, or the socket is
                 connection-mode and is no longer connected. In the latter
                 case, and if the socket is of type SOCK_STREAM or
                 SOCK_SEQPACKET and the MSG_NOSIGNAL flag is not set, the
                 SIGPIPE signal is generated to the calling thread.

          If the address family of the socket is AF_UNIX, then sendto()
          shall fail if:

          EIO    An I/O error occurred while reading from or writing to the
                 file system.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the pathname in the socket address.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of the pathname does not name an existing file
                 or the pathname is an empty string.

          ENOTDIR
                 A component of the path prefix of the pathname in the
                 socket address names an existing file that is neither a
                 directory nor a symbolic link to a directory, or the
                 pathname in the socket address contains at least one
                 non-<slash> character and ends with one or more trailing
                 <slash> characters and the last pathname component names
                 an existing file that is neither a directory nor a
                 symbolic link to a directory.

          The sendto() function may fail if:

          EACCES Search permission is denied for a component of the path
                 prefix; or write access to the named socket is denied.

          EDESTADDRREQ
                 The socket is not connection-mode and does not have its
                 peer address set, and no destination address was
                 specified.

          EHOSTUNREACH
                 The destination host cannot be reached (probably because
                 the host is down or a remote router cannot reach it).

          EINVAL The dest_len argument is not a valid length for the
                 address family.

          EIO    An I/O error occurred while reading from or writing to the
                 file system.

          EISCONN
                 A destination address was specified and the socket is
                 already connected.

          ENETDOWN
                 The local network interface used to reach the destination
                 is down.

          ENETUNREACH
                 No route to the network is present.

          ENOBUFS
                 Insufficient resources were available in the system to
                 perform the operation.

          ENOMEM Insufficient memory was available to fulfill the request.

          If the address family of the socket is AF_UNIX, then sendto() may
          fail if:

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the pathname in the socket address.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The select() and poll() functions can be used to determine when
          it is possible to send more data.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          getsockopt(3p), poll(3p), pselect(3p), recv(3p), recvfrom(3p),
          recvmsg(3p), send(3p), sendmsg(3p), setsockopt(3p), shutdown(3p),
          socket(3p)

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

   IEEE/The Open Group               2017                        SENDTO(3P)

--------------

Pages that refer to this page:
`netinet_in.h(0p) <../man0/netinet_in.h.0p.html>`__, 
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`recv(3p) <../man3/recv.3p.html>`__, 
`recvfrom(3p) <../man3/recvfrom.3p.html>`__, 
`recvmsg(3p) <../man3/recvmsg.3p.html>`__, 
`send(3p) <../man3/send.3p.html>`__, 
`sendmsg(3p) <../man3/sendmsg.3p.html>`__, 
`shutdown(3p) <../man3/shutdown.3p.html>`__

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
