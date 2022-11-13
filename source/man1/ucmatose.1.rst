.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ucmatose(1) — Linux manual page
===============================

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

   UCMATOSE(1)                     librdmacm                    UCMATOSE(1)

NAME
-------------------------------------------------

::

          ucmatose - RDMA CM connection and simple ping-pong test.


---------------------------------------------------------

::

          ucmatose [-s server_address] [-b bind_address]
                    [-f address_format] [-P port_space]
                    [-c connections] [-C message_count] [-S message_size] [-a ack_timeout]
          ucmatose -s server_address [-b bind_address]
                    [-f address_format] [-P port_space]
                    [-c connections] [-C message_count] [-S message_size] [-t tos] [-a ack_timeout]


---------------------------------------------------------------

::

          Establishes a set of reliable RDMA connections between two nodes
          using the librdmacm, optionally transfers data between the nodes,
          then disconnects.


-------------------------------------------------------

::

          -s server_address
                 The network name or IP address of the server system
                 listening for connections.  The used name or address must
                 route over an RDMA device.  This option must be specified
                 by the client.

          -b bind_address
                 The local network address to bind to.  To bind to any
                 address with IPv6 use -b ::0 .

          -f address_format
                 Specifies the format of the server and bind address.  Be
                 default, the format is determined by getaddrinfo() as
                 either being a hostname, an IPv4 address, or an IPv6
                 address.  This option may be used to indicate that a
                 specific address format has been provided.  Supported
                 address_format values are: name, ip, ipv6, and gid.

          -P port_space
                 Specifies the port space for the connection.  Be default,
                 the port space is the RDMA TCP port space. (Note that the
                 RDMA port space may be separate from that used for IP.)
                 Supported port_space values are: tcp and ib.

          -c connections
                 The number of connections to establish between the client
                 and server.  (default 1)

          -C message_count
                 The number of messages to transfer over each connection.
                 (default 10)

          -S message_size
                 The size of each message transferred, in bytes.  (default
                 100)

          -t tos Indicates the type of service used for the communication.
                 Type of service is implementation dependent based on
                 subnet configuration.

          -a ack_timeout
                 Indicates the QP ACK timeout value that should be used.
                 The value calculated according to the formula 4.096 *
                 2^(ack_timeout) usec.

          -m     Tests event channel migration.  Migrates all communication
                 identifiers to a different event channel for disconnect
                 events.


---------------------------------------------------

::

          Basic usage is to start ucmatose on a server system, then run
          ucmatose -s server_name on a client system.

          Because this test maps RDMA resources to userspace, users must
          ensure that they have available system resources and permissions.
          See the libibverbs README file for additional details.


---------------------------------------------------------

::

          rdma_cm(7), udaddy(1), mckey(1), rping(1)

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

   librdmacm                      2007-05-15                    UCMATOSE(1)

--------------

Pages that refer to this page: `mckey(1) <../man1/mckey.1.html>`__, 
`rping(1) <../man1/rping.1.html>`__, 
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
