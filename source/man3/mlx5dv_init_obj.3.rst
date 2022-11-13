.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mlx5dv_init_obj(3) — Linux manual page
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

   MLX5DV_INIT_OBJ(3)      Library Functions Manual      MLX5DV_INIT_OBJ(3)

NAME
-------------------------------------------------

::

          mlx5dv_init_obj - Initialize mlx5 direct verbs object from
          ibv_xxx structures


---------------------------------------------------------

::

          #include <infiniband/mlx5dv.h>

          int mlx5dv_init_obj(struct mlx5dv_obj *obj, uint64_t obj_type);


---------------------------------------------------------------

::

          mlx5dv_init_obj() This function will initialize mlx5dv_xxx
          structs based on supplied type. The information for
          initialization is taken from ibv_xx structs supplied as part of
          input.

          Request information of CQ marks its owned by direct verbs for all
          consumer index related actions. The initialization type can be
          combination of several types together.

          struct mlx5dv_qp {
                  uint32_t                *dbrec;
                  struct {
                          void            *buf;
                          uint32_t        wqe_cnt;
                          uint32_t        stride;
                  } sq;
                  struct {
                          void            *buf;
                          uint32_t        wqe_cnt;
                          uint32_t        stride;
                  } rq;
                  struct {
                          void            *reg;
                          uint32_t        size;
                  } bf;
                  uint64_t                comp_mask;
                  off_t               uar_mmap_offset;
                  uint32_t       tirn;
                  uint32_t       tisn;
                  uint32_t       rqn;
                  uint32_t       sqn;
                  uint64_t       tir_icm_address;
          };

          struct mlx5dv_cq {
                  void                    *buf;
                  uint32_t                *dbrec;
                  uint32_t                cqe_cnt;
                  uint32_t                cqe_size;
                  void                    *cq_uar;
                  uint32_t                cqn;
                  uint64_t                comp_mask;
          };

          struct mlx5dv_srq {
                  void                    *buf;
                  uint32_t                *dbrec;
                  uint32_t                stride;
                  uint32_t                head;
                  uint32_t                tail;
                  uint64_t                comp_mask;
                  uint32_t                srqn;
          };

          struct mlx5dv_rwq {
                  void            *buf;
                  uint32_t        *dbrec;
                  uint32_t        wqe_cnt;
                  uint32_t        stride;
                  uint64_t        comp_mask;
          };

          struct mlx5dv_dm {
                  void      *buf;
                  uint64_t  length;
                  uint64_t  comp_mask;
                  uint64_t  remote_va;
          };

          struct mlx5dv_ah {
                  struct mlx5_wqe_av    *av;
                  uint64_t              comp_mask;
          };

          struct mlx5dv_pd {
                  uint32_t              pdn;
                  uint64_t              comp_mask;
          };

          struct mlx5dv_obj {
                  struct {
                          struct ibv_qp           *in;
                          struct mlx5dv_qp        *out;
                  } qp;
                  struct {
                          struct ibv_cq           *in;
                          struct mlx5dv_cq        *out;
                  } cq;
                  struct {
                          struct ibv_srq          *in;
                          struct mlx5dv_srq       *out;
                  } srq;
                  struct {
                          struct ibv_wq           *in;
                          struct mlx5dv_rwq       *out;
                  } rwq;
                  struct {
                          struct ibv_dm       *in;
                          struct mlx5dv_dm    *out;
                  } dm;
                  struct {
                          struct ibv_ah       *in;
                          struct mlx5dv_ah    *out;
                  } ah;
                  struct {
                          struct ibv_pd           *in;
                          struct mlx5dv_pd        *out;
                  } pd;
          };

          enum mlx5dv_obj_type {
                  MLX5DV_OBJ_QP   = 1 << 0,
                  MLX5DV_OBJ_CQ   = 1 << 1,
                  MLX5DV_OBJ_SRQ  = 1 << 2,
                  MLX5DV_OBJ_RWQ  = 1 << 3,
                  MLX5DV_OBJ_DM   = 1 << 4,
                  MLX5DV_OBJ_AH   = 1 << 5,
                  MLX5DV_OBJ_PD   = 1 << 6,
          };


-----------------------------------------------------------------

::

          0 on success or the value of errno on failure (which indicates
          the failure reason).


---------------------------------------------------

::

           * The information if doorbell is blueflame is based on
          mlx5dv_qp->bf->size, in case of 0 it's not a BF.
           * Compatibility masks (comp_mask) are in/out fields.


---------------------------------------------------------

::

          mlx5dv(7)


-------------------------------------------------------

::

          Leon Romanovsky <leonro@mellanox.com>

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

   1.0.0                          2017-02-02             MLX5DV_INIT_OBJ(3)

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
