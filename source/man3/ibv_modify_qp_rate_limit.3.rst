.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_modify_qp_rate_limit(3) — Linux manual page
===============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IBV_MODIFY_QP_RATE_LIMIT(3)erbs Programmer's ManualDIFY_QP_RATE_LIMIT(3)

NAME
-------------------------------------------------

::

          ibv_modify_qp_rate_limit - modify the send rate limits attributes
          of a queue pair (QP)


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          int ibv_modify_qp_rate_limit(struct ibv_qp *qp, struct ibv_qp_rate_limit_attr *attr);


---------------------------------------------------------------

::

          ibv_modify_qp_rate_limit() modifies the send rate limiting packet
          pacing attributes of QP qp with the attributes in attr.  The
          argument attr is an ibv_qp_rate_limit_attr struct, as defined in
          <infiniband/verbs.h>.

          The rate_limit defines the MAX send rate this QP will send as
          long as the link in not blocked and there are work requests in
          send queue.

          Finer control for shaping the rate limit of a QP is achieved by
          defining the max_burst_sz, single burst max bytes size and the
          typical_pkt_sz, typical packet bytes size. These allow the device
          to adjust the inter-burst gap delay required to correctly shape
          the scheduling of sends to the wire in order to reach for
          requested application requirements.

          Setting a value of 0 for max_burst_sz or typical_pkt_sz will use
          the devices defaults.  typical_pkt_sz will default to the port's
          MTU value.

          struct ibv_qp_rate_limit_attr {
                  uint32_t        rate_limit;     /* kbps */
                  uint32_t        max_burst_sz;   /* bytes */
                  uint16_t        typical_pkt_sz; /* bytes */
          };


-----------------------------------------------------------------

::

          ibv_modify_qp_rate_limit() returns 0 on success, or the value of
          errno on failure (which indicates the failure reason).


-----------------------------------------------------

::

      EINVAL
          Invalid arguments.

      EOPNOTSUPP
          Function is not implemented for this device.  (ENOSYS may
          sometimes be returned by old versions of libibverbs).


---------------------------------------------------------

::

          ibv_create_qp(3), ibv_destroy_qp(3), ibv_modify_qp(3),
          ibv_query_qp(3)


-------------------------------------------------------

::

          Alex Rosenbaum <alexr@mellanox.com>

          Bodong Wang <bodong@mellanox.com>

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

   libibverbs                     2018-01-09    IBV_MODIFY_QP_RATE_LIMIT(3)

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
