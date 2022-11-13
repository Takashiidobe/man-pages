.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_create_qp(3) — Linux manual page
====================================

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

   IBV_CREATE_QP(3)     Libibverbs Programmer's Manual     IBV_CREATE_QP(3)

NAME
-------------------------------------------------

::

          ibv_create_qp, ibv_destroy_qp - create or destroy a queue pair
          (QP)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_qp *ibv_create_qp(struct ibv_pd *pd,
                                       struct ibv_qp_init_attr *qp_init_attr);

          int ibv_destroy_qp(struct ibv_qp *qp);


---------------------------------------------------------------

::

          ibv_create_qp() creates a queue pair (QP) associated with the
          protection domain pd.  The argument qp_init_attr is an
          ibv_qp_init_attr struct, as defined in <infiniband/verbs.h>.

          struct ibv_qp_init_attr {
                  void                   *qp_context;     /* Associated context of the QP */
                  struct ibv_cq          *send_cq;        /* CQ to be associated with the Send Queue (SQ) */
                  struct ibv_cq          *recv_cq;        /* CQ to be associated with the Receive Queue (RQ) */
                  struct ibv_srq         *srq;            /* SRQ handle if QP is to be associated with an SRQ, otherwise NULL */
                  struct ibv_qp_cap       cap;            /* QP capabilities */
                  enum ibv_qp_type        qp_type;        /* QP Transport Service Type: IBV_QPT_RC, IBV_QPT_UC, IBV_QPT_UD, IBV_QPT_RAW_PACKET or IBV_QPT_DRIVER */
                  int                     sq_sig_all;     /* If set, each Work Request (WR) submitted to the SQ generates a completion entry */
          };

          struct ibv_qp_cap {
                  uint32_t                max_send_wr;    /* Requested max number of outstanding WRs in the SQ */
                  uint32_t                max_recv_wr;    /* Requested max number of outstanding WRs in the RQ */
                  uint32_t                max_send_sge;   /* Requested max number of scatter/gather (s/g) elements in a WR in the SQ */
                  uint32_t                max_recv_sge;   /* Requested max number of s/g elements in a WR in the RQ */
                  uint32_t                max_inline_data;/* Requested max number of data (bytes) that can be posted inline to the SQ, otherwise 0 */
          };

          The function ibv_create_qp() will update the qp_init_attr->cap
          struct with the actual QP values of the QP that was created; the
          values will be greater than or equal to the values requested.

          ibv_destroy_qp() destroys the QP qp.


-----------------------------------------------------------------

::

          ibv_create_qp() returns a pointer to the created QP, or NULL if
          the request fails.  Check the QP number (qp_num) in the returned
          QP.

          ibv_destroy_qp() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          ibv_create_qp() will fail if a it is asked to create QP of a type
          other than IBV_QPT_RC or IBV_QPT_UD associated with an SRQ.

          The attributes max_recv_wr and max_recv_sge are ignored by
          ibv_create_qp() if the QP is to be associated with an SRQ.

          ibv_destroy_qp() fails if the QP is attached to a multicast
          group.

          IBV_QPT_DRIVER does not represent a specific service and is used
          for vendor specific QP logic.


---------------------------------------------------------

::

          ibv_alloc_pd(3), ibv_modify_qp(3), ibv_query_qp(3)


-------------------------------------------------------

::

          Dotan Barak <dotanba@gmail.com>

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

   libibverbs                     2006-10-31               IBV_CREATE_QP(3)

--------------

Pages that refer to this page:
`ibv_alloc_pd(3) <../man3/ibv_alloc_pd.3.html>`__, 
`ibv_create_cq(3) <../man3/ibv_create_cq.3.html>`__, 
`ibv_create_cq_ex(3) <../man3/ibv_create_cq_ex.3.html>`__, 
`ibv_modify_qp(3) <../man3/ibv_modify_qp.3.html>`__, 
`ibv_modify_qp_rate_limit(3) <../man3/ibv_modify_qp_rate_limit.3.html>`__, 
`ibv_open_qp(3) <../man3/ibv_open_qp.3.html>`__, 
`ibv_post_recv(3) <../man3/ibv_post_recv.3.html>`__, 
`ibv_post_send(3) <../man3/ibv_post_send.3.html>`__, 
`ibv_post_srq_recv(3) <../man3/ibv_post_srq_recv.3.html>`__, 
`ibv_query_port(3) <../man3/ibv_query_port.3.html>`__, 
`ibv_query_qp(3) <../man3/ibv_query_qp.3.html>`__, 
`rdma_create_qp(3) <../man3/rdma_create_qp.3.html>`__, 
`rdma_destroy_qp(3) <../man3/rdma_destroy_qp.3.html>`__

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
