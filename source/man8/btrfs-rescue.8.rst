.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs-rescue(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SUBCOMMAND <#SUBCOMMAND>`__ \|   |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS-RESCUE(8)               Btrfs Manual               BTRFS-RESCUE(8)

NAME
-------------------------------------------------

::

          btrfs-rescue - Recover a damaged btrfs filesystem


---------------------------------------------------------

::

          btrfs rescue <subcommand> <args>


---------------------------------------------------------------

::

          btrfs rescue is used to try to recover a damaged btrfs
          filesystem.


-------------------------------------------------------------

::

          chunk-recover [options] <device>
              Recover the chunk tree by scanning the devices

              Options

              -y
                  assume an answer of yes to all questions.

              -h
                  help.

              -v
                  (deprecated) alias for global -v option

              Note
              Since chunk-recover will scan the whole device, it will be
              VERY slow especially executed on a large device.

          fix-device-size <device>
              fix device size and super block total bytes values that are
              do not match

              Kernel 4.11 starts to check the device size more strictly and
              this might mismatch the stored value of total bytes. See the
              exact error message below. Newer kernel will refuse to mount
              the filesystem where the values do not match. This error is
              not fatal and can be fixed. This command will fix the device
              size values if possible.

                  BTRFS error (device sdb): super_total_bytes 92017859088384 mismatch with fs_devices total_rw_bytes 92017859094528

              The mismatch may also exhibit as a kernel warning:

                  WARNING: CPU: 3 PID: 439 at fs/btrfs/ctree.h:1559 btrfs_update_device+0x1c5/0x1d0 [btrfs]

          super-recover [options] <device>
              Recover bad superblocks from good copies.

              Options

              -y
                  assume an answer of yes to all questions.

              -v
                  (deprecated) alias for global -v option

          zero-log <device>
              clear the filesystem log tree

              This command will clear the filesystem log tree. This may fix
              a specific set of problem when the filesystem mount fails due
              to the log replay. See below for sample stacktraces that may
              show up in system log.

              The common case where this happens was fixed a long time ago,
              so it is unlikely that you will see this particular problem,
              but the command is kept around.

                  Note
                  clearing the log may lead to loss of changes that were
                  made since the last transaction commit. This may be up to
                  30 seconds (default commit period) or less if the commit
                  was implied by other filesystem activity.
              One can determine whether zero-log is needed according to the
              kernel backtrace:

                  ? replay_one_dir_item+0xb5/0xb5 [btrfs]
                  ? walk_log_tree+0x9c/0x19d [btrfs]
                  ? btrfs_read_fs_root_no_radix+0x169/0x1a1 [btrfs]
                  ? btrfs_recover_log_trees+0x195/0x29c [btrfs]
                  ? replay_one_dir_item+0xb5/0xb5 [btrfs]
                  ? btree_read_extent_buffer_pages+0x76/0xbc [btrfs]
                  ? open_ctree+0xff6/0x132c [btrfs]

              If the errors are like above, then zero-log should be used to
              clear the log and the filesystem may be mounted normally
              again. The keywords to look for are open_ctree which says
              that it’s during mount and function names that contain
              replay, recover or log_tree.


---------------------------------------------------------------

::

          btrfs rescue returns a zero exit status if it succeeds. Non zero
          is returned in case of failure.


-----------------------------------------------------------------

::

          btrfs is part of btrfs-progs. Please refer to the btrfs wiki
          http://btrfs.wiki.kernel.org for further details.


---------------------------------------------------------

::

          mkfs.btrfs(8), btrfs-scrub(8), btrfs-check(8)

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

   Btrfs v4.6.1                   07/14/2020                BTRFS-RESCUE(8)

--------------

Pages that refer to this page: `btrfs(8) <../man8/btrfs.8.html>`__, 
`btrfs-check(8) <../man8/btrfs-check.8.html>`__, 
`btrfs-restore(8) <../man8/btrfs-restore.8.html>`__

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
