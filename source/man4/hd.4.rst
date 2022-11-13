.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

hd(4) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HD(4)                   Linux Programmer's Manual                  HD(4)

NAME
-------------------------------------------------

::

          hd - MFM/IDE hard disk devices


---------------------------------------------------------------

::

          The hd* devices are block devices to access MFM/IDE hard disk
          drives in raw mode.  The master drive on the primary IDE
          controller (major device number 3) is hda; the slave drive is
          hdb.  The master drive of the second controller (major device
          number 22) is hdc and the slave is hdd.

          General IDE block device names have the form hdX, or hdXP, where
          X is a letter denoting the physical drive, and P is a number
          denoting the partition on that physical drive.  The first form,
          hdX, is used to address the whole drive.  Partition numbers are
          assigned in the order the partitions are discovered, and only
          nonempty, nonextended partitions get a number.  However,
          partition numbers 1–4 are given to the four partitions described
          in the MBR (the "primary" partitions), regardless of whether they
          are unused or extended.  Thus, the first logical partition will
          be hdX5.  Both DOS-type partitioning and BSD-disklabel
          partitioning are supported.  You can have at most 63 partitions
          on an IDE disk.

          For example, /dev/hda refers to all of the first IDE drive in the
          system; and /dev/hdb3 refers to the third DOS "primary" partition
          on the second one.

          They are typically created by:

              mknod -m 660 /dev/hda b 3 0
              mknod -m 660 /dev/hda1 b 3 1
              mknod -m 660 /dev/hda2 b 3 2
              ...
              mknod -m 660 /dev/hda8 b 3 8
              mknod -m 660 /dev/hdb b 3 64
              mknod -m 660 /dev/hdb1 b 3 65
              mknod -m 660 /dev/hdb2 b 3 66
              ...
              mknod -m 660 /dev/hdb8 b 3 72
              chown root:disk /dev/hd*


---------------------------------------------------

::

          /dev/hd*


---------------------------------------------------------

::

          chown(1), mknod(1), sd(4), mount(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2017-09-15                          HD(4)

--------------

`Copyright and license for this manual
page <../man4/hd.4.license.html>`__

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
