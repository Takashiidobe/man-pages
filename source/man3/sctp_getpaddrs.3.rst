.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sctp_getpaddrs(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SCTP_GETPADDRS(3)       Linux Programmer's Manual      SCTP_GETPADDRS(3)

NAME
-------------------------------------------------

::

          sctp_getpaddrs - Returns all peer addresses in an association.


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <sys/socket.h>
          #include <netinet/sctp.h>

          int sctp_getpaddrs(int sd, sctp_assoc_t assoc_id,
                             struct sockaddr **addrs);

          void sctp_freepaddrs(struct sockaddr *addrs);


---------------------------------------------------------------

::

          sctp_getpaddrs returns all peer addresses in an association. On
          return, addrs will point to a dynamically allocated packed array
          of sockaddr structures of the appropriate type for each address.
          The caller should use sctp_freepaddrs to free the memory. Note
          that the in/out parameter addrs must not be NULL.

          If sd is an IPv4 socket, the addresses returned will be all IPv4
          addresses. If sd is an IPv6 socket, the addresses returned can be
          a mix of IPv4 or IPv6 addresses.

          For one-to-many style sockets, id specifies the association to
          query. For one-to-one style sockets, id is ignored.

          sctp_freepaddrs frees all the resources allocated by
          sctp_getpaddrs.


-----------------------------------------------------------------

::

          On success, sctp_getpaddrs returns the number of peer addresses
          in the association. If there is no association on this socket, 0
          is returned and the value of *addrs is undefined. On error,
          sctp_getpaddrs returns -1 and the value of *addrs is undefined.


---------------------------------------------------------

::

          sctp(7) sctp_bindx(3), sctp_connectx(3), sctp_sendmsg(3),
          sctp_sendv(3), sctp_send(3), sctp_recvmsg(3), sctp_recvv(3),
          sctp_peeloff(3), sctp_getladdrs(3), sctp_opt_info(3),

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

   Linux 2.6                      2005-10-25              SCTP_GETPADDRS(3)

--------------

Pages that refer to this page:
`sctp_bindx(3) <../man3/sctp_bindx.3.html>`__, 
`sctp_connectx(3) <../man3/sctp_connectx.3.html>`__, 
`sctp_getladdrs(3) <../man3/sctp_getladdrs.3.html>`__, 
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
