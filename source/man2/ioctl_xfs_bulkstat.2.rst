.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ioctl_xfs_bulkstat(2) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `XFS INODE M                      |                                   |
| ETADATA HEALTH REPORTING <#XFS_IN |                                   |
| ODE_METADATA_HEALTH_REPORTING>`__ |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IOCTL-XFS-BULKSTAT(2)      System Calls Manual     IOCTL-XFS-BULKSTAT(2)

NAME
-------------------------------------------------

::

          ioctl_xfs_bulkstat - query information for a batch of XFS inodes


---------------------------------------------------------

::

          #include <xfs/xfs_fs.h>

          int ioctl(int fd, XFS_IOC_BULKSTAT, struct xfs_bulkstat_req
          *arg);


---------------------------------------------------------------

::

          Query stat information for a group of XFS inodes.  This ioctl
          uses struct xfs_bulkstat_req to set up a bulk transfer from the
          kernel:

              struct xfs_bulkstat_req {
                   struct xfs_bulk_ireq    hdr;
                   struct xfs_bulkstat     bulkstat[];
              };

          See below for the xfs_bulkstat structure definition.

              struct xfs_bulk_ireq {
                   uint64_t                ino;
                   uint32_t                flags;
                   uint32_t                icount;
                   uint32_t                ocount;
                   uint32_t                agno;
                   uint64_t                reserved[5];
              };

          hdr.ino should be set to the number of the first inode for which
          the caller wants information; or zero to start with the first
          inode in the filesystem; or a special value if
          XFS_BULK_IREQ_SPECIAL is set in the flags field.  Note that this
          is a different semantic than the lastip in the old FSBULKSTAT
          ioctl.  After the call, this value will be set to the number of
          the next inode for which information could supplied.  This sets
          up the next call for an iteration loop.

          If the XFS_BULK_IREQ_SPECIAL flag is set in the flags field, the
          ino field is interpreted according to the following special
          values:

              XFS_BULK_IREQ_SPECIAL_ROOT
                     Return stat information for the root directory inode.

          hdr.flags is a bit set of operational flags:

              XFS_BULK_IREQ_AGNO
                     If this is set, the call will only return results for
                     the allocation group (AG) set in hdr.agno.  If hdr.ino
                     is set to zero, results will be returned starting with
                     the first inode in the AG.  This flag may not be set
                     at the same time as the XFS_BULK_IREQ_SPECIAL flag.

              XFS_BULK_IREQ_SPECIAL
                     If this is set, results will be returned for only the
                     special inode specified in the hdr.ino field.  This
                     flag may not be set at the same time as the
                     XFS_BULK_IREQ_AGNO flag.

          hdr.icount is the maximum number of records to return.  This
          should be the size of the array that comes after the header.

          hdr.ocount will be set to the number of records actually
          returned.

          hdr.agno is the number of the allocation group (AG) for which we
          want results.  If the XFS_BULK_IREQ_AGNO flag is not set, this
          field is ignored.

          hdr.reserved must be set to zero.

          bulkstat is an array of struct xfs_bulkstat which is described
          below.  The array must have at least icount elements.

              struct xfs_bulkstat {
                   uint64_t                bs_ino;
                   uint64_t                bs_size;

                   uint64_t                bs_blocks;
                   uint64_t                bs_xflags;

                   uint64_t                bs_atime;
                   uint64_t                bs_mtime;

                   uint64_t                bs_ctime;
                   uint64_t                bs_btime;

                   uint32_t                bs_gen;
                   uint32_t                bs_uid;
                   uint32_t                bs_gid;
                   uint32_t                bs_projectid;

                   uint32_t                bs_atime_nsec;
                   uint32_t                bs_mtime_nsec;
                   uint32_t                bs_ctime_nsec;
                   uint32_t                bs_btime_nsec;

                   uint32_t                bs_blksize;
                   uint32_t                bs_rdev;
                   uint32_t                bs_cowextsize_blks;
                   uint32_t                bs_extsize_blks;

                   uint32_t                bs_nlink;
                   uint32_t                bs_extents;
                   uint32_t                bs_aextents;
                   uint16_t                bs_version;
                   uint16_t                bs_forkoff;

                   uint16_t                bs_sick;
                   uint16_t                bs_checked;
                   uint16_t                bs_mode;
                   uint16_t                bs_pad2;

                   uint64_t                bs_pad[7];
              };

          bs_ino is the inode number of this record.

          bs_size is the size of the file, in bytes.

          bs_blocks is the number of filesystem blocks allocated to this
          file, including metadata.

          bs_xflags tell us what extended flags are set this inode.  These
          flags are the same values as those defined in the XFS INODE FLAGS
          section of the ioctl_xfs_fsgetxattr(2) manpage.

          bs_atime is the last time this file was accessed, in seconds.

          bs_mtime is the last time the contents of this file were
          modified, in seconds.

          bs_ctime is the last time this inode record was modified, in
          seconds.

          bs_btime is the time this inode record was created, in seconds.

          bs_gen is the generation number of the inode record.

          bs_uid is the user id.

          bs_gid is the group id.

          bs_projectid is the the project id.

          bs_atime_nsec is the nanoseconds component of the last time this
          file was accessed.

          bs_mtime_nsec is the nanoseconds component of the last time the
          contents of this file were modified.

          bs_ctime_nsec is the nanoseconds component of the last time this
          inode record was modified.

          bs_btime_nsec is the nanoseconds component of the time this inode
          record was created.

          bs_blksize is the size of a data block for this file, in units of
          bytes.

          bs_rdev is the encoded device id if this is a special file.

          bs_cowextsize_blks is the Copy on Write extent size hint for this
          file, in units of data blocks.

          bs_extsize_blks is the extent size hint for this file, in units
          of data blocks.

          bs_nlink is the number of hard links to this inode.

          bs_extents is the number of storage mappings associated with this
          file's data.

          bs_aextents is the number of storage mappings associated with
          this file's extended attributes.

          bs_version is the version of this data structure.  This will be
          set to XFS_BULKSTAT_VERSION_V5 by the kernel.

          bs_forkoff is the offset of the attribute fork in the inode
          record, in bytes.

          The fields bs_sick and bs_checked indicate the relative health of
          various allocation group metadata.  Please see the section XFS
          INODE METADATA HEALTH REPORTING for more information.

          bs_mode is the file type and mode.

          bs_pad[7] is zeroed.


