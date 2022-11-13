.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

send(3p) — Linux manual page
============================

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

   SEND(3P)                POSIX Programmer's Manual               SEND(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          send — send a message on a socket


---------------------------------------------------------

::

          #include <sys/socket.h>

          ssize_t send(int socket, const void *buffer, size_t length, int flags);


---------------------------------------------------------------

::

          The send() function shall initiate transmission of a message from
          the specified socket to its peer. The send() function shall send
          a message only when the socket is connected. If the socket is a
          connectionless-mode socket, the message shall be sent to the pre-
          specified peer address.

          The send() function takes the following arguments:

          socket      Specifies the socket file descriptor.

          buffer      Points to the buffer containing the message to send.

          length      Specifies the length of the message in bytes.

          flags       Specifies the type of message transmission. Values of
                      this argument are formed by logically OR'ing zero or
                      more of the following flags:

                      MSG_EOR       Terminates a record (if supported by
                                    the protocol).

                      MSG_OOB       Sends out-of-band data on sockets that
                                    support out-of-band communications. The
                                    significance and semantics of out-of-
                                    band data are protocol-specific.

                      MSG_NOSIGNAL  Requests not to send the SIGPIPE signal
                                    if an attempt to send is made on a
                                    stream-oriented socket that is no
                                    longer connected. The [EPIPE] error
                                    shall still be returned.

          The length of the message to be sent is specified by the length
          argument. If the message is too long to pass through the
          underlying protocol, send() shall fail and no data shall be
          transmitted.

          Successful completion of a call to send() does not guarantee
          delivery of the message. A return value of -1 indicates only
          locally-detected errors.

          If space is not available at the sending socket to hold the
          message to be transmitted, and the socket file descriptor does
          not have O_NONBLOCK set, send() shall block until space is
          available. If space is not available at the sending socket to
          hold the message to be transmitted, and the socket file
          descriptor does have O_NONBLOCK set, send() shall fail. The
          select() and poll() functions can be used to determine when it is
          possible to send more data.

          The socket in use may require the process to have appropriate
          privileges to use the send() function.


-----------------------------------------------------------------

::

          Upon successful completion, send() shall return the number of
          bytes sent. Otherwise, -1 shall be returned and errno set to
          indicate the error.


-----------------------------------------------------

::

          The send() function shall fail if:

          EAGAIN or EWOULDBLOCK
                 The socket's file descriptor is marked O_NONBLOCK and the
                 requested operation would block.

          EBADF  The socket argument is not a valid file descriptor.

          ECONNRESET
                 A connection was forcibly closed by a peer.

          EDESTADDRREQ
                 The socket is not connection-mode and no peer address is
                 set.

          EINTR  A signal interrupted send() before any data was
                 transmitted.

          EMSGSIZE
                 The message is too large to be sent all at once, as the
                 socket requires.

          ENOTCONN
                 The socket is not connected.

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

          The send() function may fail if:

          EACCES The calling process does not have appropriate privileges.

          EIO    An I/O error occurred while reading from or writing to the
                 file system.

          ENETDOWN
                 The local network interface used to reach the destination
                 is down.

          ENETUNREACH
                 No route to the network is present.

          ENOBUFS
                 Insufficient resources were available in the system to
                 perform the operation.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          If the socket argument refers to a connection-mode socket, the
          send() function is equivalent to sendto() (with any value for the
          dest_addr and dest_len arguments, as they are ignored in this
          case). If the socket argument refers to a socket and the flags
          argument is 0, the send() function is equivalent to write().


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          connect(3p), getsockopt(3p), poll(3p), pselect(3p), recv(3p),
          recvfrom(3p), recvmsg(3p), sendmsg(3p), sendto(3p),
          setsockopt(3p), shutdown(3p), socket(3p), write(3p)

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

   IEEE/The Open Group               2017                          SEND(3P)

--------------

Pages that refer to this page:
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`connect(3p) <../man3/connect.3p.html>`__, 
`recv(3p) <../man3/recv.3p.html>`__, 
`recvfrom(3p) <../man3/recvfrom.3p.html>`__, 
`recvmsg(3p) <../man3/recvmsg.3p.html>`__, 
`sendmsg(3p) <../man3/sendmsg.3p.html>`__, 
`sendto(3p) <../man3/sendto.3p.html>`__, 
`shutdown(3p) <../man3/shutdown.3p.html>`__, 
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
