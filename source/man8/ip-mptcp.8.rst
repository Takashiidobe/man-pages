.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ip-mptcp(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IP-MPTCP(8)                       Linux                      IP-MPTCP(8)

NAME
-------------------------------------------------

::

          ip-mptcp - MPTCP path manager configuration


---------------------------------------------------------

::

          ip [ OPTIONS ] mptcp { endpoint  | limits  | help  }

          ip mptcp endpoint add IFADDR [ port PORT ] [ dev IFNAME ] [ id ID
                  ] [ FLAG-LIST ]

          ip mptcp endpoint del id ID

          ip mptcp endpoint show [ id ID ]

          ip mptcp endpoint flush

          FLAG-LIST := [ FLAG-LIST ] FLAG

          FLAG := [ signal | subflow | backup ]

          ip mptcp limits set [ subflow SUBFLOW_NR ] [ add_addr_accepted
                  ADD_ADDR_ACCEPTED_NR ]

          ip mptcp limits show

          ip mptcp monitor


---------------------------------------------------------------

::

          MPTCP is a transport protocol built on top of TCP that allows TCP
          connections to use multiple paths to maximize resource usage and
          increase redundancy. The ip-mptcp sub-commands allow configuring
          several aspects of the MPTCP path manager, which is in charge of
          subflows creation:

          The endpoint object specifies the IP addresses that will be used
          and/or announced for additional subflows:

          ip mptcp endpoint add      add new MPTCP endpoint
          ip mptcp endpoint delete   delete existing MPTCP endpoint
          ip mptcp endpoint show     get existing MPTCP endpoint
          ip mptcp endpoint flush    flush all existing MPTCP endpoints

          PORT   When a port number is specified, incoming MPTCP subflows
                 for already established MPTCP sockets will be accepted on
                 the specified port, regardless the original listener port
                 accepting the first MPTCP subflow and/or this peer being
                 actually on the client side.

                 ID is a unique numeric identifier for the given endpoint

          signal the endpoint will be announced/signalled to each peer via
                 an ADD_ADDR MPTCP sub-option

          subflow
                 if additional subflow creation is allowed by MPTCP limits,
                 the endpoint will be used as the source address to create
                 an additional subflow after that the MPTCP connection is
                 established.

          backup the endpoint will be announced as a backup address, if
                 this is a signal endpoint, or the subflow will be created
                 as a backup one if this is a subflow endpoint

          The limits object specifies the constraints for subflow
          creations:

          ip mptcp limits show   get current MPTCP subflow creation limits
          ip mptcp limits set    change the MPTCP subflow creation limits

          SUBFLOW_NR
                 specifies the maximum number of additional subflows
                 allowed for each MPTCP connection. Additional subflows can
                 be created due to: incoming accepted ADD_ADDR option,
                 local subflow endpoints, additional subflows started by
                 the peer.

          ADD_ADDR_ACCEPTED_NR
                 specifies the maximum number of ADD_ADDR suboptions
                 accepted for each MPTCP connection. The MPTCP path manager
                 will try to create a new subflow for each accepted
                 ADD_ADDR option, respecting the SUBFLOW_NR limit.

          monitor displays creation and deletion of MPTCP connections as
          well as addition or removal of remote addresses and subflows.


-----------------------------------------------------

::

          Original Manpage by Paolo Abeni <pabeni@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the iproute2 (utilities for controlling
          TCP/IP networking and traffic) project.  Information about the
          project can be found at 
          ⟨http://www.linuxfoundation.org/collaborate/workgroups/networking/iproute2⟩.
          If you have a bug report for this manual page, send it to
          netdev@vger.kernel.org, shemminger@osdl.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/network/iproute2/iproute2.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-18.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   iproute2                       4 Apr 2020                    IP-MPTCP(8)

--------------

Pages that refer to this page: `ip(8) <../man8/ip.8.html>`__

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
