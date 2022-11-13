.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_create_qp(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA_CREATE_QP(3)     Librdmacm Programmer's Manual    RDMA_CREATE_QP(3)

NAME
-------------------------------------------------

::

          rdma_create_qp - Allocate a QP.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_create_qp (struct rdma_cm_id *id, struct ibv_pd *pd,
          struct ibv_qp_init_attr *qp_init_attr);


-----------------------------------------------------------

::

          id          RDMA identifier.

          pd          Optional protection domain for the QP.

          qp_init_attr
                      Initial QP attributes.


---------------------------------------------------------------

::

          Allocate a QP associated with the specified rdma_cm_id and
          transition it for sending and receiving.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          The rdma_cm_id must be bound to a local RDMA device before
          calling this function, and the protection domain must be for that
          same device.  QPs allocated to an rdma_cm_id are automatically
          transitioned by the librdmacm through their states.  After being
          allocated, the QP will be ready to handle posting of receives.
          If the QP is unconnected, it will be ready to post sends.

          If a protection domain is not given - pd parameter is NULL - then
          the rdma_cm_id will be created using a default protection domain.
          One default protection domain is allocated per RDMA device.

          The initial QP attributes are specified by the qp_init_attr
          parameter.  The send_cq and recv_cq fields in the
          ibv_qp_init_attr are optional.  If a send or receive completion
          queue is not specified, then a CQ will be allocated by the
          rdma_cm for the QP, along with corresponding completion channels.
          Completion channels and CQ data created by the rdma_cm are
          exposed to the user through the rdma_cm_id structure.

          The actual capabilities and properties of the created QP will be
          returned to the user through the qp_init_attr parameter.  An
          rdma_cm_id may only be associated with a single QP.


---------------------------------------------------------

::

          rdma_bind_addr(3), rdma_resolve_addr(3), rdma_destroy_qp(3),
          ibv_create_qp(3), ibv_modify_qp(3)

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

   librdmacm                      2007-05-15              RDMA_CREATE_QP(3)

--------------

Pages that refer to this page:
`rdma_bind_addr(3) <../man3/rdma_bind_addr.3.html>`__, 
`rdma_destroy_qp(3) <../man3/rdma_destroy_qp.3.html>`__, 
`rdma_getaddrinfo(3) <../man3/rdma_getaddrinfo.3.html>`__, 
`rdma_join_multicast(3) <../man3/rdma_join_multicast.3.html>`__, 
`rdma_join_multicast_ex(3) <../man3/rdma_join_multicast_ex.3.html>`__, 
`rdma_post_recv(3) <../man3/rdma_post_recv.3.html>`__, 
`rdma_post_recvv(3) <../man3/rdma_post_recvv.3.html>`__, 
`rdma_resolve_addr(3) <../man3/rdma_resolve_addr.3.html>`__, 
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
