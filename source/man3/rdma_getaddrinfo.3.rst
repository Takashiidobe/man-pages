.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_getaddrinfo(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `                                 |                                   |
| rdma_addrinfo <#rdma_addrinfo>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA_GETADDRINFO(3)   Librdmacm Programmer's Manual  RDMA_GETADDRINFO(3)

NAME
-------------------------------------------------

::

          rdma_getaddrinfo - Provides transport independent address
          translation.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_getaddrinfo (const char *node, const char *service,
          const struct rdma_addrinfo *hints, struct rdma_addrinfo **res);


-----------------------------------------------------------

::

          node        Optional, name, dotted-decimal IPv4, or IPv6 hex
                      address to resolve.

          service     Service name or port number of address.

          hints       Reference to an rdma_addrinfo structure containing
                      hints about the type of service the caller supports.

          res         A pointer to a linked list of rdma_addrinfo
                      structures containing response information.


---------------------------------------------------------------

::

          Resolves the destination node and service address and returns
          information needed to establish communication.  Provides the RDMA
          functional equivalent to getaddrinfo.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error (errno will be set to
          indicate the failure reason), or one of the following nonzero
          error codes:

          EAI_ADDRFAMILY
                      The specified network host does not have any network
                      addresses in the requested address family.

          EAI_AGAIN   The name server returned a temporary failure
                      indication. Try again later.

          EAI_BADFLAGS
                      hints.ai_flags contains invalid flags.

          EAI_FAIL    The name server returned a permanent failure
                      indication.

          EAI_FAMILY  The requested address family is not supported.

          EAI_MEMORY  Out of memory.

          EAI_NODATA  The specified network host exists, but does not have
                      any network addresses defined.

          EAI_NONAME  The node or service is not known; or both node and
                      service are NULL.

          EAI_SERVICE The requested service is not available for the
                      requested QP type. It may be available through
                      another QP type.

          EAI_QPTYPE  The requested socket type is not supported. This
                      could occur, for example, if hints.ai_qptype and
                      hints.ai_port_space are inconsistent (e.g.,
                      IBV_QPT_UD and RDMA_PS_TCP, respectively).

          EAI_SYSTEM  Other system error, check errno for details.  The
                      gai_strerror() function translates these error codes
                      to a human readable string, suitable for error
                      reporting.


---------------------------------------------------

::

          Either node, service, or hints must be provided.  If hints are
          provided, the operation will be controlled by hints.ai_flags.  If
          RAI_PASSIVE is specified, the call will resolve address
          information for use on the passive side of a connection.  If node
          is provided, rdma_getaddrinfo will attempt to resolve the RDMA
          address, route, and connection data to the given node.  The hints
          parameter, if provided, may be used to control the resulting
          output as indicated below.  If node is not given,
          rdma_getaddrinfo will attempt to resolve the RDMA addressing
          information based on the hints.ai_src_addr, hints.ai_dst_addr, or
          hints.ai_route.


-------------------------------------------------------------------

::

          ai_flags    Hint flags that control the operation.  Supported
                      flags are:

          RAI_PASSIVE Indicates that the results will be used on the
                      passive/listening side of a connection.

          RAI_NUMERICHOST
                      If specified, then the node parameter, if provided,
                      must be a numerical network address.  This flag
                      suppresses any lengthy address resolution.

          RAI_NOROUTE If set, this flag suppresses any lengthy route
                      resolution.

          RAI_FAMILY  If set, the ai_family setting should be used as an
                      input hint for interpretting the node parameter.

          ai_family   Address family for the source and destination
                      address.  Supported families are: AF_INET, AF_INET6,
                      and AF_IB.

          ai_qp_type  Indicates the type of RDMA QP used for communication.
                      Supported types are: IBV_QPT_UD (unreliable datagram)
                      and IBV_QPT_RC (reliable connected).

          ai_port_space
                      RDMA port space in use.  Supported values are:
                      RDMA_PS_UDP, RDMA_PS_TCP, and RDMA_PS_IB.

          ai_src_len  The length of the source address referenced by
                      ai_src_addr.  This will be 0 if an appropriate source
                      address could not be discovered for a given
                      destination.

          ai_dst_len  The length of the destination address referenced by
                      ai_dst_addr.  This will be 0 if the RAI_PASSIVE flag
                      was specified as part of the hints.

          ai_src_addr If provided, the address for the local RDMA device.

          ai_dst_addr If provided, the address for the destination RDMA
                      device.

          ai_src_canonname
                      The canonical for the source.

          ai_dst_canonname
                      The canonical for the destination.

          ai_route_len
                      Size of the routing information buffer referenced by
                      ai_route.  This will be 0 if the underlying transport
                      does not require routing data, or none could be
                      resolved.

          ai_route    Routing information for RDMA transports that require
                      routing data as part of connection establishment.
                      The format of the routing data depends on the
                      underlying transport.  If Infiniband transports are
                      used, ai_route will reference an array of struct
                      ibv_path_data on output, if routing data is
                      available.  Routing paths may be restricted by
                      setting desired routing data fields on input to
                      rdma_getaddrinfo.  For Infiniband, hints.ai_route may
                      reference an array of struct ibv_path_record or
                      struct ibv_path_data on input.

          ai_connect_len
                      Size of connection information referenced by
                      ai_connect.  This will be 0 if the underlying
                      transport does not require additional connection
                      information.

          ai_connect  Data exchanged as part of the connection
                      establishment process.  If provided, ai_connect data
                      must be transferred as private data, with any user
                      supplied private data following it.

          ai_next     Pointer to the next rdma_addrinfo structure in the
                      list.  Will be NULL if no more structures exist.


---------------------------------------------------------

::

          rdma_create_id(3), rdma_resolve_route(3), rdma_connect(3),
          rdma_create_qp(3), rdma_bind_addr(3), rdma_create_ep(3)

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

   librdmacm                      2010-07-19            RDMA_GETADDRINFO(3)

--------------

Pages that refer to this page:
`rdma_create_ep(3) <../man3/rdma_create_ep.3.html>`__, 
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
