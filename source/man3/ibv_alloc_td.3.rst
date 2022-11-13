.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_alloc_td(3) — Linux manual page
===================================

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

   IBV_ALLOC_TD(3)      Libibverbs Programmer's Manual      IBV_ALLOC_TD(3)

NAME
-------------------------------------------------

::

          ibv_alloc_td(), ibv_dealloc_td() - allocate and deallocate thread
          domain object


---------------------------------------------------------

::

          #include <infiniband/verbs.h>

          struct ibv_td *ibv_alloc_td(struct ibv_context *context,
                                      struct ibv_td_init_attr *init_attr);

          int ibv_dealloc_td(struct ibv_td *td);


---------------------------------------------------------------

::

          ibv_alloc_td() allocates a thread domain object for the RDMA
          device context context.

          The thread domain object defines how the verbs libraries and
          provider will use locks and additional hardware capabilities to
          achieve best performance for handling multi-thread or single-
          thread protection.  An application assigns verbs resources to a
          thread domain when it creates a verbs object.

          If the ibv_td object is specified then any objects created under
          this thread domain will disable internal locking designed to
          protect against concurrent access to that object from multiple
          user threads. By default all verbs objects are safe for multi-
          threaded access, whether or not a thread domain is specified.

          A struct ibv_td can be added to a parent domain via
          ibv_alloc_parent_domain() and then the parent domain can be used
          to create verbs objects.

          ibv_dealloc_td() will deallocate the thread domain td.  All
          resources created with the td should be destroyed prior to
          deallocating the td.


-----------------------------------------------------------------

::

          ibv_alloc_td() returns a pointer to the allocated struct ibv_td
          object, or NULL if the request fails (and sets errno to indicate
          the failure reason).

          ibv_dealloc_td() returns 0 on success, or the value of errno on
          failure (which indicates the failure reason).


---------------------------------------------------------

::

          ibv_alloc_parent_domain(3),


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

   libibverbs                     2017-11-06                IBV_ALLOC_TD(3)

--------------

Pages that refer to this page:
`ibv_alloc_parent_domain(3) <../man3/ibv_alloc_parent_domain.3.html>`__

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
