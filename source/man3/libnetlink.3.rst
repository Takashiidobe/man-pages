.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libnetlink(3) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   libnetlink(3)           Library Functions Manual           libnetlink(3)

NAME
-------------------------------------------------

::

          libnetlink - A library for accessing the netlink service


---------------------------------------------------------

::

          #include <asm/types.h>
          #include <libnetlink.h>
          #include <linux/netlink.h>
          #include <linux/rtnetlink.h>

          int rtnl_open(struct rtnl_handle *rth, unsigned subscriptions)

          int rtnl_wilddump_request(struct rtnl_handle *rth, int family, int type)

          int rtnl_send(struct rtnl_handle *rth, char *buf, int len)

          int rtnl_dump_request(struct rtnl_handle *rth, int type, void *req, int len)

          int rtnl_dump_filter(struct rtnl_handle *rth,
                         int (*filter)(struct sockaddr_nl *, struct nlmsghdr *n, void *),
                         void *arg1,
                         int (*junk)(struct sockaddr_nl *,struct nlmsghdr *n, void *),
                         void *arg2)

          int rtnl_talk(struct rtnl_handle *rtnl, struct nlmsghdr *n, pid_t peer,
                     unsigned groups, struct nlmsghdr *answer,
                     int (*junk)(struct sockaddr_nl *,struct nlmsghdr *n, void *),
                     void *jarg)

          int rtnl_listen(struct rtnl_handle *rtnl,
                     int (*handler)(struct sockaddr_nl *, struct rtnl_ctrl_data *,
                              struct nlmsghdr *n, void *),
                     void *jarg)

          int rtnl_from_file(FILE *rtnl,
                     int (*handler)(struct sockaddr_nl *,struct nlmsghdr *n, void *),
                     void *jarg)

          int addattr32(struct nlmsghdr *n, int maxlen, int type, __u32 data)

          int addattr_l(struct nlmsghdr *n, int maxlen, int type, void *data, int alen)

          int rta_addattr32(struct rtattr *rta, int maxlen, int type, __u32 data)

          int rta_addattr_l(struct rtattr *rta, int maxlen, int type, void *data, int alen)


---------------------------------------------------------------

::

          libnetlink provides a higher level interface to rtnetlink(7).
          The read functions return 0 on success and a negative errno on
          failure.  The send functions return the amount of data sent, or
          -1 on error.

          rtnl_open
                 Open a rtnetlink socket and save the state into the rth
                 handle. This handle is passed to all subsequent calls.
                 subscriptions is a bitmap of the rtnetlink multicast
                 groups the socket will be a member of.

          rtnl_wilddump_request
                 Request a full dump of the type database for family
                 addresses.  type is a rtnetlink message type.

          rtnl_dump_request
                 Request a full dump of the type data buffer into buf with
                 maximum length of len.  type is a rtnetlink message type.

          rtnl_dump_filter
                 Receive netlink data after a request and filter it.  The
                 filter callback checks if the received message is wanted.
                 It gets the source address of the message, the message
                 itself and arg1 as arguments. 0 as return means that the
                 filter passed, a negative value is returned by
                 rtnl_dump_filter in case of error. NULL for filter means
                 to not use a filter.  junk is used to filter messages not
                 destined to the local socket.  Only one message bundle is
                 received. If there is a message pending, this function
                 does not block.

          rtnl_listen
                 Receive netlink data after a request and pass it to
                 handler.  handler is a callback that gets the message
                 source address, anscillary data, the message itself, and
                 the jarg cookie as arguments. It will get called for all
                 received messages.  Only one message bundle is received.
                 If there is a message pending this function does not
                 block.

          rtnl_from_file
                 Works like rtnl_listen, but reads a netlink message bundle
                 from the file file and passes the messages to handler for
                 parsing. The file should contain raw data as received from
                 a rtnetlink socket.

          The following functions are useful to construct custom rtnetlink
          messages. For simple database dumping with filtering it is better
          to use the higher level functions above. See rtnetlink(3) and
          netlink(3) on how to generate a rtnetlink message. The following
          utility functions require a continuous buffer that already
          contains a netlink message header and a rtnetlink request.

          rtnl_send
                 Send the rtnetlink message in buf of length len to handle
                 rth.

          addattr32
                 Add a __u32 attribute of type type and with value data to
                 netlink message n, which is part of a buffer of length
                 maxlen.

          addattr_l
                 Add a variable length attribute of type type and with
                 value data and alen length to netlink message n, which is
                 part of a buffer of length maxlen.  data is copied.

          rta_addattr32
                 Initialize the rtnetlink attribute rta with a __u32 data
                 value.

          rta_addattr32
                 Initialize the rtnetlink attribute rta with a variable
                 length data value.


-------------------------------------------------

::

          This library is meant for internal use, use libmnl for new
          programs.

          The functions sometimes use fprintf and exit when a fatal error
          occurs.  This library should be named librtnetlink.


-------------------------------------------------------

::

          netlink/rtnetlink was designed and written by Alexey Kuznetsov.
          Andi Kleen wrote the man page.


---------------------------------------------------------

::

          netlink(7), rtnetlink(7)
          /usr/include/linux/rtnetlink.h

COLOPHON
---------------------------------------------------------

::

          This page is part of the iproute2 (utilities for controlling
          TCP/IP networking and traffic) project.  Information about the
          project can be found at 
          ⟨http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2⟩.
          If you have a bug report for this manual page, send it to
          netdev@vger.kernel.org, shemminger@osdl.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/network/iproute2/iproute2.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-18.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                              libnetlink(3)

--------------

Pages that refer to this page: `netlink(3) <../man3/netlink.3.html>`__

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