-----------------------------------------------------------------

::

          On error, -1 is returned, and errno is set to indicate the error.


---------------------------------------------------------------------------------------------------------------

::

          The online filesystem checking utility scans inode metadata and
          records what it finds in the kernel incore state.  The following
          scheme is used for userspace to read the incore health status of
          an inode:

          • If a given sick flag is set in bs_sick, then that piece of
            metadata has been observed to be damaged.  The same bit should
            be set in bs_checked.

          • If a given sick flag is set in bs_checked but is not set in
            bs_sick, then that piece of metadata has been checked and is
            not faulty.

          • If a given sick flag is not set in bs_checked, then no
            conclusion can be made.

          The following flags apply to these fields:

              XFS_BS_SICK_INODE
                     The inode's record itself.

              XFS_BS_SICK_BMBTD
                     File data extent mappings.

              XFS_BS_SICK_BMBTA
                     Extended attribute extent mappings.

              XFS_BS_SICK_BMBTC
                     Copy on Write staging extent mappings.

              XFS_BS_SICK_DIR
                     Directory information.

              XFS_BS_SICK_XATTR
                     Extended attribute data.

              XFS_BS_SICK_SYMLINK
                     Symbolic link target.

              XFS_BS_SICK_PARENT
                     Parent pointers.


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

          EINVAL One of the arguments was not valid.

          EIO    An I/O error was encountered while performing the query.

          ENOMEM There was insufficient memory to perform the query.


-------------------------------------------------------------------

::

          This API is specific to XFS filesystem on the Linux kernel.


---------------------------------------------------------

::

          ioctl(2), ioctl_xfs_fsgetxattr(2)

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

   XFS                            2019-05-23          IOCTL-XFS-BULKSTAT(2)

--------------

Pages that refer to this page:
`ioctl_xfs_fsbulkstat(2) <../man2/ioctl_xfs_fsbulkstat.2.html>`__, 
`ioctl_xfs_inumbers(2) <../man2/ioctl_xfs_inumbers.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/ioctl_xfs_bulkstat.2.license.html>`__

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
