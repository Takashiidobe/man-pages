.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-pack-refs(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-PACK-REFS(1)               Git Manual               GIT-PACK-REFS(1)

NAME
-------------------------------------------------

::

          git-pack-refs - Pack heads and tags for efficient repository
          access


---------------------------------------------------------

::

          git pack-refs [--all] [--no-prune]


---------------------------------------------------------------

::

          Traditionally, tips of branches and tags (collectively known as
          refs) were stored one file per ref in a (sub)directory under
          $GIT_DIR/refs directory. While many branch tips tend to be
          updated often, most tags and some branch tips are never updated.
          When a repository has hundreds or thousands of tags, this
          one-file-per-ref format both wastes storage and hurts
          performance.

          This command is used to solve the storage and performance problem
          by storing the refs in a single file, $GIT_DIR/packed-refs. When
          a ref is missing from the traditional $GIT_DIR/refs directory
          hierarchy, it is looked up in this file and used if found.

          Subsequent updates to branches always create new files under
          $GIT_DIR/refs directory hierarchy.

          A recommended practice to deal with a repository with too many
          refs is to pack its refs with --all once, and occasionally run
          git pack-refs. Tags are by definition stationary and are not
          expected to change. Branch heads will be packed with the initial
          pack-refs --all, but only the currently active branch heads will
          become unpacked, and the next pack-refs (without --all) will
          leave them unpacked.


-------------------------------------------------------

::

          --all
              The command by default packs all tags and refs that are
              already packed, and leaves other refs alone. This is because
              branches are expected to be actively developed and packing
              their tips does not help performance. This option causes
              branch tips to be packed as well. Useful for a repository
              with many branches of historical interests.

          --no-prune
              The command usually removes loose refs under $GIT_DIR/refs
              hierarchy after packing them. This option tells it not to.


-------------------------------------------------

::

          Older documentation written before the packed-refs mechanism was
          introduced may still say things like ".git/refs/heads/<branch>
          file exists" when it means "branch <branch> exists".


-----------------------------------------------

::

          Part of the git(1) suite

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

   Git 2.33.0.69.gc420321         08/27/2021               GIT-PACK-REFS(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-maintenance(1) <../man1/git-maintenance.1.html>`__, 
`gitrepository-layout(5) <../man5/gitrepository-layout.5.html>`__, 
`gitglossary(7) <../man7/gitglossary.7.html>`__

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
