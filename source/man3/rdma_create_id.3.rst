.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_create_id(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `PORT SPACE <#PORT_SPACE>`__ \|   |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA_CREATE_ID(3)     Librdmacm Programmer's Manual    RDMA_CREATE_ID(3)

NAME
-------------------------------------------------

::

          rdma_create_id - Allocate a communication identifier.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_create_id (struct rdma_event_channel *channel, struct
          rdma_cm_id **id, void *context, enum rdma_port_space ps);


-----------------------------------------------------------

::

          channel     The communication channel that events associated with
                      the allocated rdma_cm_id will be reported on.  This
                      may be NULL.

          id          A reference where the allocated communication
                      identifier will be returned.

          context     User specified context associated with the
                      rdma_cm_id.

          ps          RDMA port space.


---------------------------------------------------------------

::

          Creates an identifier that is used to track communication
          information.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          Rdma_cm_id's are conceptually equivalent to a socket for RDMA
          communication.  The difference is that RDMA communication
          requires explicitly binding to a specified RDMA device before
          communication can occur, and most operations are asynchronous in
          nature.  Asynchronous communication events on an rdma_cm_id are
          reported through the associated event channel.  If the channel
          parameter is NULL, the rdma_cm_id will be placed into synchronous
          operation.  While operating synchronously, calls that result in
          an event will block until the operation completes.  The event
          will be returned to the user through the rdma_cm_id structure,
          and be available for access until another rdma_cm call is made.

          Users must release the rdma_cm_id by calling rdma_destroy_id.


-------------------------------------------------------------

::

          Details of the services provided by the different port spaces are
          outlined below.

          RDMA_PS_TCP
                 Provides reliable, connection-oriented QP communication.
                 Unlike TCP, the RDMA port space provides message, not
                 stream, based communication.

          RDMA_PS_UDP
                 Provides unreliable, connectionless QP communication.
                 Supports both datagram and multicast communication.

          RDMA_PS_IB
                 Provides for any IB services (UD, UC, RC, XRC, etc.).


---------------------------------------------------------

::

          rdma_cm(7), rdma_create_event_channel(3), rdma_destroy_id(3),
          rdma_get_devices(3), rdma_bind_addr(3), rdma_resolve_addr(3),
          rdma_connect(3), rdma_listen(3), rdma_set_option(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of the rdma-core (RDMA Core Userspace Libraries
          and Daemons) project.  Information about the project can be found
          at ⟨https://github.com/linux-rdma/rdma-core⟩.  If you have a bug
          report for this manual page, send it to
          linux-rdma@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/linux-rdma/rdma-core.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-18.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   librdmacm                      2010-07-19              RDMA_CREATE_ID(3)

--------------

Pages that refer to this page:
`rdma_bind_addr(3) <../man3/rdma_bind_addr.3.html>`__, 
`rdma_connect(3) <../man3/rdma_connect.3.html>`__, 
`rdma_dereg_mr(3) <../man3/rdma_dereg_mr.3.html>`__, 
`rdma_destroy_id(3) <../man3/rdma_destroy_id.3.html>`__, 
`rdma_getaddrinfo(3) <../man3/rdma_getaddrinfo.3.html>`__, 
`rdma_migrate_id(3) <../man3/rdma_migrate_id.3.html>`__, 
`rdma_post_recv(3) <../man3/rdma_post_recv.3.html>`__, 
`rdma_post_recvv(3) <../man3/rdma_post_recvv.3.html>`__, 
`rdma_reg_msgs(3) <../man3/rdma_reg_msgs.3.html>`__, 
`rdma_reg_read(3) <../man3/rdma_reg_read.3.html>`__, 
`rdma_reg_write(3) <../man3/rdma_reg_write.3.html>`__, 
`rdma_resolve_addr(3) <../man3/rdma_resolve_addr.3.html>`__, 
`rdma_set_option(3) <../man3/rdma_set_option.3.html>`__, 
`rdma_cm(7) <../man7/rdma_cm.7.html>`__

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
