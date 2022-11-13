.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

socket(3p) — Linux manual page
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

   SOCKET(3P)              POSIX Programmer's Manual             SOCKET(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          socket — create an endpoint for communication


---------------------------------------------------------

::

          #include <sys/socket.h>

          int socket(int domain, int type, int protocol);


---------------------------------------------------------------

::

          The socket() function shall create an unbound socket in a
          communications domain, and return a file descriptor that can be
          used in later function calls that operate on sockets. The file
          descriptor shall be allocated as described in Section 2.14, File
          Descriptor Allocation.

          The socket() function takes the following arguments:

          domain      Specifies the communications domain in which a socket
                      is to be created.

          type        Specifies the type of socket to be created.

          protocol    Specifies a particular protocol to be used with the
                      socket. Specifying a protocol of 0 causes socket() to
                      use an unspecified default protocol appropriate for
                      the requested socket type.

          The domain argument specifies the address family used in the
          communications domain. The address families supported by the
          system are implementation-defined.

          Symbolic constants that can be used for the domain argument are
          defined in the <sys/socket.h> header.

          The type argument specifies the socket type, which determines the
          semantics of communication over the socket. The following socket
          types are defined; implementations may specify additional socket
          types:

          SOCK_STREAM Provides sequenced, reliable, bidirectional,
                      connection-mode byte streams, and may provide a
                      transmission mechanism for out-of-band data.

          SOCK_DGRAM  Provides datagrams, which are connectionless-mode,
                      unreliable messages of fixed maximum length.

          SOCK_SEQPACKET
                      Provides sequenced, reliable, bidirectional,
                      connection-mode transmission paths for records. A
                      record can be sent using one or more output
                      operations and received using one or more input
                      operations, but a single operation never transfers
                      part of more than one record. Record boundaries are
                      visible to the receiver via the MSG_EOR flag.

          If the protocol argument is non-zero, it shall specify a protocol
          that is supported by the address family. If the protocol argument
          is zero, the default protocol for this address family and type
          shall be used. The protocols supported by the system are
          implementation-defined.

          The process may need to have appropriate privileges to use the
          socket() function or to create some sockets.


-----------------------------------------------------------------

::

          Upon successful completion, socket() shall return a non-negative
          integer, the socket file descriptor.  Otherwise, a value of -1
          shall be returned and errno set to indicate the error.


-----------------------------------------------------

::

          The socket() function shall fail if:

          EAFNOSUPPORT
                 The implementation does not support the specified address
                 family.

          EMFILE All file descriptors available to the process are
                 currently open.

          ENFILE No more file descriptors are available for the system.

          EPROTONOSUPPORT
                 The protocol is not supported by the address family, or
                 the protocol is not supported by the implementation.

          EPROTOTYPE
                 The socket type is not supported by the protocol.

          The socket() function may fail if:

          EACCES The process does not have appropriate privileges.

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

          The documentation for specific address families specifies which
          protocols each address family supports. The documentation for
          specific protocols specifies which socket types each protocol
          supports.

          The application can determine whether an address family is
          supported by trying to create a socket with domain set to the
          protocol in question.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.14, File Descriptor Allocation, accept(3p), bind(3p),
          connect(3p), getsockname(3p), getsockopt(3p), listen(3p),
          recv(3p), recvfrom(3p), recvmsg(3p), send(3p), sendmsg(3p),
          setsockopt(3p), shutdown(3p), socketpair(3p)

          The Base Definitions volume of POSIX.1‐2017, netinet_in.h(0p),
          sys_socket.h(0p)


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

   IEEE/The Open Group               2017                        SOCKET(3P)

--------------

Pages that refer to this page:
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`sys_un.h(0p) <../man0/sys_un.h.0p.html>`__, 
`accept(3p) <../man3/accept.3p.html>`__, 
`bind(3p) <../man3/bind.3p.html>`__, 
`connect(3p) <../man3/connect.3p.html>`__, 
`fdopen(3p) <../man3/fdopen.3p.html>`__, 
`freeaddrinfo(3p) <../man3/freeaddrinfo.3p.html>`__, 
`getnameinfo(3p) <../man3/getnameinfo.3p.html>`__, 
`getpeername(3p) <../man3/getpeername.3p.html>`__, 
`getsockname(3p) <../man3/getsockname.3p.html>`__, 
`getsockopt(3p) <../man3/getsockopt.3p.html>`__, 
`listen(3p) <../man3/listen.3p.html>`__, 
`recv(3p) <../man3/recv.3p.html>`__, 
`recvfrom(3p) <../man3/recvfrom.3p.html>`__, 
`recvmsg(3p) <../man3/recvmsg.3p.html>`__, 
`send(3p) <../man3/send.3p.html>`__, 
`sendmsg(3p) <../man3/sendmsg.3p.html>`__, 
`sendto(3p) <../man3/sendto.3p.html>`__, 
`setsockopt(3p) <../man3/setsockopt.3p.html>`__, 
`shutdown(3p) <../man3/shutdown.3p.html>`__, 
`socketpair(3p) <../man3/socketpair.3p.html>`__

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
