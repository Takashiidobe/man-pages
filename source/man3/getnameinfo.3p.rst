.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getnameinfo(3p) — Linux manual page
===================================

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

   GETNAMEINFO(3P)         POSIX Programmer's Manual        GETNAMEINFO(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          getnameinfo — get name information


---------------------------------------------------------

::

          #include <sys/socket.h>
          #include <netdb.h>

          int getnameinfo(const struct sockaddr *restrict sa, socklen_t salen,
              char *restrict node, socklen_t nodelen, char *restrict service,
              socklen_t servicelen, int flags);


---------------------------------------------------------------

::

          The getnameinfo() function shall translate a socket address to a
          node name and service location, all of which are defined as in
          freeaddrinfo(3p).

          The sa argument points to a socket address structure to be
          translated. The salen argument contains the length of the address
          pointed to by sa.

          If the socket address structure contains an IPv4-mapped IPv6
          address or an IPv4-compatible IPv6 address, the implementation
          shall extract the embedded IPv4 address and lookup the node name
          for that IPv4 address.

          If the address is the IPv6 unspecified address ("::"), a lookup
          shall not be performed and the behavior shall be the same as when
          the node's name cannot be located.

          If the node argument is non-NULL and the nodelen argument is non-
          zero, then the node argument points to a buffer able to contain
          up to nodelen bytes that receives the node name as a null-
          terminated string. If the node argument is NULL or the nodelen
          argument is zero, the node name shall not be returned. If the
          node's name cannot be located, the numeric form of the address
          contained in the socket address structure pointed to by the sa
          argument is returned instead of its name.

          If the service argument is non-NULL and the servicelen argument
          is non-zero, then the service argument points to a buffer able to
          contain up to servicelen bytes that receives the service name as
          a null-terminated string.  If the service argument is NULL or the
          servicelen argument is zero, the service name shall not be
          returned. If the service's name cannot be located, the numeric
          form of the service address (for example, its port number) shall
          be returned instead of its name.

          The flags argument is a flag that changes the default actions of
          the function. By default the fully-qualified domain name (FQDN)
          for the host shall be returned, but:

           *  If the flag bit NI_NOFQDN is set, only the node name portion
              of the FQDN shall be returned for local hosts.

           *  If the flag bit NI_NUMERICHOST is set, the numeric form of
              the address contained in the socket address structure pointed
              to by the sa argument shall be returned instead of its name.

           *  If the flag bit NI_NAMEREQD is set, an error shall be
              returned if the host's name cannot be located.

           *  If the flag bit NI_NUMERICSERV is set, the numeric form of
              the service address shall be returned (for example, its port
              number) instead of its name.

           *  If the flag bit NI_NUMERICSCOPE is set, the numeric form of
              the scope identifier shall be returned (for example,
              interface index) instead of its name. This flag shall be
              ignored if the sa argument is not an IPv6 address.

           *  If the flag bit NI_DGRAM is set, this indicates that the
              service is a datagram service (SOCK_DGRAM). The default
              behavior shall assume that the service is a stream service
              (SOCK_STREAM).

          Notes:

                     1. The two NI_NUMERICxxx flags are required to support
                        the -n flag that many commands provide.

                     2. The NI_DGRAM flag is required for the few AF_INET
                        and AF_INET6 port numbers (for example, [512,514])
                        that represent different services for UDP and TCP.

          The getnameinfo() function shall be thread-safe.


-----------------------------------------------------------------

::

          A zero return value for getnameinfo() indicates successful
          completion; a non-zero return value indicates failure. The
          possible values for the failures are listed in the ERRORS
          section.

          Upon successful completion, getnameinfo() shall return the node
          and service names, if requested, in the buffers provided. The
          returned names are always null-terminated strings.


-----------------------------------------------------

::

          The getnameinfo() function shall fail and return the
          corresponding value if:

          [EAI_AGAIN] The name could not be resolved at this time. Future
                      attempts may succeed.

          [EAI_BADFLAGS]
                      The flags had an invalid value.

          [EAI_FAIL]  A non-recoverable error occurred.

          [EAI_FAMILY]
                      The address family was not recognized or the address
                      length was invalid for the specified family.

          [EAI_MEMORY]
                      There was a memory allocation failure.

          [EAI_NONAME]
                      The name does not resolve for the supplied
                      parameters.

                      NI_NAMEREQD is set and the host's name cannot be
                      located, or both nodename and servname were null.

          [EAI_OVERFLOW]
                      An argument buffer overflowed. The buffer pointed to
                      by the node argument or the service argument was too
                      small.

          [EAI_SYSTEM]
                      A system error occurred. The error code can be found
                      in errno.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          If the returned values are to be used as part of any further name
          resolution (for example, passed to getaddrinfo()), applications
          should provide buffers large enough to store any result possible
          on the system.

          Given the IPv4-mapped IPv6 address "::ffff:1.2.3.4", the
          implementation performs a lookup as if the socket address
          structure contains the IPv4 address "1.2.3.4".

          The IPv6 unspecified address ("::") and the IPv6 loopback address
          ("::1") are not IPv4-compatible addresses.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          endservent(3p), freeaddrinfo(3p), gai_strerror(3p),
          inet_ntop(3p), socket(3p)

          The Base Definitions volume of POSIX.1‐2017, netdb.h(0p),
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

   IEEE/The Open Group               2017                   GETNAMEINFO(3P)

--------------

Pages that refer to this page:
`netdb.h(0p) <../man0/netdb.h.0p.html>`__, 
`freeaddrinfo(3p) <../man3/freeaddrinfo.3p.html>`__

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
