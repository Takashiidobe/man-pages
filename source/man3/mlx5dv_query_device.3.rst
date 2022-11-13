.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mlx5dv_query_device(3) — Linux manual page
==========================================

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

   MLX5DV_QUERY_DEVICE(3)  Library Functions Manual  MLX5DV_QUERY_DEVICE(3)

NAME
-------------------------------------------------

::

          mlx5dv_query_device - Query device capabilities specific to mlx5


---------------------------------------------------------

::

          #include <infiniband/mlx5dv.h>

          int mlx5dv_query_device(struct ibv_context *ctx_in,
                                  struct mlx5dv_context *attrs_out);


---------------------------------------------------------------

::

          mlx5dv_query_device() Query HW device-specific information which
          is important for data-path, but isn't provided by
          ibv_query_device(3).

          This function returns version, flags and compatibility mask. The
          version represents the format of the internal hardware structures
          that mlx5dv.h represents. Additions of new fields to the existed
          structures are handled by comp_mask field.

          struct mlx5dv_sw_parsing_caps {
                  uint32_t sw_parsing_offloads; /* Use enum mlx5dv_sw_parsing_offloads */
                  uint32_t supported_qpts;
          };

          struct mlx5dv_striding_rq_caps {
                  uint32_t min_single_stride_log_num_of_bytes; /* min log size of each stride */
                  uint32_t max_single_stride_log_num_of_bytes; /* max log size of each stride */
                  uint32_t min_single_wqe_log_num_of_strides; /* min log number of strides per WQE */
                  uint32_t max_single_wqe_log_num_of_strides; /* max log number of strides per WQE */
                  uint32_t supported_qpts;
          };

          struct mlx5dv_dci_streams_caps {
          uint8_t max_log_num_concurent; /* max log number of parallel different streams that could be handled by HW */
          uint8_t max_log_num_errored; /* max DCI error stream channels supported per DCI before a DCI move to an error state */
          };

          struct mlx5dv_context {
                  uint8_t         version;
                  uint64_t        flags;
                  uint64_t        comp_mask; /* Use enum mlx5dv_context_comp_mask */
                  struct mlx5dv_cqe_comp_caps     cqe_comp_caps;
                  struct mlx5dv_sw_parsing_caps sw_parsing_caps;
                  uint32_t  tunnel_offloads_caps;
                  uint32_t        max_dynamic_bfregs /* max blue-flame registers that can be dynamiclly allocated */
                  uint64_t        max_clock_info_update_nsec;
                  uint32_t        flow_action_flags; /* use enum mlx5dv_flow_action_cap_flags */
                  uint32_t        dc_odp_caps; /* use enum ibv_odp_transport_cap_bits */
                  void      *hca_core_clock; /* points to a memory location that is mapped to the HCA's core clock */
                  struct mlx5dv_sig_caps sig_caps;
                  size_t max_wr_memcpy_length; /* max length that is supported by the DMA memcpy WR */
          };

          enum mlx5dv_context_flags {
                  /*
                   * This flag indicates if CQE version 0 or 1 is needed.
                   */
                   MLX5DV_CONTEXT_FLAGS_CQE_V1 = (1 << 0),
                   MLX5DV_CONTEXT_FLAGS_OBSOLETE    =  (1 << 1), /* Obsoleted, don't use */
                   MLX5DV_CONTEXT_FLAGS_MPW_ALLOWED  = (1 << 2), /* Multi packet WQE is allowed */
                   MLX5DV_CONTEXT_FLAGS_ENHANCED_MPW = (1 << 3), /* Enhanced multi packet WQE is supported or not */
                   MLX5DV_CONTEXT_FLAGS_CQE_128B_COMP = (1 << 4), /* Support CQE 128B compression */
                   MLX5DV_CONTEXT_FLAGS_CQE_128B_PAD = (1 << 5), /* Support CQE 128B padding */
                   MLX5DV_CONTEXT_FLAGS_PACKET_BASED_CREDIT_MODE = (1 << 6), /* Support packet based credit mode in RC QP */
                  /*
                   * If CQ was created with IBV_WC_EX_WITH_COMPLETION_TIMESTAMP_WALLCLOCK, CQEs timestamp will be in real time format.
                   */
                   MLX5DV_CONTEXT_FLAGS_REAL_TIME_TS = (1 << 7),
          };

          enum mlx5dv_context_comp_mask {
                  MLX5DV_CONTEXT_MASK_CQE_COMPRESION      = 1 << 0,
                  MLX5DV_CONTEXT_MASK_SWP                 = 1 << 1,
                  MLX5DV_CONTEXT_MASK_STRIDING_RQ         = 1 << 2,
                  MLX5DV_CONTEXT_MASK_TUNNEL_OFFLOADS     = 1 << 3,
                  MLX5DV_CONTEXT_MASK_DYN_BFREGS          = 1 << 4,
                  MLX5DV_CONTEXT_MASK_CLOCK_INFO_UPDATE   = 1 << 5,
                  MLX5DV_CONTEXT_MASK_FLOW_ACTION_FLAGS   = 1 << 6,
                  MLX5DV_CONTEXT_MASK_DC_ODP_CAPS         = 1 << 7,
                  MLX5DV_CONTEXT_MASK_HCA_CORE_CLOCK      = 1 << 8,
                  MLX5DV_CONTEXT_MASK_NUM_LAG_PORTS       = 1 << 9,
                  MLX5DV_CONTEXT_MASK_SIGNATURE_OFFLOAD   = 1 << 10,
                  MLX5DV_CONTEXT_MASK_DCI_STREAMS         = 1 << 11,
                  MLX5DV_CONTEXT_MASK_WR_MEMCPY_LENGTH    = 1 << 12,
          };

          enum enum mlx5dv_sw_parsing_offloads {
                  MLX5DV_SW_PARSING         = 1 << 0,
                  MLX5DV_SW_PARSING_CSUM    = 1 << 1,
                  MLX5DV_SW_PARSING_LSO     = 1 << 2,
          };

          enum mlx5dv_tunnel_offloads {
                  MLX5DV_RAW_PACKET_CAP_TUNNELED_OFFLOAD_VXLAN  = 1 << 0,
                  MLX5DV_RAW_PACKET_CAP_TUNNELED_OFFLOAD_GRE    = 1 << 1,
                  MLX5DV_RAW_PACKET_CAP_TUNNELED_OFFLOAD_GENEVE = 1 << 2,
          };

          enum mlx5dv_flow_action_cap_flags {
                  MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM                = 1 << 0, /* Flow action ESP (with AES_GCM keymat) is supported */
                  MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM_REQ_METADATA   = 1 << 1, /* Flow action ESP always return metadata in the payload */
                  MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM_SPI_STEERING   = 1 << 2, /* ESP (with AESGCM keymat) Supports matching by SPI (rather than hashing against SPI) */
                  MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM_FULL_OFFLOAD   = 1 << 3, /* Flow action ESP supports full offload (with AES_GCM keymat) */
                  MLX5DV_FLOW_ACTION_FLAGS_ESP_AES_GCM_TX_IV_IS_ESN   = 1 << 4, /* Flow action ESP (with AES_GCM keymat), ESN comes implicitly from IV. */
          };

          struct mlx5dv_sig_caps {
                  uint64_t block_size; /* use enum mlx5dv_block_size_caps */
                  uint32_t block_prot; /* use enum mlx5dv_sig_prot_caps */
                  uint16_t t10dif_bg; /* use enum mlx5dv_sig_t10dif_bg_caps */
                  uint16_t crc_type; /* use enum mlx5dv_sig_crc_type_caps */
          };

          enum mlx5dv_sig_prot_caps {
                  MLX5DV_SIG_PROT_CAP_T10DIF = 1 << MLX5DV_SIG_TYPE_T10DIF,
                  MLX5DV_SIG_PROT_CAP_CRC = 1 << MLX5DV_SIG_TYPE_CRC,
          };

          enum mlx5dv_sig_t10dif_bg_caps {
                  MLX5DV_SIG_T10DIF_BG_CAP_CRC = 1 << MLX5DV_SIG_T10DIF_CRC,
                  MLX5DV_SIG_T10DIF_BG_CAP_CSUM = 1 << MLX5DV_SIG_T10DIF_CSUM,
          };

          enum mlx5dv_sig_crc_type_caps {
                  MLX5DV_SIG_CRC_TYPE_CAP_CRC32 = 1 << MLX5DV_SIG_CRC_TYPE_CRC32,
                  MLX5DV_SIG_CRC_TYPE_CAP_CRC32C = 1 << MLX5DV_SIG_CRC_TYPE_CRC32C,
                  MLX5DV_SIG_CRC_TYPE_CAP_CRC64_XP10 = 1 << MLX5DV_SIG_CRC_TYPE_CRC64_XP10,
          };

          enum mlx5dv_block_size_caps {
                  MLX5DV_BLOCK_SIZE_CAP_512 = 1 << MLX5DV_BLOCK_SIZE_512,
                  MLX5DV_BLOCK_SIZE_CAP_520 = 1 << MLX5DV_BLOCK_SIZE_520,
                  MLX5DV_BLOCK_SIZE_CAP_4048 = 1 << MLX5DV_BLOCK_SIZE_4048,
                  MLX5DV_BLOCK_SIZE_CAP_4096 = 1 << MLX5DV_BLOCK_SIZE_4096,
                  MLX5DV_BLOCK_SIZE_CAP_4160 = 1 << MLX5DV_BLOCK_SIZE_4160,
          };


-----------------------------------------------------------------

::

          0 on success or the value of errno on failure (which indicates
          the failure reason).


---------------------------------------------------

::

           * Compatibility mask (comp_mask) is in/out field.


---------------------------------------------------------

::

          mlx5dv(7), ibv_query_device(3)


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

   1.0.0                          2017-02-02         MLX5DV_QUERY_DEVICE(3)

--------------

Pages that refer to this page:
`mlx5dv_get_clock_info(3) <../man3/mlx5dv_get_clock_info.3.html>`__, 
`mlx5dv_ts_to_ns(3) <../man3/mlx5dv_ts_to_ns.3.html>`__

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
