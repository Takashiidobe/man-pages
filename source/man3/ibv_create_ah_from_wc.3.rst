.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_create_ah_from_wc(3) — Linux manual page
============================================

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

   IBV_CREATE_AH_FROM_WC(3)ibverbs Programmer's Manual_CREATE_AH_FROM_WC(3)

NAME
-------------------------------------------------

::

          ibv_init_ah_from_wc, ibv_create_ah_from_wc - initialize or create
          an address handle (AH) from a work completion


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_init_ah_from_wc(struct ibv_context *context, uint8_t port_num,
                                  struct ibv_wc *wc, struct ibv_grh *grh,
                                  struct ibv_ah_attr *ah_attr);

          struct ibv_ah *ibv_create_ah_from_wc(struct ibv_pd *pd,
                                               struct ibv_wc *wc,
                                               struct ibv_grh *grh,
                                               uint8_t port_num);


---------------------------------------------------------------

::

          ibv_init_ah_from_wc() initializes the address handle (AH)
          attribute structure ah_attr for the RDMA device context context
          using the port number port_num, using attributes from the work
          completion wc and the Global Routing Header (GRH) structure grh.

          ibv_create_ah_from_wc() creates an AH associated with the
          protection domain pd using the port number port_num, using
          attributes from the work completion wc and the Global Routing
          Header (GRH) structure grh.


-----------------------------------------------------------------

::

          ibv_init_ah_from_wc() returns 0 on success, and -1 on error.

          ibv_create_ah_from_wc() returns a pointer to the created AH, or
          NULL if the request fails.


---------------------------------------------------

::

          The filled structure ah_attr returned from ibv_init_ah_from_wc()
          can be used to create a new AH using ibv_create_ah().


---------------------------------------------------------

::

          ibv_open_device(3), ibv_alloc_pd(3), ibv_create_ah(3),
          ibv_destroy_ah(3), ibv_poll_cq(3)


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

   libibverbs                     2006-10-31       IBV_CREATE_AH_FROM_WC(3)

--------------

Pages that refer to this page:
`ibv_alloc_pd(3) <../man3/ibv_alloc_pd.3.html>`__, 
`ibv_create_ah(3) <../man3/ibv_create_ah.3.html>`__

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
