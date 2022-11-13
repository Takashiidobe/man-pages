.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

devlink-region(8) — Linux manual page
=====================================

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

   DEVLINK-REGION(8)                 Linux                DEVLINK-REGION(8)

NAME
-------------------------------------------------

::

          devlink-region - devlink address region access


---------------------------------------------------------

::

          devlink [ OPTIONS ] region  { COMMAND | help }

          OPTIONS := { -V[ersion] | -n[no-nice-names] }

          devlink region show [ DEV/REGION ]

          devlink region del DEV/REGION snapshot SNAPSHOT_ID

          devlink region dump DEV/REGION snapshot SNAPSHOT_ID

          devlink region read DEV/REGION [ snapshot SNAPSHOT_ID ] address
                  ADDRESS length LENGTH

          devlink region help


---------------------------------------------------------------

::

      devlink region show - Show all supported address regions names,
          snapshots and sizes
          DEV/REGION - specifies the devlink device and address-region to
          query.

      devlink region del - Delete a snapshot specified by address-region
          name and snapshot ID
          DEV/REGION - specifies the devlink device and address-region to
          delete the snapshot from

          snapshot SNAPSHOT_ID - specifies the snapshot ID to delete

      devlink region dump - Dump all the available data from a region or
          from snapshot of a region
          DEV/REGION - specifies the device and address-region to dump
          from.

          snapshot SNAPSHOT_ID - specifies the snapshot-id of the region to
          dump.

      devlink region read - Read from a specific region address for a given
          length
          DEV/REGION - specifies the device and address-region to read
          from.

          snapshot SNAPSHOT_ID - specifies the snapshot-id of the region to
          read.

          address ADDRESS - specifies the address to read from.

          length LENGTH - specifies the length of data to read.


---------------------------------------------------------

::

          devlink region show
              List available address regions and snapshot.

          devlink region del pci/0000:00:05.0/cr-space snapshot 1
              Delete snapshot id 1 from cr-space address region from device
              pci/0000:00:05.0.

          devlink region dump pci/0000:00:05.0/cr-space snapshot 1
              Dump the snapshot taken from cr-space address region with ID
              1

          devlink region read pci/0000:00:05.0/cr-space snapshot 1 address
          0x10 legth 16
              Read from address 0x10, 16 Bytes of snapshot ID 1 taken from
              cr-space address region


---------------------------------------------------------

::

          devlink(8), devlink-dev(8), devlink-port(8), devlink-monitor(8),


-----------------------------------------------------

::

          Alex Vesker <valex@mellanox.com>

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

   iproute2                       10 Jan 2018             DEVLINK-REGION(8)

--------------

Pages that refer to this page: `devlink(8) <../man8/devlink.8.html>`__, 
`devlink-health(8) <../man8/devlink-health.8.html>`__

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
