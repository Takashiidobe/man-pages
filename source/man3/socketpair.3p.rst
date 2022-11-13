.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

socketpair(3p) — Linux manual page
==================================

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

   SOCKETPAIR(3P)          POSIX Programmer's Manual         SOCKETPAIR(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          socketpair — create a pair of connected sockets


---------------------------------------------------------

::

          #include <sys/socket.h>

          int socketpair(int domain, int type, int protocol,
              int socket_vector[2]);


---------------------------------------------------------------

::

          The socketpair() function shall create an unbound pair of
          connected sockets in a specified domain, of a specified type,
          under the protocol optionally specified by the protocol argument.
          The two sockets shall be identical. The file descriptors used in
          referencing the created sockets shall be returned in
          socket_vector[0] and socket_vector[1].  The file descriptors
          shall be allocated as described in Section 2.14, File Descriptor
          Allocation.

          The socketpair() function takes the following arguments:

          domain      Specifies the communications domain in which the
                      sockets are to be created.

          type        Specifies the type of sockets to be created.

          protocol    Specifies a particular protocol to be used with the
                      sockets.  Specifying a protocol of 0 causes
                      socketpair() to use an unspecified default protocol
                      appropriate for the requested socket type.

          socket_vector
                      Specifies a 2-integer array to hold the file
                      descriptors of the created socket pair.

          The type argument specifies the socket type, which determines the
          semantics of communications over the socket. The following socket
          types are defined; implementations may specify additional socket
          types:

          SOCK_STREAM   Provides sequenced, reliable, bidirectional,
                        connection-mode byte streams, and may provide a
                        transmission mechanism for out-of-band data.

          SOCK_DGRAM    Provides datagrams, which are connectionless-mode,
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
          socketpair() function or to create some sockets.


-----------------------------------------------------------------

::

          Upon successful completion, this function shall return 0;
          otherwise, -1 shall be returned and errno set to indicate the
          error, no file descriptors shall be allocated, and the contents
          of socket_vector shall be left unmodified.


-----------------------------------------------------

::

          The socketpair() function shall fail if:

          EAFNOSUPPORT
                 The implementation does not support the specified address
                 family.

          EMFILE All, or all but one, of the file descriptors available to
                 the process are currently open.

          ENFILE No more file descriptors are available for the system.

          EOPNOTSUPP
                 The specified protocol does not permit creation of socket
                 pairs.

          EPROTONOSUPPORT
                 The protocol is not supported by the address family, or
                 the protocol is not supported by the implementation.

          EPROTOTYPE
                 The socket type is not supported by the protocol.

          The socketpair() function may fail if:

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

          The socketpair() function is used primarily with UNIX domain
          sockets and need not be supported for other domains.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.14, File Descriptor Allocation, socket(3p)

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

   IEEE/The Open Group               2017                    SOCKETPAIR(3P)

--------------

Pages that refer to this page:
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`sys_un.h(0p) <../man0/sys_un.h.0p.html>`__, 
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
