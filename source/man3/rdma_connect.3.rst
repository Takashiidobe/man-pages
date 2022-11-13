.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_connect(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `CONNECTION PROPE                 |                                   |
| RTIES <#CONNECTION_PROPERTIES>`__ |                                   |
| \|                                |                                   |
| `INFINIBAND S                     |                                   |
| PECIFIC <#INFINIBAND_SPECIFIC>`__ |                                   |
| \|                                |                                   |
| `IW                               |                                   |
| ARP SPECIFIC <#IWARP_SPECIFIC>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA_CONNECT(3)       Librdmacm Programmer's Manual      RDMA_CONNECT(3)

NAME
-------------------------------------------------

::

          rdma_connect - Initiate an active connection request.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_connect (struct rdma_cm_id *id, struct rdma_conn_param
          *conn_param);


-----------------------------------------------------------

::

          id          RDMA identifier.

          conn_param  connection parameters.  See CONNECTION PROPERTIES
                      below for details.


---------------------------------------------------------------

::

          For an rdma_cm_id of type RDMA_PS_TCP, this call initiates a
          connection request to a remote destination.  For an rdma_cm_id of
          type RDMA_PS_UDP, it initiates a lookup of the remote QP
          providing the datagram service.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          Users must have resolved a route to the destination address by
          having called rdma_resolve_route or rdma_create_ep before calling
          this routine.


-----------------------------------------------------------------------------------

::

          The following properties are used to configure the communication
          and specified by the conn_param parameter when connecting or
          establishing datagram communication.

          private_data
                 References a user-controlled data buffer.  The contents of
                 the buffer are copied and transparently passed to the
                 remote side as part of the communication request.  May be
                 NULL if private_data is not required.

          private_data_len
                 Specifies the size of the user-controlled data buffer.
                 Note that the actual amount of data transferred to the
                 remote side is transport dependent and may be larger than
                 that requested.

          responder_resources
                 The maximum number of outstanding RDMA read and atomic
                 operations that the local side will accept from the remote
                 side.  Applies only to RDMA_PS_TCP.  This value must be
                 less than or equal to the local RDMA device attribute
                 max_qp_rd_atom and remote RDMA device attribute
                 max_qp_init_rd_atom.  The remote endpoint can adjust this
                 value when accepting the connection.

          initiator_depth
                 The maximum number of outstanding RDMA read and atomic
                 operations that the local side will have to the remote
                 side.  Applies only to RDMA_PS_TCP.  This value must be
                 less than or equal to the local RDMA device attribute
                 max_qp_init_rd_atom and remote RDMA device attribute
                 max_qp_rd_atom.  The remote endpoint can adjust this value
                 when accepting the connection.

          flow_control
                 Specifies if hardware flow control is available.  This
                 value is exchanged with the remote peer and is not used to
                 configure the QP.  Applies only to RDMA_PS_TCP.

          retry_count
                 The maximum number of times that a data transfer operation
                 should be retried on the connection when an error occurs.
                 This setting controls the number of times to retry send,
                 RDMA, and atomic operations when timeouts occur.  Applies
                 only to RDMA_PS_TCP.

          rnr_retry_count
                 The maximum number of times that a send operation from the
                 remote peer should be retried on a connection after
                 receiving a receiver not ready (RNR) error.  RNR errors
                 are generated when a send request arrives before a buffer
                 has been posted to receive the incoming data.  Applies
                 only to RDMA_PS_TCP.

          srq    Specifies if the QP associated with the connection is
                 using a shared receive queue.  This field is ignored by
                 the library if a QP has been created on the rdma_cm_id.
                 Applies only to RDMA_PS_TCP.

          qp_num Specifies the QP number associated with the connection.
                 This field is ignored by the library if a QP has been
                 created on the rdma_cm_id.  Applies only to RDMA_PS_TCP.


-------------------------------------------------------------------------------

::

          In addition to the connection properties defined above,
          InfiniBand QPs are configured with minimum RNR NAK timer and
          local ACK timeout values.  The minimum RNR NAK timer value is set
          to 0, for a delay of 655 ms.  The local ACK timeout is calculated
          based on the packet lifetime and local HCA ACK delay.  The packet
          lifetime is determined by the InfiniBand Subnet Administrator and
          is part of the resolved route (path record) information.  The HCA
          ACK delay is a property of the locally used HCA.

          Retry count and RNR retry count values are 3-bit values.

          The length of the private data provided by the user is limited to
          56 bytes for RDMA_PS_TCP, or 180 bytes for RDMA_PS_UDP.


---------------------------------------------------------------------

::

          Connections established over iWarp RDMA devices currently require
          that the active side of the connection send the first message.


---------------------------------------------------------

::

          rdma_cm(7), rdma_create_id(3), rdma_resolve_route(3),
          rdma_disconnect(3), rdma_listen(3), rdma_get_cm_event(3)

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

   librdmacm                      2010-07-19                RDMA_CONNECT(3)

--------------

Pages that refer to this page:
`rdma_create_ep(3) <../man3/rdma_create_ep.3.html>`__, 
`rdma_create_id(3) <../man3/rdma_create_id.3.html>`__, 
`rdma_disconnect(3) <../man3/rdma_disconnect.3.html>`__, 
`rdma_getaddrinfo(3) <../man3/rdma_getaddrinfo.3.html>`__, 
`rdma_get_cm_event(3) <../man3/rdma_get_cm_event.3.html>`__, 
`rdma_get_dst_port(3) <../man3/rdma_get_dst_port.3.html>`__, 
`rdma_get_request(3) <../man3/rdma_get_request.3.html>`__, 
`rdma_listen(3) <../man3/rdma_listen.3.html>`__, 
`rdma_notify(3) <../man3/rdma_notify.3.html>`__, 
`rdma_post_read(3) <../man3/rdma_post_read.3.html>`__, 
`rdma_post_readv(3) <../man3/rdma_post_readv.3.html>`__, 
`rdma_post_send(3) <../man3/rdma_post_send.3.html>`__, 
`rdma_post_sendv(3) <../man3/rdma_post_sendv.3.html>`__, 
`rdma_post_ud_send(3) <../man3/rdma_post_ud_send.3.html>`__, 
`rdma_post_write(3) <../man3/rdma_post_write.3.html>`__, 
`rdma_post_writev(3) <../man3/rdma_post_writev.3.html>`__, 
`rdma_resolve_addr(3) <../man3/rdma_resolve_addr.3.html>`__, 
`rdma_resolve_route(3) <../man3/rdma_resolve_route.3.html>`__, 
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
