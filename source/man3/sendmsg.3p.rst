.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sendmsg(3p) — Linux manual page
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

   SENDMSG(3P)             POSIX Programmer's Manual            SENDMSG(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sendmsg — send a message on a socket using a message structure


---------------------------------------------------------

::

          #include <sys/socket.h>

          ssize_t sendmsg(int socket, const struct msghdr *message, int flags);


---------------------------------------------------------------

::

          The sendmsg() function shall send a message through a connection-
          mode or connectionless-mode socket. If the socket is a
          connectionless-mode socket, the message shall be sent to the
          address specified by msghdr if no pre-specified peer address has
          been set. If a peer address has been pre-specified, either the
          message shall be sent to the address specified in msghdr
          (overriding the pre-specified peer address), or the function
          shall return -1 and set errno to [EISCONN].  If the socket is
          connection-mode, the destination address in msghdr shall be
          ignored.

          The sendmsg() function takes the following arguments:

          socket      Specifies the socket file descriptor.

          message     Points to a msghdr structure, containing both the
                      destination address and the buffers for the outgoing
                      message. The length and format of the address depend
                      on the address family of the socket. The msg_flags
                      member is ignored.

          flags       Specifies the type of message transmission. The
                      application may specify 0 or the following flag:

                      MSG_EOR       Terminates a record (if supported by
                                    the protocol).

                      MSG_OOB       Sends out-of-band data on sockets that
                                    support out-of-bound data. The
                                    significance and semantics of out-of-
                                    band data are protocol-specific.

                      MSG_NOSIGNAL  Requests not to send the SIGPIPE signal
                                    if an attempt to send is made on a
                                    stream-oriented socket that is no
                                    longer connected. The [EPIPE] error
                                    shall still be returned.

          The msg_iov and msg_iovlen fields of message specify zero or more
          buffers containing the data to be sent.  msg_iov points to an
          array of iovec structures; msg_iovlen shall be set to the
          dimension of this array. In each iovec structure, the iov_base
          field specifies a storage area and the iov_len field gives its
          size in bytes. Some of these sizes can be zero. The data from
          each storage area indicated by msg_iov is sent in turn.

          Successful completion of a call to sendmsg() does not guarantee
          delivery of the message. A return value of -1 indicates only
          locally-detected errors.

          If space is not available at the sending socket to hold the
          message to be transmitted and the socket file descriptor does not
          have O_NONBLOCK set, the sendmsg() function shall block until
          space is available. If space is not available at the sending
          socket to hold the message to be transmitted and the socket file
          descriptor does have O_NONBLOCK set, the sendmsg() function shall
          fail.

          If the socket protocol supports broadcast and the specified
          address is a broadcast address for the socket protocol, sendmsg()
          shall fail if the SO_BROADCAST option is not set for the socket.

          The socket in use may require the process to have appropriate
          privileges to use the sendmsg() function.


-----------------------------------------------------------------

::

          Upon successful completion, sendmsg() shall return the number of
          bytes sent. Otherwise, -1 shall be returned and errno set to
          indicate the error.


-----------------------------------------------------

::

          The sendmsg() function shall fail if:

          EAGAIN or EWOULDBLOCK
                 The socket's file descriptor is marked O_NONBLOCK and the
                 requested operation would block.

          EAFNOSUPPORT
                 Addresses in the specified address family cannot be used
                 with this socket.

          EBADF  The socket argument is not a valid file descriptor.

          ECONNRESET
                 A connection was forcibly closed by a peer.

          EINTR  A signal interrupted sendmsg() before any data was
                 transmitted.

          EINVAL The sum of the iov_len values overflows an ssize_t.

          EMSGSIZE
                 The message is too large to be sent all at once (as the
                 socket requires), or the msg_iovlen member of the msghdr
                 structure pointed to by message is less than or equal to 0
                 or is greater than {IOV_MAX}.

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

          If the address family of the socket is AF_UNIX, then sendmsg()
          shall fail if:

          EIO    An I/O error occurred while reading from or writing to the
                 file system.

          ELOOP  A loop exists in symbolic links encountered during
                 resolution of the pathname in the socket address.

          ENAMETOOLONG
                 The length of a component of a pathname is longer than
                 {NAME_MAX}.

          ENOENT A component of the pathname does not name an existing file
                 or the path name is an empty string.

          ENOTDIR
                 A component of the path prefix of the pathname in the
                 socket address names an existing file that is neither a
                 directory nor a symbolic link to a directory, or the
                 pathname in the socket address contains at least one
                 non-<slash> character and ends with one or more trailing
                 <slash> characters and the last pathname component names
                 an existing file that is neither a directory nor a
                 symbolic link to a directory.

          The sendmsg() function may fail if:

          EACCES Search permission is denied for a component of the path
                 prefix; or write access to the named socket is denied.

          EDESTADDRREQ
                 The socket is not connection-mode and does not have its
                 peer address set, and no destination address was
                 specified.

          EHOSTUNREACH
                 The destination host cannot be reached (probably because
                 the host is down or a remote router cannot reach it).

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

          If the address family of the socket is AF_UNIX, then sendmsg()
          may fail if:

          ELOOP  More than {SYMLOOP_MAX} symbolic links were encountered
                 during resolution of the pathname in the socket address.

          ENAMETOOLONG
                 The length of a pathname exceeds {PATH_MAX}, or pathname
                 resolution of a symbolic link produced an intermediate
                 result with a length that exceeds {PATH_MAX}.

          The following sections are informative.


---------------------------------------------------------

::

          Done.


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
          recvmsg(3p), send(3p), sendto(3p), setsockopt(3p), shutdown(3p),
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

   IEEE/The Open Group               2017                       SENDMSG(3P)

--------------

Pages that refer to this page:
`netinet_in.h(0p) <../man0/netinet_in.h.0p.html>`__, 
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`pselect(3p) <../man3/pselect.3p.html>`__, 
`recv(3p) <../man3/recv.3p.html>`__, 
`recvfrom(3p) <../man3/recvfrom.3p.html>`__, 
`recvmsg(3p) <../man3/recvmsg.3p.html>`__, 
`send(3p) <../man3/send.3p.html>`__, 
`sendto(3p) <../man3/sendto.3p.html>`__, 
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
