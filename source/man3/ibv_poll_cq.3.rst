.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_poll_cq(3) — Linux manual page
==================================

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

   IBV_POLL_CQ(3)       Libibverbs Programmer's Manual       IBV_POLL_CQ(3)

NAME
-------------------------------------------------

::

          ibv_poll_cq - poll a completion queue (CQ)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_poll_cq(struct ibv_cq *cq, int num_entries,
                          struct ibv_wc *wc);


---------------------------------------------------------------

::

          ibv_poll_cq() polls the CQ cq for work completions and returns
          the first num_entries (or all available completions if the CQ
          contains fewer than this number) in the array wc.  The argument
          wc is a pointer to an array of ibv_wc structs, as defined in
          <infiniband/verbs.h>.

          struct ibv_wc {
                  uint64_t                wr_id;          /* ID of the completed Work Request (WR) */
                  enum ibv_wc_status      status;         /* Status of the operation */
                  enum ibv_wc_opcode      opcode;         /* Operation type specified in the completed WR */
                  uint32_t                vendor_err;     /* Vendor error syndrome */
                  uint32_t                byte_len;       /* Number of bytes transferred */
                  union {
                          __be32                  imm_data;         /* Immediate data (in network byte order) */
                          uint32_t                invalidated_rkey; /* Local RKey that was invalidated */
                  };
                  uint32_t                qp_num;         /* Local QP number of completed WR */
                  uint32_t                src_qp;         /* Source QP number (remote QP number) of completed WR (valid only for UD QPs) */
                  unsigned int            wc_flags;       /* Flags of the completed WR */
                  uint16_t                pkey_index;     /* P_Key index (valid only for GSI QPs) */
                  uint16_t                slid;           /* Source LID */
                  uint8_t                 sl;             /* Service Level */
                  uint8_t                 dlid_path_bits; /* DLID path bits (not applicable for multicast messages) */
          };

          The attribute wc_flags describes the properties of the work
          completion.  It is either 0 or the bitwise OR of one or more of
          the following flags:

          IBV_WC_GRH  GRH is present (valid only for UD QPs)

          IBV_WC_WITH_IMM  Immediate data value is valid

          IBV_WC_WITH_INV  Invalidated RKey data value is valid (cannot be
          combined with IBV_WC_WITH_IMM)

          IBV_WC_IP_CSUM_OK  TCP/UDP checksum over IPv4 and IPv4 header
          checksum are
                 verified.  Valid only when device_cap_flags in device_attr
                 indicates current QP is supported by checksum offload.

          Not all wc attributes are always valid. If the completion status
          is other than IBV_WC_SUCCESS, only the following attributes are
          valid: wr_id, status, qp_num, and vendor_err.


-----------------------------------------------------------------

::

          On success, ibv_poll_cq() returns a non-negative value equal to
          the number of completions found.  On failure, a negative value is
          returned.


---------------------------------------------------

::

          Each polled completion is removed from the CQ and cannot be
          returned to it.

          The user should consume work completions at a rate that prevents
          CQ overrun from occurrence.  In case of a CQ overrun, the async
          event IBV_EVENT_CQ_ERR will be triggered, and the CQ cannot be
          used.

          IBV_WC_DRIVER1 will be reported as a response to IBV_WR_DRIVER1
          opcode; IBV_WC_DRIVER2/IBV_WC_DRIVER3 will be reported on
          specific driver operations.


---------------------------------------------------------

::

          ibv_post_send(3), ibv_post_recv(3)


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

   libibverbs                     2006-10-31                 IBV_POLL_CQ(3)

--------------

Pages that refer to this page:
`ibv_bind_mw(3) <../man3/ibv_bind_mw.3.html>`__, 
`ibv_create_ah_from_wc(3) <../man3/ibv_create_ah_from_wc.3.html>`__, 
`ibv_get_cq_event(3) <../man3/ibv_get_cq_event.3.html>`__, 
`ibv_post_recv(3) <../man3/ibv_post_recv.3.html>`__, 
`ibv_post_send(3) <../man3/ibv_post_send.3.html>`__, 
`ibv_post_srq_recv(3) <../man3/ibv_post_srq_recv.3.html>`__, 
`rdma_get_recv_comp(3) <../man3/rdma_get_recv_comp.3.html>`__, 
`rdma_get_send_comp(3) <../man3/rdma_get_send_comp.3.html>`__

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
