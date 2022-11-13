.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

shutdown(2) — Linux manual page
===============================

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

   SHUTDOWN(2)             Linux Programmer's Manual            SHUTDOWN(2)

NAME
-------------------------------------------------

::

          shutdown - shut down part of a full-duplex connection


---------------------------------------------------------

::

          #include <sys/socket.h>

          int shutdown(int sockfd, int how);


---------------------------------------------------------------

::

          The shutdown() call causes all or part of a full-duplex
          connection on the socket associated with sockfd to be shut down.
          If how is SHUT_RD, further receptions will be disallowed.  If how
          is SHUT_WR, further transmissions will be disallowed.  If how is
          SHUT_RDWR, further receptions and transmissions will be
          disallowed.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  sockfd is not a valid file descriptor.

          EINVAL An invalid value was specified in how (but see BUGS).

          ENOTCONN
                 The specified socket is not connected.

          ENOTSOCK
                 The file descriptor sockfd does not refer to a socket.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.4BSD (shutdown() first appeared in
          4.2BSD).


---------------------------------------------------

::

          The constants SHUT_RD, SHUT_WR, SHUT_RDWR have the value 0, 1, 2,
          respectively, and are defined in <sys/socket.h> since
          glibc-2.1.91.


-------------------------------------------------

::

          Checks for the validity of how are done in domain-specific code,
          and before Linux 3.7 not all domains performed these checks.
          Most notably, UNIX domain sockets simply ignored invalid values.
          This problem was fixed for UNIX domain sockets in Linux 3.7.


---------------------------------------------------------

::

          close(2), connect(2), socket(2), socket(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    SHUTDOWN(2)

--------------

Pages that refer to this page: `close(2) <../man2/close.2.html>`__, 
`recv(2) <../man2/recv.2.html>`__,  `send(2) <../man2/send.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`socketcall(2) <../man2/socketcall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`systemd.socket(5) <../man5/systemd.socket.5.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`sock_diag(7) <../man7/sock_diag.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`lsof(8) <../man8/lsof.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/shutdown.2.license.html>`__

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
