.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mlx5dv_get_clock_info(3) — Linux manual page
============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MLX5DV_GET_CLOCK_INFO(3)Library Functions ManualMLX5DV_GET_CLOCK_INFO(3)

NAME
-------------------------------------------------

::

          mlx5dv_get_clock_info - Get device clock information


---------------------------------------------------------

::

          #include <infiniband/mlx5dv.h>

          int mlx5dv_get_clock_info(struct ibv_context *ctx_in,
                                    struct mlx5dv_clock_info *clock_info);


---------------------------------------------------------------

::

          Get the updated core clock_info from the device driver. This
          information will be used later to translate the completion
          timestamp from HCA core clock to nanoseconds. The values of the
          clock are updated from the driver's PTP clock, therefore, without
          a running PTP client on the machine, the wall clock conversion
          will not be accurate.

          Pass the latest struct mlx5dv_clock_info to mlx5dv_ts_to_ns(3) in
          order to translate the completion timestamp from HCA core clock
          to nanoseconds.

          If the clock_info becomes too old then time conversion will
          return wrong conversion results.  The user must ensure that
          mlx5dv_get_clock_info(3) is called at least once every
          max_clock_info_update_nsec as returned by the
          mlx5dv_query_device(3) function.


-----------------------------------------------------------------

::

          0 on success or the value of errno on failure (which indicates
          the failure reason).


---------------------------------------------------------

::

          mlx5dv(7), mlx5dv_ts_to_ns(3)


-------------------------------------------------------

::

          Feras Daoud <ferasda@mellanox.com>

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

   1.0.0                          2017-11-08       MLX5DV_GET_CLOCK_INFO(3)

--------------

Pages that refer to this page:
`mlx5dv_get_clock_info(3) <../man3/mlx5dv_get_clock_info.3.html>`__, 
`mlx5dv_ts_to_ns(3) <../man3/mlx5dv_ts_to_ns.3.html>`__

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
