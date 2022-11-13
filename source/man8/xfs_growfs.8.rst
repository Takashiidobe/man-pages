.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfs_growfs(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| PRACTICAL USE <#PRACTICAL_USE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::


   xfs_growfs(8)            System Manager's Manual           xfs_growfs(8)

NAME
-------------------------------------------------

::

          xfs_growfs - expand an XFS filesystem


---------------------------------------------------------

::

          xfs_growfs [ -dilnrx ] [ -D size ] [ -e rtextsize ] [ -L size ] [
          -m maxpct ] [ -t mtab ] [ -R size ] [ mount-point | block-device
          ]

          xfs_growfs -V


---------------------------------------------------------------

::

          xfs_growfs expands an existing XFS filesystem (see xfs(5)).  The
          mount-point argument is the pathname of the directory where the
          filesystem is mounted. The block-device argument is the device
          name of a mounted XFS filesystem.  The filesystem must be mounted
          to be grown (see mount(8)).  The existing contents of the
          filesystem are undisturbed, and the added space becomes available
          for additional file storage.


-------------------------------------------------------

::

          -d | -D size
                 Specifies that the data section of the filesystem should
                 be resized. If the -D size option is given, the data
                 section is changed to that size, otherwise the data
                 section is grown to the largest size possible with the -d
                 option. The size is expressed in filesystem blocks. A
                 filesystem with only 1 AG cannot be shrunk further, and a
                 filesystem cannot be shrunk to the point where it would
                 only have 1 AG.

          -e     Allows the real-time extent size to be specified. In
                 mkfs.xfs(8) this is specified with -r extsize=nnnn.

          -i     The new log is an internal log (inside the data section).
                 [NOTE: This option is not implemented]

          -l | -L size
                 Specifies that the log section of the filesystem should be
                 grown, shrunk, or moved. If the -L size option is given,
                 the log section is changed to be that size, if possible.
                 The size is expressed in filesystem blocks.  The size of
                 an internal log must be smaller than the size of an
                 allocation group (this value is printed at mkfs(8) time).
                 If neither -i nor -x is given with -l, the log continues
                 to be internal or external as it was before.  [NOTE: These
                 options are not implemented]

          -m     Specify a new value for the maximum percentage of space in
                 the filesystem that can be allocated as inodes. In
                 mkfs.xfs(8) this is specified with -i maxpct=nn.

          -n     Specifies that no change to the filesystem is to be made.
                 The filesystem geometry is printed, and argument checking
                 is performed, but no growth occurs.  See output examples
                 below.

          -r | -R size
                 Specifies that the real-time section of the filesystem
                 should be grown. If the -R size option is given, the real-
                 time section is grown to that size, otherwise the real-
                 time section is grown to the largest size possible with
                 the -r option. The size is expressed in filesystem blocks.
                 The filesystem does not need to have contained a real-time
                 section before the xfs_growfs operation.

          -t     Specifies an alternate mount table file (default is
                 /proc/mounts if it exists, else /etc/mtab).  This is used
                 when working with filesystems mounted without writing to
                 /etc/mtab file - refer to mount(8) for further details.

          -V     Prints the version number and exits. The mount-point
                 argument is not required with -V.

          xfs_growfs is most often used in conjunction with logical volumes
          (see md(4) and lvm(8) on Linux).  However, it can also be used on
          a regular disk partition, for example if a partition has been
          enlarged while retaining the same starting block.


-------------------------------------------------------------------

::

          Filesystems normally occupy all of the space on the device where
          they reside. In order to grow a filesystem, it is necessary to
          provide added space for it to occupy. Therefore there must be at
          least one spare new disk partition available. Adding the space is
          often done through the use of a logical volume manager.


---------------------------------------------------------

::

          mkfs.xfs(8), xfs_info(8), md(4), lvm(8), mount(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the xfsprogs (utilities for XFS filesystems)
          project.  Information about the project can be found at 
          ⟨http://xfs.org/⟩.  If you have a bug report for this manual page,
          send it to linux-xfs@vger.kernel.org.  This page was obtained
          from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-20.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                              xfs_growfs(8)

--------------

Pages that refer to this page: `xfs(5) <../man5/xfs.5.html>`__, 
`fsadm(8) <../man8/fsadm.8.html>`__, 
`mkfs.xfs(8) <../man8/mkfs.xfs.8.html>`__, 
`xfs_admin(8) <../man8/xfs_admin.8.html>`__, 
`xfs_copy(8) <../man8/xfs_copy.8.html>`__

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
