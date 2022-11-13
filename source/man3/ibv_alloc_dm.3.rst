.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_alloc_dm(3) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `Accessing an                     |                                   |
| allocated device memory <#Accessi |                                   |
| ng_an_allocated_device_memory>`__ |                                   |
| \|                                |                                   |
| `Device memory registration       |                                   |
|  <#Device_memory_registration>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IBV_ALLOC_DM(3)      Libibverbs Programmer's Manual      IBV_ALLOC_DM(3)

NAME
-------------------------------------------------

::

          ibv_alloc_dm, ibv_free_dm, ibv_memcpy_to/from_dm - allocate or
          free a device memory buffer (DMs) and perform memory copy to or
          from it


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_dm *ibv_alloc_dm(struct ibv_context *context,
                                      struct ibv_alloc_dm_attr *attr);

          int ibv_free_dm(struct ibv_dm *dm);


---------------------------------------------------------------

::

          ibv_alloc_dm() allocates a device memory buffer for the RDMA
          device context context.  The argument attr is a pointer to an
          ibv_alloc_dm_attr struct, as defined in <infiniband/verbs.h>.

          ibv_free_dm() free the device memory buffer dm.

          struct ibv_alloc_dm_attr {
                  size_t length;           /* Length of desired device memory buffer */
                  uint32_t log_align_req;       /* Log base 2 of address alignment requirement */
                  uint32_t comp_mask;      /* Compatibility mask that defines which of the following variables are valid */
          };

          Address alignment may be required in cases where RDMA atomic operations will be performed using the device memory.

          In such cases, the user may specify the device memory start address alignment using the log_align_req parameter

          in the allocation attributes struct.


-----------------------------------------------------------------------------------------------------------------

::

          In order to perform a write/read memory access to an allocated device memory, a user could use the ibv_memcpy_to_dm
          and ibv_memcpy_from_dm calls respectively.

          int ibv_memcpy_to_dm(struct ibv_dm *dm, uint64_t dm_offset,
                               void *host_addr, size_t length);

          int ibv_memcpy_from_dm(void *host_addr, struct ibv_dm *dm,
                             uint64_t dm_offset, size_t length);

          dm_offest
          is the byte offset from the beginning of the allocated device memory buffer to access.

          host_addr
          is the host memory buffer address to access.

          length
          is the copy length in bytes.


---------------------------------------------------------------------------------------------

::

          User may register the allocated device memory as a memory region and use the lkey/rkey inside sge when posting receive
          or sending work request. This type of MR is defined as zero based and therefore any reference to it (specifically in sge)
          is done with a byte offset from the beginning of the region.

          This type of registration is done using ibv_reg_dm_mr.

          struct ibv_mr* ibv_reg_dm_mr(struct ibv_pd *pd, struct ibv_dm *dm, uint64_t dm_offset,
                            size_t length, uint32_t access);

          pd
          the associated pd for this registration.

          dm
          the associated dm for this registartion.

          dm_offest
          is the byte offset from the beginning of the allocated device memory buffer to register.

          length
          the memory length to register.

          access
          mr access flags (Use enum ibv_access_flags). For this type of registration, user must set the IBV_ACCESS_ZERO_BASED
          flag.


-----------------------------------------------------------------

::

          ibv_alloc_dm() returns a pointer to an ibv_dm struct or NULL if
          the request fails.  The output dm contains the handle which could
          be used by user to import this device memory.

          ibv_free_dm() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).

          ibv_reg_dm_mr() returns a pointer to an ibv_mr struct on success
          or NULL if request fails.

          ibv_memcpy_to_dm()/ibv_memcpy_from_dm() returns 0 on success or
          the failure reason value on failure.


---------------------------------------------------

::

          ibv_alloc_dm() may fail if device has no more free device memory
          left, where the maximum amount of allocated memory is provided by
          the max_dm_size attribute in ibv_device_attr_ex struct.
          ibv_free_dm() may fail if any other resources (such as an MR) is
          still associated with the DM being freed.


---------------------------------------------------------

::

          ibv_query_device_ex(3),


-------------------------------------------------------

::

          Ariel Levkovich <lariel@mellanox.com>

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

   libibverbs                     2017-07-25                IBV_ALLOC_DM(3)

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
