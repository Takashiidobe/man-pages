.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_bind_mw(3) — Linux manual page
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

   IBV_BIND_MW(3)       Libibverbs Programmer's Manual       IBV_BIND_MW(3)

NAME
-------------------------------------------------

::

          ibv_bind_mw - post a request to bind a type 1 memory window to a
          memory region


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_bind_mw(struct ibv_qp *qp, struct ibv_mw *mw,
                          struct ibv_mw_bind *mw_bind);


---------------------------------------------------------------

::

          ibv_bind_mw() posts to the queue pair qp a request to bind the
          memory window mw according to the details in mw_bind.

          The argument mw_bind is an ibv_mw_bind struct, as defined in
          <infiniband/verbs.h>.

          struct ibv_mw_bind {
                  uint64_t                     wr_id;           /* User defined WR ID */
                  unsigned int                 send_flags;      /* Use ibv_send_flags */
                  struct ibv_mw_bind_info      bind_info;       /* MW bind information */
          }

          struct ibv_mw_bind_info {
                  struct ibv_mr                *mr;             /* The MR to bind the MW to */
                  uint64_t                     addr;            /* The address the MW should start at */
                  uint64_t                     length;          /* The length (in bytes) the MW should span */
                  unsigned int                 mw_access_flags; /* Access flags to the MW. Use ibv_access_flags */
          };

          The QP Transport Service Type must be either UC, RC or XRC_SEND
          for bind operations.

          The attribute send_flags describes the properties of the WR. It
          is either 0 or the bitwise OR of one or more of the following
          flags:

          IBV_SEND_FENCE  Set the fence indicator.

          IBV_SEND_SIGNALED  Set the completion notification indicator.
          Relevant only if QP was created with sq_sig_all=0

          The mw_access_flags define the allowed access to the MW after the
          bind completes successfully. It is either 0 or the bitwise OR of
          one or more of the following flags:

          IBV_ACCESS_REMOTE_WRITE  Enable Remote Write Access. Requires
          local write access to the MR.

          IBV_ACCESS_REMOTE_READ Enable Remote Read Access

          IBV_ACCESS_REMOTE_ATOMIC Enable Remote Atomic Operation Access
          (if supported). Requires local write access to the MR.

          IBV_ACCESS_ZERO_BASED If set, the address set on the
          'remote_addr' field on the WR will be an offset from the MW's
          start address.


-----------------------------------------------------------------

::

          ibv_bind_mw() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).  In case of a
          success, the R_key of the memory window after the bind is
          returned in the mw_bind->mw->rkey field.


---------------------------------------------------

::

          The bind does not complete when the function return - it is
          merely posted to the QP. The user should keep a copy of the old
          R_key, and fix the mw structure if the subsequent CQE for the
          bind operation indicates a failure. The user may safely send the
          R_key using a send request on the same QP, (based on QP ordering
          rules: a send after a bind request on the same QP are always
          ordered), but must not transfer it to the remote in any other
          manner before reading a successful CQE.

          Note that for type 2 MW, one should directly post bind WR to the
          QP, using ibv_post_send.


---------------------------------------------------------

::

          ibv_alloc_mw(3), ibv_post_send(3), ibv_poll_cq(3) ibv_reg_mr(3),


-------------------------------------------------------

::

          Majd Dibbiny <majd@mellanox.com>

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

   libibverbs                     2016-02-02                 IBV_BIND_MW(3)

--------------

Pages that refer to this page:
`ibv_alloc_mw(3) <../man3/ibv_alloc_mw.3.html>`__

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
