.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rtnetlink(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   RTNETLINK(3)            Linux Programmer's Manual           RTNETLINK(3)

NAME
-------------------------------------------------

::

          rtnetlink - macros to manipulate rtnetlink messages


---------------------------------------------------------

::

          #include <asm/types.h>
          #include <linux/netlink.h>
          #include <linux/rtnetlink.h>
          #include <sys/socket.h>

          rtnetlink_socket = socket(AF_NETLINK, int socket_type, NETLINK_ROUTE);

          int RTA_OK(struct rtattr *rta, int rtabuflen);

          void *RTA_DATA(struct rtattr *rta);
          unsigned int RTA_PAYLOAD(struct rtattr *rta);

          struct rtattr *RTA_NEXT(struct rtattr *rta, unsigned int rtabuflen);

          unsigned int RTA_LENGTH(unsigned int length);
          unsigned int RTA_SPACE(unsigned int length);


---------------------------------------------------------------

::

          All rtnetlink(7) messages consist of a netlink(7) message header
          and appended attributes.  The attributes should be manipulated
          only using the macros provided here.

          RTA_OK(rta, attrlen) returns true if rta points to a valid
          routing attribute; attrlen is the running length of the attribute
          buffer.  When not true then you must assume there are no more
          attributes in the message, even if attrlen is nonzero.

          RTA_DATA(rta) returns a pointer to the start of this attribute's
          data.

          RTA_PAYLOAD(rta) returns the length of this attribute's data.

          RTA_NEXT(rta, attrlen) gets the next attribute after rta.
          Calling this macro will update attrlen.  You should use RTA_OK to
          check the validity of the returned pointer.

          RTA_LENGTH(len) returns the length which is required for len
          bytes of data plus the header.

          RTA_SPACE(len) returns the amount of space which will be needed
          in a message with len bytes of data.


-------------------------------------------------------------------

::

          These macros are nonstandard Linux extensions.


-------------------------------------------------

::

          This manual page is incomplete.


---------------------------------------------------------

::

          Creating a rtnetlink message to set the MTU of a device:

              #include <linux/rtnetlink.h>

              ...

              struct {
                  struct nlmsghdr  nh;
                  struct ifinfomsg if;
                  char             attrbuf[512];
              } req;

              struct rtattr *rta;
              unsigned int mtu = 1000;

              int rtnetlink_sk = socket(AF_NETLINK, SOCK_DGRAM, NETLINK_ROUTE);

              memset(&req, 0, sizeof(req));
              req.nh.nlmsg_len = NLMSG_LENGTH(sizeof(req.if));
              req.nh.nlmsg_flags = NLM_F_REQUEST;
              req.nh.nlmsg_type = RTM_NEWLINK;
              req.if.ifi_family = AF_UNSPEC;
              req.if.ifi_index = INTERFACE_INDEX;
              req.if.ifi_change = 0xffffffff; /* ??? */
              rta = (struct rtattr *)(((char *) &req) +
                                       NLMSG_ALIGN(req.nh.nlmsg_len));
              rta->rta_type = IFLA_MTU;
              rta->rta_len = RTA_LENGTH(sizeof(mtu));
              req.nh.nlmsg_len = NLMSG_ALIGN(req.nh.nlmsg_len) +
                                            RTA_LENGTH(sizeof(mtu));
              memcpy(RTA_DATA(rta), &mtu, sizeof(mtu));
              send(rtnetlink_sk, &req, req.nh.nlmsg_len, 0);


---------------------------------------------------------

::

          netlink(3), netlink(7), rtnetlink(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                   RTNETLINK(3)

--------------

Pages that refer to this page:
`libnetlink(3) <../man3/libnetlink.3.html>`__, 
`rtnetlink(7) <../man7/rtnetlink.7.html>`__, 
`sock_diag(7) <../man7/sock_diag.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/rtnetlink.3.license.html>`__

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
