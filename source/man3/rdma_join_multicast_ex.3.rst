.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_join_multicast_ex(3) — Linux manual page
=============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
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

   RDMA_JOIN_MULTICAST_EX(3)rdmacm Programmer's Manual_JOIN_MULTICAST_EX(3)

NAME
-------------------------------------------------

::

          rdma_join_multicast_ex - Joins a multicast group with extended
          options.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_join_multicast_ex (struct rdma_cm_id *id, struct
          rdma_cm_join_mc_attr_ex *mc_join_attr, void *context);


-----------------------------------------------------------

::

          id                  Communication identifier associated with the
                              request.

          mc_join_attr        Is an rdma_cm_join_mc_attr_ex struct, as
                              defined in <rdma/rdma_cma.h>.

          context             User-defined context associated with the join
                              request.


---------------------------------------------------------------

::

          Joins a multicast group (MCG) with extended options.  Currently
          supporting MC join with a specified join flag.

          struct rdma_cm_join_mc_attr_ex {
                  uint32_t                comp_mask;      /* Bitwise OR between "rdma_cm_join_mc_attr_mask" enum */
                  uint32_t                join_flags;     /* Use a single flag from "rdma_cm_mc_join_flags" enum */
                  struct sockaddr         *addr;          /* Multicast address identifying the group to join */
          };

          The supported join flags are:

          RDMA_MC_JOIN_FLAG_FULLMEMBER - Create multicast group, Send
          multicast messages to MCG, Receive multicast messages from MCG.

          RDMA_MC_JOIN_FLAG_SENDONLY_FULLMEMBER - Create multicast group,
          Send multicast messages to MCG, Don't receive multicast messages
          from MCG (send-only).

          Initiating a MC join as "Send Only Full Member" on InfiniBand
          requires SM support, otherwise joining will fail.

          Initiating a MC join as "Send Only Full Member" on RoCEv2/ETH
          will not send any IGMP messages unlike a Full Member MC join.
          When "Send Only Full Member" is used the QP will not be attached
          to the MCG.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          Before joining a multicast group, the rdma_cm_id must be bound to
          an RDMA device by calling rdma_bind_addr or rdma_resolve_addr.
          Use of rdma_resolve_addr requires the local routing tables to
          resolve the multicast address to an RDMA device, unless a
          specific source address is provided.  The user must call
          rdma_leave_multicast to leave the multicast group and release any
          multicast resources.  After the join operation completes, if a QP
          is associated with the rdma_cm_id, it is automatically attached
          to the multicast group when the multicast event is retrieved by
          the user.  Otherwise, the user is responsible for calling
          ibv_attach_mcast to bind the QP to the multicast group.  The join
          context is returned to the user through the private_data field in
          the rdma_cm_event.


---------------------------------------------------------

::

          rdma_join_multicast(3), rdma_leave_multicast(3),
          rdma_bind_addr(3), rdma_resolve_addr(3), rdma_create_qp(3),
          rdma_get_cm_event(3)


-------------------------------------------------------

::

          Alex Vesker <valex@mellanox.com>

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

   librdmacm                      2017-11-17      RDMA_JOIN_MULTICAST_EX(3)

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
