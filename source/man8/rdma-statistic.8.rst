.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma-statistic(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA-STATISTIC(8)                 Linux                RDMA-STATISTIC(8)

NAME
-------------------------------------------------

::

          rdma-statistic - RDMA statistic counter configuration


---------------------------------------------------------

::

          rdma [ OPTIONS ] statistic { COMMAND | help }

          rdma statistic { OBJECT } show

          rdma statistic [ OBJECT ] show link [ DEV/PORT_INDX ] [
                  FILTER_NAME FILTER_VALUE ]

          rdma statistic OBJECT mode

          rdma statistic OBJECT set COUNTER_SCOPE [ DEV/PORT_INDEX ] auto {
                  CRITERIA | off }

          rdma statistic OBJECT bind COUNTER_SCOPE [ DEV/PORT_INDEX ] [
                  OBJECT-ID ] [ COUNTER-ID ]

          rdma statistic OBJECT unbind COUNTER_SCOPE [ DEV/PORT_INDEX ] [
                  COUNTER-ID ] [ OBJECT-ID ]

          COUNTER_SCOPE := { link | dev }

          OBJECT := { qp | mr }

          CRITERIA := { type | pid }

          FILTER_NAME := { cntn | lqpn | pid | qp-type }


---------------------------------------------------------------

::

      rdma statistic [object] show - Queries the specified RDMA device for
          RDMA and driver-specific statistics. Show the default hw counters
          if object is not specified
          DEV - specifies counters on this RDMA device to show.

          PORT_INDEX - specifies counters on this RDMA port to show.

          FILTER_NAME - specifies a filter to show only the results
          matching it.

      rdma statistic <object> set - configure counter statistic auto-mode
          for a specific device/port
          In auto mode all objects belong to one category are bind
          automatically to a single counter set. The "off" is global for
          all auto modes together. Not applicable for MR's.

      rdma statistic <object> bind - manually bind an object (e.g., a qp)
          with a counter
          When bound the statistics of this object are available in this
          counter. Not applicable for MR's.

      rdma statistic <object> unbind - manually unbind an object (e.g., a
          qp) from the counter previously bound
          When unbound the statistics of this object are no longer
          available in this counter; And if object id is not specified then
          all objects on this counter will be unbound. Not applicable for
          MR's.

          COUNTER-ID - specifies the id of the counter to be bound.  If
          this argument is omitted then a new counter will be allocated.


---------------------------------------------------------

::

          rdma statistic show
              Shows the state of the default counter of all RDMA devices on
              the system.

          rdma statistic show link mlx5_2/1
              Shows the state of the default counter of specified RDMA port

          rdma statistic qp show
              Shows the state of all qp counters of all RDMA devices on the
              system.

          rdma statistic qp show link mlx5_2/1
              Shows the state of all qp counters of specified RDMA port.

          rdma statistic qp show link mlx5_2 pid 30489
              Shows the state of all qp counters of specified RDMA port and
              belonging to pid 30489

          rdma statistic qp show link mlx5_2 qp-type UD
              Shows the state of all qp counters of specified RDMA port and
              with QP type UD

          rdma statistic qp mode
              List current counter mode on all devices

          rdma statistic qp mode link mlx5_2/1
              List current counter mode of device mlx5_2 port 1

          rdma statistic qp set link mlx5_2/1 auto type on
              On device mlx5_2 port 1, for each new user QP bind it with a
              counter automatically. Per counter for QPs with same qp type.

          rdma statistic qp set link mlx5_2/1 auto pid on
              On device mlx5_2 port 1, for each new user QP bind it with a
              counter automatically. Per counter for QPs with same pid.

          rdma statistic qp set link mlx5_2/1 auto pid,type on
              On device mlx5_2 port 1, for each new user QP bind it with a
              counter automatically. Per counter for QPs with same pid and
              same type.

          rdma statistic qp set link mlx5_2/1 auto off
              Turn-off auto mode on device mlx5_2 port 1. The allocated
              counters can be manually accessed.

          rdma statistic qp bind link mlx5_2/1 lqpn 178
              On device mlx5_2 port 1, allocate a counter and bind the
              specified qp on it

          rdma statistic qp unbind link mlx5_2/1 cntn 4 lqpn 178
              On device mlx5_2 port 1, bind the specified qp on the
              specified counter

          rdma statistic qp unbind link mlx5_2/1 cntn 4
              On device mlx5_2 port 1, unbind all QPs on the specified
              counter. After that this counter will be released
              automatically by the kernel.

          rdma statistic show mr
              List all currently allocated MR's and their counters.

          rdma statistic show mr mrn 6
              Dump a specific MR statistics with mrn 6. Dumps nothing if
              does not exists.


---------------------------------------------------------

::

          rdma(8), rdma-dev(8), rdma-link(8), rdma-resource(8),


-------------------------------------------------------

::

          Mark Zhang <markz@mellanox.com>
          Erez Alfasi <ereza@mellanox.com>

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

   iproute2                      27 June 2019             RDMA-STATISTIC(8)

--------------

Pages that refer to this page: `rdma(8) <../man8/rdma.8.html>`__, 
`rdma-dev(8) <../man8/rdma-dev.8.html>`__, 
`rdma-link(8) <../man8/rdma-link.8.html>`__, 
`rdma-resource(8) <../man8/rdma-resource.8.html>`__

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
