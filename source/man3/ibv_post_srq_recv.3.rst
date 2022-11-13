.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_post_srq_recv(3) — Linux manual page
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

   IBV_POST_SRQ_RECV(3) Libibverbs Programmer's Manual IBV_POST_SRQ_RECV(3)

NAME
-------------------------------------------------

::

          ibv_post_srq_recv - post a list of work requests (WRs) to a
          shared receive queue (SRQ)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_post_srq_recv(struct ibv_srq *srq, struct ibv_recv_wr *wr,
                                struct ibv_recv_wr **bad_wr);


---------------------------------------------------------------

::

          ibv_post_srq_recv() posts the linked list of work requests (WRs)
          starting with wr to the shared receive queue (SRQ) srq.  It stops
          processing WRs from this list at the first failure (that can be
          detected immediately while requests are being posted), and
          returns this failing WR through bad_wr.

          The argument wr is an ibv_recv_wr struct, as defined in
          <infiniband/verbs.h>.

          struct ibv_recv_wr {
                  uint64_t                wr_id;     /* User defined WR ID */
                  struct ibv_recv_wr     *next;      /* Pointer to next WR in list, NULL if last WR */
                  struct ibv_sge         *sg_list;   /* Pointer to the s/g array */
                  int                     num_sge;   /* Size of the s/g array */
          };

          struct ibv_sge {
                  uint64_t                addr;      /* Start address of the local memory buffer */
                  uint32_t                length;    /* Length of the buffer */
                  uint32_t                lkey;      /* Key of the local Memory Region */
          };


-----------------------------------------------------------------

::

          ibv_post_srq_recv() returns 0 on success, or the value of errno
          on failure (which indicates the failure reason).


---------------------------------------------------

::

          The buffers used by a WR can only be safely reused after WR the
          request is fully executed and a work completion has been
          retrieved from the corresponding completion queue (CQ).

          If a WR is being posted to a UD QP, the Global Routing Header
          (GRH) of the incoming message will be placed in the first 40
          bytes of the buffer(s) in the scatter list.  If no GRH is present
          in the incoming message, then the first bytes will be undefined.
          This means that in all cases, the actual data of the incoming
          message will start at an offset of 40 bytes into the buffer(s) in
          the scatter list.


---------------------------------------------------------

::

          ibv_create_qp(3), ibv_post_send(3), ibv_post_recv(3),
          ibv_poll_cq(3)


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

   libibverbs                     2006-10-31           IBV_POST_SRQ_RECV(3)

--------------

Pages that refer to this page:
`ibv_post_recv(3) <../man3/ibv_post_recv.3.html>`__, 
`ibv_post_send(3) <../man3/ibv_post_send.3.html>`__, 
`ibv_reg_mr(3) <../man3/ibv_reg_mr.3.html>`__

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
