.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_post_write(3) — Linux manual page
======================================

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

   RDMA_POST_WRITE(3)    Librdmacm Programmer's Manual   RDMA_POST_WRITE(3)

NAME
-------------------------------------------------

::

          rdma_post_write - post an RDMA write work request.


---------------------------------------------------------

::

          #include <rdma/rdma_verbs.h>

          int rdma_post_write (struct rdma_cm_id *id, void *context, void
          *addr, size_t length, struct ibv_mr *mr, int flags, uint64_t
          remote_addr, uint32_t rkey);


-----------------------------------------------------------

::

          id          A reference to a communication identifier where the
                      request will be posted.

          context     User-defined context associated with the request.

          addr        The local address of the source of the write request.

          length      The length of the write operation.

          mr          Optional memory region associated with the local
                      buffer.

          flags       Optional flags used to control the write operation.

          remote_addr The address of the remote registered memory to write
                      into.

          rkey        The registered memory key associated with the remote
                      address.


---------------------------------------------------------------

::

          Posts a work request to the send queue of the queue pair
          associated with the rdma_cm_id.  The contents of the local data
          buffer will be written into the remote memory region.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          For a list of supported flags, see ibv_post_send.  Unless inline
          data is specified, the local data buffer must have been
          registered before the write is issued, and the buffer must remain
          registered until the write completes.  The remote buffer must
          always be registered.

          Write operations may not be posted to an rdma_cm_id or the
          corresponding queue pair until it has been connected.

          The user-defined context associated with the write request will
          be returned to the user through the work completion wr_id, work
          request identifier, field.


---------------------------------------------------------

::

          rdma_cm(7), rdma_connect(3), rdma_accept(3), ibv_post_send(3),
          rdma_post_writev(3), rdma_reg_write(3), rdma_reg_msgs(3)

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

   librdmacm                      2010-07-19             RDMA_POST_WRITE(3)

--------------

Pages that refer to this page:
`rdma_get_recv_comp(3) <../man3/rdma_get_recv_comp.3.html>`__, 
`rdma_get_send_comp(3) <../man3/rdma_get_send_comp.3.html>`__, 
`rdma_post_writev(3) <../man3/rdma_post_writev.3.html>`__, 
`rdma_reg_msgs(3) <../man3/rdma_reg_msgs.3.html>`__, 
`rdma_reg_write(3) <../man3/rdma_reg_write.3.html>`__, 
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
