.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_modify_srq(3) — Linux manual page
=====================================

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

   IBV_MODIFY_SRQ(3)    Libibverbs Programmer's Manual    IBV_MODIFY_SRQ(3)

NAME
-------------------------------------------------

::

          ibv_modify_srq - modify attributes of a shared receive queue
          (SRQ)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_modify_srq(struct ibv_srq *srq,
                             struct ibv_srq_attr *srq_attr,
                             int srq_attr_mask);


---------------------------------------------------------------

::

          ibv_modify_srq() modifies the attributes of SRQ srq with the
          attributes in srq_attr according to the mask srq_attr_mask.  The
          argument srq_attr is an ibv_srq_attr struct, as defined in
          <infiniband/verbs.h>.

          struct ibv_srq_attr {
                  uint32_t                max_wr;      /* maximum number of outstanding work requests (WRs) in the SRQ */
                  uint32_t                max_sge;     /* number of scatter elements per WR (irrelevant for ibv_modify_srq) */
                  uint32_t                srq_limit;   /* the limit value of the SRQ */
          };

          The argument srq_attr_mask specifies the SRQ attributes to be
          modified.  The argument is either 0 or the bitwise OR of one or
          more of the following flags:

          IBV_SRQ_MAX_WR  Resize the SRQ

          IBV_SRQ_LIMIT  Set the SRQ limit


-----------------------------------------------------------------

::

          ibv_modify_srq() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------

::

          If any of the modify attributes is invalid, none of the
          attributes will be modified.

          Not all devices support resizing SRQs.  To check if a device
          supports it, check if the IBV_DEVICE_SRQ_RESIZE bit is set in the
          device capabilities flags.

          Modifying the srq_limit arms the SRQ to produce an
          IBV_EVENT_SRQ_LIMIT_REACHED "low watermark" asynchronous event
          once the number of WRs in the SRQ drops below srq_limit.


---------------------------------------------------------

::

          ibv_query_device(3), ibv_create_srq(3), ibv_destroy_srq(3),
          ibv_query_srq(3)


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

   libibverbs                     2006-10-31              IBV_MODIFY_SRQ(3)

--------------

Pages that refer to this page:
`ibv_create_srq(3) <../man3/ibv_create_srq.3.html>`__, 
`ibv_create_srq_ex(3) <../man3/ibv_create_srq_ex.3.html>`__, 
`ibv_query_srq(3) <../man3/ibv_query_srq.3.html>`__

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
