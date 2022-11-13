.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-prune(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-PRUNE(1)                   Git Manual                   GIT-PRUNE(1)

NAME
-------------------------------------------------

::

          git-prune - Prune all unreachable objects from the object
          database


---------------------------------------------------------

::

          git prune [-n] [-v] [--progress] [--expire <time>] [--] [<head>...]


---------------------------------------------------------------

::

              Note
              In most cases, users should run git gc, which calls git
              prune. See the section "NOTES", below.

          This runs git fsck --unreachable using all the refs available in
          refs/, optionally with additional set of objects specified on the
          command line, and prunes all unpacked objects unreachable from
          any of these head objects from the object database. In addition,
          it prunes the unpacked objects that are also found in packs by
          running git prune-packed. It also removes entries from
          .git/shallow that are not reachable by any ref.

          Note that unreachable, packed objects will remain. If this is not
          desired, see git-repack(1).


-------------------------------------------------------

::

          -n, --dry-run
              Do not remove anything; just report what it would remove.

          -v, --verbose
              Report all removed objects.

          --progress
              Show progress.

          --expire <time>
              Only expire loose objects older than <time>.

          --
              Do not interpret any more arguments as options.

          <head>...
              In addition to objects reachable from any of our references,
              keep objects reachable from listed <head>s.


---------------------------------------------------------

::

          To prune objects not used by your repository or another that
          borrows from your repository via its
          .git/objects/info/alternates:

              $ git prune $(cd ../another && git rev-parse --all)


---------------------------------------------------

::

          In most cases, users will not need to call git prune directly,
          but should instead call git gc, which handles pruning along with
          many other housekeeping tasks.

          For a description of which objects are considered for pruning,
          see git fsck's --unreachable option.


---------------------------------------------------------

::

          git-fsck(1), git-gc(1), git-reflog(1)


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

   Git 2.33.0.69.gc420321         08/27/2021                   GIT-PRUNE(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-gc(1) <../man1/git-gc.1.html>`__

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
