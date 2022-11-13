.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

socketpair(2) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SOCKETPAIR(2)           Linux Programmer's Manual          SOCKETPAIR(2)

NAME
-------------------------------------------------

::

          socketpair - create a pair of connected sockets


---------------------------------------------------------

::

          #include <sys/socket.h>

          int socketpair(int domain, int type, int protocol, int sv[2]);


---------------------------------------------------------------

::

          The socketpair() call creates an unnamed pair of connected
          sockets in the specified domain, of the specified type, and using
          the optionally specified protocol.  For further details of these
          arguments, see socket(2).

          The file descriptors used in referencing the new sockets are
          returned in sv[0] and sv[1].  The two sockets are
          indistinguishable.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, errno is
          set to indicate the error, and sv is left unchanged

          On Linux (and other systems), socketpair() does not modify sv on
          failure.  A requirement standardizing this behavior was added in
          POSIX.1-2008 TC2.


-----------------------------------------------------

::

          EAFNOSUPPORT
                 The specified address family is not supported on this
                 machine.

          EFAULT The address sv does not specify a valid part of the
                 process address space.

          EMFILE The per-process limit on the number of open file
                 descriptors has been reached.

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          EOPNOTSUPP
                 The specified protocol does not support creation of socket
                 pairs.

          EPROTONOSUPPORT
                 The specified protocol is not supported on this machine.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.4BSD.  socketpair() first appeared
          in 4.2BSD.  It is generally portable to/from non-BSD systems
          supporting clones of the BSD socket layer (including System V
          variants).


---------------------------------------------------

::

          On Linux, the only supported domains for this call are AF_UNIX
          (or synonymously, AF_LOCAL) and AF_TIPC (since Linux 4.12).

          Since Linux 2.6.27, socketpair() supports the SOCK_NONBLOCK and
          SOCK_CLOEXEC flags in the type argument, as described in
          socket(2).


---------------------------------------------------------

::

          pipe(2), read(2), socket(2), write(2), socket(7), unix(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  SOCKETPAIR(2)

--------------

Pages that refer to this page: `pipe(2) <../man2/pipe.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`socketcall(2) <../man2/socketcall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`fifo(7) <../man7/fifo.7.html>`__,  `pipe(7) <../man7/pipe.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/socketpair.2.license.html>`__

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
