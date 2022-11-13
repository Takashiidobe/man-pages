.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cmsg(3) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CMSG(3)                 Linux Programmer's Manual                CMSG(3)

NAME
-------------------------------------------------

::

          CMSG_ALIGN, CMSG_SPACE, CMSG_NXTHDR, CMSG_FIRSTHDR - access
          ancillary data


---------------------------------------------------------

::

          #include <sys/socket.h>

          struct cmsghdr *CMSG_FIRSTHDR(struct msghdr *msgh);
          struct cmsghdr *CMSG_NXTHDR(struct msghdr *msgh,
                                      struct cmsghdr *cmsg);
          size_t CMSG_ALIGN(size_t length);
          size_t CMSG_SPACE(size_t length);
          size_t CMSG_LEN(size_t length);
          unsigned char *CMSG_DATA(struct cmsghdr *cmsg);


---------------------------------------------------------------

::

          These macros are used to create and access control messages (also
          called ancillary data) that are not a part of the socket payload.
          This control information may include the interface the packet was
          received on, various rarely used header fields, an extended error
          description, a set of file descriptors, or UNIX credentials.  For
          instance, control messages can be used to send additional header
          fields such as IP options.  Ancillary data is sent by calling
          sendmsg(2) and received by calling recvmsg(2).  See their manual
          pages for more information.

          Ancillary data is a sequence of cmsghdr structures with appended
          data.  See the specific protocol man pages for the available
          control message types.  The maximum ancillary buffer size allowed
          per socket can be set using /proc/sys/net/core/optmem_max; see
          socket(7).

          The cmsghdr structure is defined as follows:

              struct cmsghdr {
                  size_t cmsg_len;    /* Data byte count, including header
                                         (type is socklen_t in POSIX) */
                  int    cmsg_level;  /* Originating protocol */
                  int    cmsg_type;   /* Protocol-specific type */
              /* followed by
                 unsigned char cmsg_data[]; */
              };

          The sequence of cmsghdr structures should never be accessed
          directly.  Instead, use only the following macros:

          *  CMSG_FIRSTHDR() returns a pointer to the first cmsghdr in the
             ancillary data buffer associated with the passed msghdr.  It
             returns NULL if there isn't enough space for a cmsghdr in the
             buffer.

          *  CMSG_NXTHDR() returns the next valid cmsghdr after the passed
             cmsghdr.  It returns NULL when there isn't enough space left
             in the buffer.

             When initializing a buffer that will contain a series of
             cmsghdr structures (e.g., to be sent with sendmsg(2)), that
             buffer should first be zero-initialized to ensure the correct
             operation of CMSG_NXTHDR().

          *  CMSG_ALIGN(), given a length, returns it including the
             required alignment.  This is a constant expression.

          *  CMSG_SPACE() returns the number of bytes an ancillary element
             with payload of the passed data length occupies.  This is a
             constant expression.

          *  CMSG_DATA() returns a pointer to the data portion of a
             cmsghdr.  The pointer returned cannot be assumed to be
             suitably aligned for accessing arbitrary payload data types.
             Applications should not cast it to a pointer type matching the
             payload, but should instead use memcpy(3) to copy data to or
             from a suitably declared object.

          *  CMSG_LEN() returns the value to store in the cmsg_len member
             of the cmsghdr structure, taking into account any necessary
             alignment.  It takes the data length as an argument.  This is
             a constant expression.

          To create ancillary data, first initialize the msg_controllen
          member of the msghdr with the length of the control message
          buffer.  Use CMSG_FIRSTHDR() on the msghdr to get the first
          control message and CMSG_NXTHDR() to get all subsequent ones.  In
          each control message, initialize cmsg_len (with CMSG_LEN()), the
          other cmsghdr header fields, and the data portion using
          CMSG_DATA().  Finally, the msg_controllen field of the msghdr
          should be set to the sum of the CMSG_SPACE() of the length of all
          control messages in the buffer.  For more information on the
          msghdr, see recvmsg(2).


-------------------------------------------------------------------

::

          This ancillary data model conforms to the POSIX.1g draft, 4.4BSD-
          Lite, the IPv6 advanced API described in RFC 2292 and SUSv2.
          CMSG_FIRSTHDR(), CMSG_NXTHDR(), and CMSG_DATA() are specified in
          POSIX.1-2008.  CMSG_SPACE() and CMSG_LEN() will be included in
          the next POSIX release (Issue 8).

          CMSG_ALIGN() is a Linux extension.


---------------------------------------------------

::

          For portability, ancillary data should be accessed using only the
          macros described here.  CMSG_ALIGN() is a Linux extension and
          should not be used in portable programs.

          In Linux, CMSG_LEN(), CMSG_DATA(), and CMSG_ALIGN() are constant
          expressions (assuming their argument is constant), meaning that
          these values can be used to declare the size of global variables.
          This may not be portable, however.


---------------------------------------------------------

::

          This code looks for the IP_TTL option in a received ancillary
          buffer:

              struct msghdr msgh;
              struct cmsghdr *cmsg;
              int received_ttl;

              /* Receive auxiliary data in msgh */

              for (cmsg = CMSG_FIRSTHDR(&msgh); cmsg != NULL;
                      cmsg = CMSG_NXTHDR(&msgh, cmsg)) {
                  if (cmsg->cmsg_level == IPPROTO_IP
                          && cmsg->cmsg_type == IP_TTL) {
                      memcpy(&receive_ttl, CMSG_DATA(cmsg), sizeof(received_ttl));
                      break;
                  }
              }

              if (cmsg == NULL) {
                  /* Error: IP_TTL not enabled or small buffer or I/O error */
              }

          The code below passes an array of file descriptors over a UNIX
          domain socket using SCM_RIGHTS:

              struct msghdr msg = { 0 };
              struct cmsghdr *cmsg;
              int myfds[NUM_FD];  /* Contains the file descriptors to pass */
              char iobuf[1];
              struct iovec io = {
                  .iov_base = iobuf,
                  .iov_len = sizeof(iobuf)
              };
              union {         /* Ancillary data buffer, wrapped in a union
                                 in order to ensure it is suitably aligned */
                  char buf[CMSG_SPACE(sizeof(myfds))];
                  struct cmsghdr align;
              } u;

              msg.msg_iov = &io;
              msg.msg_iovlen = 1;
              msg.msg_control = u.buf;
              msg.msg_controllen = sizeof(u.buf);
              cmsg = CMSG_FIRSTHDR(&msg);
              cmsg->cmsg_level = SOL_SOCKET;
              cmsg->cmsg_type = SCM_RIGHTS;
              cmsg->cmsg_len = CMSG_LEN(sizeof(myfds));
              memcpy(CMSG_DATA(cmsg), myfds, sizeof(myfds));

          For a complete code example that shows passing of file
          descriptors over a UNIX domain socket, see seccomp_unotify(2).


---------------------------------------------------------

::

          recvmsg(2), sendmsg(2)

          RFC 2292

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        CMSG(3)

--------------

Pages that refer to this page:
`memfd_create(2) <../man2/memfd_create.2.html>`__, 
`recv(2) <../man2/recv.2.html>`__,  `send(2) <../man2/send.2.html>`__, 
`netlink(3) <../man3/netlink.3.html>`__, 
`ipv6(7) <../man7/ipv6.7.html>`__, 
`netlink(7) <../man7/netlink.7.html>`__, 
`packet(7) <../man7/packet.7.html>`__, 
`rtnetlink(7) <../man7/rtnetlink.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/cmsg.3.license.html>`__

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
