.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_create_cq(3) — Linux manual page
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

   IBV_CREATE_CQ(3)     Libibverbs Programmer's Manual     IBV_CREATE_CQ(3)

NAME
-------------------------------------------------

::

          ibv_create_cq, ibv_destroy_cq - create or destroy a completion
          queue (CQ)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_cq *ibv_create_cq(struct ibv_context *context, int cqe,
                                       void *cq_context,
                                       struct ibv_comp_channel *channel,
                                       int comp_vector);

          int ibv_destroy_cq(struct ibv_cq *cq);


---------------------------------------------------------------

::

          ibv_create_cq() creates a completion queue (CQ) with at least cqe
          entries for the RDMA device context context.  The pointer
          cq_context will be used to set user context pointer of the CQ
          structure. The argument channel is optional; if not NULL, the
          completion channel channel will be used to return completion
          events.  The CQ will use the completion vector comp_vector for
          signaling completion events; it must be at least zero and less
          than context->num_comp_vectors.

          ibv_destroy_cq() destroys the CQ cq.


-----------------------------------------------------------------

::

          ibv_create_cq() returns a pointer to the CQ, or NULL if the
          request fails.

          ibv_destroy_cq() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          ibv_create_cq() may create a CQ with size greater than or equal
          to the requested size. Check the cqe attribute in the returned CQ
          for the actual size.

          ibv_destroy_cq() fails if any queue pair is still associated with
          this CQ.


---------------------------------------------------------

::

          ibv_resize_cq(3), ibv_req_notify_cq(3), ibv_ack_cq_events(3),
          ibv_create_qp(3)


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

   libibverbs                     2006-10-31               IBV_CREATE_CQ(3)

--------------

Pages that refer to this page:
`ibv_create_comp_channel(3) <../man3/ibv_create_comp_channel.3.html>`__, 
`ibv_create_cq_ex(3) <../man3/ibv_create_cq_ex.3.html>`__, 
`ibv_get_cq_event(3) <../man3/ibv_get_cq_event.3.html>`__, 
`ibv_modify_cq(3) <../man3/ibv_modify_cq.3.html>`__

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
