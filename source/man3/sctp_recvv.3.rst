.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sctp_recvv(3) — Linux manual page
=================================

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

   SCTP_RECVV(3)                     Linux                    SCTP_RECVV(3)

NAME
-------------------------------------------------

::

          sctp_recvv - Receive a message from a SCTP socket with an
          extensible way.


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <sys/socket.h>
          #include <netinet/sctp.h>

          int sctp_recvv(int sd, const struct iovec * iov, int iovlen,
                         struct sockaddr * from, socklen_t * fromlen, void * info,
                         socklen_t * infolen, unsigned int * infotype, int * flags);


---------------------------------------------------------------

::

          sctp_recvv provides an extensible way for the SCTP stack to pass
          up different SCTP attributes associated with a received message
          to an application.  There are two types of attributes that can be
          returned by this call: the attribute of the received message and
          the attribute of the next message in the receive buffer.  The
          caller enables the SCTP_RECVRCVINFO and SCTP_RECVNXTINFO socket
          options, respectively, to receive these attributes.  Attributes
          of the received message are returned in struct sctp_rcvinfo, and
          attributes of the next message are returned in struct
          sctp_nxtinfo.  If both options are enabled, both attributes are
          returned using the following structure.

             struct sctp_recvv_rn {
               struct sctp_rcvinfo recvv_rcvinfo;
               struct sctp_nxtinfo recvv_nxtinfo;
             };

          sd is the socket descriptor.  iov is the scatter buffer, and only
          one user message is returned in this buffer.  iovlen is the
          number of elements in iov.  from is a pointer to a buffer to be
          filled with the sender of the received message's address.
          fromlen is an in/out parameter describing the from length.  info
          is a pointer to the buffer to hold the attributes of the received
          message, the structure type of info is determined by the
          info_type parameter.  infolen is an in/out parameter describing
          the size of the info buffer.  On return, infotype is set to the
          type of the info buffer, and the current defined values are as
          follows:

          SCTP_RECVV_NOINFO
                 If neither SCTP_RECVRCVINFO nor SCTP_RECVNXTINFO options
                 are enabled, no attribute will be returned.  If only the
                 SCTP_RECVNXTINFO option is enabled but there is no next
                 message in the buffer, no attribute will be returned.  In
                 these cases, *info_type will be set to SCTP_RECVV_NOINFO.

          SCTP_RECVV_RCVINFO
                 The type of info is struct sctp_rcvinfo, and the attribute
                 relates to the received message.

          SCTP_RECVV_NXTINFO
                 The type of info is struct sctp_nxtinfo, and the attribute
                 relates to the next message in the receive buffer.  This
                 is the case when only the SCTP_RECVNXTINFO option is
                 enabled and there is a next message in the buffer.

          SCTP_RECVV_RN
                 The type of info is struct sctp_recvv_rn.  The
                 recvv_rcvinfo field is the attribute of the received
                 message, and the recvv_nxtinfo field is the attribute of
                 the next message in the buffer.  This is the case when
                 both SCTP_RECVRCVINFO and SCTP_RECVNXTINFO options are
                 enabled and there is a next message in the receive buffer.

          flags is pointer to an integer to be filled with any message
          flags (e.g., MSG_NOTIFICATION).


-----------------------------------------------------------------

::

          On success, sctp_recvv returns the number of bytes received or -1
          if an error occurred.


---------------------------------------------------------

::

          sctp(7) sctp_bindx(3), sctp_connectx(3), sctp_sendmsg(3),
          sctp_sendv(3), sctp_send(3), sctp_peeloff(3), sctp_getpaddrs(3),
          sctp_getladdrs(3), sctp_opt_info(3)

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

   Linux 4.16                     2018-04-29                  SCTP_RECVV(3)

--------------

Pages that refer to this page:
`sctp_bindx(3) <../man3/sctp_bindx.3.html>`__, 
`sctp_connectx(3) <../man3/sctp_connectx.3.html>`__, 
`sctp_getladdrs(3) <../man3/sctp_getladdrs.3.html>`__, 
`sctp_getpaddrs(3) <../man3/sctp_getpaddrs.3.html>`__, 
`sctp_opt_info(3) <../man3/sctp_opt_info.3.html>`__, 
`sctp_peeloff(3) <../man3/sctp_peeloff.3.html>`__, 
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
