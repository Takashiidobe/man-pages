.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CO                               |                                   |
| MMAND SYNTAX <#COMMAND_SYNTAX>`__ |                                   |
| \| `COMMANDS <#COMMANDS>`__ \|    |                                   |
| `STANDA                           |                                   |
| LONE TOOLS <#STANDALONE_TOOLS>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS(8)                      Btrfs Manual                      BTRFS(8)

NAME
-------------------------------------------------

::

          btrfs - a toolbox to manage btrfs filesystems


---------------------------------------------------------

::

          btrfs <command> [<args>]


---------------------------------------------------------------

::

          The btrfs utility is a toolbox for managing btrfs filesystems.
          There are command groups to work with subvolumes, devices, for
          whole filesystem or other specific actions. See section COMMANDS.

          There are also standalone tools for some tasks like btrfs-convert
          or btrfstune that were separate historically and/or haven’t been
          merged to the main utility. See section STANDALONE TOOLS for more
          details.

          For other topics (mount options, etc) please refer to the
          separate manual page btrfs(5).


---------------------------------------------------------------------

::

          Any command name can be shortened so long as the shortened form
          is unambiguous, however, it is recommended to use full command
          names in scripts. All command groups have their manual page named
          btrfs-<group>.

          For example: it is possible to run btrfs sub snaps instead of
          btrfs subvolume snapshot. But btrfs file s is not allowed,
          because file s may be interpreted both as filesystem show and as
          filesystem sync.

          If the command name is ambiguous, the list of conflicting options
          is printed.

          For an overview of a given command use btrfs command --help or
          btrfs [command...] --help --full to print all available options.


---------------------------------------------------------

::

          balance
              Balance btrfs filesystem chunks across single or several
              devices.

              See btrfs-balance(8) for details.

          check
              Do off-line check on a btrfs filesystem.

              See btrfs-check(8) for details.

          device
              Manage devices managed by btrfs, including add/delete/scan
              and so on.

              See btrfs-device(8) for details.

          filesystem
              Manage a btrfs filesystem, including label setting/sync and
              so on.

              See btrfs-filesystem(8) for details.

          inspect-internal
              Debug tools for developers/hackers.

              See btrfs-inspect-internal(8) for details.

          property
              Get/set a property from/to a btrfs object.

              See btrfs-property(8) for details.

          qgroup
              Manage quota group(qgroup) for btrfs filesystem.

              See btrfs-qgroup(8) for details.

          quota
              Manage quota on btrfs filesystem like enabling/rescan and
              etc.

              See btrfs-quota(8) and btrfs-qgroup(8) for details.

          receive
              Receive subvolume data from stdin/file for restore and etc.

              See btrfs-receive(8) for details.

          replace
              Replace btrfs devices.

              See btrfs-replace(8) for details.

          rescue
              Try to rescue damaged btrfs filesystem.

              See btrfs-rescue(8) for details.

          restore
              Try to restore files from a damaged btrfs filesystem.

              See btrfs-restore(8) for details.

          scrub
              Scrub a btrfs filesystem.

              See btrfs-scrub(8) for details.

          send
              Send subvolume data to stdout/file for backup and etc.

              See btrfs-send(8) for details.

          subvolume
              Create/delete/list/manage btrfs subvolume.

              See btrfs-subvolume(8) for details.


-------------------------------------------------------------------------

::

          New functionality could be provided using a standalone tool. If
          the functionality proves to be useful, then the standalone tool
          is declared obsolete and its functionality is copied to the main
          tool. Obsolete tools are removed after a long (years)
          depreciation period.

          Tools that are still in active use without an equivalent in
          btrfs:

          btrfs-convert
              in-place conversion from ext2/3/4 filesystems to btrfs

          btrfstune
              tweak some filesystem properties on a unmounted filesystem

          btrfs-select-super
              rescue tool to overwrite primary superblock from a spare copy

          btrfs-find-root
              rescue helper to find tree roots in a filesystem

          Deprecated and obsolete tools:

          btrfs-debug-tree
              moved to btrfs inspect-internal dump-tree. Removed from
              source distribution.

          btrfs-show-super
              moved to btrfs inspect-internal dump-super, standalone
              removed.

          btrfs-zero-log
              moved to btrfs rescue zero-log, standalone removed.

          For space-constrained environments, it’s possible to build a
          single binary with functionality of several standalone tools.
          This is following the concept of busybox where the file name
          selects the functionality. This works for symlinks or hardlinks.
          The full list can be obtained by btrfs help --box.


---------------------------------------------------------------

::

          btrfs returns a zero exit status if it succeeds. Non zero is
          returned in case of failure.


-----------------------------------------------------------------

::

          btrfs is part of btrfs-progs. Please refer to the btrfs wiki
          http://btrfs.wiki.kernel.org for further details.


---------------------------------------------------------

::

          btrfs(5), btrfs-balance(8), btrfs-check(8), btrfs-convert(8),
          btrfs-device(8), btrfs-filesystem(8), btrfs-inspect-internal(8),
          btrfs-property(8), btrfs-qgroup(8), btrfs-quota(8),
          btrfs-receive(8), btrfs-replace(8), btrfs-rescue(8),
          btrfs-restore(8), btrfs-scrub(8), btrfs-send(8),
          btrfs-subvolume(8), btrfstune(8), mkfs.btrfs(8)

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

   Btrfs v4.6.1                   05/16/2020                       BTRFS(8)

--------------

Pages that refer to this page:
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`org.freedesktop.import1(5) <../man5/org.freedesktop.import1.5.html>`__, 
`fsck.btrfs(8) <../man8/fsck.btrfs.8.html>`__, 
`mkfs.btrfs(8) <../man8/mkfs.btrfs.8.html>`__, 
`systemd-gpt-auto-generator(8) <../man8/systemd-gpt-auto-generator.8.html>`__

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
