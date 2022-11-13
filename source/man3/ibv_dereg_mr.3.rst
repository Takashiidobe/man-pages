.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_reg_mr(3) — Linux manual page
=================================

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

   IBV_REG_MR(3)        Libibverbs Programmer's Manual        IBV_REG_MR(3)

NAME
-------------------------------------------------

::

          ibv_reg_mr, ibv_reg_mr_iova, ibv_reg_dmabuf_mr, ibv_dereg_mr -
          register or deregister a memory region (MR)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_mr *ibv_reg_mr(struct ibv_pd *pd, void *addr,
                                    size_t length, int access);

          struct ibv_mr *ibv_reg_mr_iova(struct ibv_pd *pd, void *addr,
                                         size_t length, uint64_t hca_va,
                                         int access);

          struct ibv_mr *ibv_reg_dmabuf_mr(struct ibv_pd *pd, uint64_t offset,
                                           size_t length, uint64_t iova,
                                           int fd, int access);

          int ibv_dereg_mr(struct ibv_mr *mr);


---------------------------------------------------------------

::

          ibv_reg_mr() registers a memory region (MR) associated with the
          protection domain pd.  The MR's starting address is addr and its
          size is length.  The argument access describes the desired memory
          protection attributes; it is either 0 or the bitwise OR of one or
          more of the following flags:

          IBV_ACCESS_LOCAL_WRITE  Enable Local Write Access

          IBV_ACCESS_REMOTE_WRITE  Enable Remote Write Access

          IBV_ACCESS_REMOTE_READ Enable Remote Read Access

          IBV_ACCESS_REMOTE_ATOMIC Enable Remote Atomic Operation Access
          (if supported)

          IBV_ACCESS_MW_BIND Enable Memory Window Binding

          IBV_ACCESS_ZERO_BASED Use byte offset from beginning of MR to
          access this MR, instead of a pointer address

          IBV_ACCESS_ON_DEMAND Create an on-demand paging MR

          IBV_ACCESS_HUGETLB Huge pages are guaranteed to be used for this
          MR, applicable with IBV_ACCESS_ON_DEMAND in explicit mode only

          IBV_ACCESS_RELAXED_ORDERING Allow system to reorder accesses to
          the MR to improve performance

          If IBV_ACCESS_REMOTE_WRITE or IBV_ACCESS_REMOTE_ATOMIC is set,
          then IBV_ACCESS_LOCAL_WRITE must be set too.

          Local read access is always enabled for the MR.

          To create an implicit ODP MR, IBV_ACCESS_ON_DEMAND should be set,
          addr should be 0 and length should be SIZE_MAX.

          If IBV_ACCESS_HUGETLB is set, then application awares that for
          this MR all pages are huge and must promise it will never do
          anything to break huge pages.

          ibv_reg_mr_iova() ibv_reg_mr_iova is the same as the normal
          reg_mr, except that the user is allowed to specify the virtual
          base address of the MR when accessed through a lkey or rkey. The
          offset in the memory region is computed as 'addr + (iova -
          hca_va)'. Specifying 0 for hca_va has the same effect as
          IBV_ACCESS_ZERO_BASED.

          ibv_reg_dmabuf_mr() registers a dma-buf based memory region (MR)
          associated with the protection domain pd.  The MR starts at
          offset of the dma-buf and its size is length.  The dma-buf is
          identified by the file descriptor fd.  The argument iova
          specifies the virtual base address of the MR when accessed
          through a lkey or rkey.  It must have the same page offset as
          offset.  The argument access describes the desired memory
          protection attributes; it is similar to the ibv_reg_mr case
          except that only the following flags are supported:
          IBV_ACCESS_LOCAL_WRITE, IBV_ACCESS_REMOTE_WRITE,
          IBV_ACCESS_REMOTE_READ, IBV_ACCESS_REMOTE_ATOMIC,
          IBV_ACCESS_RELAXED_ORDERING.

          ibv_dereg_mr() deregisters the MR mr.


-----------------------------------------------------------------

::

          ibv_reg_mr() / ibv_reg_mr_iova() / ibv_reg_dmabuf_mr() returns a
          pointer to the registered MR, or NULL if the request fails.  The
          local key (L_Key) field lkey is used as the lkey field of struct
          ibv_sge when posting buffers with ibv_post_* verbs, and the the
          remote key (R_Key) field rkey is used by remote processes to
          perform Atomic and RDMA operations.  The remote process places
          this rkey as the rkey field of struct ibv_send_wr passed to the
          ibv_post_send function.

          ibv_dereg_mr() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          ibv_dereg_mr() fails if any memory window is still bound to this
          MR.


---------------------------------------------------------

::

          ibv_alloc_pd(3), ibv_post_send(3), ibv_post_recv(3),
          ibv_post_srq_recv(3)


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

   libibverbs                     2006-10-31                  IBV_REG_MR(3)

--------------

Pages that refer to this page:
`ibv_alloc_mw(3) <../man3/ibv_alloc_mw.3.html>`__, 
`ibv_alloc_pd(3) <../man3/ibv_alloc_pd.3.html>`__, 
`ibv_bind_mw(3) <../man3/ibv_bind_mw.3.html>`__, 
`rdma_dereg_mr(3) <../man3/rdma_dereg_mr.3.html>`__, 
`rdma_post_recv(3) <../man3/rdma_post_recv.3.html>`__, 
`rdma_post_recvv(3) <../man3/rdma_post_recvv.3.html>`__, 
`rdma_reg_msgs(3) <../man3/rdma_reg_msgs.3.html>`__, 
`rdma_reg_read(3) <../man3/rdma_reg_read.3.html>`__, 
`rdma_reg_write(3) <../man3/rdma_reg_write.3.html>`__

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
