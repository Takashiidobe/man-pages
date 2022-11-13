.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rdma-system(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RDMA-SYSTEM(8)                    Linux                   RDMA-SYSTEM(8)

NAME
-------------------------------------------------

::

          rdma-system - RDMA subsystem configuration


---------------------------------------------------------

::

          rdma [ OPTIONS ] sys  { COMMAND | help }

          OPTIONS := { -V[ersion] | -d[etails] }

          rdma system show

          rdma system set netns NEWMODE

          rdma system help


---------------------------------------------------------------

::

      rdma system set - set RDMA subsystem network namespace mode
      rdma system show - display RDMA subsystem network namespace mode
          NEWMODE - specifies the RDMA subsystem mode. Either exclusive or
          shared.  When user wants to assign dedicated RDMA device to a
          particular network namespace, exclusive mode should be set before
          creating any network namespace. If there are active network
          namespaces and if one or more RDMA devices exist, changing mode
          from shared to exclusive returns error code EBUSY.

          When RDMA subsystem is in shared mode, RDMA device is accessible
          in all network namespace. When RDMA device isolation among
          multiple network namespaces is not needed, shared mode can be
          used.

          It is preferred to not change the subsystem mode when there is
          active RDMA traffic running, even though it is supported.


---------------------------------------------------------

::

          rdma system show
              Shows the state of RDMA subsystem network namespace mode on
              the system.

          rdma system set netns exclusive
              Sets the RDMA subsystem in network namespace exclusive mode.
              In this mode RDMA devices are visible only in single network
              namespace.

          rdma system set netns shared
              Sets the RDMA subsystem in network namespace shared mode. In
              this mode RDMA devices are shared among network namespaces.


---------------------------------------------------------

::

          rdma(8), rdma-link(8), rdma-resource(8), network_namespaces(7),
          namespaces(7),


-----------------------------------------------------

::

          Parav Pandit <parav@mellanox.com>

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

   iproute2                       06 Jul 2017                RDMA-SYSTEM(8)

--------------

Pages that refer to this page: `rdma(8) <../man8/rdma.8.html>`__, 
`rdma-dev(8) <../man8/rdma-dev.8.html>`__

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
