.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mlx4dv_init_obj(3) — Linux manual page
======================================

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

   MLX4DV_INIT_OBJ(3)      Library Functions Manual      MLX4DV_INIT_OBJ(3)

NAME
-------------------------------------------------

::

          mlx4dv_init_obj - Initialize mlx4 direct verbs object from
          ibv_xxx structures


---------------------------------------------------------

::

          #include <infiniband/mlx4dv.h>

          int mlx4dv_init_obj(struct mlx4dv_obj *obj, uint64_t obj_type);


---------------------------------------------------------------

::

          mlx4dv_init_obj() This function will initialize mlx4dv_xxx
          structs based on supplied type. The information for
          initialization is taken from ibv_xx structs supplied as part of
          input.

          Request information of CQ marks its owned by direct verbs for all
          consumer index related actions. The initialization type can be
          combination of several types together.

          struct mlx4dv_qp {
                  uint32_t         *rdb;
                  uint32_t         *sdb;
                  struct {
                          uint32_t        wqe_cnt;
                          int             wqe_shift;
                          int             offset;
                  } sq;
                  struct {
                          uint32_t        wqe_cnt;
                          int             wqe_shift;
                          int             offset;
                  } rq;
                  struct {
                          void            *buf;
                          size_t          length;
                  } buf;
                  uint64_t        comp_mask; /* Use enum mlx4dv_qp_comp_mask */
                  off_t           uar_mmap_offset; /* If MLX4DV_QP_MASK_UAR_MMAP_OFFSET is set in comp_mask, this will contain the mmap offset of *sdb* */
          };

          struct mlx4dv_cq {
                  struct {
                          void            *buf;
                          size_t          length;
                  } buf;
                  uint32_t        cqe_cnt;
                  uint32_t        cqn;
                  uint32_t        *set_ci_db;
                  uint32_t        *arm_db;
                  int             arm_sn;
                  int             cqe_size;
                  uint64_t        comp_mask; /* Use enum mlx4dv_cq_comp_mask */
                  void            *cq_uar;
          };

          struct mlx4dv_srq {
                  struct {
                          void            *buf;
                          size_t          length;
                  } buf;
                  int             wqe_shift;
                  int             head;
                  int             tail;
                  uint32_t        *db;
                  uint64_t        comp_mask;
          };

          struct mlx4dv_rwq {
                  __be32          *rdb;
                  struct {
                          uint32_t        wqe_cnt;
                          int             wqe_shift;
                          int             offset;
                  } rq;
                  struct {
                          void            *buf;
                          size_t          length;
                  } buf;
                  uint64_t        comp_mask;
          };

          struct mlx4dv_obj {
                  struct {
                          struct ibv_qp      *in;
                          struct mlx4dv_qp   *out;
                  } qp;
                  struct {
                          struct ibv_cq      *in;
                          struct mlx4dv_cq   *out;
                  } cq;
          };

          enum mlx4dv_obj_type {
                  MLX4DV_OBJ_QP   = 1 << 0,
                  MLX4DV_OBJ_CQ   = 1 << 1,
                  MLX4DV_OBJ_SRQ  = 1 << 2,
          };


-----------------------------------------------------------------

::

          0 on success or the value of errno on failure (which indicates
          the failure reason).


---------------------------------------------------

::

           * Compatibility masks (comp_mask) are in/out fields.


---------------------------------------------------------

::

          mlx4dv(7)


-------------------------------------------------------

::

          Maor Gottlieb <maorg@mellanox.com>

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

   1.0.0                          2017-02-02             MLX4DV_INIT_OBJ(3)

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
