.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getsockopt(3p) — Linux manual page
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

   GETSOCKOPT(3P)          POSIX Programmer's Manual         GETSOCKOPT(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getsockopt — get the socket options


---------------------------------------------------------

::

          #include <sys/socket.h>

          int getsockopt(int socket, int level, int option_name,
              void *restrict option_value, socklen_t *restrict option_len);


---------------------------------------------------------------

::

          The getsockopt() function manipulates options associated with a
          socket.

          The getsockopt() function shall retrieve the value for the option
          specified by the option_name argument for the socket specified by
          the socket argument. If the size of the option value is greater
          than option_len, the value stored in the object pointed to by the
          option_value argument shall be silently truncated. Otherwise, the
          object pointed to by the option_len argument shall be modified to
          indicate the actual length of the value.

          The level argument specifies the protocol level at which the
          option resides. To retrieve options at the socket level, specify
          the level argument as SOL_SOCKET. To retrieve options at other
          levels, supply the appropriate level identifier for the protocol
          controlling the option.  For example, to indicate that an option
          is interpreted by the TCP (Transmission Control Protocol), set
          level to IPPROTO_TCP as defined in the <netinet/in.h> header.

          The socket in use may require the process to have appropriate
          privileges to use the getsockopt() function.

          The option_name argument specifies a single option to be
          retrieved. It can be one of the socket-level options defined in
          sys_socket.h(0p) and described in Section 2.10.16, Use of
          Options.


-----------------------------------------------------------------

::

          Upon successful completion, getsockopt() shall return 0;
          otherwise, -1 shall be returned and errno set to indicate the
          error.


-----------------------------------------------------

::

          The getsockopt() function shall fail if:

          EBADF  The socket argument is not a valid file descriptor.

          EINVAL The specified option is invalid at the specified socket
                 level.

          ENOPROTOOPT
                 The option is not supported by the protocol.

          ENOTSOCK
                 The socket argument does not refer to a socket.

          The getsockopt() function may fail if:

          EACCES The calling process does not have appropriate privileges.

          EINVAL The socket has been shut down.

          ENOBUFS
                 Insufficient resources are available in the system to
                 complete the function.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.10.16, Use of Options, bind(3p), close(3p),
          endprotoent(3p), setsockopt(3p), socket(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_socket.h(0p),
          netinet_in.h(0p)


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

   IEEE/The Open Group               2017                    GETSOCKOPT(3P)

--------------

Pages that refer to this page:
`netinet_in.h(0p) <../man0/netinet_in.h.0p.html>`__, 
`netinet_tcp.h(0p) <../man0/netinet_tcp.h.0p.html>`__, 
`sys_socket.h(0p) <../man0/sys_socket.h.0p.html>`__, 
`if_freenameindex(3p) <../man3/if_freenameindex.3p.html>`__, 
`if_indextoname(3p) <../man3/if_indextoname.3p.html>`__, 
`if_nameindex(3p) <../man3/if_nameindex.3p.html>`__, 
`if_nametoindex(3p) <../man3/if_nametoindex.3p.html>`__, 
`send(3p) <../man3/send.3p.html>`__, 
`sendmsg(3p) <../man3/sendmsg.3p.html>`__, 
`sendto(3p) <../man3/sendto.3p.html>`__, 
`setsockopt(3p) <../man3/setsockopt.3p.html>`__, 
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
