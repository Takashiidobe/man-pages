.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma_listen(3) — Linux manual page
==================================

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

   RDMA_LISTEN(3)        Librdmacm Programmer's Manual       RDMA_LISTEN(3)

NAME
-------------------------------------------------

::

          rdma_listen - Listen for incoming connection requests.


---------------------------------------------------------

::

          #include <rdma/rdma_cma.h>

          int rdma_listen (struct rdma_cm_id *id, int backlog);


-----------------------------------------------------------

::

          id          RDMA identifier.

          backlog     backlog of incoming connection requests.


---------------------------------------------------------------

::

          Initiates a listen for incoming connection requests or datagram
          service lookup.  The listen will be restricted to the locally
          bound source address.


-----------------------------------------------------------------

::

          Returns 0 on success, or -1 on error.  If an error occurs, errno
          will be set to indicate the failure reason.


---------------------------------------------------

::

          Users must have bound the rdma_cm_id to a local address by
          calling rdma_bind_addr before calling this routine.  If the
          rdma_cm_id is bound to a specific IP address, the listen will be
          restricted to that address and the associated RDMA device.  If
          the rdma_cm_id is bound to an RDMA port number only, the listen
          will occur across all RDMA devices.


---------------------------------------------------------

::

          rdma_cm(7), rdma_bind_addr(3), rdma_connect(3), rdma_accept(3),
          rdma_reject(3), rdma_get_cm_event(3)

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

   librdmacm                      2007-05-15                 RDMA_LISTEN(3)

--------------

Pages that refer to this page:
`rdma_accept(3) <../man3/rdma_accept.3.html>`__, 
`rdma_bind_addr(3) <../man3/rdma_bind_addr.3.html>`__, 
`rdma_connect(3) <../man3/rdma_connect.3.html>`__, 
`rdma_create_ep(3) <../man3/rdma_create_ep.3.html>`__, 
`rdma_create_id(3) <../man3/rdma_create_id.3.html>`__, 
`rdma_disconnect(3) <../man3/rdma_disconnect.3.html>`__, 
`rdma_get_cm_event(3) <../man3/rdma_get_cm_event.3.html>`__, 
`rdma_get_request(3) <../man3/rdma_get_request.3.html>`__, 
`rdma_notify(3) <../man3/rdma_notify.3.html>`__, 
`rdma_reject(3) <../man3/rdma_reject.3.html>`__, 
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
