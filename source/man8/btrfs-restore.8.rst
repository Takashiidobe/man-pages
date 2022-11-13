.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs-restore(8) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS-RESTORE(8)              Btrfs Manual              BTRFS-RESTORE(8)

NAME
-------------------------------------------------

::

          btrfs-restore - try to restore files from a damaged btrfs
          filesystem image


---------------------------------------------------------

::

          btrfs restore [options] <device> <path> | -l <device>


---------------------------------------------------------------

::

          btrfs restore is used to try to salvage files from a damaged
          filesystem and restore them into <path> or just list the
          subvolume tree roots. The filesystem image is not modified.

          If the filesystem is damaged and cannot be repaired by the other
          tools (btrfs-check(8) or btrfs-rescue(8)), btrfs restore could be
          used to retrieve file data, as far as the metadata are readable.
          The checks done by restore are less strict and the process is
          usually able to get far enough to retrieve data from the whole
          filesystem. This comes at a cost that some data might be
          incomplete or from older versions if they’re available.

          There are several options to attempt restoration of various file
          metadata type. You can try a dry run first to see how well the
          process goes and use further options to extend the set of
          restored metadata.

          For images with damaged tree structures, there are several
          options to point the process to some spare copy.

              Note
              It is recommended to read the following btrfs wiki page if
              your data is not salvaged with default option:
              https://btrfs.wiki.kernel.org/index.php/Restore 


-------------------------------------------------------

::

          -s|--snapshots
              get also snapshots that are skipped by default

          -x|--xattr
              get extended attributes

          -m|--metadata
              restore owner, mode and times for files and directories

          -S|--symlinks
              restore symbolic links as well as normal files

          -i|--ignore-errors
              ignore errors during restoration and continue

          -o|--overwrite
              overwrite directories/files in <path>, eg. for repeated runs

          -t <bytenr>
              use <bytenr> to read the root tree

          -f <bytenr>
              only restore files that are under specified subvolume root
              pointed by <bytenr>

          -u|--super <mirror>
              use given superblock mirror identified by <mirror>, it can be
              0,1 or 2

          -r|--root <rootid>
              only restore files that are under a specified subvolume whose
              objectid is <rootid>

          -d
              find directory

          -l|--list-roots
              list subvolume tree roots, can be used as argument for -r

          -D|--dry-run
              dry run (only list files that would be recovered)

          --path-regex <regex>
              restore only filenames matching a regular expression (‐
              regex(7)) with a mandatory format

              ^/(|home(|/username(|/Desktop(|/.*))))$

              The format is not very comfortable and restores all files in
              the directories in the whole path, so this is not useful for
              restoring single file in a deep hierarchy.

          -c
              ignore case (--path-regex only)

          -v|--verbose
              (deprecated) alias for global -v option

          Global options

          -v|--verbose
              be verbose and print what is being restored


---------------------------------------------------------------

::

          btrfs restore returns a zero exit status if it succeeds. Non zero
          is returned in case of failure.


-----------------------------------------------------------------

::

          btrfs is part of btrfs-progs. Please refer to the btrfs wiki
          http://btrfs.wiki.kernel.org for further details.


---------------------------------------------------------

::

          mkfs.btrfs(8), btrfs-rescue(8), btrfs-check(8)

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

   Btrfs v4.6.1                   07/14/2020               BTRFS-RESTORE(8)

--------------

Pages that refer to this page: `btrfs(8) <../man8/btrfs.8.html>`__

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
