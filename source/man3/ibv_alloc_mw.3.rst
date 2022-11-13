.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_alloc_mw(3) — Linux manual page
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

   IBV_ALLOC_MW(3)      Libibverbs Programmer's Manual      IBV_ALLOC_MW(3)

NAME
-------------------------------------------------

::

          ibv_alloc_mw, ibv_dealloc_mw - allocate or deallocate a memory
          window (MW)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_mw *ibv_alloc_mw(struct ibv_pd *pd,
                                      enum ibv_mw_type type);

          int ibv_dealloc_mw(struct ibv_mw *mw);


---------------------------------------------------------------

::

          ibv_alloc_mw() allocates a memory window (MW) associated with the
          protection domain pd.  The MW's type (1 or 2A/2B) is type.

          The MW is created not bound. For it to be useful, the MW must be
          bound, through either ibv_bind_mw (type 1) or a special WR (type
          2).  Once bound, the memory window allows RDMA (remote) access to
          a subset of the MR to which it was bound, until invalidated by:
          ibv_bind_mw verb with zero length for type 1,
          IBV_WR_LOCAL_INV/IBV_WR_SEND_WITH_INV WR opcode for type 2,
          deallocation.

          ibv_dealloc_mw() Unbinds in case was previously bound and
          deallocates the MW mw.


-----------------------------------------------------------------

::

          ibv_alloc_mw() returns a pointer to the allocated MW, or NULL if
          the request fails.  The remote key (R_Key) field rkey is used by
          remote processes to perform Atomic and RDMA operations. This key
          will be changed during bind operations. The remote process places
          this rkey as the rkey field of struct ibv_send_wr passed to the
          ibv_post_send function.

          ibv_dealloc_mw() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          ibv_dereg_mr() fails if any memory window is still bound to this
          MR.


---------------------------------------------------------

::

          ibv_alloc_pd(3), ibv_post_send(3), ibv_bind_mw(3), ibv_reg_mr(3),


-------------------------------------------------------

::

          Majd Dibbiny <majd@mellanox.com>

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

   libibverbs                     2016-02-02                IBV_ALLOC_MW(3)

--------------

Pages that refer to this page:
`ibv_bind_mw(3) <../man3/ibv_bind_mw.3.html>`__

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
