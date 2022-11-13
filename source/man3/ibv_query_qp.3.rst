.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_query_qp(3) — Linux manual page
===================================

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

   IBV_QUERY_QP(3)      Libibverbs Programmer's Manual      IBV_QUERY_QP(3)

NAME
-------------------------------------------------

::

          ibv_query_qp - get the attributes of a queue pair (QP)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_query_qp(struct ibv_qp *qp, struct ibv_qp_attr *attr,
                           int attr_mask,
                           struct ibv_qp_init_attr *init_attr);


---------------------------------------------------------------

::

          ibv_query_qp() gets the attributes specified in attr_mask for the
          QP qp and returns them through the pointers attr and init_attr.
          The argument attr is an ibv_qp_attr struct, as defined in
          <infiniband/verbs.h>.

          struct ibv_qp_attr {
                  enum ibv_qp_state       qp_state;            /* Current QP state */
                  enum ibv_qp_state       cur_qp_state;        /* Current QP state - irrelevant for ibv_query_qp */
                  enum ibv_mtu            path_mtu;            /* Path MTU (valid only for RC/UC QPs) */
                  enum ibv_mig_state      path_mig_state;      /* Path migration state (valid if HCA supports APM) */
                  uint32_t                qkey;                /* Q_Key of the QP (valid only for UD QPs) */
                  uint32_t                rq_psn;              /* PSN for receive queue (valid only for RC/UC QPs) */
                  uint32_t                sq_psn;              /* PSN for send queue */
                  uint32_t                dest_qp_num;         /* Destination QP number (valid only for RC/UC QPs) */
                  unsigned int            qp_access_flags;     /* Mask of enabled remote access operations (valid only for RC/UC QPs) */
                  struct ibv_qp_cap       cap;                 /* QP capabilities */
                  struct ibv_ah_attr      ah_attr;             /* Primary path address vector (valid only for RC/UC QPs) */
                  struct ibv_ah_attr      alt_ah_attr;         /* Alternate path address vector (valid only for RC/UC QPs) */
                  uint16_t                pkey_index;          /* Primary P_Key index */
                  uint16_t                alt_pkey_index;      /* Alternate P_Key index */
                  uint8_t                 en_sqd_async_notify; /* Enable SQD.drained async notification - irrelevant for ibv_query_qp */
                  uint8_t                 sq_draining;         /* Is the QP draining? (Valid only if qp_state is SQD) */
                  uint8_t                 max_rd_atomic;       /* Number of outstanding RDMA reads & atomic operations on the destination QP (valid only for RC QPs) */
                  uint8_t                 max_dest_rd_atomic;  /* Number of responder resources for handling incoming RDMA reads & atomic operations (valid only for RC QPs) */
                  uint8_t                 min_rnr_timer;       /* Minimum RNR NAK timer (valid only for RC QPs) */
                  uint8_t                 port_num;            /* Primary port number */
                  uint8_t                 timeout;             /* Local ack timeout for primary path (valid only for RC QPs) */
                  uint8_t                 retry_cnt;           /* Retry count (valid only for RC QPs) */
                  uint8_t                 rnr_retry;           /* RNR retry (valid only for RC QPs) */
                  uint8_t                 alt_port_num;        /* Alternate port number */
                  uint8_t                 alt_timeout;         /* Local ack timeout for alternate path (valid only for RC QPs) */
          };

          For details on struct ibv_qp_cap see the description of
          ibv_create_qp().  For details on struct ibv_ah_attr see the
          description of ibv_create_ah().


-----------------------------------------------------------------

::

          ibv_query_qp() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          The argument attr_mask is a hint that specifies the minimum list
          of attributes to retrieve.  Some RDMA devices may return extra
          attributes not requested, for example if the value can be
          returned cheaply. This has the same form as in ibv_modify_qp().

          Attribute values are valid if they have been set using
          ibv_modify_qp().  The exact list of valid attributes depends on
          the QP state.

          Multiple calls to ibv_query_qp() may yield some differences in
          the values returned for the following attributes: qp_state,
          path_mig_state, sq_draining, ah_attr (if APM is enabled).


---------------------------------------------------------

::

          ibv_create_qp(3), ibv_destroy_qp(3), ibv_modify_qp(3),
          ibv_create_ah(3)


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

   libibverbs                     2006-10-31                IBV_QUERY_QP(3)

--------------

Pages that refer to this page:
`ibv_create_qp(3) <../man3/ibv_create_qp.3.html>`__, 
`ibv_create_qp_ex(3) <../man3/ibv_create_qp_ex.3.html>`__, 
`ibv_modify_qp(3) <../man3/ibv_modify_qp.3.html>`__, 
`ibv_modify_qp_rate_limit(3) <../man3/ibv_modify_qp_rate_limit.3.html>`__, 
`ibv_open_qp(3) <../man3/ibv_open_qp.3.html>`__, 
`ibv_query_port(3) <../man3/ibv_query_port.3.html>`__

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
