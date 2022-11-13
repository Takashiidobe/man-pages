.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_open_qp(3) — Linux manual page
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

   IBV_OPEN_QP(3)       Libibverbs Programmer's Manual       IBV_OPEN_QP(3)

NAME
-------------------------------------------------

::

          ibv_open_qp - open a shareable queue pair (QP)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_qp *ibv_open_qp(struct ibv_context *context,
                                     struct ibv_qp_open_attr *qp_open_attr);


---------------------------------------------------------------

::

          ibv_open_qp() opens an existing queue pair (QP) associated with
          the extended protection domain xrcd.  The argument qp_open_attr
          is an ibv_qp_open_attr struct, as defined in
          <infiniband/verbs.h>.

          struct ibv_qp_open_attr {
                  uint32_t          comp_mask;  /* Identifies valid fields */
                  uint32_t          qp_num;     /* QP number */
                  struct            *ibv_xrcd;  /* XRC domain */
                  void             *qp_context; /* User defined opaque value */
                  enum ibv_qp_type  qp_type;    /* QP transport service type */

          ibv_destroy_qp() closes the opened QP and destroys the underlying
          QP if it has no other references.  qp.


-----------------------------------------------------------------

::

          ibv_open_qp() returns a pointer to the opened QP, or NULL if the
          request fails.  Check the QP number (qp_num) in the returned QP.


---------------------------------------------------

::

          ibv_open_qp() will fail if a it is asked to open a QP that does
          not exist within the xrcd with the specified qp_num and qp_type.


---------------------------------------------------------

::

          ibv_alloc_pd(3), ibv_create_qp(3), ibv_create_qp_ex(3),
          ibv_modify_qp(3), ibv_query_qp(3)


-------------------------------------------------------

::

          Sean Hefty <sean.hefty@intel.com>

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

   libibverbs                     2011-08-12                 IBV_OPEN_QP(3)

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
