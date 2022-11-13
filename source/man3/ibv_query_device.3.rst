.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_query_device(3) — Linux manual page
=======================================

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

   IBV_QUERY_DEVICE(3)  Libibverbs Programmer's Manual  IBV_QUERY_DEVICE(3)

NAME
-------------------------------------------------

::

          ibv_query_device - query an RDMA device's attributes


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_query_device(struct ibv_context *context,
                               struct ibv_device_attr *device_attr);


---------------------------------------------------------------

::

          ibv_query_device() returns the attributes of the device with
          context context.  The argument device_attr is a pointer to an
          ibv_device_attr struct, as defined in <infiniband/verbs.h>.

          struct ibv_device_attr {
                  char                    fw_ver[64];             /* FW version */
                  uint64_t                node_guid;              /* Node GUID (in network byte order) */
                  uint64_t                sys_image_guid;         /* System image GUID (in network byte order) */
                  uint64_t                max_mr_size;            /* Largest contiguous block that can be registered */
                  uint64_t                page_size_cap;          /* Supported memory shift sizes */
                  uint32_t                vendor_id;              /* Vendor ID, per IEEE */
                  uint32_t                vendor_part_id;         /* Vendor supplied part ID */
                  uint32_t                hw_ver;                 /* Hardware version */
                  int                     max_qp;                 /* Maximum number of supported QPs */
                  int                     max_qp_wr;              /* Maximum number of outstanding WR on any work queue */
                  unsigned int            device_cap_flags;       /* HCA capabilities mask */
                  int                     max_sge;                /* Maximum number of s/g per WR for SQ & RQ of QP for non RDMA Read operations */
                  int                     max_sge_rd;             /* Maximum number of s/g per WR for RDMA Read operations */
                  int                     max_cq;                 /* Maximum number of supported CQs */
                  int                     max_cqe;                /* Maximum number of CQE capacity per CQ */
                  int                     max_mr;                 /* Maximum number of supported MRs */
                  int                     max_pd;                 /* Maximum number of supported PDs */
                  int                     max_qp_rd_atom;         /* Maximum number of RDMA Read & Atomic operations that can be outstanding per QP */
                  int                     max_ee_rd_atom;         /* Maximum number of RDMA Read & Atomic operations that can be outstanding per EEC */
                  int                     max_res_rd_atom;        /* Maximum number of resources used for RDMA Read & Atomic operations by this HCA as the Target */
                  int                     max_qp_init_rd_atom;    /* Maximum depth per QP for initiation of RDMA Read & Atomic operations */
                  int                     max_ee_init_rd_atom;    /* Maximum depth per EEC for initiation of RDMA Read & Atomic operations */
                  enum ibv_atomic_cap     atomic_cap;             /* Atomic operations support level */
                  int                     max_ee;                 /* Maximum number of supported EE contexts */
                  int                     max_rdd;                /* Maximum number of supported RD domains */
                  int                     max_mw;                 /* Maximum number of supported MWs */
                  int                     max_raw_ipv6_qp;        /* Maximum number of supported raw IPv6 datagram QPs */
                  int                     max_raw_ethy_qp;        /* Maximum number of supported Ethertype datagram QPs */
                  int                     max_mcast_grp;          /* Maximum number of supported multicast groups */
                  int                     max_mcast_qp_attach;    /* Maximum number of QPs per multicast group which can be attached */
                  int                     max_total_mcast_qp_attach;/* Maximum number of QPs which can be attached to multicast groups */
                  int                     max_ah;                 /* Maximum number of supported address handles */
                  int                     max_fmr;                /* Maximum number of supported FMRs */
                  int                     max_map_per_fmr;        /* Maximum number of (re)maps per FMR before an unmap operation in required */
                  int                     max_srq;                /* Maximum number of supported SRQs */
                  int                     max_srq_wr;             /* Maximum number of WRs per SRQ */
                  int                     max_srq_sge;            /* Maximum number of s/g per SRQ */
                  uint16_t                max_pkeys;              /* Maximum number of partitions */
                  uint8_t                 local_ca_ack_delay;     /* Local CA ack delay */
                  uint8_t                 phys_port_cnt;          /* Number of physical ports */
          };


-----------------------------------------------------------------

::

          ibv_query_device() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          The maximum values returned by this function are the upper limits
          of supported resources by the device.  However, it may not be
          possible to use these maximum values, since the actual number of
          any resource that can be created may be limited by the machine
          configuration, the amount of host memory, user permissions, and
          the amount of resources already in use by other users/processes.


---------------------------------------------------------

::

          ibv_open_device(3), ibv_query_port(3), ibv_query_pkey(3),
          ibv_query_gid(3)


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

   libibverbs                     2006-10-31            IBV_QUERY_DEVICE(3)

--------------

Pages that refer to this page:
`ibv_modify_srq(3) <../man3/ibv_modify_srq.3.html>`__, 
`ibv_open_device(3) <../man3/ibv_open_device.3.html>`__, 
`ibv_query_device_ex(3) <../man3/ibv_query_device_ex.3.html>`__, 
`ibv_query_rt_values_ex(3) <../man3/ibv_query_rt_values_ex.3.html>`__, 
`mlx4dv_query_device(3) <../man3/mlx4dv_query_device.3.html>`__, 
`mlx5dv_query_device(3) <../man3/mlx5dv_query_device.3.html>`__

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
