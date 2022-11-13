.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma-link(8) — Linux manual page
================================

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

   RDMA-LINK(8)                      Linux                     RDMA-LINK(8)

NAME
-------------------------------------------------

::

          rdma-link - rdma link configuration


---------------------------------------------------------

::

          devlink [ OPTIONS ] link  { COMMAND | help }

          OPTIONS := { -V[ersion] | -d[etails] }

          rdma link show [ DEV/PORT_INDEX ]

          rdma link add NAME type TYPE netdev NETDEV

          rdma link delete NAME

          rdma link help


---------------------------------------------------------------

::

      rdma link show - display rdma link attributes
          DEV/PORT_INDEX - specifies the RDMA link to show.  If this
          argument is omitted all links are listed.

      rdma link add NAME type TYPE netdev NETDEV - add an rdma link for the
          specified type to the network device
          NAME - specifies the new name of the rdma link to add

          TYPE - specifies which rdma type to use.  Link types:

                  rxe - Soft RoCE driver

                  siw - Soft iWARP driver

          NETDEV - specifies the network device to which the link is bound

      rdma link delete NAME - delete an rdma link
          NAME - specifies the name of the rdma link to delete


---------------------------------------------------------

::

          rdma link show
              Shows the state of all rdma links on the system.

          rdma link show mlx5_2/1
              Shows the state of specified rdma link.

          rdma link add rxe_eth0 type rxe netdev eth0
              Adds a RXE link named rxe_eth0 to network device eth0

          rdma link del rxe_eth0
              Removes RXE link rxe_eth0


---------------------------------------------------------

::

          rdma(8), rdma-dev(8), rdma-resource(8), rdma-statistic(8),


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

   iproute2                       06 Jul 2017                  RDMA-LINK(8)

--------------

Pages that refer to this page: `rdma(8) <../man8/rdma.8.html>`__, 
`rdma-dev(8) <../man8/rdma-dev.8.html>`__, 
`rdma-resource(8) <../man8/rdma-resource.8.html>`__, 
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
