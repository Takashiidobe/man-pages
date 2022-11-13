.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_create_srq(3) — Linux manual page
======================================

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

   RDMA_CREATE_SRQ(3)    Librdmacm Programmer's Manual   RDMA_CREATE_SRQ(3)

NAME
-------------------------------------------------

::

          rdma_create_srq - Allocate a shared receive queue.


---------------------------------------------------------

::

          #include <rdma/rdma_verbs.h>

          int rdma_create_srq (struct rdma_cm_id *id, struct ibv_pd *pd,
          struct ibv_srq_init_attr *attr);


-----------------------------------------------------------

::

          id          RDMA identifier.

          pd          Optional protection domain for the SRQ.

          attr        Initial SRQ attributes.


---------------------------------------------------------------

::

          Allocate a SRQ associated with the specified rdma_cm_id.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          The rdma_cm_id must be bound to a local RDMA device before
          calling this function, and the protection domain, if provided,
          must be for that same device.  After being allocated, the SRQ
          will be ready to handle posting of receives.

          If a protection domain is not given - pd parameter is NULL - then
          the rdma_cm_id will be created using a default protection domain.
          One default protection domain is allocated per RDMA device.

          The initial SRQ attributes are specified by the attr parameter.
          The ext.xrc.cq fields in the ibv_srq_init_attr is optional.  If a
          completion queue is not specified for an XRC SRQ, then a CQ will
          be allocated by the rdma_cm for the SRQ, along with corresponding
          completion channels.  Completion channels and CQ data created by
          the rdma_cm are exposed to the user through the rdma_cm_id
          structure.

          The actual capabilities and properties of the created SRQ will be
          returned to the user through the attr parameter.  An rdma_cm_id
          may only be associated with a single SRQ.


---------------------------------------------------------

::

          rdma_bind_addr(3), rdma_resolve_addr(3), rdma_create_ep(3),
          rdma_destroy_srq(3), ibv_create_srq(3), ibv_create_xsrq(3)

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

   librdmacm                      2011-06-15             RDMA_CREATE_SRQ(3)

--------------

Pages that refer to this page:
`rdma_destroy_srq(3) <../man3/rdma_destroy_srq.3.html>`__

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
