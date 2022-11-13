.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma-resource(8) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA-RESOURCE(8)                  Linux                 RDMA-RESOURCE(8)

NAME
-------------------------------------------------

::

          rdma-resource - rdma resource configuration


---------------------------------------------------------

::

          rdma [ OPTIONS ] RESOURCE { COMMAND | help }

          RESOURCE := { cm_id | cq | mr | pd | qp | ctx | srq }

          OPTIONS := { -j[son] | -d[etails] }

          rdma resource show [ DEV/PORT_INDEX ]

          rdma resource help


---------------------------------------------------------------

::

      rdma resource show - display rdma resource tracking information
          DEV/PORT_INDEX - specifies the RDMA link to show.  If this
          argument is omitted all links are listed.


---------------------------------------------------------

::

          rdma resource show
              Shows summary for all devices on the system.

          rdma resource show mlx5_2
              Shows the state of specified rdma device.

          rdma res show qp link mlx5_4
              Get all QPs for the specific device.

          rdma res show qp link mlx5_4/1
              Get QPs of specific port.

          rdma res show qp link mlx5_4/0
              Provide illegal port number (0 is illegal).

          rdma res show qp link mlx5_4/-
              Get QPs which have not assigned port yet.

          rdma res show qp link mlx5_4/- -d
              Detailed view.

          rdma res show qp link mlx5_4/- -dd
              Detailed view including driver-specific details.

          rdma res show qp link mlx5_4/1 lqpn 0-6
              Limit to specific Local QPNs.

          rdma res show qp link mlx5_4/1 lqpn 6 -r
              Driver specific details in raw format.

          rdma resource show cm_id dst-port 7174
              Show CM_IDs with destination ip port of 7174.

          rdma resource show cm_id src-addr 172.16.0.100
              Show CM_IDs bound to local ip address 172.16.0.100

          rdma resource show cq pid 30489
              Show CQs belonging to pid 30489

          rdma resource show ctx ctxn 1
              Show contexts that have index equal to 1.

          rdma resource show srq lqpn 5-7
              Show SRQs that the QPs with lqpn 5-7 are associated with.


---------------------------------------------------------

::

          rdma(8), rdma-dev(8), rdma-link(8), rdma-statistic(8),


-----------------------------------------------------

::

          Leon Romanovsky <leonro@mellanox.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the iproute2 (utilities for controlling
          TCP/IP networking and traffic) project.  Information about the
          project can be found at 
          ⟨http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2⟩.
          If you have a bug report for this manual page, send it to
          netdev@vger.kernel.org, shemminger@osdl.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/network/iproute2/iproute2.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-18.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   iproute2                       26 Dec 2017              RDMA-RESOURCE(8)

--------------

Pages that refer to this page: `rdma(8) <../man8/rdma.8.html>`__, 
`rdma-dev(8) <../man8/rdma-dev.8.html>`__, 
`rdma-link(8) <../man8/rdma-link.8.html>`__, 
`rdma-statistic(8) <../man8/rdma-statistic.8.html>`__, 
`rdma-system(8) <../man8/rdma-system.8.html>`__

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
