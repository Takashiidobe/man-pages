.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs-image(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS-IMAGE(8)                Btrfs Manual                BTRFS-IMAGE(8)

NAME
-------------------------------------------------

::

          btrfs-image - create/restore an image of the filesystem


---------------------------------------------------------

::

          btrfs-image [options] <source> <target>


---------------------------------------------------------------

::

          btrfs-image is used to create an image of a btrfs filesystem. All
          data will be zeroed, but metadata and the like is preserved.
          Mainly used for debugging purposes.

          In the dump mode, source is the btrfs device/file and target is
          the output file (use - for stdout).

          In the restore mode (option -r), source is the dumped image and
          target is the btrfs device/file.


-------------------------------------------------------

::

          -r
              Restore metadump image. By default, this fixes super’s chunk
              tree, by using 1 stripe pointing to primary device, so that
              file system can be restored by running tree log reply if
              possible. To restore without changing number of stripes in
              chunk tree check -o option.

          -c <value>
              Compression level (0 ~ 9).

          -t <value>
              Number of threads (1 ~ 32) to be used to process the image
              dump or restore.

          -o
              Use the old restore method, this does not fixup the chunk
              tree so the restored file system will not be able to be
              mounted.

          -s
              Sanitize the file names when generating the image. One -s
              means just generate random garbage, which means that the
              directory indexes won’t match up since the hashes won’t match
              with the garbage filenames. Using -ss will calculate a
              collision for the filename so that the hashes match, and if
              it can’t calculate a collision then it will just generate
              garbage. The collision calculator is very time and CPU
              intensive so only use it if you are having problems with your
              file system tree and need to have it mostly working.

          -w
              Walk all the trees manually and copy any blocks that are
              referenced. Use this option if your extent tree is corrupted
              to make sure that all of the metadata is captured.

          -m
              Restore for multiple devices, more than 1 device should be
              provided.


---------------------------------------------------------------

::

          btrfs-image will return 0 if no error happened. If any problems
          happened, 1 will be returned.


---------------------------------------------------------

::

          mkfs.btrfs(8)

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

   Btrfs v4.6.1                   05/16/2020                 BTRFS-IMAGE(8)

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
