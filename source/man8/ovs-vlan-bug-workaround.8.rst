.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ovs-vlan-bug-workaround(8) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DR                               |                                   |
| IVER DETAILS <#DRIVER_DETAILS>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ovs-vlan-bug-workaround(8) Open vSwitch Manualovs-vlan-bug-workaround(8)

NAME
-------------------------------------------------

::

          ovs-vlan-bug-workaround - utility for configuring Linux VLAN
          driver bug workaround


---------------------------------------------------------

::

          ovs-vlan-bug-workaround netdev on
          ovs-vlan-bug-workaround netdev off
          ovs-vlan-bug-workaround --help
          ovs-vlan-bug-workaround --version


---------------------------------------------------------------

::

          Some Linux network drivers support a feature called ``VLAN
          acceleration''.  VLAN acceleration is associated with a data
          structure called a vlan_group that is, abstractly, a dictionary
          that maps from a VLAN ID (in the range 0 to 4095) to a VLAN
          device, that is, a Linux network device associated with a
          particular VLAN, e.g. eth0.9 for VLAN 9 on eth0.

          Some drivers that support VLAN acceleration have bugs that fall
          roughly into the categories listed below.  ovs-vlan-test(8) can
          test for these driver bugs.

          •      When NICs use VLAN stripping on receive they must pass a
                 pointer to a vlan_group when reporting the stripped tag to
                 the networking core.  If no vlan_group is in use then some
                 drivers just drop the extracted tag.  Drivers are supposed
                 to only enable stripping if a vlan_group is registered but
                 not all of them do that.

          •      On receive, some drivers handle priority tagged packets
                 specially and don't pass the tag onto the network stack at
                 all, so Open vSwitch never has a chance to see it.

          •      Some drivers size their receive buffers based on whether a
                 vlan_group is enabled, meaning that a maximum size packet
                 with a VLAN tag will not fit if no vlan_group is
                 configured.

          •      On transmit, some drivers expect that VLAN acceleration
                 will be used if it is available, which can only be done if
                 a vlan_group is configured.  In these cases, the driver
                 may fail to parse the packet and correctly setup checksum
                 offloading or TSO.

          The correct long term solution is to fix these driver bugs.

          For now, ovs-vlan-bug-workaround can enable a special-purpose
          workaround for devices with buggy VLAN acceleration.  A kernel
          patch must be applied for this workaround to work.

          Use the command ovs-vlan-bug-workaround netdev on to enable the
          VLAN driver bug workaround for network device netdev.  Use the
          command ovs-vlan-bug-workaround netdev off to disable the VLAN
          driver bug workaround for network device netdev.


---------------------------------------------------------------------

::

          The following drivers in Linux version
          2.6.32.12-0.7.1.xs1.0.0.311.170586 implement VLAN acceleration
          and are relevant to Open vSwitch on XenServer.  We have not
          tested any version of most of these drivers, so we do not know
          whether they have a VLAN problem that needs to be fixed.  The
          drivers are listed by the name that they report in, e.g., ethtool
          -i output; in a few cases this differs slightly from the name of
          the module's .ko file:
          8139cp    acenic    amd8111e  atl1c     ATL1E     atl1
          atl2      be2net    bna       bnx2      bnx2x     cnic
          cxgb      cxgb3     e1000     e1000e    enic      forcedeth
          igb       igbvf     ixgb      ixgbe     jme       ml4x_core
          ns83820   qlge      r8169     S2IO      sky2      starfire
          tehuti    tg3       typhoon   via-velocity        vxge

          The following drivers use vlan_group but are irrelevant to Open
          vSwitch on XenServer:

          bonding
                 Not used with Open vSwitch on XenServer.

          gianfar
                 Not shipped with XenServer.  A FreeScale CPU-integrated
                 device.

          ehea   Cannot be built on x86.  IBM Power architecture only.

          stmmac Cannot be built on x86.  SH4 architecture only.

          vmxnet3
                 Not shipped with XenServer.  For use inside VMware VMs
                 only.


-------------------------------------------------------

::

          -h
          --help Prints a brief help message to the console.

          -V
          --version
                 Prints version information to the console.


-------------------------------------------------

::

          Obviously.


---------------------------------------------------------

::

          ovs-vlan-test(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the Open vSwitch (a distributed virtual
          multilayer switch) project.  Information about the project can be
          found at ⟨http://openvswitch.org/⟩.  If you have a bug report for
          this manual page, send it to bugs@openvswitch.org.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/openvswitch/ovs.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-20.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Open vSwitch                     2.11.90      ovs-vlan-bug-workaround(8)

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
