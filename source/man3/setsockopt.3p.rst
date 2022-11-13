.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setsockopt(3p) — Linux manual page
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

   SETSOCKOPT(3P)          POSIX Programmer's Manual         SETSOCKOPT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          setsockopt — set the socket options


---------------------------------------------------------

::

          #include <sys/socket.h>

          int setsockopt(int socket, int level, int option_name,
              const void *option_value, socklen_t option_len);


---------------------------------------------------------------

::

          The setsockopt() function shall set the option specified by the
          option_name argument, at the protocol level specified by the
          level argument, to the value pointed to by the option_value
          argument for the socket associated with the file descriptor
          specified by the socket argument.

          The level argument specifies the protocol level at which the
          option resides. To set options at the socket level, specify the
          level argument as SOL_SOCKET. To set options at other levels,
          supply the appropriate level identifier for the protocol
          controlling the option. For example, to indicate that an option
          is interpreted by the TCP (Transport Control Protocol), set level
          to IPPROTO_TCP as defined in the <netinet/in.h> header.

          The option_name argument specifies a single option to set. It can
          be one of the socket-level options defined in sys_socket.h(0p)
          and described in Section 2.10.16, Use of Options.  If option_name
          is equal to SO_RCVTIMEO or SO_SNDTIMEO and the implementation
          supports setting the option, it is unspecified whether the struct
          timeval pointed to by option_value is stored as provided by this
          function or is rounded up to align with the resolution of the
          clock being used. If setsockopt() is called with option_name
          equal to SO_ACCEPTCONN, SO_ERROR, or SO_TYPE, the behavior is
          unspecified.


-----------------------------------------------------------------

::

          Upon successful completion, setsockopt() shall return 0.
          Otherwise, -1 shall be returned and errno set to indicate the
          error.


-----------------------------------------------------

::

          The setsockopt() function shall fail if:

          EBADF  The socket argument is not a valid file descriptor.

          EDOM   The send and receive timeout values are too big to fit
                 into the timeout fields in the socket structure.

          EINVAL The specified option is invalid at the specified socket
                 level or the socket has been shut down.

          EISCONN
                 The socket is already connected, and a specified option
                 cannot be set while the socket is connected.

          ENOPROTOOPT
                 The option is not supported by the protocol.

          ENOTSOCK
                 The socket argument does not refer to a socket.

          The setsockopt() function may fail if:

          ENOMEM There was insufficient memory available for the operation
                 to complete.

          ENOBUFS
                 Insufficient resources are available in the system to
                 complete the call.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The setsockopt() function provides an application program with
          the means to control socket behavior. An application program can
          use setsockopt() to allocate buffer space, control timeouts, or
          permit socket data broadcasts. The <sys/socket.h> header defines
          the socket-level options available to setsockopt().

          Options may exist at multiple protocol levels. The SO_ options
          are always present at the uppermost socket level.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.10, Sockets, bind(3p), endprotoent(3p), getsockopt(3p),
          socket(3p)

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

   IEEE/The Open Group               2017                    SETSOCKOPT(3P)

--------------

Pages that refer to this page:
`netinet_in.h(0p) <../man0/netinet_in.h.0p.html>`__, 
`netinet_tcp.h(0p) <../man0/netinet_tcp.h.0p.html>`__, 
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`getsockopt(3p) <../man3/getsockopt.3p.html>`__, 
`if_freenameindex(3p) <../man3/if_freenameindex.3p.html>`__, 
`if_indextoname(3p) <../man3/if_indextoname.3p.html>`__, 
`if_nameindex(3p) <../man3/if_nameindex.3p.html>`__, 
`if_nametoindex(3p) <../man3/if_nametoindex.3p.html>`__, 
`send(3p) <../man3/send.3p.html>`__, 
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
