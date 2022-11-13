.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_create_ep(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA_CREATE_EP(3)     Librdmacm Programmer's Manual    RDMA_CREATE_EP(3)

NAME
-------------------------------------------------

::

          rdma_create_ep - Allocate a communication identifier and optional
          QP.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_create_ep (struct rdma_cm_id **id, struct rdma_addrinfo
          *res, struct ibv_pd  *pd, struct ibv_qp_init_attr *qp_init_attr);


-----------------------------------------------------------

::

          id          A reference where the allocated communication
                      identifier will be returned.

          res         Address information associated with the rdma_cm_id
                      returned from rdma_getaddrinfo.

          pd          Optional protection domain if a QP is associated with
                      the rdma_cm_id.

          qp_init_attr
                      Optional initial QP attributes.


---------------------------------------------------------------

::

          Creates an identifier that is used to track communication
          information.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          After resolving address information using rdma_getaddrinfo, a
          user may use this call to allocate an rdma_cm_id based on the
          results.

          If the rdma_cm_id will be used on the active side of a
          connection, meaning that res->ai_flag does not have RAI_PASSIVE
          set, rdma_create_ep will automatically create a QP on the
          rdma_cm_id if qp_init_attr is not NULL.  The QP will be
          associated with the specified protection domain, if provided, or
          a default protection domain if not.  Users should see
          rdma_create_qp for details on the use of the pd and qp_init_attr
          parameters.  After calling rdma_create_ep, the returned
          rdma_cm_id may be connected by calling rdma_connect.  The active
          side calls rdma_resolve_addr and rdma_resolve_route are not
          necessary.

          If the rdma_cm_id will be used on the passive side of a
          connection, indicated by having res->ai_flag RAI_PASSIVE set,
          this call will save the provided pd and qp_init_attr parameters.
          When a new connection request is retrieved by calling
          rdma_get_request, the rdma_cm_id associated with the new
          connection will automatically be associated with a QP using the
          pd and qp_init_attr parameters.  After calling rdma_create_ep,
          the returned rdma_cm_id may be placed into a listening state by
          immediately calling rdma_listen.  The passive side call
          rdma_bind_addr is not necessary.  Connection requests may then be
          retrieved by calling rdma_get_request.

          The newly created rdma_cm_id will be set to use synchronous
          operation.  Users that wish asynchronous operation must migrate
          the rdma_cm_id to a user created event channel using
          rdma_migrate_id.

          Users must release the created rdma_cm_id by calling
          rdma_destroy_ep.


---------------------------------------------------------

::

          rdma_cm(7), rdma_getaddrinfo(3), rdma_create_event_channel(3),
          rdma_connect(3), rdma_listen(3), rdma_destroy_ep(3),
          rdma_migrate_id(3)

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

   librdmacm                      2010-07-19              RDMA_CREATE_EP(3)

--------------

Pages that refer to this page:
`rdma_create_srq(3) <../man3/rdma_create_srq.3.html>`__, 
`rdma_dereg_mr(3) <../man3/rdma_dereg_mr.3.html>`__, 
`rdma_destroy_ep(3) <../man3/rdma_destroy_ep.3.html>`__, 
`rdma_getaddrinfo(3) <../man3/rdma_getaddrinfo.3.html>`__, 
`rdma_post_recv(3) <../man3/rdma_post_recv.3.html>`__, 
`rdma_post_recvv(3) <../man3/rdma_post_recvv.3.html>`__, 
`rdma_reg_msgs(3) <../man3/rdma_reg_msgs.3.html>`__, 
`rdma_reg_read(3) <../man3/rdma_reg_read.3.html>`__, 
`rdma_reg_write(3) <../man3/rdma_reg_write.3.html>`__, 
`rdma_cm(7) <../man7/rdma_cm.7.html>`__

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
