.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_bind_addr(3) — Linux manual page
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

   RDMA_BIND_ADDR(3)     Librdmacm Programmer's Manual    RDMA_BIND_ADDR(3)

NAME
-------------------------------------------------

::

          rdma_bind_addr - Bind an RDMA identifier to a source address.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_bind_addr (struct rdma_cm_id *id, struct sockaddr
          *addr);


-----------------------------------------------------------

::

          id          RDMA identifier.

          addr        Local address information.  Wildcard values are
                      permitted.


---------------------------------------------------------------

::

          Associates a source address with an rdma_cm_id.  The address may
          be wildcarded.  If binding to a specific local address, the
          rdma_cm_id will also be bound to a local RDMA device.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          Typically, this routine is called before calling rdma_listen to
          bind to a specific port number, but it may also be called on the
          active side of a connection before calling rdma_resolve_addr to
          bind to a specific address.

          If used to bind to port 0, the rdma_cm will select an available
          port, which can be retrieved with rdma_get_src_port(3).


---------------------------------------------------------

::

          rdma_create_id(3), rdma_listen(3), rdma_resolve_addr(3),
          rdma_create_qp(3), rdma_get_local_addr(3), rdma_get_src_port(3)

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

   librdmacm                      2007-05-15              RDMA_BIND_ADDR(3)

--------------

Pages that refer to this page:
`rdma_create_id(3) <../man3/rdma_create_id.3.html>`__, 
`rdma_create_qp(3) <../man3/rdma_create_qp.3.html>`__, 
`rdma_create_srq(3) <../man3/rdma_create_srq.3.html>`__, 
`rdma_getaddrinfo(3) <../man3/rdma_getaddrinfo.3.html>`__, 
`rdma_get_local_addr(3) <../man3/rdma_get_local_addr.3.html>`__, 
`rdma_get_src_port(3) <../man3/rdma_get_src_port.3.html>`__, 
`rdma_join_multicast(3) <../man3/rdma_join_multicast.3.html>`__, 
`rdma_join_multicast_ex(3) <../man3/rdma_join_multicast_ex.3.html>`__, 
`rdma_listen(3) <../man3/rdma_listen.3.html>`__, 
`rdma_resolve_addr(3) <../man3/rdma_resolve_addr.3.html>`__, 
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
