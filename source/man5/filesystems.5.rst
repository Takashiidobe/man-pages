.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

filesystems(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FILESYSTEMS(5)          Linux Programmer's Manual         FILESYSTEMS(5)

NAME
-------------------------------------------------

::

          filesystems - Linux filesystem types: ext, ext2, ext3, ext4,
          hpfs, iso9660, JFS, minix, msdos, ncpfs nfs, ntfs, proc,
          Reiserfs, smb, sysv, umsdos, vfat, XFS, xiafs


---------------------------------------------------------------

::

          When, as is customary, the proc filesystem is mounted on /proc,
          you can find in the file /proc/filesystems which filesystems your
          kernel currently supports; see proc(5) for more details.  There
          is also a legacy sysfs(2) system call (whose availability is
          controlled by the CONFIG_SYSFS_SYSCALL kernel build configuration
          option since Linux 3.15) that enables enumeration of the
          currently available filesystem types regardless of /proc
          availability and/or sanity.

          If you need a currently unsupported filesystem, insert the
          corresponding kernel module or recompile the kernel.

          In order to use a filesystem, you have to mount it; see mount(2)
          and mount(8).

          The following list provides a short description of the available
          or historically available filesystems in the Linux kernel.  See
          the kernel documentation for a comprehensive description of all
          options and limitations.

          ext    is an elaborate extension of the minix filesystem.  It has
                 been completely superseded by the second version of the
                 extended filesystem (ext2) and has been removed from the
                 kernel (in 2.1.21).

          ext2   is the high performance disk filesystem used by Linux for
                 fixed disks as well as removable media.  The second
                 extended filesystem was designed as an extension of the
                 extended filesystem (ext).  See ext2(5).

          ext3   is a journaling version of the ext2 filesystem.  It is
                 easy to switch back and forth between ext2 and ext3.  See
                 ext3(5).

          ext4   is a set of upgrades to ext3 including substantial
                 performance and reliability enhancements, plus large
                 increases in volume, file, and directory size limits.  See
                 ext4(5).

          hpfs   is the High Performance Filesystem, used in OS/2.  This
                 filesystem is read-only under Linux due to the lack of
                 available documentation.

          iso9660
                 is a CD-ROM filesystem type conforming to the ISO 9660
                 standard.

                 High Sierra
                        Linux supports High Sierra, the precursor to the
                        ISO 9660 standard for CD-ROM filesystems.  It is
                        automatically recognized within the iso9660
                        filesystem support under Linux.

                 Rock Ridge
                        Linux also supports the System Use Sharing Protocol
                        records specified by the Rock Ridge Interchange
                        Protocol.  They are used to further describe the
                        files in the iso9660 filesystem to a UNIX host, and
                        provide information such as long filenames,
                        UID/GID, POSIX permissions, and devices.  It is
                        automatically recognized within the iso9660
                        filesystem support under Linux.

          JFS    is a journaling filesystem, developed by IBM, that was
                 integrated into Linux in kernel 2.4.24.

          minix  is the filesystem used in the Minix operating system, the
                 first to run under Linux.  It has a number of
                 shortcomings, including a 64 MB partition size limit,
                 short filenames, and a single timestamp.  It remains
                 useful for floppies and RAM disks.

          msdos  is the filesystem used by DOS, Windows, and some OS/2
                 computers.  msdos filenames can be no longer than 8
                 characters, followed by an optional period and 3 character
                 extension.

          ncpfs  is a network filesystem that supports the NCP protocol,
                 used by Novell NetWare.  It was removed from the kernel in
                 4.17.

                 To use ncpfs, you need special programs, which can be
                 found at ⟨ftp://ftp.gwdg.de/pub/linux/misc/ncpfs⟩.

          nfs    is the network filesystem used to access disks located on
                 remote computers.

          ntfs   is the filesystem native to Microsoft Windows NT,
                 supporting features like ACLs, journaling, encryption, and
                 so on.

          proc   is a pseudo filesystem which is used as an interface to
                 kernel data structures rather than reading and
                 interpreting /dev/kmem.  In particular, its files do not
                 take disk space.  See proc(5).

          Reiserfs
                 is a journaling filesystem, designed by Hans Reiser, that
                 was integrated into Linux in kernel 2.4.1.

          smb    is a network filesystem that supports the SMB protocol,
                 used by Windows for Workgroups, Windows NT, and Lan
                 Manager.  See ⟨https://www.samba.org/samba/smbfs/⟩.

          sysv   is an implementation of the System V/Coherent filesystem
                 for Linux.  It implements all of Xenix FS, System V/386
                 FS, and Coherent FS.

          umsdos is an extended DOS filesystem used by Linux.  It adds
                 capability for long filenames, UID/GID, POSIX permissions,
                 and special files (devices, named pipes, etc.) under the
                 DOS filesystem, without sacrificing compatibility with
                 DOS.

          tmpfs  is a filesystem whose contents reside in virtual memory.
                 Since the files on such filesystems typically reside in
                 RAM, file access is extremely fast.  See tmpfs(5).

          vfat   is an extended FAT filesystem used by Microsoft Windows95
                 and Windows NT.  vfat adds the capability to use long
                 filenames under the MSDOS filesystem.

          XFS    is a journaling filesystem, developed by SGI, that was
                 integrated into Linux in kernel 2.4.20.

          xiafs  was designed and implemented to be a stable, safe
                 filesystem by extending the Minix filesystem code.  It
                 provides the basic most requested features without undue
                 complexity.  The xiafs filesystem is no longer actively
                 developed or maintained.  It was removed from the kernel
                 in 2.1.21.


---------------------------------------------------------

::

          fuse(4), btrfs(5), ext2(5), ext3(5), ext4(5), nfs(5), proc(5),
          sysfs(5), tmpfs(5), xfs(5), fsck(8), mkfs(8), mount(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-12-21                 FILESYSTEMS(5)

--------------

Pages that refer to this page: `fstab(5) <../man5/fstab.5.html>`__, 
`proc(5) <../man5/proc.5.html>`__,  `mkfs(8) <../man8/mkfs.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__

--------------

`Copyright and license for this manual
page <../man5/filesystems.5.license.html>`__

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
