.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

recvmsg(3p) — Linux manual page
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

   RECVMSG(3P)             POSIX Programmer's Manual            RECVMSG(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          recvmsg — receive a message from a socket


---------------------------------------------------------

::

          #include <sys/socket.h>

          ssize_t recvmsg(int socket, struct msghdr *message, int flags);


---------------------------------------------------------------

::

          The recvmsg() function shall receive a message from a connection-
          mode or connectionless-mode socket. It is normally used with
          connectionless-mode sockets because it permits the application to
          retrieve the source address of received data.

          The recvmsg() function takes the following arguments:

          socket      Specifies the socket file descriptor.

          message     Points to a msghdr structure, containing both the
                      buffer to store the source address and the buffers
                      for the incoming message. The length and format of
                      the address depend on the address family of the
                      socket. The msg_flags member is ignored on input, but
                      may contain meaningful values on output.

          flags       Specifies the type of message reception. Values of
                      this argument are formed by logically OR'ing zero or
                      more of the following values:

                      MSG_OOB     Requests out-of-band data. The
                                  significance and semantics of out-of-band
                                  data are protocol-specific.

                      MSG_PEEK    Peeks at the incoming message.

                      MSG_WAITALL On SOCK_STREAM sockets this requests that
                                  the function block until the full amount
                                  of data can be returned. The function may
                                  return the smaller amount of data if the
                                  socket is a message-based socket, if a
                                  signal is caught, if the connection is
                                  terminated, if MSG_PEEK was specified, or
                                  if an error is pending for the socket.

          The recvmsg() function shall receive messages from unconnected or
          connected sockets and shall return the length of the message.

          The recvmsg() function shall return the total length of the
          message. For message-based sockets, such as SOCK_DGRAM and
          SOCK_SEQPACKET, the entire message shall be read in a single
          operation. If a message is too long to fit in the supplied
          buffers, and MSG_PEEK is not set in the flags argument, the
          excess bytes shall be discarded, and MSG_TRUNC shall be set in
          the msg_flags member of the msghdr structure. For stream-based
          sockets, such as SOCK_STREAM, message boundaries shall be
          ignored. In this case, data shall be returned to the user as soon
          as it becomes available, and no data shall be discarded.

          If the MSG_WAITALL flag is not set, data shall be returned only
          up to the end of the first message.

          If no messages are available at the socket and O_NONBLOCK is not
          set on the socket's file descriptor, recvmsg() shall block until
          a message arrives. If no messages are available at the socket and
          O_NONBLOCK is set on the socket's file descriptor, the recvmsg()
          function shall fail and set errno to [EAGAIN] or [EWOULDBLOCK].

          In the msghdr structure, the msg_name member may be a null
          pointer if the source address is not required.  Otherwise, if the
          socket is unconnected, the msg_name member points to a sockaddr
          structure in which the source address is to be stored, and the
          msg_namelen member on input specifies the length of the supplied
          sockaddr structure and on output specifies the length of the
          stored address.  If the actual length of the address is greater
          than the length of the supplied sockaddr structure, the stored
          address shall be truncated. If the socket is connected, the
          msg_name and msg_namelen members shall be ignored. The msg_iov
          and msg_iovlen fields are used to specify where the received data
          shall be stored.  The msg_iov member points to an array of iovec
          structures; the msg_iovlen member shall be set to the dimension
          of this array. In each iovec structure, the iov_base field
          specifies a storage area and the iov_len field gives its size in
          bytes. Each storage area indicated by msg_iov is filled with
          received data in turn until all of the received data is stored or
          all of the areas have been filled.

          Upon successful completion, the msg_flags member of the message
          header shall be the bitwise-inclusive OR of all of the following
          flags that indicate conditions detected for the received message:

          MSG_EOR     End-of-record was received (if supported by the
                      protocol).

          MSG_OOB     Out-of-band data was received.

          MSG_TRUNC   Normal data was truncated.

          MSG_CTRUNC  Control data was truncated.


-----------------------------------------------------------------

::

          Upon successful completion, recvmsg() shall return the length of
          the message in bytes. If no messages are available to be received
          and the peer has performed an orderly shutdown, recvmsg() shall
          return 0. Otherwise, -1 shall be returned and errno set to
          indicate the error.


-----------------------------------------------------

::

          The recvmsg() function shall fail if:

          EAGAIN or EWOULDBLOCK
                 The socket's file descriptor is marked O_NONBLOCK and no
                 data is waiting to be received; or MSG_OOB is set and no
                 out-of-band data is available and either the socket's file
                 descriptor is marked O_NONBLOCK or the socket does not
                 support blocking to await out-of-band data.

          EBADF  The socket argument is not a valid open file descriptor.

          ECONNRESET
                 A connection was forcibly closed by a peer.

          EINTR  This function was interrupted by a signal before any data
                 was available.

          EINVAL The sum of the iov_len values overflows a ssize_t, or the
                 MSG_OOB flag is set and no out-of-band data is available.

          EMSGSIZE
                 The msg_iovlen member of the msghdr structure pointed to
                 by message is less than or equal to 0, or is greater than
                 {IOV_MAX}.

          ENOTCONN
                 A receive is attempted on a connection-mode socket that is
                 not connected.

          ENOTSOCK
                 The socket argument does not refer to a socket.

          EOPNOTSUPP
                 The specified flags are not supported for this socket
                 type.

          ETIMEDOUT
                 The connection timed out during connection establishment,
                 or due to a transmission timeout on active connection.

          The recvmsg() function may fail if:

          EIO    An I/O error occurred while reading from or writing to the
                 file system.

          ENOBUFS
                 Insufficient resources were available in the system to
                 perform the operation.

          ENOMEM Insufficient memory was available to fulfill the request.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The select() and poll() functions can be used to determine when
          data is available to be received.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          poll(3p), pselect(3p), recv(3p), recvfrom(3p), send(3p),
          sendmsg(3p), sendto(3p), shutdown(3p), socket(3p)

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

   IEEE/The Open Group               2017                       RECVMSG(3P)

--------------

Pages that refer to this page:
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`pselect(3p) <../man3/pselect.3p.html>`__, 
`recv(3p) <../man3/recv.3p.html>`__, 
`recvfrom(3p) <../man3/recvfrom.3p.html>`__, 
`send(3p) <../man3/send.3p.html>`__, 
`sendmsg(3p) <../man3/sendmsg.3p.html>`__, 
`sendto(3p) <../man3/sendto.3p.html>`__, 
`shutdown(3p) <../man3/shutdown.3p.html>`__, 
`sockatmark(3p) <../man3/sockatmark.3p.html>`__, 
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
