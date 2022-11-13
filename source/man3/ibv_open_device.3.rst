.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_open_device(3) — Linux manual page
======================================

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

   IBV_OPEN_DEVICE(3)   Libibverbs Programmer's Manual   IBV_OPEN_DEVICE(3)

NAME
-------------------------------------------------

::

          ibv_open_device, ibv_close_device - open and close an RDMA device
          context


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_context *ibv_open_device(struct ibv_device *device);

          int ibv_close_device(struct ibv_context *context);


---------------------------------------------------------------

::

          ibv_open_device() opens the device device and creates a context
          for further use.

          ibv_close_device() closes the device context context.


-----------------------------------------------------------------

::

          ibv_open_device() returns a pointer to the allocated device
          context, or NULL if the request fails.

          ibv_close_device() returns 0 on success, -1 on failure.


---------------------------------------------------

::

          ibv_close_device() does not release all the resources allocated
          using context context.  To avoid resource leaks, the user should
          release all associated resources before closing a context.

          Setting the environment variable **RDMAV_ALLOW_DISASSOC_DESTROY**
          tells the library to relate an EIO from destroy commands as a
          success as the kernel resources were already released. This comes
          to prevent memory leakage in the user space area upon device
          disassociation. Applications using this flag cannot call
          ibv_get_cq_event or ibv_get_async_event concurrently with any
          call to an object destruction function.


---------------------------------------------------------

::

          ibv_get_device_list(3), ibv_query_device(3), ibv_query_port(3),
          ibv_query_gid(3), ibv_query_pkey(3)


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

   libibverbs                     2006-10-31             IBV_OPEN_DEVICE(3)

--------------

Pages that refer to this page:
`ibv_create_ah_from_wc(3) <../man3/ibv_create_ah_from_wc.3.html>`__, 
`ibv_create_comp_channel(3) <../man3/ibv_create_comp_channel.3.html>`__, 
`ibv_get_async_event(3) <../man3/ibv_get_async_event.3.html>`__, 
`ibv_query_device(3) <../man3/ibv_query_device.3.html>`__, 
`ibv_query_device_ex(3) <../man3/ibv_query_device_ex.3.html>`__, 
`ibv_query_rt_values_ex(3) <../man3/ibv_query_rt_values_ex.3.html>`__

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
