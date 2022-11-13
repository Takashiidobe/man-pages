.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_create_ah(3) — Linux manual page
====================================

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

   IBV_CREATE_AH(3)     Libibverbs Programmer's Manual     IBV_CREATE_AH(3)

NAME
-------------------------------------------------

::

          ibv_create_ah, ibv_destroy_ah - create or destroy an address
          handle (AH)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_ah *ibv_create_ah(struct ibv_pd *pd,
                                       struct ibv_ah_attr *attr);

          int ibv_destroy_ah(struct ibv_ah *ah);


---------------------------------------------------------------

::

          ibv_create_ah() creates an address handle (AH) associated with
          the protection domain pd.  The argument attr is an ibv_ah_attr
          struct, as defined in <infiniband/verbs.h>.

          struct ibv_ah_attr {
                  struct ibv_global_route grh;            /* Global Routing Header (GRH) attributes */
                  uint16_t                dlid;           /* Destination LID */
                  uint8_t                 sl;             /* Service Level */
                  uint8_t                 src_path_bits;  /* Source path bits */
                  uint8_t                 static_rate;    /* Maximum static rate */
                  uint8_t                 is_global;      /* GRH attributes are valid */
                  uint8_t                 port_num;       /* Physical port number */
          };

          struct ibv_global_route {
                  union ibv_gid           dgid;           /* Destination GID or MGID */
                  uint32_t                flow_label;     /* Flow label */
                  uint8_t                 sgid_index;     /* Source GID index */
                  uint8_t                 hop_limit;      /* Hop limit */
                  uint8_t                 traffic_class;  /* Traffic class */
          };

          ibv_destroy_ah() destroys the AH ah.


-----------------------------------------------------------------

::

          ibv_create_ah() returns a pointer to the created AH, or NULL if
          the request fails.


---------------------------------------------------

::

          If port flag IBV_QPF_GRH_REQUIRED is set then ibv_create_ah()
          must be created with definition of 'struct ibv_ah_attr {
          .is_global = 1; .grh = {...}; }'.

          ibv_destroy_ah() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------------

::

          ibv_alloc_pd(3), ibv_init_ah_from_wc(3), ibv_create_ah_from_wc(3)


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

   libibverbs                     2006-10-31               IBV_CREATE_AH(3)

--------------

Pages that refer to this page:
`ibv_alloc_pd(3) <../man3/ibv_alloc_pd.3.html>`__, 
`ibv_create_ah_from_wc(3) <../man3/ibv_create_ah_from_wc.3.html>`__, 
`ibv_modify_qp(3) <../man3/ibv_modify_qp.3.html>`__, 
`ibv_post_send(3) <../man3/ibv_post_send.3.html>`__, 
`ibv_query_port(3) <../man3/ibv_query_port.3.html>`__, 
`ibv_query_qp(3) <../man3/ibv_query_qp.3.html>`__

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
