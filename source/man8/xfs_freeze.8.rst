.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfs_freeze(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   xfs_freeze(8)            System Manager's Manual           xfs_freeze(8)

NAME
-------------------------------------------------

::

          xfs_freeze - suspend access to an XFS filesystem


---------------------------------------------------------

::

          xfs_freeze [ -f | -u ] mount-point
          xfs_freeze -V


---------------------------------------------------------------

::

          xfs_freeze suspends and resumes access to an XFS filesystem (see
          xfs(5)).

          xfs_freeze halts new access to the filesystem and creates a
          stable image on disk.  xfs_freeze is intended to be used with
          volume managers and hardware RAID devices that support the
          creation of snapshots.

          The mount-point argument is the pathname of the directory where
          the filesystem is mounted.  The filesystem must be mounted to be
          frozen (see mount(8)).

          The -f flag requests the specified XFS filesystem to be frozen
          from new modifications.  When this is selected, all ongoing
          transactions in the filesystem are allowed to complete, new write
          system calls are halted, other calls which modify the filesystem
          are halted, and all dirty data, metadata, and log information are
          written to disk.  Any process attempting to write to the frozen
          filesystem will block waiting for the filesystem to be unfrozen.

          Note that even after freezing, the on-disk filesystem can contain
          information on files that are still in the process of unlinking.
          These files will not be unlinked until the filesystem is unfrozen
          or a clean mount of the snapshot is complete.

          The -u flag is used to un-freeze the filesystem and allow
          operations to continue.  Any filesystem modifications that were
          blocked by the freeze are unblocked and allowed to complete.

          The -V flag prints the version number and exits.

          Unless -V is specified, one of -f or -u must be supplied to
          xfs_freeze.


---------------------------------------------------

::

          A copy of a frozen XFS filesystem will usually have the same
          universally unique identifier (UUID) as the original, and thus
          may be prevented from being mounted.  The XFS nouuid mount option
          can be used to circumvent this issue.

          In Linux kernel version 2.6.29, the interface which XFS uses to
          freeze and unfreeze was elevated to the VFS, so that this tool
          can now be used on many other Linux filesystems.


---------------------------------------------------------

::

          xfs(5), lvm(8), mount(8).

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

                                                              xfs_freeze(8)

--------------

Pages that refer to this page:
`fsfreeze(8) <../man8/fsfreeze.8.html>`__, 
`xfs_copy(8) <../man8/xfs_copy.8.html>`__, 
`xfs_metadump(8) <../man8/xfs_metadump.8.html>`__

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
