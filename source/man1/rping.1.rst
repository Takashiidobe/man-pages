.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rping(1) — Linux manual page
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

   RPING(1)                        librdmacm                       RPING(1)

NAME
-------------------------------------------------

::

          rping - RDMA CM connection and RDMA ping-pong test.


---------------------------------------------------------

::

          rping -s [-v] [-V] [-d] [-P] [-a address] [-p port]
                    [-C message_count] [-S message_size]
          rping -c [-v] [-V] [-d] [-I address] -a address [-p port]
                    [-C message_count] [-S message_size]


---------------------------------------------------------------

::

          Establishes a reliable RDMA connection between two nodes using
          the librdmacm, optionally performs RDMA transfers between the
          nodes, then disconnects.


-------------------------------------------------------

::

          -s     Run as the server.

          -c     Run as the client.

          -a address
                 On the server, specifies the network address to bind the
                 connection to.  To bind to any address with IPv6 use -a
                 ::0 .  On the client, specifies the server address to
                 connect to.

          -I address
                 The address to bind to as the source IP address to use.
                 This is useful if you have multiple addresses on the same
                 network or complex routing.

          -p     Port number for listening server.

          -v     Display ping data.

          -V     Validate ping data.

          -d     Display debug information.

          -C message_count
                 The number of messages to transfer over each connection.
                 (default infinite)

          -S message_size
                 The size of each message transferred, in bytes.  (default
                 100)

          -P     Run the server in persistent mode.  This allows multiple
                 rping clients to connect to a single server instance. The
                 server will run until killed.

          -q     Control QP Creation/Modification directly from the
                 application, instead of rdma_cm.


---------------------------------------------------

::

          Because this test maps RDMA resources to userspace, users must
          ensure that they have available system resources and permissions.
          See the libibverbs README file for additional details.


---------------------------------------------------------

::

          rdma_cm(7), ucmatose(1), udaddy(1), mckey(1)

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

   librdmacm                      2007-05-15                       RPING(1)

--------------

Pages that refer to this page: `mckey(1) <../man1/mckey.1.html>`__, 
`rdma_client(1) <../man1/rdma_client.1.html>`__, 
`rdma_server(1) <../man1/rdma_server.1.html>`__, 
`rdma_xclient(1) <../man1/rdma_xclient.1.html>`__, 
`rdma_xserver(1) <../man1/rdma_xserver.1.html>`__, 
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
