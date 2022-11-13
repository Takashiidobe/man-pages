.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfs_scrub(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| OPTIMIZATIONS <#OPTIMIZATIONS>`__ |                                   |
| \| `REPAIRS <#REPAIRS>`__ \|      |                                   |
| `EXIT CODE <#EXIT_CODE>`__ \|     |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   xfs_scrub(8)             System Manager's Manual            xfs_scrub(8)

NAME
-------------------------------------------------

::

          xfs_scrub - check and repair the contents of a mounted XFS
          filesystem


---------------------------------------------------------

::

          xfs_scrub [ -abCemnTvx ] mount-point
          xfs_scrub -V


---------------------------------------------------------------

::

          xfs_scrub attempts to check and repair all metadata in a mounted
          XFS filesystem.

          WARNING!  This program is EXPERIMENTAL, which means that its
          behavior and interface could change at any time!

          xfs_scrub asks the kernel to scrub all metadata objects in the
          filesystem.  Metadata records are scanned for obviously bad
          values and then cross-referenced against other metadata.  The
          goal is to establish a reasonable confidence about the
          consistency of the overall filesystem by examining the
          consistency of individual metadata records against the other
          metadata in the filesystem.  Damaged metadata can be rebuilt from
          other metadata if there exists redundant data structures which
          are intact.

          Filesystem corruption and optimization opportunities will be
          logged to the standard error stream.  Enabling verbose mode will
          increase the amount of status information sent to the output.

          If the kernel scrub reports that metadata needs repairs or
          optimizations and the user does not pass -n on the command line,
          this program will ask the kernel to make the repairs and to
          perform the optimizations.  See the sections about optimizations
          and repairs for a list of optimizations and repairs known to this
          program.  The kernel may not support repairing or optimizing the
          filesystem.  If this is the case, the filesystem must be
          unmounted and xfs_repair(8) run on the filesystem to fix the
          problems.


-------------------------------------------------------

::

          -a errors
                 Abort if more than this many errors are found on the
                 filesystem.

          -b     Run in background mode.  If the option is specified once,
                 only run a single scrubbing thread at a time.  If given
                 more than once, an artificial delay of 100us is added to
                 each scrub call to reduce CPU overhead even further.

          -C fd  This option causes xfs_scrub to write progress information
                 to the specified file description so that the progress of
                 the filesystem check can be monitored.  If the file
                 description is a tty, a fancy progress bar is rendered.
                 Otherwise, a simple numeric status dump compatible with
                 the fsck -C format is output.

          -e     Specifies what happens when errors are detected.  If
                 shutdown is given, the filesystem will be taken offline if
                 errors are found.  If continue is given, no action is
                 taken if errors are found; this is the default behavior.

          -k     Do not call TRIM on the free space.

          -m file
                 Search this file for mounted filesystems instead of
                 /etc/mtab.

          -n     Only check filesystem metadata.  Do not repair or optimize
                 anything.

          -T     Print timing and memory usage information for each phase.

          -v     Enable verbose mode, which prints periodic status updates.

          -V     Prints the version number and exits.

          -x     Read all file data extents to look for disk errors.
                 xfs_scrub will issue O_DIRECT reads to the block device
                 directly.  If the block device is a SCSI disk, it will
                 instead issue READ VERIFY commands directly to the disk.
                 If media errors are found, the error report will include
                 the disk offset, in bytes.  If the media errors affect a
                 file, the report will also include the inode number and
                 file offset, in bytes.  These actions will confirm that
                 all file data blocks can be read from storage.


-------------------------------------------------------------------

::

          Optimizations supported by this program include, but are not
          limited to:

          • Instructing the underlying storage to discard unused extents
            via the TRIM ioctl.

          • Updating secondary superblocks to match the primary superblock.

          • Turning off shared block write checks for files that no longer
            share blocks.


-------------------------------------------------------

::

          Repairs are performed by calling into the kernel.  This limits
          the scope of repair activities to rebuilding primary data
          structures from secondary data structures, or secondary
          structures from primary structures.  The existence of secondary
          data structures may require features that can only be turned on
          from mkfs.xfs(8).  If errors cannot be repaired, the filesystem
          must be unmounted and xfs_repair(8) run.  Repairs supported by
          the kernel include, but are not limited to:

          • Reconstructing extent allocation data.

          • Rebuilding free space information.

          • Rebuilding inode indexes.

          • Fixing minor corruptions of inode records.

          • Recalculating reference count information.

          • Reconstructing reverse mapping data from primary extent
            allocation data.

          • Scheduling a quotacheck for the next mount.

          If corrupt metadata is successfully repaired, this program will
          log that a repair has succeeded instead of a corruption report.


-----------------------------------------------------------

::

          The exit code returned by xfs_scrub is the sum of the following
          conditions:
               0    - No errors
               1    - File system errors left uncorrected
               2    - File system optimizations possible
               4    - Operational error
               8    - Usage or syntax error


-------------------------------------------------------

::

          xfs_scrub is an immature utility!  Do not run this program unless
          you have backups of your data!  This program takes advantage of
          in-kernel scrubbing to verify a given data structure with locks
          held and can keep the filesystem busy for a long time.  The
          kernel must be new enough to support the SCRUB_METADATA ioctl.

          If errors are found and cannot be repaired, the filesystem must
          be unmounted and repaired.


---------------------------------------------------------

::

          xfs_repair(8).

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

                                                               xfs_scrub(8)

--------------

Pages that refer to this page:
`ioctl_xfs_scrub_metadata(2) <../man2/ioctl_xfs_scrub_metadata.2.html>`__, 
`xfs_scrub_all(8) <../man8/xfs_scrub_all.8.html>`__

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
