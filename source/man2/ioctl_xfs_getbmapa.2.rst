.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ioctl_xfs_getbmapx(2) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   IOCTL-XFS-GETBMAPX(2)      System Calls Manual     IOCTL-XFS-GETBMAPX(2)

NAME
-------------------------------------------------

::

          ioctl_xfs_getbmapx - query extent information for an open file


---------------------------------------------------------

::

          #include <xfs/xfs_fs.h>

          int ioctl(int fd, XFS_IOC_GETBMAP, struct getbmap *arg);
          int ioctl(int fd, XFS_IOC_GETBMAPA, struct getbmap *arg);
          int ioctl(int fd, XFS_IOC_GETBMAPX, struct getbmapx *arg);


---------------------------------------------------------------

::

          Get the block map for a segment of a file in an XFS file system.
          The mapping information is conveyed via an array of structures of
          the following form:

              struct getbmap {
                   __s64   bmv_offset;
                   __s64   bmv_block;
                   __s64   bmv_length;
                   __s32   bmv_count;
                   __s32   bmv_entries;
              };

          The XFS_IOC_GETBMAPX ioctl uses a larger version of that
          structure:

              struct getbmapx {
                   __s64   bmv_offset;
                   __s64   bmv_block;
                   __s64   bmv_length;
                   __s32   bmv_count;
                   __s32   bmv_entries;
                   __s32   bmv_iflags;
                   __s32   bmv_oflags;
                   __s32   bmv_unused1;
                   __s32   bmv_unused2;
              };

          All sizes and offsets in the structure are in units of 512 bytes.

          The first structure in the array is a header and the remaining
          structures in the array contain block map information on return.
          The header controls iterative calls to the command and should be
          filled out as follows:

          bmv_offset
                 The file offset of the area of interest in the file.

          bmv_length
                 The length of the area of interest in the file.  If this
                 value is set to -1, the length of the interesting area is
                 the rest of the file.

          bmv_count
                 The number of elements in the array, including this
                 header.  The minimum value is 2.

          bmv_entries
                 The number of entries actually filled in by the call.
                 This does not need to be filled out before the call.  This
                 value may be zero if no extents were found in the
                 requested range, or if iterated calls have reached the end
                 of the requested range.

          bmv_iflags
                 For the XFS_IOC_GETBMAPX function, this is a bitmask
                 containing a combination of the following flags:

              BMV_IF_ATTRFORK
                     Return information about the extended attribute fork.

              BMV_IF_PREALLOC
                     Return information about unwritten pre-allocated
                     segments.

              BMV_IF_DELALLOC
                     Return information about delayed allocation
                     reservation segments.

              BMV_IF_NO_HOLES
                     Do not return information about holes.

          The other bmv_* fields in the header are ignored.

          On successful return from a call, the offset and length values in
          the header are updated so that the command can be reused to
          obtain more information.  The remaining elements of the array
          will be filled out by the call as follows:

          bmv_offset
                 File offset of segment.

          bmv_block
                 Physical starting block of segment.  If this is -1, then
                 the segment is a hole.

          bmv_length
                 Length of segment.

          bmv_oflags
                 The XFS_IOC_GETBMAPX function will fill this field with a
                 combination of the following flags:

              BMV_OF_PREALLOC
                     The segment is an unwritten pre-allocation.

              BMV_OF_DELALLOC
                     The segment is a delayed allocation reservation.

              BMV_OF_LAST
                     This segment is the last in the file.

              BMV_OF_SHARED
                     This segment shares blocks with other files.

          The other bmv_* fields are unused in the array of output records.

          The XFS_IOC_GETBMAPA command is identical to XFS_IOC_GETBMAP
          except that information about the attribute fork of the file is
          returned.


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

          EINVAL One of the arguments was not valid.

          EIO    An I/O error was encountered while performing the query.

          ENOMEM There was insufficient memory to perform the query.


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

   XFS                            2019-06-17          IOCTL-XFS-GETBMAPX(2)

--------------

Pages that refer to this page: `xfsctl(3) <../man3/xfsctl.3.html>`__

--------------

`Copyright and license for this manual
page <../man2/ioctl_xfs_getbmapx.2.license.html>`__

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
