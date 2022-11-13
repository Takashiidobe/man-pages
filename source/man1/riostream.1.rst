.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

riostream(1) — Linux manual page
================================

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

   RIOSTREAM(1)                    librdmacm                   RIOSTREAM(1)

NAME
-------------------------------------------------

::

          riostream - zero-copy streaming over RDMA ping-pong test.


---------------------------------------------------------

::

          riostream [-s server_address] [-b bind_address] [-B buffer_size]
                         [-I iterations] [-C transfer_count]
                         [-S transfer_size] [-p server_port] [-T test_option]


---------------------------------------------------------------

::

          Uses the streaming over RDMA protocol (rsocket) to connect and
          exchange data between a client and server application.


-------------------------------------------------------

::

          -s server_address
                 The network name or IP address of the server system
                 listening for connections.  The used name or address must
                 route over an RDMA device.  This option must be specified
                 by the client.

          -b bind_address
                 The local network address to bind to.

          -B buffer_size
                 Indicates the size of the send and receive network
                 buffers.

          -I iterations
                 The number of times that the specified number of messages
                 will be exchanged between the client and server.  (default
                 1000)

          -C transfer_count
                 The number of messages to transfer from the client to the
                 server and back again on each iteration.  (default 1)

          -S transfer_size
                 The size of each send transfer, in bytes.  (default 1000)
                 If 'all' is specified, rstream will run a series of tests
                 of various sizes.

          -p server_port
                 The server's port number.

          -T test_option
                 Specifies test parameters.  Available options are:

          a | async - uses asynchronous operation (e.g. select / poll)

          b | blocking - uses blocking calls

          n | nonblocking - uses non-blocking calls

          v | verify - verifies data transfers


---------------------------------------------------

::

          Basic usage is to start riostream on a server system, then run
          riostream -s server_name on a client system.  By default,
          riostream will run a series of latency and bandwidth performance
          tests.  Specifying a different iterations, transfer_count, or
          transfer_size will run a user customized test using default
          values where none have been specified.

          Because this test maps RDMA resources to userspace, users must
          ensure that they have available system resources and permissions.
          See the libibverbs README file for additional details.


---------------------------------------------------------

::

          rdma_cm(7) rstream(1)

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

   librdmacm                      2012-10-24                   RIOSTREAM(1)

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
