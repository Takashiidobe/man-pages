.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs-check(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SAFE OR ADVISORY OPTIO           |                                   |
| NS <#SAFE_OR_ADVISORY_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `DANGEROU                         |                                   |
| S OPTIONS <#DANGEROUS_OPTIONS>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS-CHECK(8)                Btrfs Manual                BTRFS-CHECK(8)

NAME
-------------------------------------------------

::

          btrfs-check - check or repair a btrfs filesystem


---------------------------------------------------------

::

          btrfs check [options] <device>


---------------------------------------------------------------

::

          The filesystem checker is used to verify structural integrity of
          a filesystem and attempt to repair it if requested. It is
          recommended to unmount the filesystem prior to running the check,
          but it is possible to start checking a mounted filesystem (see
          --force).

          By default, btrfs check will not modify the device but you can
          reaffirm that by the option --readonly.

          btrfsck is an alias of btrfs check command and is now deprecated.

              Warning
              Do not use --repair unless you are advised to do so by a
              developer or an experienced user, and then only after having
              accepted that no fsck successfully repair all types of
              filesystem corruption. Eg. some other software or hardware
              bugs can fatally damage a volume.

          The structural integrity check verifies if internal filesystem
          objects or data structures satisfy the constraints, point to the
          right objects or are correctly connected together.

          There are several cross checks that can detect wrong reference
          counts of shared extents, backreferences, missing extents of
          inodes, directory and inode connectivity etc.

          The amount of memory required can be high, depending on the size
          of the filesystem, similarly the run time. Check the modes that
          can also affect that.


-----------------------------------------------------------------------------------------

::

          -b|--backup
              use the first valid set of backup roots stored in the
              superblock

              This can be combined with --super if some of the superblocks
              are damaged.

          --check-data-csum
              verify checksums of data blocks

              This expects that the filesystem is otherwise OK, and is
              basically an offline scrub that does not repair data from
              spare copies.

          --chunk-root <bytenr>
              use the given offset bytenr for the chunk tree root

          -E|--subvol-extents <subvolid>
              show extent state for the given subvolume

          -p|--progress
              indicate progress at various checking phases

          -Q|--qgroup-report
              verify qgroup accounting and compare against filesystem
              accounting

          -r|--tree-root <bytenr>
              use the given offset bytenr for the tree root

          --readonly
              (default) run in read-only mode, this option exists to calm
              potential panic when users are going to run the checker

          -s|--super <superblock>
              use 'superblock’th superblock copy, valid values are 0, 1 or
              2 if the respective superblock offset is within the device
              size

              This can be used to use a different starting point if some of
              the primary superblock is damaged.

          --clear-space-cache v1|v2
              completely wipe all free space cache of given type

              For free space cache v1, the clear_cache kernel mount option
              only rebuilds the free space cache for block groups that are
              modified while the filesystem is mounted with that option.
              Thus, using this option with v1 makes it possible to actually
              clear the entire free space cache.

              For free space cache v2, the clear_cache kernel mount option
              destroys the entire free space cache. This option, with v2
              provides an alternative method of clearing the free space
              cache that doesn’t require mounting the filesystem.

          --clear-ino-cache
              remove leftover items pertaining to the deprecated inode map
              feature


---------------------------------------------------------------------------

::

          --repair
              enable the repair mode and attempt to fix problems where
              possible

                  Note
                  there’s a warning and 10 second delay when this option is
                  run without --force to give users a chance to think twice
                  before running repair, the warnings in documentation have
                  shown to be insufficient

          --init-csum-tree
              create a new checksum tree and recalculate checksums in all
              files

                  Note
                  Do not blindly use this option to fix checksum mismatch
                  problems.

          --init-extent-tree
              build the extent tree from scratch

                  Note
                  Do not use unless you know what you’re doing.

          --mode <MODE>
              select mode of operation regarding memory and IO

              The MODE can be one of:

              original
                  The metadata are read into memory and verified, thus the
                  requirements are high on large filesystems and can even
                  lead to out-of-memory conditions. The possible workaround
                  is to export the block device over network to a machine
                  with enough memory.

              lowmem
                  This mode is supposed to address the high memory
                  consumption at the cost of increased IO when it needs to
                  re-read blocks. This may increase run time.

                      Note
                      lowmem mode does not work with --repair yet, and is
                      still considered experimental.

          --force
              allow work on a mounted filesystem. Note that this should
              work fine on a quiescent or read-only mounted filesystem but
              may crash if the device is changed externally, eg. by the
              kernel module. Repair without mount checks is not supported
              right now.

              This option also skips the delay and warning in the repair
              mode (see --repair).


---------------------------------------------------------------

::

          btrfs check returns a zero exit status if it succeeds. Non zero
          is returned in case of failure.


-----------------------------------------------------------------

::

          btrfs is part of btrfs-progs. Please refer to the btrfs wiki
          http://btrfs.wiki.kernel.org for further details.


---------------------------------------------------------

::

          mkfs.btrfs(8), btrfs-scrub(8), btrfs-rescue(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the btrfs-progs (btrfs filesystem tools)
          project.  Information about the project can be found at 
          ⟨https://btrfs.wiki.kernel.org/index.php/Btrfs_source_repositories⟩.
          If you have a bug report for this manual page, see
          ⟨https://btrfs.wiki.kernel.org/index.php/Problem_FAQ#How_do_I_report_bugs_and_issues.3F⟩.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-07-30.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Btrfs v4.6.1                   03/13/2021                 BTRFS-CHECK(8)

--------------

Pages that refer to this page: `btrfs(8) <../man8/btrfs.8.html>`__, 
`btrfs-rescue(8) <../man8/btrfs-rescue.8.html>`__, 
`btrfs-restore(8) <../man8/btrfs-restore.8.html>`__, 
`fsck.btrfs(8) <../man8/fsck.btrfs.8.html>`__

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
