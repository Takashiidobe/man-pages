.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_query_port(3) — Linux manual page
=====================================

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

   IBV_QUERY_PORT(3)    Libibverbs Programmer's Manual    IBV_QUERY_PORT(3)

NAME
-------------------------------------------------

::

          ibv_query_port - query an RDMA port's attributes


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_query_port(struct ibv_context *context, uint8_t port_num,
                             struct ibv_port_attr *port_attr);


---------------------------------------------------------------

::

          ibv_query_port() returns the attributes of port port_num for
          device context context through the pointer port_attr.  The
          argument port_attr is an ibv_port_attr struct, as defined in
          <infiniband/verbs.h>.

          struct ibv_port_attr {
                  enum ibv_port_state     state;          /* Logical port state */
                  enum ibv_mtu            max_mtu;        /* Max MTU supported by port */
                  enum ibv_mtu            active_mtu;     /* Actual MTU */
                  int                     gid_tbl_len;    /* Length of source GID table */
                  uint32_t                port_cap_flags; /* Port capabilities */
                  uint32_t                max_msg_sz;     /* Maximum message size */
                  uint32_t                bad_pkey_cntr;  /* Bad P_Key counter */
                  uint32_t                qkey_viol_cntr; /* Q_Key violation counter */
                  uint16_t                pkey_tbl_len;   /* Length of partition table */
                  uint16_t                lid;            /* Base port LID */
                  uint16_t                sm_lid;         /* SM LID */
                  uint8_t                 lmc;            /* LMC of LID */
                  uint8_t                 max_vl_num;     /* Maximum number of VLs */
                  uint8_t                 sm_sl;          /* SM service level */
                  uint8_t                 subnet_timeout; /* Subnet propagation delay */
                  uint8_t                 init_type_reply;/* Type of initialization performed by SM */
                  uint8_t                 active_width;   /* Currently active link width */
                  uint8_t                 active_speed;   /* Currently active link speed */
                  uint8_t                 phys_state;     /* Physical port state */
                  uint8_t                 link_layer;     /* link layer protocol of the port */
                  uint8_t                 flags;          /* Port flags */
                  uint16_t                port_cap_flags2;/* Port capabilities */
          };

          possible values for the link layer field are IBV_LINK_LAYER_INFINIBAND,
          IBV_LINK_LAYER_ETHERNET, or IBV_LINK_LAYER_UNSPECIFIED.

          supported port flags:
          IBV_QPF_GRH_REQUIRED - When this flag is set, the applications must create all AH with GRH configured.


-----------------------------------------------------------------

::

          ibv_query_port() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------------

::

          ibv_create_qp(3), ibv_destroy_qp(3), ibv_query_qp(3),
          ibv_create_ah(3)


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

   libibverbs                     2006-10-31              IBV_QUERY_PORT(3)

--------------

Pages that refer to this page:
`ibv_open_device(3) <../man3/ibv_open_device.3.html>`__, 
`ibv_query_device(3) <../man3/ibv_query_device.3.html>`__, 
`ibv_query_device_ex(3) <../man3/ibv_query_device_ex.3.html>`__, 
`ibv_query_rt_values_ex(3) <../man3/ibv_query_rt_values_ex.3.html>`__

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
