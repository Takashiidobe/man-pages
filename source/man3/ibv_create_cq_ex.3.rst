.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_create_cq_ex(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `Polling an extende               |                                   |
| d CQ <#Polling_an_extended_CQ>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IBV_CREATE_CQ_EX(3)  Libibverbs Programmer's Manual  IBV_CREATE_CQ_EX(3)

NAME
-------------------------------------------------

::

          ibv_create_cq_ex - create a completion queue (CQ)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_cq_ex *ibv_create_cq_ex(struct ibv_context *context,
                                             struct ibv_cq_init_attr_ex *cq_attr);


---------------------------------------------------------------

::

          ibv_create_cq_ex() creates a completion queue (CQ) for RDMA
          device context context.  The argument cq_attr is a pointer to
          struct ibv_cq_init_attr_ex as defined in <infiniband/verbs.h>.

          struct ibv_cq_init_attr_ex {
                  int                     cqe;               /* Minimum number of entries required for CQ */
                  void                    *cq_context;       /* Consumer-supplied context returned for completion events */
                  struct ibv_comp_channel *channel;          /* Completion channel where completion events will be queued. May be NULL if completion events will not be used. */
                  int                     comp_vector;       /* Completion vector used to signal completion events. Must be >= 0 and < context->num_comp_vectors. */
                  uint64_t                wc_flags;          /* The wc_flags that should be returned in ibv_poll_cq_ex. Or'ed bit of enum ibv_wc_flags_ex. */
                  uint32_t                comp_mask;         /* compatibility mask (extended verb). */
                  uint32_t                flags              /* One or more flags from enum ibv_create_cq_attr_flags */
                  struct ibv_pd           *parent_domain;    /* Parent domain to be used by this CQ */
          };

          enum ibv_wc_flags_ex {
                  IBV_WC_EX_WITH_BYTE_LEN              = 1 << 0,  /* Require byte len in WC */
                  IBV_WC_EX_WITH_IMM                   = 1 << 1,  /* Require immediate in WC */
                  IBV_WC_EX_WITH_QP_NUM                = 1 << 2,  /* Require QP number in WC */
                  IBV_WC_EX_WITH_SRC_QP                = 1 << 3,  /* Require source QP in WC */
                  IBV_WC_EX_WITH_SLID                  = 1 << 4,  /* Require slid in WC */
                  IBV_WC_EX_WITH_SL                    = 1 << 5,  /* Require sl in WC */
                  IBV_WC_EX_WITH_DLID_PATH_BITS        = 1 << 6,  /* Require dlid path bits in WC */
                  IBV_WC_EX_WITH_COMPLETION_TIMESTAMP  = 1 << 7,  /* Require completion device timestamp in WC /*
                  IBV_WC_EX_WITH_CVLAN                 = 1 << 8,  /* Require VLAN info in WC */
                  IBV_WC_EX_WITH_FLOW_TAG              = 1 << 9,  /* Require flow tag in WC */
                  IBV_WC_EX_WITH_COMPLETION_TIMESTAMP_WALLCLOCK  = 1 << 11, /* Require completion wallclock timestamp in WC */
          };

          enum ibv_cq_init_attr_mask {
                  IBV_CQ_INIT_ATTR_MASK_FLAGS             = 1 << 0,
                  IBV_CQ_INIT_ATTR_MASK_PD                = 1 << 1,
          };

          enum ibv_create_cq_attr_flags {
                  IBV_CREATE_CQ_ATTR_SINGLE_THREADED      = 1 << 0, /* This CQ is used from a single threaded, thus no locking is required */
                  IBV_CREATE_CQ_ATTR_IGNORE_OVERRUN       = 1 << 1, /* This CQ will not pass to error state if overrun, CQE always will be written to next entry.
                                                                     * An application must be designed to avoid ever overflowing the CQ, otherwise CQEs might be lost.
                                                                     */
          };


-------------------------------------------------------------------------------------

::

          In order to poll an extended CQ efficiently, a user could use the
          following functions.

          Completion iterator functions

                 int ibv_start_poll(struct ibv_cq_ex *cq, struct
                 ibv_poll_cq_attr *attr)
                 Start polling a batch of work completions.  attr is given
                 in order to make this function easily extensible in the
                 future. This function either returns 0 on success or an
                 error code otherwise. When no completions are available on
                 the CQ, ENOENT is returned, but the CQ remains in a valid
                 state. On success, querying the completion's attribute
                 could be done using the query functions described below.
                 If an error code is given, end_poll shouldn't be called.

                 int ibv_next_poll(struct ibv_cq_ex *cq)
                 This function is called in order to get the next work
                 completion. It has to be called after start_poll and
                 before end_poll are called. This function either returns 0
                 on success or an error code otherwise. When no completions
                 are available on the CQ, ENOENT is returned, but the CQ
                 remains in a valid state. On success, querying the
                 completion's attribute could be done using the query
                 functions described below. If an error code is given,
                 end_poll should still be called, indicating this is the
                 end of the polled batch.

                 void ibv_end_poll(struct ibv_cq_ex *cq)
                 This function indicates the end of polling batch of work
                 completions. After calling this function, the user should
                 start a new batch by calling start_poll.

          Polling fields in the completion
                 Below members and functions are used in order to poll the
                 current completion. The current completion is the
                 completion which the iterator points to (start_poll and
                 next_poll advances this iterator). Only fields that the
                 user requested via wc_flags in ibv_create_cq_ex could be
                 queried. In addition, some fields are only valid in
                 certain opcodes and status codes.

                 uint64_t wr_id - Can be accessed directly from struct
                 ibv_cq_ex.

                 enum ibv_wc_status - Can be accessed directly from struct
                 ibv_cq_ex.

                 enum ibv_wc_opcode ibv_wc_read_opcode(struct ibv_cq_ex
                 *cq); Get the opcode from the current completion.

                 uint32_t ibv_wc_read_vendor_err(struct ibv_cq_ex *cq); Get
                 the vendor error from the current completion.

                 uint32_t ibv_wc_read_byte_len(struct ibv_cq_ex *cq); Get
                 the vendor error from the current completion.

                 __be32 ibv_wc_read_imm_data(struct ibv_cq_ex *cq); Get the
                 immediate data field from the current completion.

                 uint32_t ibv_wc_read_invalidated_rkey(struct ibv_cq_ex
                 *cq); Get the rkey invalided by the SEND_INVAL from the
                 current completion.

                 uint32_t ibv_wc_read_qp_num(struct ibv_cq_ex *cq); Get the
                 QP number field from the current completion.

                 uint32_t ibv_wc_read_src_qp(struct ibv_cq_ex *cq); Get the
                 source QP number field from the current completion.

                 unsigned int ibv_wc_read_wc_flags(struct ibv_cq_ex *cq);
                 Get the QP flags field from the current completion.

                 uint16_t ibv_wc_read_pkey_index(struct ibv_cq_ex *cq); Get
                 the pkey index field from the current completion.

                 uint32_t ibv_wc_read_slid(struct ibv_cq_ex *cq); Get the
                 slid field from the current completion.

                 uint8_t ibv_wc_read_sl(struct ibv_cq_ex *cq); Get the sl
                 field from the current completion.

                 uint8_t ibv_wc_read_dlid_path_bits(struct ibv_cq_ex *cq);
                 Get the dlid_path_bits field from the current completion.

                 uint64_t ibv_wc_read_completion_ts(struct ibv_cq_ex *cq);
                 Get the completion timestamp from the current completion
                 in HCA clock units.

                 uint64_t ibv_wc_read_completion_wallclock_ns(struct
                 ibv_cq_ex *cq); Get the completion timestamp from the
                 current completion and convert it from HCA clock units to
                 wall clock nanoseconds.

                 uint16_t ibv_wc_read_cvlan(struct ibv_cq_ex *cq); Get the
                 CVLAN field from the current completion.

                 uint32_t ibv_wc_read_flow_tag(struct ibv_cq_ex *cq); Get
                 flow tag from the current completion.

                 void ibv_wc_read_tm_info(struct ibv_cq_ex *cq, struct
                 ibv_wc_tm_info *tm_info);  Get tag matching info from the
                 current completion.
                 struct ibv_wc_tm_info {
                         uint64_t tag;  /* tag from TMH */
                         uint32_t priv; /* opaque user data from TMH */
                 };


-----------------------------------------------------------------

::

          ibv_create_cq_ex() returns a pointer to the CQ, or NULL if the
          request fails.


---------------------------------------------------

::

          ibv_create_cq_ex() may create a CQ with size greater than or
          equal to the requested size. Check the cqe attribute in the
          returned CQ for the actual size.

          CQ should be destroyed with ibv_destroy_cq.


---------------------------------------------------------

::

          ibv_create_cq(3), ibv_destroy_cq(3), ibv_resize_cq(3),
          ibv_req_notify_cq(3), ibv_ack_cq_events(3), ibv_create_qp(3),
          ibv_alloc_parent_domain(3)


-------------------------------------------------------

::

          Matan Barak <matanb@mellanox.com>

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

   libibverbs                     2016-05-08            IBV_CREATE_CQ_EX(3)

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
