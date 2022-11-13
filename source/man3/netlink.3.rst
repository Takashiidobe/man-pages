.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

netlink(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NETLINK(3)              Linux Programmer's Manual             NETLINK(3)

NAME
-------------------------------------------------

::

          netlink - Netlink macros


---------------------------------------------------------

::

          #include <asm/types.h>
          #include <linux/netlink.h>

          int NLMSG_ALIGN(size_t len);
          int NLMSG_LENGTH(size_t len);
          int NLMSG_SPACE(size_t len);
          void *NLMSG_DATA(struct nlmsghdr *nlh);
          struct nlmsghdr *NLMSG_NEXT(struct nlmsghdr *nlh, int len);
          int NLMSG_OK(struct nlmsghdr *nlh, int len);
          int NLMSG_PAYLOAD(struct nlmsghdr *nlh, int len);


---------------------------------------------------------------

::

          <linux/netlink.h> defines several standard macros to access or
          create a netlink datagram.  They are similar in spirit to the
          macros defined in cmsg(3) for auxiliary data.  The buffer passed
          to and from a netlink socket should be accessed using only these
          macros.

          NLMSG_ALIGN()
                 Round the length of a netlink message up to align it
                 properly.

          NLMSG_LENGTH()
                 Given the payload length, len, this macro returns the
                 aligned length to store in the nlmsg_len field of the
                 nlmsghdr.

          NLMSG_SPACE()
                 Return the number of bytes that a netlink message with
                 payload of len would occupy.

          NLMSG_DATA()
                 Return a pointer to the payload associated with the passed
                 nlmsghdr.

          NLMSG_NEXT()
                 Get the next nlmsghdr in a multipart message.  The caller
                 must check if the current nlmsghdr didn't have the
                 NLMSG_DONE set—this function doesn't return NULL on end.
                 The len argument is an lvalue containing the remaining
                 length of the message buffer.  This macro decrements it by
                 the length of the message header.

          NLMSG_OK()
                 Return true if the netlink message is not truncated and is
                 in a form suitable for parsing.

          NLMSG_PAYLOAD()
                 Return the length of the payload associated with the
                 nlmsghdr.


-------------------------------------------------------------------

::

          These macros are nonstandard Linux extensions.


---------------------------------------------------

::

          It is often better to use netlink via libnetlink than via the
          low-level kernel interface.


---------------------------------------------------------

::

          libnetlink(3), netlink(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2014-03-20                     NETLINK(3)

--------------

Pages that refer to this page:
`libnetlink(3) <../man3/libnetlink.3.html>`__, 
`rtnetlink(3) <../man3/rtnetlink.3.html>`__, 
`netlink(7) <../man7/netlink.7.html>`__, 
`sock_diag(7) <../man7/sock_diag.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/netlink.3.license.html>`__

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
