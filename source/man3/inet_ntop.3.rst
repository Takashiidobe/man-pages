.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

inet_ntop(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   INET_NTOP(3)            Linux Programmer's Manual           INET_NTOP(3)

NAME
-------------------------------------------------

::

          inet_ntop - convert IPv4 and IPv6 addresses from binary to text
          form


---------------------------------------------------------

::

          #include <arpa/inet.h>

          const char *inet_ntop(int af, const void *restrict src,
                                char *restrict dst, socklen_t size);


---------------------------------------------------------------

::

          This function converts the network address structure src in the
          af address family into a character string.  The resulting string
          is copied to the buffer pointed to by dst, which must be a non-
          null pointer.  The caller specifies the number of bytes available
          in this buffer in the argument size.

          inet_ntop() extends the inet_ntoa(3) function to support multiple
          address families, inet_ntoa(3) is now considered to be deprecated
          in favor of inet_ntop().  The following address families are
          currently supported:

          AF_INET
                 src points to a struct in_addr (in network byte order)
                 which is converted to an IPv4 network address in the
                 dotted-decimal format, "ddd.ddd.ddd.ddd".  The buffer dst
                 must be at least INET_ADDRSTRLEN bytes long.

          AF_INET6
                 src points to a struct in6_addr (in network byte order)
                 which is converted to a representation of this address in
                 the most appropriate IPv6 network address format for this
                 address.  The buffer dst must be at least INET6_ADDRSTRLEN
                 bytes long.


-----------------------------------------------------------------

::

          On success, inet_ntop() returns a non-null pointer to dst.  NULL
          is returned if there was an error, with errno set to indicate the
          error.


-----------------------------------------------------

::

          EAFNOSUPPORT
                 af was not a valid address family.

          ENOSPC The converted address string would exceed the size given
                 by size.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌───────────────────────────────┬───────────────┬────────────────┐
          │Interface                      │ Attribute     │ Value          │
          ├───────────────────────────────┼───────────────┼────────────────┤
          │inet_ntop()                    │ Thread safety │ MT-Safe locale │
          └───────────────────────────────┴───────────────┴────────────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.  Note that RFC 2553 defines a
          prototype where the last argument size is of type size_t.  Many
          systems follow RFC 2553.  Glibc 2.0 and 2.1 have size_t, but 2.2
          and later have socklen_t.


-------------------------------------------------

::

          AF_INET6 converts IPv4-mapped IPv6 addresses into an IPv6 format.


---------------------------------------------------------

::

          See inet_pton(3).


---------------------------------------------------------

::

          getnameinfo(3), inet(3), inet_pton(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                   INET_NTOP(3)

--------------

Pages that refer to this page:
`gethostbyname(3) <../man3/gethostbyname.3.html>`__, 
`getipnodebyname(3) <../man3/getipnodebyname.3.html>`__, 
`getnameinfo(3) <../man3/getnameinfo.3.html>`__, 
`inet(3) <../man3/inet.3.html>`__, 
`inet_pton(3) <../man3/inet_pton.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/inet_ntop.3.license.html>`__

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
