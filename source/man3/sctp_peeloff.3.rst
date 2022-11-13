.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sctp_peeloff(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SCTP_PEELOFF(3)         Linux Programmer's Manual        SCTP_PEELOFF(3)

NAME
-------------------------------------------------

::

          sctp_peeloff - Branch off an association into a separate socket.


---------------------------------------------------------

::

          #include <sys/types.h>
          #include <sys/socket.h>
          #include <netinet/sctp.h>

          int sctp_peeloff(int sd, sctp_assoc_t assoc_id);
          int sctp_peeloff_flags(int sd, sctp_assoc_t assoc_id, unsigned flags);


---------------------------------------------------------------

::

          sctp_peeloff branches off an existing association assoc_id on a
          one-to-many style socket sd into a separate socket. The new
          socket is a one-to-one style socket.

          This is particularly desirable when, for instance, the
          application wishes to have a number of sporadic message
          senders/receivers remain under the original one-to-many style
          socket, but branch off those assocations carrying high volume
          data traffic into their own separate socket descriptors.

          sctp_peeloff_flags is a variant of sctp_peeloff, in which flags
          describing the behavior of the newly peeled off socket can be
          specified.  Currently the supported flags are:

          SOCK_NONBLOCK
                 Specifies that the new socket should not block on io
                 operations.

          SOCK_CLOEXEC
                 Specifies that the new socket should be closed when the
                 owning process calls exec.


-----------------------------------------------------------------

::

          On success, the new socket descriptor representing the branched-
          off asociation is returned.  On error, -1 is returned, and errno
          is set appropriately.


-----------------------------------------------------

::

          EBADF  sd is not a valid descriptor.

          EINVAL The assoc id passed is invalid or if the socket is a one-
                 to-one style socket.

          ENOTSOCK
                 Argument is a descriptor for a file, not a socket.


---------------------------------------------------

::

          sctp_peeloff_flags is a linux specific variant of sctp_peeloff.
          While it will compile on other systems, its use will result in an
          error return.  Portable code should use sctp_peeloff.


---------------------------------------------------------

::

          sctp(7) sctp_bindx(3), sctp_connectx(3), sctp_sendmsg(3),
          sctp_sendv(3), sctp_send(3), sctp_recvmsg(3), sctp_recvv(3),
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

   Linux 2.6                      2005-10-25                SCTP_PEELOFF(3)

--------------

Pages that refer to this page:
`sctp_bindx(3) <../man3/sctp_bindx.3.html>`__, 
`sctp_connectx(3) <../man3/sctp_connectx.3.html>`__, 
`sctp_getladdrs(3) <../man3/sctp_getladdrs.3.html>`__, 
`sctp_getpaddrs(3) <../man3/sctp_getpaddrs.3.html>`__, 
`sctp_opt_info(3) <../man3/sctp_opt_info.3.html>`__, 
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
