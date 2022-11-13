.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ioctl_xfs_fsgeometry(2) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILESYSTEM FEATURE FLA           |                                   |
| GS <#FILESYSTEM_FEATURE_FLAGS>`__ |                                   |
| \|                                |                                   |
| `XFS METADATA HEALTH REPORTING <# |                                   |
| XFS_METADATA_HEALTH_REPORTING>`__ |                                   |
| \|                                |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IOCTL-XFS-FSGEOMETRY(2)    System Calls Manual   IOCTL-XFS-FSGEOMETRY(2)

NAME
-------------------------------------------------

::

          ioctl_xfs_fsgeometry - report XFS filesystem layout and features


---------------------------------------------------------

::

          #include <xfs/xfs_fs.h>

          int ioctl(int fd, XFS_IOC_FSGEOMETRY, struct xfs_fsop_geom *arg);
          int ioctl(int fd, XFS_IOC_FSGEOMETRY_V4, struct xfs_fsop_geom_v4
          *arg);
          int ioctl(int fd, XFS_IOC_FSGEOMETRY_V1, struct xfs_fsop_geom_v1
          *arg);


---------------------------------------------------------------

::

          Report the details of an XFS filesystem layout, features, and
          other descriptive items.  This information is conveyed in a
          structure of the following form:

              struct xfs_fsop_geom {
                   __u32         blocksize;
                   __u32         rtextsize;
                   __u32         agblocks;
                   __u32         agcount;
                   __u32         logblocks;
                   __u32         sectsize;
                   __u32         inodesize;
                   __u32         imaxpct;
                   __u64         datablocks;
                   __u64         rtblocks;
                   __u64         rtextents;
                   __u64         logstart;
                   unsigned char uuid[16];
                   __u32         sunit;
                   __u32         swidth;
                   __s32         version;
                   __u32         flags;
                   __u32         logsectsize;
                   __u32         rtsectsize;
                   __u32         dirblocksize;
                   /* struct xfs_fsop_geom_v1 stops here. */

                   __u32         logsunit;
                   /* struct xfs_fsop_geom_v4 stops here. */

                   __u32         sick;
                   __u32         checked;
                   __u64         reserved[17];
              };

          blocksize is the size of a fundamental filesystem block, in
          bytes.

          rtextsize is the size of an extent on the realtime volume, in
          bytes.

          agblocks is the size of an allocation group, in units of
          filesystem blocks.

          agcount is the number of allocation groups in the filesystem.

          logblocks is the size of the log, in units of filesystem blocks.

          sectsize is the smallest amount of data that can be written to
          the data device atomically, in bytes.

          inodesize is the size of an inode record, in bytes.

          imaxpct is the maximum percentage of the filesystem that can be
          allocated to inode record blocks.

          datablocks is the size of the data device, in units of filesystem
          blocks.

          rtblocks is the size of the realtime device, in units of
          filesystem blocks.

          rtextents is the number of extents that can be allocated on the
          realtime device.

          logstart is the start of the log, in units of filesystem blocks.
          If the filesystem has an external log, this will be zero.

          uuid is the universal unique identifier of the filesystem.

          sunit is what the filesystem has been told is the size of a RAID
          stripe unit on the underlying data device, in filesystem blocks.

          swidth is what the filesystem has been told is the width of a
          RAID stripe on the underlying data device, in units of RAID
          stripe units.

          version is the version of this structure.  This value will be
          XFS_FSOP_GEOM_VERSION.

          flags tell us what features are enabled on the filesystem.  Refer
          to the section FILESYSTEM FEATURE FLAGS below for more
          information about each feature.

          logsectsize is the smallest amount of data that can be written to
          the log device atomically, in bytes.

          rtsectsize is the smallest amount of data that can be written to
          the realtime device atomically, in bytes.

          dirblocksize is the size of directory blocks, in bytes.

          logsunit is what the filesystem has been told is the size of a
          RAID stripe unit on the underlying log device, in filesystem
          blocks.  This field is meaningful only if the flag
          XFS_FSOP_GEOM_FLAGS_LOGV2 is set.

          The fields sick and checked indicate the relative health of
          various whole-filesystem metadata.  Please see the section XFS
          METADATA HEALTH REPORTING for more details.

          reserved is set to zero.


-----------------------------------------------------------------------------------------

