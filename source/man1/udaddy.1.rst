.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

udaddy(1) — Linux manual page
=============================

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

   UDADDY(1)                       librdmacm                      UDADDY(1)

NAME
-------------------------------------------------

::

          udaddy - RDMA CM datagram setup and simple ping-pong test.


---------------------------------------------------------

::

          udaddy [-s server_address] [-b bind_address] [-c connections]
                    [-C message_count] [-S message_size] [-p port_space]
          udaddy -s server_address [-b bind_address] [-c connections]
                    [-C message_count] [-S message_size] [-t tos] [-p port_space]


---------------------------------------------------------------

::

          Establishes a set of unreliable RDMA datagram communication paths
          between two nodes using the librdmacm, optionally transfers
          datagrams between the nodes, then tears down the communication.


-------------------------------------------------------

::

          -s server_address
                 The network name or IP address of the server system
                 listening for communication.  The used name or address
                 must route over an RDMA device.  This option must be
                 specified by the client.

          -b bind_address
                 The local network address to bind to.  To bind to any
                 address with IPv6 use -b ::0 .

          -c connections
                 The number of communication paths to establish between the
                 client and server.  The test uses unreliable datagram
                 communication, so no actual connections are formed.
                 (default 1)

          -C message_count
                 The number of messages to transfer over each connection.
                 (default 10)

          -S message_size
                 The size of each message transferred, in bytes.  This
                 value must be smaller than the MTU of the underlying RDMA
                 transport, or an error will occur.  (default 100)

          -t tos Indicates the type of service used for the communication.
                 Type of service is implementation dependent based on
                 subnet configuration.

          -p port_space
                 The port space of the datagram communication.  May be
                 either the RDMA UDP (0x0111) or IPoIB (0x0002) port space.
                 (default RDMA_PS_UDP)


---------------------------------------------------

::

          Basic usage is to start udaddy on a server system, then run
          udaddy -s server_name on a client system.

          Because this test maps RDMA resources to userspace, users must
          ensure that they have available system resources and permissions.
          See the libibverbs README file for additional details.


---------------------------------------------------------

::

          rdma_cm(7), ucmatose(1), mckey(1), rping(1)

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

   librdmacm                      2007-05-15                      UDADDY(1)

--------------

Pages that refer to this page: `mckey(1) <../man1/mckey.1.html>`__, 
`rdma_client(1) <../man1/rdma_client.1.html>`__, 
`rdma_server(1) <../man1/rdma_server.1.html>`__, 
`rdma_xclient(1) <../man1/rdma_xclient.1.html>`__, 
`rdma_xserver(1) <../man1/rdma_xserver.1.html>`__, 
`rping(1) <../man1/rping.1.html>`__, 
`ucmatose(1) <../man1/ucmatose.1.html>`__, 
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
