.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

smartpqi(4) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SMARTPQI(4)             Linux Programmer's Manual            SMARTPQI(4)

NAME
-------------------------------------------------

::

          smartpqi - Microsemi Smart Family SCSI driver


---------------------------------------------------------

::

          modprobe smartpqi [disable_device_id_wildcards={0|1}]
                            [disable_heartbeat={0|1}]
                            [disable_ctrl_shutdown={0|1}]
                            [lockup_action={none|reboot|panic}]
                            [expose_ld_first={0|1}] [hide_vsep={0|1}]


---------------------------------------------------------------

::

          smartpqi is a SCSI driver for Microsemi Smart Family controllers.

      Supported ioctl() operations
          For compatibility with applications written for the cciss(4) and
          hpsa(4) drivers, many, but not all of the ioctl(2) operations
          supported by the hpsa driver are also supported by the smartpqi
          driver.  The data structures used by these operations are
          described in the Linux kernel source file
          include/linux/cciss_ioctl.h.

          CCISS_DEREGDISK, CCISS_REGNEWDISK, CCISS_REGNEWD
                 These operations all do exactly the same thing, which is
                 to cause the driver to re-scan for new devices.  This does
                 exactly the same thing as writing to the smartpqi-specific
                 host rescan attribute.

          CCISS_GETPCIINFO
                 This operation returns the PCI domain, bus, device, and
                 function and "board ID" (PCI subsystem ID).

          CCISS_GETDRIVVER
                 This operation returns the driver version in four bytes,
                 encoded as:

                     (major_version << 28) | (minor_version << 24) |
                             (release << 16) | revision

          CCISS_PASSTHRU
                 Allows BMIC and CISS commands to be passed through to the
                 controller.

      Boot options
          disable_device_id_wildcards={0|1}
                 Disables support for device ID wildcards.  The default
                 value is 0.

          disable_heartbeat={0|1}
                 Disables support for the controller's heartbeat check.
                 This parameter is used for debugging purposes.  The
                 default value is 0, leaving the controller's heartbeat
                 check active.

          disable_ctrl_shutdown={0|1}
                 Disables support for shutting down the controller in the
                 event of a controller lockup.  The default value is 0.

          lockup_action={none|reboot|panic}
                 Specifies the action the driver takes when a controller
                 lockup is detected.  The default action is none.

                 parameter   action
                 ─────────────────────────────────────────────
                 none        take controller offline only
                 reboot      reboot the system
                 panic       panic the system

          expose_ld_first={0|1}
                 This option enables support for exposing logical devices
                 to the operating system before physical devices.  The
                 default value is 0.

          hide_vsep={0|1}
                 This option enables disabling exposure of the virtual SEP
                 to the host.  This is usually associated with direct
                 attached drives.  The default value is 0.


---------------------------------------------------

::

      Device nodes
          Logical drives are accessed via the SCSI disk driver (sd), tape
          drives via the SCSI tape driver (st), and the RAID controller via
          the SCSI generic driver (sg), with device nodes named /dev/sd*,
          /dev/st*, and /dev/sg*, respectively.

      [1mSmartPQI-specific host attribute files in /sys
          /sys/class/scsi_host/host*/rescan
                 The host rescan attribute is a write-only attribute.
                 Writing to this attribute will cause the driver to scan
                 for new, changed, or removed devices (e.g., hot-plugged
                 tape drives, or newly configured or deleted logical
                 drives) and notify the SCSI mid-layer of any changes
                 detected.  Usually this action is triggered automatically
                 by configuration changes, so the user should not normally
                 have to write to this file.  Doing so may be useful when
                 hot-plugging devices such as tape drives or entire storage
                 boxes containing pre-configured logical drives.

          /sys/class/scsi_host/host*/version
                 The host version attribute is a read-only attribute.  This
                 attribute contains the driver version and the controller
                 firmware version.

                 For example:

                     $ cat /sys/class/scsi_host/host1/version
                     driver: 1.1.2-126
                     firmware: 1.29-112

          /sys/class/scsi_host/host*/lockup_action
                 The host lockup_action attribute is a read/write
                 attribute.  This attribute will cause the driver to
                 perform a specific action in the unlikely event that a
                 controller lockup has been detected.  See OPTIONS above
                 for an explanation of the lockup_action values.

          /sys/class/scsi_host/host*/driver_version
                 The driver_version attribute is read-only.  This attribute
                 contains the smartpqi driver version.

                 For example:

                     $ cat /sys/class/scsi_host/host1/driver_version
                     1.1.2-126

          /sys/class/scsi_host/host*/firmware_version
                 The firmware_version attribute is read-only.  This
                 attribute contains the controller firmware version.

                 For example:

                     $ cat /sys/class/scsi_host/host1/firmware_version
                     1.29-112

          /sys/class/scsi_host/host*/model
                 The model attribute is read-only.  This attribute contains
                 the product identification string of the controller.

                 For example:

                     $ cat /sys/class/scsi_host/host1/model
                     1100-16i

          /sys/class/scsi_host/host*/serial_number
                 The serial_number attribute is read-only.  This attribute
                 contains the unique identification number of the
                 controller.

                 For example:

                     $ cat /sys/class/scsi_host/host1/serial_number
                     6A316373777

          /sys/class/scsi_host/host*/vendor
                 The vendor attribute is read-only.  This attribute
                 contains the vendor identification string of the
                 controller.

                 For example:

                     $ cat /sys/class/scsi_host/host1/vendor
                     Adaptec

      [1mSmartPQI-specific disk attribute files in /sys
          In the file specifications below, c stands for the number of the
          appropriate SCSI controller, b is the bus number, t the target
          number, and l is the logical unit number (LUN).

          /sys/class/scsi_disk/c:b:t:l/device/raid_level
                 The raid_level attribute is read-only.  This attribute
                 contains the RAID level of each logical drive.

                 For example:

                     $ cat /sys/class/scsi_disk/4:0:0:0/device/raid_level
                     RAID 0

          /sys/class/scsi_disk/c:b:t:l/device/sas_address
                 The sas_address attribute is read-only.  This attribute
                 contains the unique identifier of the disk.

                 For example:

                     $ cat /sys/class/scsi_disk/1:0:3:0/device/sas_address
                     0x5001173d028543a2

          /sys/class/scsi_disk/c:b:t:l/device/ssd_smart_path_enabled
                 The ssd_smart_path_enabled attribute is read-only.  This
                 attribute is for ioaccel-enabled volumes.  (Ioaccel is an
                 alternative driver submission path that allows the driver
                 to send I/O requests directly to backend SCSI devices,
                 bypassing the controller firmware.  This results in an
                 increase in performance.  This method is used for HBA
                 disks and for logical volumes comprised of SSDs.)
                 Contains 1 if ioaccel is enabled for the volume and 0
                 otherwise.

                 For example:

                     $ cat /sys/class/scsi_disk/1:0:3:0/device/ssd_smart_path_enabled
                     0


---------------------------------------------------------

::

          The smartpqi driver was added in Linux 4.9.


---------------------------------------------------

::

      Configuration
          To configure a Microsemi Smart Family controller, refer to the
          User Guide for the controller, which can be found by searching
          for the specific controller at ⟨https://storage.microsemi.com/⟩.


---------------------------------------------------------

::

          cciss(4), hpsa(4), sd(4), st(4)

          Documentation/ABI/testing/sysfs-bus-pci-devices-cciss in the
          Linux kernel source tree.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    SMARTPQI(4)

--------------

`Copyright and license for this manual
page <../man4/smartpqi.4.license.html>`__

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
