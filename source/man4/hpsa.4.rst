.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

hpsa(4) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HPSA(4)                 Linux Programmer's Manual                HPSA(4)

NAME
-------------------------------------------------

::

          hpsa - HP Smart Array SCSI driver


---------------------------------------------------------

::

          modprobe hpsa [ hpsa_allow_any=1 ]


---------------------------------------------------------------

::

          hpsa is a SCSI driver for HP Smart Array RAID controllers.

      Options
          hpsa_allow_any=1: This option allows the driver to attempt to
          operate on any HP Smart Array hardware RAID controller, even if
          it is not explicitly known to the driver.  This allows newer
          hardware to work with older drivers.  Typically this is used to
          allow installation of operating systems from media that predates
          the RAID controller, though it may also be used to enable hpsa to
          drive older controllers that would normally be handled by the
          cciss(4) driver.  These older boards have not been tested and are
          not supported with hpsa, and cciss(4) should still be used for
          these.

      Supported hardware
          The hpsa driver supports the following Smart Array boards:

              Smart Array P700M
              Smart Array P212
              Smart Array P410
              Smart Array P410i
              Smart Array P411
              Smart Array P812
              Smart Array P712m
              Smart Array P711m
              StorageWorks P1210m

          Since Linux 4.14, the following Smart Array boards are also
          supported:

              Smart Array 5300
              Smart Array 5312
              Smart Array 532
              Smart Array 5i
              Smart Array 6400
              Smart Array 6400 EM
              Smart Array 641
              Smart Array 642
              Smart Array 6i
              Smart Array E200
              Smart Array E200i
              Smart Array E200i
              Smart Array E200i
              Smart Array E200i
              Smart Array E500
              Smart Array P400
              Smart Array P400i
              Smart Array P600
              Smart Array P700m
              Smart Array P800

      Configuration details
          To configure HP Smart Array controllers, use the HP Array
          Configuration Utility (either hpacuxe(8) or hpacucli(8)) or the
          Offline ROM-based Configuration Utility (ORCA) run from the Smart
          Array's option ROM at boot time.


---------------------------------------------------

::

      Device nodes
          Logical drives are accessed via the SCSI disk driver (sd(4)),
          tape drives via the SCSI tape driver (st(4)), and the RAID
          controller via the SCSI generic driver (sg(4)), with device nodes
          named /dev/sd*, /dev/st*, and /dev/sg*, respectively.

      HPSA-specific host attribute files in /sys
          /sys/class/scsi_host/host*/rescan
                 This is a write-only attribute.  Writing to this attribute
                 will cause the driver to scan for new, changed, or removed
                 devices (e.g., hot-plugged tape drives, or newly
                 configured or deleted logical drives, etc.)  and notify
                 the SCSI midlayer of any changes detected.  Normally a
                 rescan is triggered automatically by HP's Array
                 Configuration Utility (either the GUI or the command-line
                 variety); thus, for logical drive changes, the user should
                 not normally have to use this attribute.  This attribute
                 may be useful when hot plugging devices like tape drives,
                 or entire storage boxes containing preconfigured logical
                 drives.

          /sys/class/scsi_host/host*/firmware_revision
                 This attribute contains the firmware version of the Smart
                 Array.

                 For example:

                     # cd /sys/class/scsi_host/host4
                     # cat firmware_revision
                     7.14

      HPSA-specific disk attribute files in /sys
          /sys/class/scsi_disk/c:b:t:l/device/unique_id
                 This attribute contains a 32 hex-digit unique ID for each
                 logical drive.

                 For example:

                     # cd /sys/class/scsi_disk/4:0:0:0/device
                     # cat unique_id
                     600508B1001044395355323037570F77

          /sys/class/scsi_disk/c:b:t:l/device/raid_level
                 This attribute contains the RAID level of each logical
                 drive.

                 For example:

                     # cd /sys/class/scsi_disk/4:0:0:0/device
                     # cat raid_level
                     RAID 0

          /sys/class/scsi_disk/c:b:t:l/device/lunid
                 This attribute contains the 16 hex-digit (8 byte) LUN ID
                 by which a logical drive or physical device can be
                 addressed.  c:b:t:l are the controller, bus, target, and
                 lun of the device.

          For example:

                     # cd /sys/class/scsi_disk/4:0:0:0/device
                     # cat lunid
                     0x0000004000000000

      Supported ioctl() operations
          For compatibility with applications written for the cciss(4)
          driver, many, but not all of the ioctls supported by the cciss(4)
          driver are also supported by the hpsa driver.  The data
          structures used by these ioctls are described in the Linux kernel
          source file include/linux/cciss_ioctl.h.

          CCISS_DEREGDISK, CCISS_REGNEWDISK, CCISS_REGNEWD
                 These three ioctls all do exactly the same thing, which is
                 to cause the driver to rescan for new devices.  This does
                 exactly the same thing as writing to the hpsa-specific
                 host "rescan" attribute.

          CCISS_GETPCIINFO
                 Returns PCI domain, bus, device, and function and "board
                 ID" (PCI subsystem ID).

          CCISS_GETDRIVVER
                 Returns driver version in three bytes encoded as:

                     (major_version << 16) | (minor_version << 8) |
                         (subminor_version)

          CCISS_PASSTHRU, CCISS_BIG_PASSTHRU
                 Allows "BMIC" and "CISS" commands to be passed through to
                 the Smart Array.  These are used extensively by the HP
                 Array Configuration Utility, SNMP storage agents, and so
                 on.  See cciss_vol_status at ⟨http://cciss.sf.net⟩ for
                 some examples.


---------------------------------------------------------

::

          cciss(4), sd(4), st(4), cciss_vol_status(8), hpacucli(8),
          hpacuxe(8),

          ⟨http://cciss.sf.net⟩, and Documentation/scsi/hpsa.txt and
          Documentation/ABI/testing/sysfs-bus-pci-devices-cciss in the
          Linux kernel source tree

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        HPSA(4)

--------------

Pages that refer to this page: `cciss(4) <../man4/cciss.4.html>`__, 
`smartpqi(4) <../man4/smartpqi.4.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__

--------------

`Copyright and license for this manual
page <../man4/hpsa.4.license.html>`__

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
