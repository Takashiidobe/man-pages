.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_create_wq(3) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IBV_CREATE_WQ(3)     Libibverbs Programmer's Manual     IBV_CREATE_WQ(3)

NAME
-------------------------------------------------

::

          ibv_create_wq, ibv_destroy_wq - create or destroy a Work Queue
          (WQ).


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_wq *ibv_create_wq(struct ibv_context *context,
                                               struct ibv_wq_init_attr *wq_init_attr);

          int ibv_destroy_wq(struct ibv_wq *wq);


---------------------------------------------------------------

::

          ibv_create_wq() creates a WQ associated with the ibv_context
          context.  The argument wq_init_attr is an ibv_wq_init_attr
          struct, as defined in <infiniband/verbs.h>.

          struct ibv_wq_init_attr {
                  void                      *wq_context;    /* Associated context of the WQ */
                  enum ibv_wq_type           wq_type;       /* WQ type */
                  uint32_t                   max_wr;        /* Requested max number of outstanding WRs in the WQ */
                  uint32_t                   max_sge;       /* Requested max number of scatter/gather (s/g) elements per WR in the WQ */
                  struct  ibv_pd            *pd;            /* PD to be associated with the WQ */
                  struct  ibv_cq            *cq;            /* CQ to be associated with the WQ */
                  uint32_t                   comp_mask;     /* Identifies valid fields. Use ibv_wq_init_attr_mask */
                  uint32_t                   create_flags    /* Creation flags for this WQ, use enum ibv_wq_flags */
          };

          enum ibv_wq_flags {
                  IBV_WQ_FLAGS_CVLAN_STRIPPING            = 1 << 0, /* CVLAN field will be stripped from incoming packets */
                  IBV_WQ_FLAGS_SCATTER_FCS                = 1 << 1, /* FCS field will be scattered to host memory */
                  IBV_WQ_FLAGS_DELAY_DROP                 = 1 << 2, /* Packets won't be dropped immediately if no receive WQEs */
                  IBV_WQ_FLAGS_PCI_WRITE_END_PADDING      = 1 << 3, /* Incoming packets will be padded to cacheline size */
                  IBV_WQ_FLAGS_RESERVED                   = 1 << 4,
          };

          The function ibv_create_wq() will update the wq_init_attr->max_wr
          and wq_init_attr->max_sge fields with the actual WQ values of the
          WQ that was created; the values will be greater than or equal to
          the values requested.

          ibv_destroy_wq() destroys the WQ wq.


-----------------------------------------------------------------

::

          ibv_create_wq() returns a pointer to the created WQ, or NULL if
          the request fails.

          ibv_destroy_wq() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------------

::

          ibv_modify_wq(3),


-------------------------------------------------------

::

          Yishai Hadas <yishaih@mellanox.com>

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

   libibverbs                     2016-07-27               IBV_CREATE_WQ(3)

--------------

Pages that refer to this page:
`ibv_create_rwq_ind_table(3) <../man3/ibv_create_rwq_ind_table.3.html>`__, 
`ibv_modify_wq(3) <../man3/ibv_modify_wq.3.html>`__

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
