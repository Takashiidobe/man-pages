.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ioctl_xfs_inumbers(2) — Linux manual page
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

   IOCTL-XFS-INUMBERS(2)      System Calls Manual     IOCTL-XFS-INUMBERS(2)

NAME
-------------------------------------------------

::

          ioctl_xfs_inumbers - query allocation information for groups of
          XFS inodes


---------------------------------------------------------

::

          #include <xfs/xfs_fs.h>

          int ioctl(int fd, XFS_IOC_INUMBERS, struct xfs_inumbers_req
          *arg);


---------------------------------------------------------------

::

          Query inode allocation information for groups of XFS inodes.
          This ioctl uses struct xfs_inumbers_req to set up a bulk transfer
          from the kernel:

              struct xfs_inumbers_req {
                   struct xfs_bulk_ireq    hdr;
                   struct xfs_inumbers     inumbers[];
              };

          See below for the xfs_inumbers structure definition.

              struct xfs_bulk_ireq {
                   uint64_t                ino;
                   uint32_t                flags;
                   uint32_t                icount;
                   uint32_t                ocount;
                   uint32_t                agno;
                   uint64_t                reserved[5];
              };

          hdr describes the information to query.  The layout and behavior
          are documented in the ioctl_xfs_bulkstat(2) manpage and will not
          be discussed further here.

          inumbers is an array of struct xfs_inumbers which is described
          below.  The array must have at least icount elements.

              struct xfs_inumbers {
                   uint64_t                xi_startino;
                   uint64_t                xi_allocmask;
                   uint8_t                 xi_alloccount;
                   uint8_t                 xi_version;
                   uint8_t                 xi_padding[6];
              };

          This structure describes inode usage information for a group of
          64 consecutive inode numbers.

          xi_startino is the first inode number of this group.

          xi_allocmask is a bitmask telling which inodes in this group are
          allocated.  To clarify, bit N is set if inode xi_startino+N is
          allocated.

          xi_alloccount is the number of inodes in this group that are
          allocated.  This should be equal to popcnt(xi_allocmask).

          xi_version is the version of this data structure.  This will be
          set to XFS_INUMBERS_VERSION_V5 by the kernel.

          xi_padding[6] is zeroed.


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

          ioctl(2), ioctl_xfs_bulkstat(2).

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

   XFS                            2019-05-23          IOCTL-XFS-INUMBERS(2)

--------------

`Copyright and license for this manual
page <../man2/ioctl_xfs_inumbers.2.license.html>`__

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
