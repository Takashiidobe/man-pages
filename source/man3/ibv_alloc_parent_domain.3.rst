.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_alloc_parent_domain(3) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IBV_ALLOC_PARENT_DOMAIN(3)verbs Programmer's ManualLLOC_PARENT_DOMAIN(3)

NAME
-------------------------------------------------

::

          ibv_alloc_parent_domain(), ibv_dealloc_pd() - allocate and
          deallocate the parent domain object


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_pd *ibv_alloc_parent_domain(struct ibv_context *context", struct ibv_parent_domain_init_attr *attr);


---------------------------------------------------------------

::

          ibv_alloc_parent_domain() allocates a parent domain object for
          the RDMA device context context.

          The parent domain object extends the normal protection domain
          with additional objects, such as a thread domain.

          A parent domain is completely interchangeable with the struct
          ibv_pd used to create it, and can be used as an input argument to
          any function accepting a struct ibv_pd.

          The behavior of each verb may be different if the verb is passed
          a parent domain struct ibv_pd that contains a struct ibv_td
          pointer.  For instance the verb may choose to share resources
          between objects using the same thread domain. The exact behavior
          is provider dependent.

          The attr argument specifies the following:

          enum ibv_parent_domain_init_attr_mask {
                  IBV_PARENT_DOMAIN_INIT_ATTR_ALLOCATORS = 1 << 0,
                  IBV_PARENT_DOMAIN_INIT_ATTR_PD_CONTEXT = 1 << 1,
          };

          struct ibv_parent_domain_init_attr {
                  struct ibv_pd *pd; /* reference to a protection domain, can't be NULL */
                  struct ibv_td *td; /* reference to a thread domain, or NULL */
                  uint32_t comp_mask;
                  void *(*alloc)(struct ibv_pd *pd, void *pd_context, size_t size,
                                 size_t alignment, uint64_t resource_type);
                  void (*free)(struct ibv_pd *pd, void *pd_context, void *ptr,
                               uint64_t resource_type);
                  void *pd_context;
          };

          ibv_dealloc_pd() will deallocate the parent domain as its exposed
          as an ibv_pd pd.  All resources created with the parent domain
          should be destroyed prior to deallocating the parent domain.


-----------------------------------------------------------

::

          pd Reference to the protection domain that this parent domain
          uses.

          td An optional thread domain that the parent domain uses.

          comp_mask Bit-mask of optional fields in the
          ibv_parent_domain_init_attr struct.

          alloc Custom memory allocation function for this parent domain.
          Provider memory allocations will use this function to allocate
          the needed memory.  The allocation function is passed the parent
          domain pd and the user-specified context pd_context.  In
          addition, the callback receives the size and the alignment of the
          requested buffer, as well a vendor-specific resource_type , which
          is derived from the rdma_driver_id enum (upper 32 bits) and a
          vendor specific resource code.  The function returns the pointer
          to the allocated buffer, or NULL to designate an error.  It may
          also return IBV_ALLOCATOR_USE_DEFAULT asking the callee to
          allocate the buffer using the default allocator.

          The callback makes sure the allocated buffer is initialized with
          zeros. It is also the responsibility of the callback to make sure
          the memory cannot be COWed, e.g. by using madvise(MADV_DONTFORK)
          or by allocating anonymous shared memory.

          free Callback to free memory buffers that were allocated using a
          successful alloc().

          pd_context A pointer for additional user-specific data to be
          associated with this parent domain. The pointer is passed back to
          the custom allocator functions.


-----------------------------------------------------------------

::

          ibv_alloc_parent_domain() returns a pointer to the allocated
          struct ibv_pd object, or NULL if the request fails (and sets
          errno to indicate the failure reason).


---------------------------------------------------------

::

          ibv_alloc_parent_domain(3), ibv_dealloc_pd(3), ibv_alloc_pd(3),
          ibv_alloc_td(3)


-------------------------------------------------------

::

          Alex Rosenbaum <alexr@mellanox.com>

          Yishai Hadas <yishaih@mellanox.com>

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

   libibverbs                     2017-11-06     IBV_ALLOC_PARENT_DOMAIN(3)

--------------

Pages that refer to this page:
`ibv_alloc_parent_domain(3) <../man3/ibv_alloc_parent_domain.3.html>`__, 
`ibv_alloc_td(3) <../man3/ibv_alloc_td.3.html>`__, 
`ibv_create_cq_ex(3) <../man3/ibv_create_cq_ex.3.html>`__

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
