.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_post_srq_ops(3) — Linux manual page
=======================================

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

   IBV_POST_SRQ_OPS(3)  Libibverbs Programmer's Manual  IBV_POST_SRQ_OPS(3)

NAME
-------------------------------------------------

::

          ibv_post_srq_ops - perform on a special shared receive queue
          (SRQ) configuration manipulations


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_post_srq_ops(struct ibv_srq *srq, struct ibv_ops_wr *wr,
                               struct ibv_ops_wr **bad_wr);


---------------------------------------------------------------

::

          The ibv_post_srq_ops() performs series of offload configuration
          manipulations on special types of SRQ srq. Currenlty it is used
          to configure tag matching SRQ. Series of configuration operations
          defined by linked lists of struct ibv_ops_wr elements starting
          from wr.

          struct ibv_ops_wr {
                  uint64_t                wr_id;   /* User defined WR ID */
                  /* Pointer to next WR in list, NULL if last WR */
                  struct ibv_ops_wr      *next;
                  enum ibv_ops_wr_opcode  opcode;  /* From enum ibv_ops_wr_opcode */
                  int                     flags;   /* From enum ibv_ops_flags */
                  struct {
                          /* Number of unexpected messages
                           * handled by SW */
                          uint32_t unexpected_cnt;
                          /* Input parameter for the DEL opcode
                           * and output parameter for the ADD opcode */
                          uint32_t handle;
                          struct {
                                  uint64_t                recv_wr_id;   /* User defined WR ID for TM_RECV */
                                  struct ibv_sge         *sg_list; /* Pointer to the s/g array */
                                  int                     num_sge; /* Size of the s/g array */
                                  uint64_t                tag;
                                  uint64_t                mask;    /* Incoming message considered matching if
                                                                      TMH.tag & entry.mask == entry.tag */
                          } add;
                  } tm;
          };

          First part of struct ibv_ops_wr retains ibv_send_wr notion.
          Opcode defines operation to perform. Currently supported
          IBV_WR_TAG_ADD, IBV_WR_TAG_DEL and IBV_WR_TAG_SYNC values. See
          below for detailed description.

          To allow reliable data delivery TM SRQ maintains special low
          level synchronization primitive - phase synchronization. Receive
          side message handling comprises two concurrent activities -
          posting tagged buffers by SW and receiving incoming messages by
          HW. This process considered coherent only if all unexpected
          messages received by HW is completely processed in SW. To pass to
          hardware number of processed unexpected messages unexpected_cnt
          field should be used and IBV_OPS_TM_SYNC flag should be set.

          To request WC for tag list operations IBV_OPS_SIGNALED flags
          should be passed. In this case WC will be generated on TM SRQ's
          CQ, provided wr_id will identify WC.

          Opcode IBV_WR_TAG_ADD used to add tag entry to tag matching list.
          Tag entry consists of SGE list, tag & mask (matching parameters),
          user specified opaque wr_id (passed via recv_wr_id field) and
          uniquely identified by handle (returned by driver).  Size of tag
          matching list is limited by max_num_tags.  SGE list size is
          limited by max_sge.

          Opcode IBV_WR_TAG_DEL removes previously added tag entry.  Field
          handle should be set to value returned by previously performed
          IBV_WR_TAG_ADD operation.  Operation may fail due to concurrent
          tag consumption - in this case IBV_WC_TM_ERR status will be
          returned in WC.

          Opcode IBV_WR_TAG_SYNC may be used if no changes to matching list
          required, just to updated unexpected messages counter.

          IBV_WC_TM_SYNC_REQ flag returned in list operation WC shows that
          counter synchronization required. This flag also may be returned
          by unexpected receive WC, asking for IBV_WR_TAG_SYNC operation to
          keep TM coherence consistency.


-----------------------------------------------------------------

::

          ibv_post_srq_ops() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------------

::

          ibv_create_srq_ex(3),


-------------------------------------------------------

::

          Artemy Kovalyov <artemyko@mellanox.com>

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

   libibverbs                     2017-03-26            IBV_POST_SRQ_OPS(3)

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
