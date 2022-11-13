.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfs_copy(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   xfs_copy(8)              System Manager's Manual             xfs_copy(8)

NAME
-------------------------------------------------

::

          xfs_copy - copy the contents of an XFS filesystem


---------------------------------------------------------

::

          xfs_copy [ -bd ] [ -L log ] source target1 [ target2 ... ]
          xfs_copy -V


---------------------------------------------------------------

::

          xfs_copy copies an XFS filesystem to one or more targets in
          parallel (see xfs(5)).  The first (source) argument must be the
          pathname of the device or file containing the XFS filesystem. The
          remaining arguments specify one or more target devices or file
          names. If the pathnames specify devices, a copy of the source XFS
          filesystem is created on each device. The target can also be the
          name of a regular file, in which case an image of the source XFS
          filesystem is created in that file. If the file does not exist,
          xfs_copy creates the file. The length of the resulting file is
          equal to the size of the source filesystem. However, if the file
          is created on an XFS filesystem, the file consumes roughly the
          amount of space actually used in the source filesystem by the
          filesystem and the XFS log.  The space saving is because xfs_copy
          seeks over free blocks instead of copying them and the XFS
          filesystem supports sparse files efficiently.

          xfs_copy should only be used to copy unmounted filesystems, read-
          only mounted filesystems, or frozen filesystems (see
          xfs_freeze(8)).  Otherwise, the generated filesystem(s) would be
          inconsistent or corrupt.

          xfs_copy does not alter the source filesystem in any way. Each
          new (target) filesystem is identical to the original filesystem
          except that new filesystems each have a new unique filesystem
          identifier (UUID).  Therefore, if both the old and new
          filesystems will be used as separate distinct filesystems,
          xfs_copy or xfsdump(8)/xfsrestore(8) should be used to generate
          the new filesystem(s) instead of dd(1) or other programs that do
          block-by-block disk copying.

          xfs_copy uses synchronous writes to ensure that write errors are
          detected.

          xfs_copy uses pthreads(7) to perform simultaneous parallel
          writes.  xfs_copy creates one additional thread for each target
          to be written.  All threads die if xfs_copy terminates or aborts.


-------------------------------------------------------

::

          -d     Create a duplicate (true clone) filesystem. This should be
                 done only if the new filesystem will be used as a
                 replacement for the original filesystem (such as in the
                 case of disk replacement).

          -b     The buffered option can be used to ensure direct IO is not
                 attempted to any of the target files. This is useful when
                 the filesystem holding the target file does not support
                 direct IO.

          -L log Specifies the location of the log if the default location
                 of /var/tmp/xfs_copy.log.XXXXXX is not desired.

          -V     Prints the version number and exits.


---------------------------------------------------------------

::

          xfs_copy reports errors to both stderr and in more detailed form
          to a generated log file whose name is of the form
          /var/tmp/xfs_copy.log.XXXXXX or a log file specified by the -L
          option. If xfs_copy detects a write error on a target, the copy
          of that one target is aborted and an error message is issued to
          both stderr and the log file, but the rest of the copies
          continue. When xfs_copy terminates, all aborted targets are
          reported to both stderr and the log file.

          If all targets abort or if there is an error reading the source
          filesystem, xfs_copy immediately aborts.

          xfs_copy returns an exit code of 0 if all targets are
          successfully copied and an exit code of 1 if any target fails.


---------------------------------------------------

::

          When moving filesystems from one disk to another, if the original
          filesystem is significantly smaller than the new filesystem, and
          will be made larger, we recommend that mkfs.xfs(8) and
          xfsdump(8)/xfsrestore(8) be used instead of using xfs_copy and
          xfs_growfs(8).  The filesystem layout resulting from using
          xfs_copy/xfs_growfs is almost always worse than the result of
          using mkfs.xfs/xfsdump/xfsrestore but in the case of small
          filesystems, the differences can have a significant performance
          impact. This is due to the way xfs_growfs(8) works, and not due
          to any shortcoming in xfs_copy itself.


-------------------------------------------------------

::

          xfs_copy does not copy XFS filesystems that have a real-time
          section or XFS filesystems with external logs. In both cases,
          xfs_copy aborts with an error message.


---------------------------------------------------------

::

          mkfs.xfs(8), xfsdump(8), xfsrestore(8), xfs_freeze(8),
          xfs_growfs(8), xfs(5).

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

                                                                xfs_copy(8)

--------------

Pages that refer to this page: `xfs_db(8) <../man8/xfs_db.8.html>`__, 
`xfsdump(8) <../man8/xfsdump.8.html>`__, 
`xfs_logprint(8) <../man8/xfs_logprint.8.html>`__, 
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
