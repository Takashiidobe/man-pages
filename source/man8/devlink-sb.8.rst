.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

devlink-sb(8) — Linux manual page
=================================

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

   DEVLINK-SB(8)                     Linux                    DEVLINK-SB(8)

NAME
-------------------------------------------------

::

          devlink-sb - devlink shared buffer configuration


---------------------------------------------------------

::

          devlink [ OPTIONS ] sb  { COMMAND | help }

          OPTIONS := { -V[ersion] | -n[no-nice-names] }

          devlink sb show [ DEV [ sb SB_INDEX ] ]

          devlink sb pool show [ DEV [ sb SB_INDEX ]
                  pool POOL_INDEX ]

          devlink sb pool set DEV [ sb SB_INDEX ]
                  pool POOL_INDEX
                  size POOL_SIZE
                  thtype { static | dynamic }

          devlink sb port pool show [ DEV/PORT_INDEX [ sb SB_INDEX ]
                  pool POOL_INDEX ]

          devlink sb port pool set DEV/PORT_INDEX [ sb SB_INDEX ]
                  pool POOL_INDEX
                  th THRESHOLD

          devlink sb tc bind show [ DEV/PORT_INDEX [ sb SB_INDEX ]
                  tc TC_INDEX
                  type { ingress | egress } ]

          devlink sb tc bind set DEV/PORT_INDEX [ sb SB_INDEX ]
                  tc TC_INDEX
                  type { ingress | egress }
                  pool POOL_INDEX
                  th THRESHOLD

          devlink sb occupancy show { DEV | DEV/PORT_INDEX } [ sb SB_INDEX
                  ]

          devlink sb occupancy snapshot DEV [ sb SB_INDEX ]

          devlink sb occupancy clearmax DEV [ sb SB_INDEX ]

          devlink sb help


---------------------------------------------------------------

::

      devlink sb show - display available shared buffers and their
          attributes
          DEV - specifies the devlink device to show shared buffers.  If
          this argument is omitted all shared buffers of all devices are
          listed.

          SB_INDEX - specifies the shared buffer.  If this argument is
          omitted shared buffer with index 0 is selected.  Behaviour of
          this argument it the same for every command.

      devlink sb pool show - display available pools and their attributes
          DEV - specifies the devlink device to show pools.  If this
          argument is omitted all pools of all devices are listed.

          Display available pools listing their type, size, thtype and
          cell_size. cell_size is the allocation granularity of memory
          within the shared buffer. Drivers may round up, round down or
          reject size passed to the set command if it is not multiple of
          cell_size.

      devlink sb pool set - set attributes of pool
          DEV - specifies the devlink device to set pool.

          size POOL_SIZE
                 size of the pool in Bytes.

          thtype { static | dynamic }
                 pool threshold type.

                 static - Threshold values for the pool will be passed in
                 Bytes.

                 dynamic - Threshold values ("to_alpha") for the pool will
                 be used to compute alpha parameter according to formula:
                                 alpha = 2 ^ (to_alpha - 10)

                           The range of the passed value is between 0 to
                           20. The computed alpha is used to determine the
                           maximum usage of the flow:
                                 max_usage = alpha / (1 + alpha) *
                                 Free_Buffer

      devlink sb port pool show - display port-pool combinations and
          threshold for each
          DEV/PORT_INDEX - specifies the devlink port.

          pool POOL_INDEX
                 pool index.

      devlink sb port pool set - set port-pool threshold
          DEV/PORT_INDEX - specifies the devlink port.

          pool POOL_INDEX
                 pool index.

          th THRESHOLD
                 threshold value. Type of the value is either Bytes or
                 "to_alpha", depends on thtype set for the pool.

      devlink sb tc bind show - display port-TC to pool bindings and
          threshold for each
          DEV/PORT_INDEX - specifies the devlink port.

          tc TC_INDEX
                 index of either ingress or egress TC, usually in range 0
                 to 8 (depends on device).

          type { ingress | egress }
                 TC type.

      devlink sb tc bind set - set port-TC to pool binding with specified
          threshold
          DEV/PORT_INDEX - specifies the devlink port.

          tc TC_INDEX
                 index of either ingress or egress TC, usually in range 0
                 to 8 (depends on device).

          type { ingress | egress }
                 TC type.

          pool POOL_INDEX
                 index of pool to bind this to.

          th THRESHOLD
                 threshold value. Type of the value is either Bytes or
                 "to_alpha", depends on thtype set for the pool.

      devlink sb occupancy show - display shared buffer occupancy values
          for device or port
          This command is used to browse shared buffer occupancy values.
          Values are showed for every port-pool combination as well as for
          all port-TC combinations (with pool this port-TC is bound to).
          Format of value is:
                          current_value/max_value
          Note that before showing values, one has to issue occupancy
          snapshot command first.

          DEV - specifies the devlink device to show occupancy values for.

          DEV/PORT_INDEX - specifies the devlink port to show occupancy
          values for.

      devlink sb occupancy snapshot - take occupancy snapshot of shared
          buffer for device
          This command is used to take a snapshot of shared buffer
          occupancy values. After that, the values can be showed using
          occupancy show command.

          DEV - specifies the devlink device to take occupancy snapshot on.

      devlink sb occupancy clearmax - clear occupancy watermarks of shared
          buffer for device
          This command is used to reset maximal occupancy values reached
          for whole device. Note that before browsing reset values, one has
          to issue occupancy snapshot command.

          DEV - specifies the devlink device to clear occupancy watermarks
          on.


---------------------------------------------------------

::

          devlink sb show
              List available share buffers.

          devlink sb pool show
              List available pools and their config.

          devlink sb port pool show pci/0000:03:00.0/1 pool 0
              Show port-pool setup for specified port and pool.

          sudo devlink sb port pool set pci/0000:03:00.0/1 pool 0 th 15
              Change threshold for port specified port and pool.

          devlink sb tc bind show pci/0000:03:00.0/1 tc 0 type ingress
              Show pool binding and threshold for specified port and TC.

          sudo devlink sb tc bind set pci/0000:03:00.0/1 tc 0 type ingress
          pool 0 th 9
              Set pool binding and threshold for specified port and TC.

          sudo devlink sb occupancy snapshot pci/0000:03:00.0
              Make a snapshot of occupancy of shared buffer for specified
              devlink device.

          devlink sb occupancy show pci/0000:03:00.0/1
              Show occupancy for specified port from the snapshot.

          sudo devlink sb occupancy clearmax pci/0000:03:00.0
              Clear watermarks for shared buffer of specified devlink
              device.


---------------------------------------------------------

::

          devlink(8), devlink-dev(8), devlink-port(8), devlink-monitor(8),


-----------------------------------------------------

::

          Jiri Pirko <jiri@mellanox.com>

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

   iproute2                       14 Apr 2016                 DEVLINK-SB(8)

--------------

Pages that refer to this page: `devlink(8) <../man8/devlink.8.html>`__, 
`devlink-dev(8) <../man8/devlink-dev.8.html>`__, 
`devlink-monitor(8) <../man8/devlink-monitor.8.html>`__, 
`devlink-port(8) <../man8/devlink-port.8.html>`__, 
`devlink-resource(8) <../man8/devlink-resource.8.html>`__

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
