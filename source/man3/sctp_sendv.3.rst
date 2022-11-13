.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sctp_sendv(3) — Linux manual page
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

   SCTP_SENDV(3)                     Linux                    SCTP_SENDV(3)

NAME
-------------------------------------------------

::

          sctp_sendv - Send messages from a SCTP socket with an extensible
          way.


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <sys/socket.h>
          #include <netinet/sctp.h>

          int sctp_sendv(int sd, const struct iovec * iov, int iovcnt,
                         struct sockaddr *addrs, int addrcnt, void * info,
                         socklen_t infolen, unsigned int infotype, int flags);


---------------------------------------------------------------

::

          sctp_sendv provides an extensible way for an application to
          communicate different send attributes to the SCTP stack when
          sending a message. There are three types of attributes that can
          be used to describe a message to be sent. They are struct
          sctp_sndinfo, struct sctp_prinfo, and struct sctp_authinfo. The
          following structure, sctp_sendv_spa, is defined to be used when
          more than one of the above attributes are needed to describe a
          message to be sent.

             struct sctp_sendv_spa {
               uint32_t sendv_flags;
               struct sctp_sndinfo sendv_sndinfo;
               struct sctp_prinfo sendv_prinfo;
               struct sctp_authinfo sendv_authinfo;
             };

          The sendv_flags field holds a bitwise OR of
          SCTP_SEND_SNDINFO_VALID, SCTP_SEND_PRINFO_VALID, and
          SCTP_SEND_AUTHINFO_VALID indicating if the
          sendv_sndinfo/sendv_prinfo/sendv_authinfo fields contain valid
          information.

          sd is the socket descriptor.  iov is the gather buffer,  the data
          in the buffer is treated as a single user message.  iovcnt is the
          number of elements in iov.  addrs is an array of addresses to be
          used to set up an association or a single address to be used to
          send the message, and  NULL is passed in if the caller neither
          wants to set up an association nor wants to send the message to a
          specific address.  addrcnt is the number of addresses in the
          addrs array.  info is a pointer to the buffer containing the
          attribute associated with the message to be sent,  and the type
          is indicated by the info_type parameter.  infolen is the length
          of info, in bytes.  infotype identifies the type of the
          information provided in info ,and the current defined values are
          as follows:

          SCTP_SENDV_NOINFO
                 No information is provided.  The parameter info is a NULL
                 pointer, and infolen is 0.

          SCTP_SENDV_SNDINFO
                 The parameter info is pointing to a struct sctp_sndinfo.

          SCTP_SENDV_PRINFO
                 The parameter info is pointing to a struct sctp_prinfo.

          SCTP_SENDV_AUTHINFO
                 The parameter info is pointing to a struct sctp_authinfo.

          SCTP_SENDV_SPA
                 The parameter info is pointing to a struct sctp_sendv_spa.

          flags The same flags as used by the sendmsg() call flags (e.g.,
          MSG_DONTROUTE).


-----------------------------------------------------------------

::

          On success, sctp_sendv returns the number of bytes sent or -1 if
          an error occurred.


---------------------------------------------------------

::

          sctp(7) sctp_bindx(3), sctp_connectx(3), sctp_send(3),
          sctp_recvmsg(3), sctp_recvv(3), sctp_peeloff(3),
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

   Linux 4.16                     2018-04-29                  SCTP_SENDV(3)

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
`sctp_sendmsg(3) <../man3/sctp_sendmsg.3.html>`__, 
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
