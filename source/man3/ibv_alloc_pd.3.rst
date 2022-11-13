.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_alloc_pd(3) — Linux manual page
===================================

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

   IBV_ALLOC_PD(3)      Libibverbs Programmer's Manual      IBV_ALLOC_PD(3)

NAME
-------------------------------------------------

::

          ibv_alloc_pd, ibv_dealloc_pd - allocate or deallocate a
          protection domain (PDs)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_pd *ibv_alloc_pd(struct ibv_context *context);

          int ibv_dealloc_pd(struct ibv_pd *pd);


---------------------------------------------------------------

::

          ibv_alloc_pd() allocates a PD for the RDMA device context
          context.

          ibv_dealloc_pd() deallocates the PD pd.


-----------------------------------------------------------------

::

          ibv_alloc_pd() returns a pointer to the allocated PD, or NULL if
          the request fails.

          ibv_dealloc_pd() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          ibv_dealloc_pd() may fail if any other resource is still
          associated with the PD being freed.


---------------------------------------------------------

::

          ibv_reg_mr(3), ibv_create_srq(3), ibv_create_qp(3),
          ibv_create_ah(3), ibv_create_ah_from_wc(3)


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

   libibverbs                     2006-10-31                IBV_ALLOC_PD(3)

--------------

Pages that refer to this page:
`ibv_alloc_mw(3) <../man3/ibv_alloc_mw.3.html>`__, 
`ibv_alloc_parent_domain(3) <../man3/ibv_alloc_parent_domain.3.html>`__, 
`ibv_create_ah(3) <../man3/ibv_create_ah.3.html>`__, 
`ibv_create_ah_from_wc(3) <../man3/ibv_create_ah_from_wc.3.html>`__, 
`ibv_create_qp(3) <../man3/ibv_create_qp.3.html>`__, 
`ibv_create_qp_ex(3) <../man3/ibv_create_qp_ex.3.html>`__, 
`ibv_create_srq(3) <../man3/ibv_create_srq.3.html>`__, 
`ibv_create_srq_ex(3) <../man3/ibv_create_srq_ex.3.html>`__, 
`ibv_open_qp(3) <../man3/ibv_open_qp.3.html>`__, 
`ibv_reg_mr(3) <../man3/ibv_reg_mr.3.html>`__

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
