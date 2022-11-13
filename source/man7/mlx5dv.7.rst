.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mlx5dv(7) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MLX5DV(7)           Miscellaneous Information Manual           MLX5DV(7)

NAME
-------------------------------------------------

::

          mlx5dv - Direct verbs for mlx5 devices
          This is low level access to mlx5 devices to perform data path
          operations, without general branching performed by
          ibv_post_send(3).


---------------------------------------------------------------

::

          The libibverbs API is an abstract one. It is agnostic to any
          underlying provider specific implementation. While this
          abstraction has the advantage of user applications portability it
          has a performance penalty. For some applications optimizing
          performance is more important than portability.

          The mlx5 direct verbs API is intended for such applications.  It
          exposes mlx5 specific low level data path
          (send/receive/completion) operations, allowing the application to
          bypass the libibverbs data path API.

          This interface consists from one hardware specific header file
          with relevant inline functions and conversion logic from ibverbs
          structures to mlx5 specific structures.

          The direct include of mlx5dv.h together with linkage to mlx5
          library will allow usage of this new interface.

          Once an application uses the direct flow the locking scheme is
          fully managed by itself. There is an expectation that no mixed
          flows in the data path for both direct/non-direct access will be
          by same application.


---------------------------------------------------

::

          All Mellanox NIC devices starting from Connect-IB (Connect-IB,
          ConnectX-4, ConnectX-4Lx, ConnectX-5, ...) implement the mlx5
          API, thus using the mlx5 direct verbs does not limit the
          applications to a single NIC HW device thus keeping some level of
          portability.


---------------------------------------------------------

::

          ibv_post_send(3), verbs(7), mlx5dv_is_supported(3)


-------------------------------------------------------

::

          Leon Romanovsky <leonro@mellanox.com>

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

   1.0.0                          2017-02-02                      MLX5DV(7)

--------------

Pages that refer to this page:
`mlx5dv_get_clock_info(3) <../man3/mlx5dv_get_clock_info.3.html>`__, 
`mlx5dv_init_obj(3) <../man3/mlx5dv_init_obj.3.html>`__, 
`mlx5dv_query_device(3) <../man3/mlx5dv_query_device.3.html>`__, 
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
