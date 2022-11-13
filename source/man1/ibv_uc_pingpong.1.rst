.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ibv_uc_pingpong(1) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IBV_UC_PINGPONG(1)            USER COMMANDS           IBV_UC_PINGPONG(1)

NAME
-------------------------------------------------

::

          ibv_uc_pingpong - simple InfiniBand UC transport test


---------------------------------------------------------

::

          ibv_uc_pingpong [-p port] [-d device] [-i ib port] [-s size] [-m
          size] [-r rx depth] [-n iters] [-l sl] [-e] [-g gid index]
          HOSTNAME

          ibv_uc_pingpong [-p port] [-d device] [-i ib port] [-s size] [-m
          size] [-r rx depth] [-n iters] [-l sl] [-e] [-g gid index]


---------------------------------------------------------------

::

          Run a simple ping-pong test over InfiniBand via the unreliable
          connected (UC) transport.


-------------------------------------------------------

::

          -p, --port=PORT
                 use TCP port PORT for initial synchronization (default
                 18515)

          -d, --ib-dev=DEVICE
                 use IB device DEVICE (default first device found)

          -i, --ib-port=PORT
                 use IB port PORT (default port 1)

          -s, --size=SIZE
                 ping-pong messages of size SIZE (default 4096)

          -m, --mtu=SIZE
                 path MTU SIZE (default 1024)

          -r, --rx-depth=DEPTH
                 post DEPTH receives at a time (default 1000)

          -n, --iters=ITERS
                 perform ITERS message exchanges (default 1000)

          -l, --sl=SL
                 use SL as the service level value of the QP (default 0)

          -e, --events
                 sleep while waiting for work completion events (default is
                 to poll for completions)

          -g, --gid-idx=GIDINDEX
                 local port GIDINDEX

          -c, --chk
                 validate received buffer


---------------------------------------------------------

::

          ibv_rc_pingpong(1), ibv_ud_pingpong(1), ibv_srq_pingpong(1),
          ibv_xsrq_pingpong(1)


-------------------------------------------------------

::

          Roland Dreier
                 <rolandd@cisco.com>


-------------------------------------------------

::

          The network synchronization between client and server instances
          is weak, and does not prevent incompatible options from being
          used on the two instances.  The method used for retrieving work
          completions is not strictly correct, and race conditions may
          cause failures on some systems.

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

   libibverbs                   August 30, 2005          IBV_UC_PINGPONG(1)

--------------

Pages that refer to this page:
`ibv_rc_pingpong(1) <../man1/ibv_rc_pingpong.1.html>`__, 
`ibv_srq_pingpong(1) <../man1/ibv_srq_pingpong.1.html>`__, 
`ibv_ud_pingpong(1) <../man1/ibv_ud_pingpong.1.html>`__, 
`ibv_xsrq_pingpong(1) <../man1/ibv_xsrq_pingpong.1.html>`__

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
