.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getsockname(2) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETSOCKNAME(2)          Linux Programmer's Manual         GETSOCKNAME(2)

NAME
-------------------------------------------------

::

          getsockname - get socket name


---------------------------------------------------------

::

          #include <sys/socket.h>

          int getsockname(int sockfd, struct sockaddr *restrict addr,
                          socklen_t *restrict addrlen);


---------------------------------------------------------------

::

          getsockname() returns the current address to which the socket
          sockfd is bound, in the buffer pointed to by addr.  The addrlen
          argument should be initialized to indicate the amount of space
          (in bytes) pointed to by addr.  On return it contains the actual
          size of the socket address.

          The returned address is truncated if the buffer provided is too
          small; in this case, addrlen will return a value greater than was
          supplied to the call.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  The argument sockfd is not a valid file descriptor.

          EFAULT The addr argument points to memory not in a valid part of
                 the process address space.

          EINVAL addrlen is invalid (e.g., is negative).

          ENOBUFS
                 Insufficient resources were available in the system to
                 perform the operation.

          ENOTSOCK
                 The file descriptor sockfd does not refer to a socket.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.4BSD (getsockname() first
          appeared in 4.2BSD).


---------------------------------------------------

::

          For background on the socklen_t type, see accept(2).


---------------------------------------------------------

::

          bind(2), socket(2), getifaddrs(3), ip(7), socket(7), unix(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 GETSOCKNAME(2)

--------------

Pages that refer to this page: `bind(2) <../man2/bind.2.html>`__, 
`connect(2) <../man2/connect.2.html>`__, 
`getpeername(2) <../man2/getpeername.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`socketcall(2) <../man2/socketcall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`bindresvport(3) <../man3/bindresvport.3.html>`__, 
`getifaddrs(3) <../man3/getifaddrs.3.html>`__, 
`getnameinfo(3) <../man3/getnameinfo.3.html>`__, 
`if_nameindex(3) <../man3/if_nameindex.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getsockname.2.license.html>`__

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
