.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getsockopt(2) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETSOCKOPT(2)           Linux Programmer's Manual          GETSOCKOPT(2)

NAME
-------------------------------------------------

::

          getsockopt, setsockopt - get and set options on sockets


---------------------------------------------------------

::

          #include <sys/socket.h>

          int getsockopt(int sockfd, int level, int optname,
                         void *restrict optval, socklen_t *restrict optlen);
          int setsockopt(int sockfd, int level, int optname,
                         const void *optval, socklen_t optlen);


---------------------------------------------------------------

::

          getsockopt() and setsockopt() manipulate options for the socket
          referred to by the file descriptor sockfd.  Options may exist at
          multiple protocol levels; they are always present at the
          uppermost socket level.

          When manipulating socket options, the level at which the option
          resides and the name of the option must be specified.  To
          manipulate options at the sockets API level, level is specified
          as SOL_SOCKET.  To manipulate options at any other level the
          protocol number of the appropriate protocol controlling the
          option is supplied.  For example, to indicate that an option is
          to be interpreted by the TCP protocol, level should be set to the
          protocol number of TCP; see getprotoent(3).

          The arguments optval and optlen are used to access option values
          for setsockopt().  For getsockopt() they identify a buffer in
          which the value for the requested option(s) are to be returned.
          For getsockopt(), optlen is a value-result argument, initially
          containing the size of the buffer pointed to by optval, and
          modified on return to indicate the actual size of the value
          returned.  If no option value is to be supplied or returned,
          optval may be NULL.

          Optname and any specified options are passed uninterpreted to the
          appropriate protocol module for interpretation.  The include file
          <sys/socket.h> contains definitions for socket level options,
          described below.  Options at other protocol levels vary in format
          and name; consult the appropriate entries in section 4 of the
          manual.

          Most socket-level options utilize an int argument for optval.
          For setsockopt(), the argument should be nonzero to enable a
          boolean option, or zero if the option is to be disabled.

          For a description of the available socket options see socket(7)
          and the appropriate protocol man pages.


-----------------------------------------------------------------

::

          On success, zero is returned for the standard options.  On error,
          -1 is returned, and errno is set to indicate the error.

          Netfilter allows the programmer to define custom socket options
          with associated handlers; for such options, the return value on
          success is the value returned by the handler.


-----------------------------------------------------

::

          EBADF  The argument sockfd is not a valid file descriptor.

          EFAULT The address pointed to by optval is not in a valid part of
                 the process address space.  For getsockopt(), this error
                 may also be returned if optlen is not in a valid part of
                 the process address space.

          EINVAL optlen invalid in setsockopt().  In some cases this error
                 can also occur for an invalid value in optval (e.g., for
                 the IP_ADD_MEMBERSHIP option described in ip(7)).

          ENOPROTOOPT
                 The option is unknown at the level indicated.

          ENOTSOCK
                 The file descriptor sockfd does not refer to a socket.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.4BSD (these system calls
          first appeared in 4.2BSD).


---------------------------------------------------

::

          For background on the socklen_t type, see accept(2).


-------------------------------------------------

::

          Several of the socket options should be handled at lower levels
          of the system.


---------------------------------------------------------

::

          ioctl(2), socket(2), getprotoent(3), protocols(5), ip(7),
          packet(7), socket(7), tcp(7), udp(7), unix(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  GETSOCKOPT(2)

--------------

Pages that refer to this page: `connect(2) <../man2/connect.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`recv(2) <../man2/recv.2.html>`__,  `send(2) <../man2/send.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`socketcall(2) <../man2/socketcall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`if_nameindex(3) <../man3/if_nameindex.3.html>`__, 
`sctp_connectx(3) <../man3/sctp_connectx.3.html>`__, 
`bpf-helpers(7) <../man7/bpf-helpers.7.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`ip(7) <../man7/ip.7.html>`__,  `ipv6(7) <../man7/ipv6.7.html>`__, 
`netlink(7) <../man7/netlink.7.html>`__, 
`packet(7) <../man7/packet.7.html>`__, 
`raw(7) <../man7/raw.7.html>`__,  `sctp(7) <../man7/sctp.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`tcp(7) <../man7/tcp.7.html>`__,  `udp(7) <../man7/udp.7.html>`__, 
`udplite(7) <../man7/udplite.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__, 
`vsock(7) <../man7/vsock.7.html>`__,  `x25(7) <../man7/x25.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getsockopt.2.license.html>`__

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
