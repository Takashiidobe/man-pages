.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mckey(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MCKEY(1)                        librdmacm                       MCKEY(1)

NAME
-------------------------------------------------

::

          mckey - RDMA CM multicast setup and simple data transfer test.


---------------------------------------------------------

::

          mckey -m multicast_address [-s] [-b bind_address] [-c connections]
                    [-C message_count] [-S message_size] [-p port_space]
          mckey -m multicast_address -s [-b bind_address] [-c connections]
                    [-C message_count] [-S message_size] [-p port_space]
          mckey -M unmapped_multicast_address -b bind_address [-s] [-c connections]
                    [-C message_count] [-S message_size] [-p port_space]


---------------------------------------------------------------

::

          Establishes a set of RDMA multicast communication paths between
          nodes using the librdmacm, optionally transfers datagrams to
          receiving nodes, then tears down the communication.


-------------------------------------------------------

::

          -m multicast_address
                 IP multicast address to join.

          -M unmapped_multicast_address
                 RDMA transport specific multicast address to join.

          -s     Send datagrams to the multicast group.

          -b bind_address
                 The local network address to bind to.

          -c connections
                 The number of QPs to join the multicast group.  (default
                 1)

          -C message_count
                 The number of messages to transfer over each connection.
                 (default 10)

          -S message_size
                 The size of each message transferred, in bytes.  This
                 value must be smaller than the MTU of the underlying RDMA
                 transport, or an error will occur.  (default 100)

          -o     Join the multicast group as a send-only full-member.
                 Otherwise the group is joined as a full-member.

          -p port_space
                 The port space of the datagram communication.  May be
                 either the RDMA UDP (0x0111) or IPoIB (0x0002) port space.
                 (default RDMA_PS_UDP)


---------------------------------------------------

::

          Basic usage is to start mckey -m multicast_address on a server
          system, then run mckey -m multicast_address -s on a client
          system.

          Unique Infiniband SA assigned multicast GIDs can be retrieved by
          invoking mckey with a zero MGID or IP address.  (Example, -M 0 or
          -m 0.0.0.0).  The assigned address will be displayed to allow
          mckey clients to join the created group.

          Because this test maps RDMA resources to userspace, users must
          ensure that they have available system resources and permissions.
          See the libibverbs README file for additional details.


---------------------------------------------------------

::

          rdma_cm(7), ucmatose(1), udaddy(1), rping(1)

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

   librdmacm                      2007-05-15                       MCKEY(1)

--------------

Pages that refer to this page:
`rdma_client(1) <../man1/rdma_client.1.html>`__, 
`rdma_server(1) <../man1/rdma_server.1.html>`__, 
`rdma_xclient(1) <../man1/rdma_xclient.1.html>`__, 
`rdma_xserver(1) <../man1/rdma_xserver.1.html>`__, 
`rping(1) <../man1/rping.1.html>`__, 
`ucmatose(1) <../man1/ucmatose.1.html>`__, 
`udaddy(1) <../man1/udaddy.1.html>`__, 
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
