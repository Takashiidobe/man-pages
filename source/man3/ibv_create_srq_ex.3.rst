.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_create_srq_ex(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IBV_CREATE_SRQ_EX(3) Libibverbs Programmer's Manual IBV_CREATE_SRQ_EX(3)

NAME
-------------------------------------------------

::

          ibv_create_srq_ex, ibv_destroy_srq - create or destroy a shared
          receive queue (SRQ)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_srq *ibv_create_srq_ex(struct ibv_context *context, struct
                                         ibv_srq_init_attr_ex *srq_init_attr_ex);

          int ibv_destroy_srq(struct ibv_srq *srq);


---------------------------------------------------------------

::

          ibv_create_srq_ex() creates a shared receive queue (SRQ)
          supporting both basic and xrc modes.  The argument
          srq_init_attr_ex is an ibv_srq_init_attr_ex struct, as defined in
          <infiniband/verbs.h>.

          struct ibv_srq_init_attr_ex {
                  void                   *srq_context;    /* Associated context of the SRQ */
                  struct ibv_srq_attr     attr;           /* SRQ attributes */
                  uint32_t                comp_mask;      /* Identifies valid fields */
                  enum ibv_srq_type       srq_type;       /* Basic / XRC / tag matching */
                  struct ibv_pd          *pd;             /* PD associated with the SRQ */
                  struct ibv_xrcd        *xrcd;           /* XRC domain to associate with the SRQ */
                  struct ibv_cq          *cq;             /* CQ to associate with the SRQ for XRC mode */
                  struct ibv_tm_cap       tm_cap;         /* Tag matching attributes */
          };

          struct ibv_srq_attr {
                  uint32_t                max_wr;         /* Requested max number of outstanding work requests (WRs) in the SRQ */
                  uint32_t                max_sge;        /* Requested max number of scatter elements per WR */
                  uint32_t                srq_limit;      /* The limit value of the SRQ */
          };

          struct ibv_tm_cap {
                  uint32_t                max_num_tags;   /* Tag matching list size */
                  uint32_t                max_ops;        /* Number of outstanding tag list operations */
          };

          The function ibv_create_srq_ex() will update the srq_init_attr_ex
          struct with the original values of the SRQ that was created; the
          values of max_wr and max_sge will be greater than or equal to the
          values requested.

          ibv_destroy_srq() destroys the SRQ srq.


-----------------------------------------------------------------

::

          ibv_create_srq_ex() returns a pointer to the created SRQ, or NULL
          if the request fails.

          ibv_destroy_srq() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          ibv_destroy_srq() fails if any queue pair is still associated
          with this SRQ.


---------------------------------------------------------

::

          ibv_alloc_pd(3), ibv_modify_srq(3), ibv_query_srq(3)


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

   libibverbs                     2013-06-26           IBV_CREATE_SRQ_EX(3)

--------------

Pages that refer to this page:
`ibv_open_xrcd(3) <../man3/ibv_open_xrcd.3.html>`__, 
`ibv_post_srq_ops(3) <../man3/ibv_post_srq_ops.3.html>`__

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
