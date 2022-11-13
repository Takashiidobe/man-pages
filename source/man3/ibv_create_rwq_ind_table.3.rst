.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_create_rwq_ind_table(3) — Linux manual page
===============================================

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

   CREATE_RWQ_IND_TBL(3)Libibverbs Programmer's ManualCREATE_RWQ_IND_TBL(3)

NAME
-------------------------------------------------

::

          ibv_create_rwq_ind_table, ibv_destroy_rwq_ind_table  - create or
          destroy a Receive Work Queue Indirection Table (RWQ IND TBL).


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_rwq_ind_table *ibv_create_rwq_ind_table(struct ibv_context *context,
                                                                     struct ibv_rwq_ind_table_init_attr *init_attr);

          int ibv_destroy_rwq_ind_table(struct ibv_rwq_ind_table *rwq_ind_table);


---------------------------------------------------------------

::

          ibv_create_rwq_ind_table() creates a RWQ IND TBL associated with
          the ibv_context context.  The argument init_attr is an
          ibv_rwq_ind_table_init_attr struct, as defined in
          <infiniband/verbs.h>.

          struct ibv_rwq_ind_table_init_attr {
                  uint32_t        log_ind_tbl_size;     /* Log, base 2, of Indirection table size */
                  struct          ibv_wq **ind_tbl;     /* Each entry is a pointer to Receive Work Queue */
                  uint32_t        comp_mask;            /* Identifies valid fields. Use ibv_ind_table_init_attr_mask */
          };

          The function ibv_create_rwq_ind_table() will create a RWQ IND TBL
          that holds a table of Receive Work Queue.  For further usage of
          the created object see below NOTES.

          ibv_destroy_rwq_ind_table() destroys the RWQ IND TBL
          rwq_ind_table.


-----------------------------------------------------------------

::

          ibv_create_rwq_ind_table() returns a pointer to the created RWQ
          IND TBL, or NULL if the request fails.

          ibv_destroy_rwq_ind_table() returns 0 on success, or the value of
          errno on failure (which indicates the failure reason).


---------------------------------------------------

::

          The created object should be used as part of ibv_create_qp_ex()
          to enable dispatching of incoming packets based on some RX hash
          configuration.


---------------------------------------------------------

::

          ibv_create_wq(3), ibv_modify_wq(3), ibv_create_qp_ex(3),


-------------------------------------------------------

::

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

   libibverbs                     2016-07-27          CREATE_RWQ_IND_TBL(3)

--------------

Pages that refer to this page:
`ibv_create_qp_ex(3) <../man3/ibv_create_qp_ex.3.html>`__

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
