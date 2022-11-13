.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-multi-pack-index(1) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-MULTI-PACK-IN(1)           Git Manual           GIT-MULTI-PACK-IN(1)

NAME
-------------------------------------------------

::

          git-multi-pack-index - Write and verify multi-pack-indexes


---------------------------------------------------------

::

          git multi-pack-index [--object-dir=<dir>] [--[no-]progress]
                  [--preferred-pack=<pack>] <subcommand>


---------------------------------------------------------------

::

          Write or verify a multi-pack-index (MIDX) file.


-------------------------------------------------------

::

          --object-dir=<dir>
              Use given directory for the location of Git objects. We check
              <dir>/packs/multi-pack-index for the current MIDX file, and
              <dir>/packs for the pack-files to index.

          --[no-]progress
              Turn progress on/off explicitly. If neither is specified,
              progress is shown if standard error is connected to a
              terminal.

          The following subcommands are available:

          write
              Write a new MIDX file. The following options are available
              for the write sub-command:

              --preferred-pack=<pack>
                  Optionally specify the tie-breaking pack used when
                  multiple packs contain the same object. If not given,
                  ties are broken in favor of the pack with the lowest
                  mtime.

          verify
              Verify the contents of the MIDX file.

          expire
              Delete the pack-files that are tracked by the MIDX file, but
              have no objects referenced by the MIDX. Rewrite the MIDX file
              afterward to remove all references to these pack-files.

          repack
              Create a new pack-file containing objects in small pack-files
              referenced by the multi-pack-index. If the size given by the
              --batch-size=<size> argument is zero, then create a pack
              containing all objects referenced by the multi-pack-index.
              For a non-zero batch size, Select the pack-files by examining
              packs from oldest-to-newest, computing the "expected size" by
              counting the number of objects in the pack referenced by the
              multi-pack-index, then divide by the total number of objects
              in the pack and multiply by the pack size. We select packs
              with expected size below the batch size until the set of
              packs have total expected size at least the batch size, or
              all pack-files are considered. If only one pack-file is
              selected, then do nothing. If a new pack-file is created,
              rewrite the multi-pack-index to reference the new pack-file.
              A later run of git multi-pack-index expire will delete the
              pack-files that were part of this batch.

              If repack.packKeptObjects is false, then any pack-files with
              an associated .keep file will not be selected for the batch
              to repack.


---------------------------------------------------------

::

          •   Write a MIDX file for the packfiles in the current .git
              folder.

                  $ git multi-pack-index write

          •   Write a MIDX file for the packfiles in an alternate object
              store.

                  $ git multi-pack-index --object-dir <alt> write

          •   Verify the MIDX file for the packfiles in the current .git
              folder.

                  $ git multi-pack-index verify


---------------------------------------------------------

::

          See The Multi-Pack-Index Design Document[1] and The
          Multi-Pack-Index Format[2] for more information on the
          multi-pack-index feature.


-----------------------------------------------

::

          Part of the git(1) suite


---------------------------------------------------

::

           1. The Multi-Pack-Index Design Document
              file:///usr/local/share/doc/git/technical/multi-pack-index.html

           2. The Multi-Pack-Index Format
              file:///usr/local/share/doc/git/technical/pack-format.html

COLOPHON
---------------------------------------------------------

::

          This page is part of the git (Git distributed version control
          system) project.  Information about the project can be found at
          ⟨http://git-scm.com/⟩.  If you have a bug report for this manual
          page, see ⟨http://git-scm.com/community⟩.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/git/git.git⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Git 2.33.0.69.gc420321         08/27/2021           GIT-MULTI-PACK-IN(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`git-maintenance(1) <../man1/git-maintenance.1.html>`__

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
