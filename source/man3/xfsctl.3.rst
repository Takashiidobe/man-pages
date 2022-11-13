.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfsctl(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   XFSCTL(3)               Library Functions Manual               XFSCTL(3)

NAME
-------------------------------------------------

::

          xfsctl - control XFS filesystems and individual files


-------------------------------------------------------------

::

          #include <xfs/xfs.h>

          int xfsctl(const char *path, int fd, int cmd, void *ptr);

          int platform_test_xfs_fd(int fd);
          int platform_test_xfs_path(const char *path);


---------------------------------------------------------------

::

          Some functionality specific to the XFS filesystem is accessible
          to applications through platform-specific system call interfaces.
          These operations can be divided into two sections - operations
          that operate on individual files, and operations that operate on
          the filesystem itself. Care should be taken when issuing xfsctl()
          calls to ensure the target path and file descriptor (both must be
          supplied) do indeed represent a file from an XFS filesystem.  The
          statfs(2) and fstatfs(2) system calls can be used to determine
          whether or not an arbitrary path or file descriptor belong to an
          XFS filesystem.  These are not portable however, so the routines
          platform_test_xfs_fd() and platform_test_xfs_path() provide a
          platform-independent mechanism.

      File Operations
          In order to effect an operation on an individual file, the
          pathname and descriptor arguments passed to xfsctl identifies the
          file being operated on.  The final argument described below
          refers to the final argument of xfsctl.  All of the data
          structures and macros mentioned below are defined in the
          <xfs/xfs_fs.h> header file.

          XFS_IOC_ALLOCSP
          XFS_IOC_ALLOCSP64
          XFS_IOC_FREESP
          XFS_IOC_FREESP64
                 Alter storage space associated with a section of the
                 ordinary file specified.  The section is specified by a
                 variable of type xfs_flock64_t, pointed to by the final
                 argument.  The data type xfs_flock64_t contains the
                 following members: l_whence is 0, 1, or 2 to indicate that
                 the relative offset l_start will be measured from the
                 start of the file, the current position, or the end of the
                 file, respectively (i.e., l_start is the offset from the
                 position specified in l_whence).  If the offset specified
                 is before the current end of file, any data previously
                 written into this section is no longer accessible.  If the
                 offset specified is beyond the current end of file, the
                 file is grown and filled with zeroes.  The l_len field is
                 currently ignored, and should be set to zero.

                 XFS_IOC_ALLOCSP, XFS_IOC_ALLOCSP64, XFS_IOC_FREESP and
                 XFS_IOC_FREESP64 operations are all identical.

          XFS_IOC_FSSETDM
                 Set the di_dmevmask and di_dmstate fields in an XFS on-
                 disk inode.  The only legitimate values for these fields
                 are those previously returned in the bs_dmevmask and
                 bs_dmstate fields of the bulkstat structure.  The data
                 referred to by the final argument is a struct fsdmidata.
                 This structure's members are fsd_dmevmask and fsd_dmstate.
                 The di_dmevmask field is set to the value in fsd_dmevmask.
                 The di_dmstate field is set to the value in fsd_dmstate.
                 This command is restricted to root or to processes with
                 device management capabilities.  Its sole purpose is to
                 allow backup and restore programs to restore the
                 aforementioned critical on-disk inode fields.

          XFS_IOC_DIOINFO
                 Get information required to perform direct I/O on the
                 specified file descriptor.  Direct I/O is performed
                 directly to and from a user's data buffer.  Since the
                 kernel's buffer cache is no longer between the two, the
                 user's data buffer must conform to the same type of
                 constraints as required for accessing a raw disk
                 partition.  The final argument points to a variable of
                 type struct dioattr, which contains the following members:
                 d_mem is the memory alignment requirement of the user's
                 data buffer.  d_miniosz specifies block size, minimum I/O
                 request size, and I/O alignment.  The size of all I/O
                 requests must be a multiple of this amount and the value
                 of the seek pointer at the time of the I/O request must
                 also be an integer multiple of this amount.  d_maxiosz is
                 the maximum I/O request size which can be performed on the
                 file descriptor.  If an I/O request does not meet these
                 constraints, the read(2) or write(2) will fail with
                 EINVAL.  All I/O requests are kept consistent with any
                 data brought into the cache with an access through a non-
                 direct I/O file descriptor.

          XFS_IOC_FSGETXATTR
          XFS_IOC_FSGETXATTRA
          XFS_IOC_FSSETXATTR
                 See ioctl_xfs_fsgetxattr(2) for more information.

          XFS_IOC_GETBMAP
          XFS_IOC_GETBMAPA
          XFS_IOC_GETBMAPX
                 See ioctl_getbmap(2) for more information.

          XFS_IOC_RESVSP
          XFS_IOC_RESVSP64
                 This command is used to allocate space to a file.  A range
                 of bytes is specified using a pointer to a variable of
                 type xfs_flock64_t in the final argument.  The blocks are
                 allocated, but not zeroed, and the file size does not
                 change.  If the XFS filesystem is configured to flag
                 unwritten file extents, performance will be negatively
                 affected when writing to preallocated space, since extra
                 filesystem transactions are required to convert extent
                 flags on the range of the file written.  If xfs_info(8)
                 reports unwritten=1, then the filesystem was made to flag
                 unwritten extents.

          XFS_IOC_UNRESVSP
          XFS_IOC_UNRESVSP64
                 This command is used to free space from a file.  A range
                 of bytes is specified using a pointer to a variable of
                 type xfs_flock64_t in the final argument.  Partial
                 filesystem blocks are zeroed, and whole filesystem blocks
                 are removed from the file.  The file size does not change.

          XFS_IOC_ZERO_RANGE
                 This command is used to convert a range of a file to zeros
                 without issuing data IO.  A range of bytes is specified
                 using a pointer to a variable of type xfs_flock64_t in the
                 final argument.  Blocks are preallocated for regions that
                 span holes in the file, and the entire range is converted
                 to unwritten extents.  This operation is a fast method of
                 overwriting any from the range specified with zeros
                 without removing any blocks or having to write zeros to
                 disk.  Any subsequent read in the given range will return
                 zeros until new data is written.  This functionality
                 requires filesystems to support unwritten extents.  If
                 xfs_info(8) reports unwritten=1, then the filesystem was
                 made to flag unwritten extents.

          XFS_IOC_PATH_TO_HANDLE
          XFS_IOC_PATH_TO_FSHANDLE
          XFS_IOC_FD_TO_HANDLE
          XFS_IOC_OPEN_BY_HANDLE
          XFS_IOC_READLINK_BY_HANDLE
          XFS_IOC_ATTR_LIST_BY_HANDLE
          XFS_IOC_ATTR_MULTI_BY_HANDLE
          XFS_IOC_FSSETDM_BY_HANDLE
                 These are all interfaces that are used to implement
                 various libhandle functions (see open_by_handle(3)).  They
                 are all subject to change and should not be called
                 directly by applications.

      Filesystem Operations
          In order to effect one of the following operations, the pathname
          and descriptor arguments passed to xfsctl() can be any open file
          in the XFS filesystem in question.

          XFS_IOC_FSINUMBERS
                 See ioctl_xfs_fsinumbers(2) for more information.

          XFS_IOC_FSGEOMETRY
                 See ioctl_xfs_fsgeometry(2) for more information.

          XFS_IOC_AG_GEOMETRY
                 See ioctl_xfs_ag_geometry(2) for more information.

          XFS_IOC_FSBULKSTAT or XFS_IOC_FSBULKSTAT_SINGLE
                 See ioctl_xfs_fsbulkstat(2) for more information.

          XFS_IOC_SCRUB_METADATA
                 See ioctl_xfs_scrub_metadata(2) for more information.

          XFS_IOC_FSCOUNTS
                 See ioctl_xfs_fscounts(2) for more information.

          XFS_IOC_GET_RESBLKS
          XFS_IOC_SET_RESBLKS
                 See ioctl_xfs_getresblks(2) for more information.  Save
                 yourself a lot of frustration and avoid these ioctls.

          XFS_IOC_GOINGDOWN
                 See ioctl_xfs_goingdown(2) for more information.

          XFS_IOC_THAW
          XFS_IOC_FREEZE
          XFS_IOC_FSGROWFSDATA
          XFS_IOC_FSGROWFSLOG
          XFS_IOC_FSGROWFSRT
                 These interfaces are used to implement various filesystem
                 internal operations on XFS filesystems.  The remainder of
                 these operations will not be described further as they are
                 not of general use to applications.


---------------------------------------------------------

::

          ioctl_xfs_fsgetxattr(2), ioctl_xfs_fsgeometry(2),
          ioctl_xfs_fsbulkstat(2), ioctl_xfs_scrub_metadata(2),
          ioctl_xfs_fsinumbers(2), ioctl_xfs_fscounts(2),
          ioctl_xfs_getresblks(2), ioctl_xfs_getbmap(2),
          ioctl_xfs_goingdown(2), fstatfs(2), statfs(2), xfs(5),
          xfs_info(8).

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

                                                                  XFSCTL(3)

--------------

Pages that refer to this page: `open(2) <../man2/open.2.html>`__, 
`handle(3) <../man3/handle.3.html>`__, 
`projects(5) <../man5/projects.5.html>`__, 
`projid(5) <../man5/projid.5.html>`__, 
`xfs(5) <../man5/xfs.5.html>`__,  `xfs_io(8) <../man8/xfs_io.8.html>`__

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
