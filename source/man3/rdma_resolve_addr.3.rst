.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_resolve_addr(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `INFINIBAND S                     |                                   |
| PECIFIC <#INFINIBAND_SPECIFIC>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA_RESOLVE_ADDR(3)  Librdmacm Programmer's Manual RDMA_RESOLVE_ADDR(3)

NAME
-------------------------------------------------

::

          rdma_resolve_addr - Resolve destination and optional source
          addresses.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_resolve_addr (struct rdma_cm_id *id, struct sockaddr
          *src_addr, struct sockaddr *dst_addr, int timeout_ms);


-----------------------------------------------------------

::

          id          RDMA identifier.

          src_addr    Source address information.  This parameter may be
                      NULL.

          dst_addr    Destination address information.

          timeout_ms  Time to wait for resolution to complete.


---------------------------------------------------------------

::

          Resolve destination and optional source addresses from IP
          addresses to an RDMA address.  If successful, the specified
          rdma_cm_id will be bound to a local device.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          This call is used to map a given destination IP address to a
          usable RDMA address.  The IP to RDMA address mapping is done
          using the local routing tables, or via ARP.  If a source address
          is given, the rdma_cm_id is bound to that address, the same as if
          rdma_bind_addr were called.  If no source address is given, and
          the rdma_cm_id has not yet been bound to a device, then the
          rdma_cm_id will be bound to a source address based on the local
          routing tables.  After this call, the rdma_cm_id will be bound to
          an RDMA device.  This call is typically made from the active side
          of a connection before calling rdma_resolve_route and
          rdma_connect.


-------------------------------------------------------------------------------

::

          This call maps the destination and, if given, source IP addresses
          to GIDs.  In order to perform the mapping, IPoIB must be running
          on both the local and remote nodes.


---------------------------------------------------------

::

          rdma_create_id(3), rdma_resolve_route(3), rdma_connect(3),
          rdma_create_qp(3), rdma_get_cm_event(3), rdma_bind_addr(3),
          rdma_get_src_port(3), rdma_get_dst_port(3),
          rdma_get_local_addr(3), rdma_get_peer_addr(3)

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

   librdmacm                      2007-10-31           RDMA_RESOLVE_ADDR(3)

--------------

Pages that refer to this page:
`rdma_bind_addr(3) <../man3/rdma_bind_addr.3.html>`__, 
`rdma_create_id(3) <../man3/rdma_create_id.3.html>`__, 
`rdma_create_qp(3) <../man3/rdma_create_qp.3.html>`__, 
`rdma_create_srq(3) <../man3/rdma_create_srq.3.html>`__, 
`rdma_get_cm_event(3) <../man3/rdma_get_cm_event.3.html>`__, 
`rdma_get_local_addr(3) <../man3/rdma_get_local_addr.3.html>`__, 
`rdma_get_peer_addr(3) <../man3/rdma_get_peer_addr.3.html>`__, 
`rdma_get_src_port(3) <../man3/rdma_get_src_port.3.html>`__, 
`rdma_join_multicast(3) <../man3/rdma_join_multicast.3.html>`__, 
`rdma_join_multicast_ex(3) <../man3/rdma_join_multicast_ex.3.html>`__, 
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
