.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fsfreeze(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILESYSTEM                       |                                   |
|  SUPPORT <#FILESYSTEM_SUPPORT>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FSFREEZE(8)               System Administration              FSFREEZE(8)

NAME
-------------------------------------------------

::

          fsfreeze - suspend access to a filesystem (Ext3/4, ReiserFS, JFS,
          XFS)


---------------------------------------------------------

::

          fsfreeze --freeze|--unfreeze mountpoint


---------------------------------------------------------------

::

          fsfreeze suspends or resumes access to a filesystem.

          fsfreeze halts any new access to the filesystem and creates a
          stable image on disk. fsfreeze is intended to be used with
          hardware RAID devices that support the creation of snapshots.

          fsfreeze is unnecessary for device-mapper devices. The
          device-mapper (and LVM) automatically freezes a filesystem on the
          device when a snapshot creation is requested. For more details
          see the dmsetup(8) man page.

          The mountpoint argument is the pathname of the directory where
          the filesystem is mounted. The filesystem must be mounted to be
          frozen (see mount(8)).

          Note that access-time updates are also suspended if the
          filesystem is mounted with the traditional atime behavior (mount
          option strictatime, for more details see mount(8)).


-------------------------------------------------------

::

          -f, --freeze
              This option requests the specified a filesystem to be frozen
              from new modifications. When this is selected, all ongoing
              transactions in the filesystem are allowed to complete, new
              write system calls are halted, other calls which modify the
              filesystem are halted, and all dirty data, metadata, and log
              information are written to disk. Any process attempting to
              write to the frozen filesystem will block waiting for the
              filesystem to be unfrozen.

              Note that even after freezing, the on-disk filesystem can
              contain information on files that are still in the process of
              unlinking. These files will not be unlinked until the
              filesystem is unfrozen or a clean mount of the snapshot is
              complete.

          -u, --unfreeze
              This option is used to un-freeze the filesystem and allow
              operations to continue. Any filesystem modifications that
              were blocked by the freeze are unblocked and allowed to
              complete.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-----------------------------------------------------------------------------

::

          This command will work only if filesystem supports has support
          for freezing. List of these filesystems include (2016-12-18)
          btrfs, ext2/3/4, f2fs, jfs, nilfs2, reiserfs, and xfs. Previous
          list may be incomplete, as more filesystems get support. If in
          doubt easiest way to know if a filesystem has support is create a
          small loopback mount and test freezing it.


---------------------------------------------------

::

          This man page is based on xfs_freeze(8).


-------------------------------------------------------

::

          Written by Hajime Taira.


---------------------------------------------------------

::

          mount(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The fsfreeze command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                    FSFREEZE(8)

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
