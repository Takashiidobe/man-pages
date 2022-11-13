.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sd(4) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SD(4)                   Linux Programmer's Manual                  SD(4)

NAME
-------------------------------------------------

::

          sd - driver for SCSI disk drives


---------------------------------------------------------

::

          #include <linux/hdreg.h>        /* for HDIO_GETGEO */
          #include <linux/fs.h>           /* for BLKGETSIZE and BLKRRPART */


-------------------------------------------------------------------

::

          The block device name has the following form: sdlp, where l is a
          letter denoting the physical drive, and p is a number denoting
          the partition on that physical drive.  Often, the partition
          number, p, will be left off when the device corresponds to the
          whole drive.

          SCSI disks have a major device number of 8, and a minor device
          number of the form (16 * drive_number) + partition_number, where
          drive_number is the number of the physical drive in order of
          detection, and partition_number is as follows:

          +3     partition 0 is the whole drive

                 partitions 1–4 are the DOS "primary" partitions

                 partitions 5–8 are the DOS "extended" (or "logical")
                 partitions

          For example, /dev/sda will have major 8, minor 0, and will refer
          to all of the first SCSI drive in the system; and /dev/sdb3 will
          have major 8, minor 19, and will refer to the third DOS "primary"
          partition on the second SCSI drive in the system.

          At this time, only block devices are provided.  Raw devices have
          not yet been implemented.


---------------------------------------------------------------

::

          The following ioctls are provided:

          HDIO_GETGEO
                 Returns the BIOS disk parameters in the following
                 structure:

              struct hd_geometry {
                  unsigned char  heads;
                  unsigned char  sectors;
                  unsigned short cylinders;
                  unsigned long  start;
              };

                 A pointer to this structure is passed as the ioctl(2)
                 parameter.

                 The information returned in the parameter is the disk
                 geometry of the drive as understood by DOS!  This geometry
                 is not the physical geometry of the drive.  It is used
                 when constructing the drive's partition table, however,
                 and is needed for convenient operation of fdisk(1),
                 efdisk(1), and lilo(1).  If the geometry information is
                 not available, zero will be returned for all of the
                 parameters.

          BLKGETSIZE
                 Returns the device size in sectors.  The ioctl(2)
                 parameter should be a pointer to a long.

          BLKRRPART
                 Forces a reread of the SCSI disk partition tables.  No
                 parameter is needed.

                 The SCSI ioctl(2) operations are also supported.  If the
                 ioctl(2) parameter is required, and it is NULL, then
                 ioctl(2) fails with the error EINVAL.


---------------------------------------------------

::

          /dev/sd[a-h]
                 the whole device

          /dev/sd[a-h][0-8]
                 individual block partitions

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2017-09-15                          SD(4)

--------------

Pages that refer to this page: `ioctl(2) <../man2/ioctl.2.html>`__, 
`ioctl_console(2) <../man2/ioctl_console.2.html>`__, 
`hd(4) <../man4/hd.4.html>`__,  `hpsa(4) <../man4/hpsa.4.html>`__, 
`smartpqi(4) <../man4/smartpqi.4.html>`__

--------------

`Copyright and license for this manual
page <../man4/sd.4.license.html>`__

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
