.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ioctl_fslabel(2) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   IOCTL_FSLABEL(2)        Linux Programmer's Manual       IOCTL_FSLABEL(2)

NAME
-------------------------------------------------

::

          ioctl_fslabel - get or set a filesystem label


---------------------------------------------------------

::

          #include <linux/fs.h>       /* Definition of *FSLABEL* constants */
          #include <sys/ioctl.h>

          int ioctl(int fd, FS_IOC_GETFSLABEL, char label[FSLABEL_MAX]);
          int ioctl(int fd, FS_IOC_SETFSLABEL, char label[FSLABEL_MAX]);


---------------------------------------------------------------

::

          If a filesystem supports online label manipulation, these
          ioctl(2) operations can be used to get or set the filesystem
          label for the filesystem on which fd resides.  The
          FS_IOC_SETFSLABEL operation requires privilege (CAP_SYS_ADMIN).


-----------------------------------------------------------------

::

          On success zero is returned.  On error, -1 is returned, and errno
          is set to indicate the error.


-----------------------------------------------------

::

          Possible errors include (but are not limited to) the following:

          EFAULT label references an inaccessible memory area.

          EINVAL The specified label exceeds the maximum label length for
                 the filesystem.

          ENOTTY This can appear if the filesystem does not support online
                 label manipulation.

          EPERM  The calling process does not have sufficient permissions
                 to set the label.


---------------------------------------------------------

::

          These ioctl(2) operations first appeared in Linux 4.18.  They
          were previously known as BTRFS_IOC_GET_FSLABEL and
          BTRFS_IOC_SET_FSLABEL and were private to Btrfs.


-------------------------------------------------------------------

::

          This API is Linux-specific.


---------------------------------------------------

::

          The maximum string length for this interface is FSLABEL_MAX,
          including the terminating null byte ('\0').  Filesystems have
          differing maximum label lengths, which may or may not include the
          terminating null.  The string provided to FS_IOC_SETFSLABEL must
          always be null-terminated, and the string returned by
          FS_IOC_GETFSLABEL will always be null-terminated.


---------------------------------------------------------

::

          ioctl(2), blkid(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22               IOCTL_FSLABEL(2)

--------------

Pages that refer to this page: `ioctl(2) <../man2/ioctl.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/ioctl_fslabel.2.license.html>`__

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
