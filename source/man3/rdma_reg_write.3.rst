.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_reg_write(3) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA_REG_WRITE(3)     Librdmacm Programmer's Manual    RDMA_REG_WRITE(3)

NAME
-------------------------------------------------

::

          rdma_reg_write - register data buffer(s) for remote RDMA write
          access.


---------------------------------------------------------

::

          #include <rdma/rdma_verbs.h>

          struct ibv_mr * rdma_reg_write (struct rdma_cm_id *id, void
          *addr, size_t length);


-----------------------------------------------------------

::

          id          A reference to a communication identifier where the
                      message buffer(s) will be used.

          addr        The address of the memory buffer(s) to register.

          length      The total length of the memory to register.


---------------------------------------------------------------

::

          Registers a memory buffer that will be accessed by a remote RDMA
          write operation.  Memory buffers registered using rdma_reg_write
          may be targeted in an RDMA write request, allowing the buffer to
          be specified on the remote side of an RDMA connection as the
          remote_addr of rdma_post_write, or similar call.


-----------------------------------------------------------------

::

          Returns a reference to the registered memory region on success,
          or NULL on error.  If an error occurs, errno will be set to
          indicate the failure reason.


---------------------------------------------------

::

          rdma_reg_write is used to register a data buffer that will be the
          target of an RDMA write operation on a queue pair associated with
          an rdma_cm_id.  The memory buffer is registered with the
          proteection domain associated with the idenfier.  The start of
          the data buffer is specified through the addr parameter, and the
          total size of the buffer is given by length.

          All data buffers should be registered before being posted as a
          work request.  Users must deregister all registered memory by
          calling rdma_dereg_mr.


---------------------------------------------------------

::

          rdma_cm(7), rdma_create_id(3), rdma_create_ep(3),
          rdma_reg_msgs(3), rdma_reg_read(3), ibv_reg_mr(3),
          ibv_dereg_mr(3), rdma_post_write(3)

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

   librdmacm                      2010-07-19              RDMA_REG_WRITE(3)

--------------

Pages that refer to this page:
`rdma_dereg_mr(3) <../man3/rdma_dereg_mr.3.html>`__, 
`rdma_post_write(3) <../man3/rdma_post_write.3.html>`__, 
`rdma_post_writev(3) <../man3/rdma_post_writev.3.html>`__, 
`rdma_reg_msgs(3) <../man3/rdma_reg_msgs.3.html>`__, 
`rdma_reg_read(3) <../man3/rdma_reg_read.3.html>`__, 
`rdma_cm(7) <../man7/rdma_cm.7.html>`__

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
