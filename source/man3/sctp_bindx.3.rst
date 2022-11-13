.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sctp_bindx(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SCTP_BINDX(3)           Linux Programmer's Manual          SCTP_BINDX(3)

NAME
-------------------------------------------------

::

          sctp_bindx - Add or remove bind addresses on a socket.


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <sys/socket.h>
          #include <netinet/sctp.h>

          int sctp_bindx(int sd, struct sockaddr * addrs, int addrcnt,
                         int flags);


---------------------------------------------------------------

::

          sctp_bindx adds or removes a set of bind addresses passed in the
          array addrs to/from the socket sd.  addrcnt is the number of
          addresses in the array and the flags paramater indicates if the
          addresses need to be added or removed.

          If sd is an IPv4 socket, the addresses passed must be IPv4
          addresses. If sd is an IPv6 socket, the addresses passed can be
          either IPv4 or IPv6 addresses.

          addrs is a pointer to an array of one or more socket addresses.
          Each address is contained in its appropriate structure(i.e.
          struct sockaddr_in or struct sockaddr_in6). The family of the
          address type must be used to distinguish the address length. The
          caller specifies the number of addresses in the array with
          addrcnt.

          The flags parameter can be either SCTP_BINDX_ADD_ADDR or
          SCTP_BINDX_REM_ADDR.  An application can use SCTP_BINDX_ADD_ADDR
          to associate additional addresses with an endpoint after calling
          bind(2).  SCTP_BINDX_REM_ADDR directs SCTP to remove the given
          addresses from the association.  A caller may not remove all
          addresses from an association. It will fail with EINVAL.


-----------------------------------------------------------------

::

          On success, 0 is returned. On failure, -1 is returned, and errno
          is set appropriately.


-----------------------------------------------------

::

          EBADF  sd is not a valid descriptor.

          ENOTSOCK
                 sd is a descriptor for a file, not a socket.

          EFAULT Error while copying in or out from the user address space.

          EINVAL Invalid port or address or trying to remove all addresses
                 from an association.

          EACCES The address is protected, and the user is not the super-
                 user.


---------------------------------------------------------

::

          sctp(7) sctp_sendmsg(3), sctp_sendv(3), sctp_send(3),
          sctp_recvmsg(3), sctp_recvv(3), sctp_peeloff(3),
          sctp_getpaddrs(3), sctp_getladdrs(3), sctp_opt_info(3),
          sctp_connectx(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the lksctp-tools (Linux kernel SCTP tools)
          project.  Information about the project can be found at [unknown
          -- if you know, please contact man-pages@man7.org] If you have a
          bug report for this manual page, send it to sctp@vger.kernel.org.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/sctp/lksctp-tools.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Linux 2.6                      2005-10-25                  SCTP_BINDX(3)

--------------

Pages that refer to this page:
`sctp_connectx(3) <../man3/sctp_connectx.3.html>`__, 
`sctp_getladdrs(3) <../man3/sctp_getladdrs.3.html>`__, 
`sctp_getpaddrs(3) <../man3/sctp_getpaddrs.3.html>`__, 
`sctp_opt_info(3) <../man3/sctp_opt_info.3.html>`__, 
`sctp_peeloff(3) <../man3/sctp_peeloff.3.html>`__, 
`sctp_recvmsg(3) <../man3/sctp_recvmsg.3.html>`__, 
`sctp_recvv(3) <../man3/sctp_recvv.3.html>`__, 
`sctp_send(3) <../man3/sctp_send.3.html>`__, 
`sctp_sendmsg(3) <../man3/sctp_sendmsg.3.html>`__, 
`sctp_sendv(3) <../man3/sctp_sendv.3.html>`__, 
`sctp(7) <../man7/sctp.7.html>`__

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
