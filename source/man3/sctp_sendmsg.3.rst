.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sctp_sendmsg(3) — Linux manual page
===================================

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

   SCTP_SENDMSG(3)         Linux Programmer's Manual        SCTP_SENDMSG(3)

NAME
-------------------------------------------------

::

          sctp_sendmsg - Send a message from a SCTP socket.


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <sys/socket.h>
          #include <netinet/sctp.h>

          int sctp_sendmsg(int sd, const void * msg, size_t len,
                           struct sockaddr *to, socklen_t tolen,
                           uint32_t ppid, uint32_t flags,
                           uint16_t stream_no, uint32_t timetolive,
                           uint32_t context);


---------------------------------------------------------------

::

          sctp_sendmsg is a wrapper library function that can be used to
          send a message from a socket while using the advanced features of
          SCTP.  sd is the socket descriptor from which the message pointed
          to by msg of length len is sent.  to is the destination address
          of the message and tolen is the length of the destination
          address.  stream_no identifies the stream number that the
          application wishes to send this message to.  flags parameter is
          composed of a bitwise OR of the following values.

          SCTP_UNORDERED
                 This flags requests the un-ordered delivery of the
                 message.

          SCTP_ADDR_OVER
                 This flag, in the one-to-many style, requests the SCTP
                 stack to override the primary destination address with
                 address specified in to.

          SCTP_ABORT
                 Setting this flag causes the specified association to
                 abort by sending an ABORT message to the peer(one-to-many
                 style only). The ABORT chunk will contain an error cause
                 'User Initiated Abort' with cause code 12. The cause
                 specific information of this error cause is provided in
                 msg.

          SCTP_EOF
                 Setting this flag invokes the SCTP graceful shutdown
                 procedure on the specific association(one-to-many style
                 only).

          timetolive specifies the time duration in milliseconds. The
          sending side will expire the message if the message has not been
          sent to the peer within this time period.  A value of 0 indicates
          that no timeout should occur on this message.  ppid is an opaque
          unsigned value that is passed to the remote end along with the
          message.  context is a 32 bit opaque value that is passed back to
          the upper layer along with the undelivered message if an error
          occurs on the send of the message.


-----------------------------------------------------------------

::

          On success, sctp_sendmsg returns the number of bytes sent or -1
          if an error occurred.


---------------------------------------------------------

::

          sctp(7) sctp_bindx(3), sctp_connectx(3), sctp_sendv(3),
          sctp_send(3), sctp_recvmsg(3), sctp_recvv(3), sctp_peeloff(3),
          sctp_getpaddrs(3), sctp_getladdrs(3), sctp_opt_info(3),

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

   Linux 2.6                      2004-10-25                SCTP_SENDMSG(3)

--------------

Pages that refer to this page:
`sctp_bindx(3) <../man3/sctp_bindx.3.html>`__, 
`sctp_connectx(3) <../man3/sctp_connectx.3.html>`__, 
`sctp_getladdrs(3) <../man3/sctp_getladdrs.3.html>`__, 
`sctp_getpaddrs(3) <../man3/sctp_getpaddrs.3.html>`__, 
`sctp_opt_info(3) <../man3/sctp_opt_info.3.html>`__, 
`sctp_peeloff(3) <../man3/sctp_peeloff.3.html>`__, 
`sctp_recvmsg(3) <../man3/sctp_recvmsg.3.html>`__, 
`sctp_recvv(3) <../man3/sctp_recvv.3.html>`__, 
`sctp_send(3) <../man3/sctp_send.3.html>`__, 
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