::

          Filesystem features are reported to userspace as a combination
          the following flags:

          XFS_FSOP_GEOM_FLAGS_ATTR
                 Extended attributes are present.

          XFS_FSOP_GEOM_FLAGS_NLINK
                 Files on this filesystem support up to 2^32 hard links.
                 If this flag is not set, files on this filesystem support
                 only up to 2^16 hard links.

          XFS_FSOP_GEOM_FLAGS_QUOTA
                 Quotas are enabled.

          XFS_FSOP_GEOM_FLAGS_IALIGN
                 Inodes are aligned for better performance.

          XFS_FSOP_GEOM_FLAGS_DALIGN
                 Filesystem tries to align data block allocations to RAID
                 stripe units for better performance.

          XFS_FSOP_GEOM_FLAGS_SHARED
                 Unused.

          XFS_FSOP_GEOM_FLAGS_EXTFLG
                 Filesystem supports unwritten extents.

          XFS_FSOP_GEOM_FLAGS_DIRV2
                 Directories are in version 2 format and maintain free
                 space data for better performance.  Version 1 format
                 directories are no longer supported.

          XFS_FSOP_GEOM_FLAGS_LOGV2
                 Log uses the V2 format.

          XFS_FSOP_GEOM_FLAGS_SECTOR
                 The log device has a sector size larger than 512 bytes.

          XFS_FSOP_GEOM_FLAGS_ATTR2
                 Filesystem contains V2 extended attributes.

          XFS_FSOP_GEOM_FLAGS_PROJID32
                 Project IDs can be as large as 2^32.  If this flag is not
                 set, the filesystem supports only 2^16 project IDs.

          XFS_FSOP_GEOM_FLAGS_DIRV2CI
                 Case-insensitive lookups are supported on directories.

          XFS_FSOP_GEOM_FLAGS_LAZYSB
                 On-disk superblock counters are updated only at unmount
                 time.

          XFS_FSOP_GEOM_FLAGS_V5SB
                 Metadata blocks are self describing and contain checksums.

          XFS_FSOP_GEOM_FLAGS_FTYPE
                 Directories contain inode types in directory entries.

          XFS_FSOP_GEOM_FLAGS_FINOBT
                 Filesystem maintains an index of free inodes.

          XFS_FSOP_GEOM_FLAGS_SPINODES
                 Filesystem may allocate discontiguous inode chunks when
                 free space is fragmented.

          XFS_FSOP_GEOM_FLAGS_RMAPBT
                 Filesystem stores reverse mappings of blocks to owners.

          XFS_FSOP_GEOM_FLAGS_REFLINK
                 Filesystem supports sharing blocks between files.


---------------------------------------------------------------------------------------------------

::

          The online filesystem checking utility scans metadata and records
          what it finds in the kernel incore state.  The following scheme
          is used for userspace to read the incore health status of the
          filesystem:

          • If a given sick flag is set in sick, then that piece of
            metadata has been observed to be damaged.  The same bit should
            be set in checked.

          • If a given sick flag is set in checked but is not set in sick,
            then that piece of metadata has been checked and is not faulty.

          • If a given sick flag is not set in checked, then no conclusion
            can be made.

          The following flags apply to these fields:

              XFS_FSOP_GEOM_SICK_COUNTERS
                     Inode and space summary counters.

              XFS_FSOP_GEOM_SICK_UQUOTA
                     User quota information.

              XFS_FSOP_GEOM_SICK_GQUOTA
                     Group quota information.

              XFS_FSOP_GEOM_SICK_PQUOTA
                     Project quota information.

              XFS_FSOP_GEOM_SICK_RT_BITMAP
                     Free space bitmap for the realtime device.

              XFS_FSOP_GEOM_SICK_RT_SUMMARY
                     Free space summary for the realtime device.


-----------------------------------------------------------------

::

          On error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          Error codes can be one of, but are not limited to, the following:

          EFAULT The kernel was not able to copy into the userspace buffer.

          EFSBADCRC
                 Metadata checksum validation failed while performing the
                 query.

          EFSCORRUPTED
                 Metadata corruption was encountered while performing the
                 query.

          EIO    An I/O error was encountered while performing the query.


-------------------------------------------------------------------

::

          This API is specific to XFS filesystem on the Linux kernel.


---------------------------------------------------------

::

          ioctl(2)

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

   XFS                            2019-06-17        IOCTL-XFS-FSGEOMETRY(2)

--------------

Pages that refer to this page: `xfsctl(3) <../man3/xfsctl.3.html>`__

--------------

`Copyright and license for this manual
page <../man2/ioctl_xfs_fsgeometry.2.license.html>`__

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
