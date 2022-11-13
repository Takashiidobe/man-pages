.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-reflog(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-REFLOG(1)                  Git Manual                  GIT-REFLOG(1)

NAME
-------------------------------------------------

::

          git-reflog - Manage reflog information


---------------------------------------------------------

::

          git reflog <subcommand> <options>


---------------------------------------------------------------

::

          The command takes various subcommands, and different options
          depending on the subcommand:

              git reflog [show] [log-options] [<ref>]
              git reflog expire [--expire=<time>] [--expire-unreachable=<time>]
                      [--rewrite] [--updateref] [--stale-fix]
                      [--dry-run | -n] [--verbose] [--all [--single-worktree] | <refs>...]
              git reflog delete [--rewrite] [--updateref]
                      [--dry-run | -n] [--verbose] ref@{specifier}...
              git reflog exists <ref>

          Reference logs, or "reflogs", record when the tips of branches
          and other references were updated in the local repository.
          Reflogs are useful in various Git commands, to specify the old
          value of a reference. For example, HEAD@{2} means "where HEAD
          used to be two moves ago", master@{one.week.ago} means "where
          master used to point to one week ago in this local repository",
          and so on. See gitrevisions(7) for more details.

          This command manages the information recorded in the reflogs.

          The "show" subcommand (which is also the default, in the absence
          of any subcommands) shows the log of the reference provided in
          the command-line (or HEAD, by default). The reflog covers all
          recent actions, and in addition the HEAD reflog records branch
          switching. git reflog show is an alias for git log -g
          --abbrev-commit --pretty=oneline; see git-log(1) for more
          information.

          The "expire" subcommand prunes older reflog entries. Entries
          older than expire time, or entries older than expire-unreachable
          time and not reachable from the current tip, are removed from the
          reflog. This is typically not used directly by end users —
          instead, see git-gc(1).

          The "delete" subcommand deletes single entries from the reflog.
          Its argument must be an exact entry (e.g. "git reflog delete
          master@{2}"). This subcommand is also typically not used directly
          by end users.

          The "exists" subcommand checks whether a ref has a reflog. It
          exits with zero status if the reflog exists, and non-zero status
          if it does not.


-------------------------------------------------------

::

      Options for show
          git reflog show accepts any of the options accepted by git log.

      Options for expire
          --all
              Process the reflogs of all references.

          --single-worktree
              By default when --all is specified, reflogs from all working
              trees are processed. This option limits the processing to
              reflogs from the current working tree only.

          --expire=<time>
              Prune entries older than the specified time. If this option
              is not specified, the expiration time is taken from the
              configuration setting gc.reflogExpire, which in turn defaults
              to 90 days.  --expire=all prunes entries regardless of their
              age; --expire=never turns off pruning of reachable entries
              (but see --expire-unreachable).

          --expire-unreachable=<time>
              Prune entries older than <time> that are not reachable from
              the current tip of the branch. If this option is not
              specified, the expiration time is taken from the
              configuration setting gc.reflogExpireUnreachable, which in
              turn defaults to 30 days.  --expire-unreachable=all prunes
              unreachable entries regardless of their age;
              --expire-unreachable=never turns off early pruning of
              unreachable entries (but see --expire).

          --updateref
              Update the reference to the value of the top reflog entry
              (i.e. <ref>@{0}) if the previous top entry was pruned. (This
              option is ignored for symbolic references.)

          --rewrite
              If a reflog entry’s predecessor is pruned, adjust its "old"
              SHA-1 to be equal to the "new" SHA-1 field of the entry that
              now precedes it.

          --stale-fix
              Prune any reflog entries that point to "broken commits". A
              broken commit is a commit that is not reachable from any of
              the reference tips and that refers, directly or indirectly,
              to a missing commit, tree, or blob object.

              This computation involves traversing all the reachable
              objects, i.e. it has the same cost as git prune. It is
              primarily intended to fix corruption caused by garbage
              collecting using older versions of Git, which didn’t protect
              objects referred to by reflogs.

          -n, --dry-run
              Do not actually prune any entries; just show what would have
              been pruned.

          --verbose
              Print extra information on screen.

      Options for delete
          git reflog delete accepts options --updateref, --rewrite, -n,
          --dry-run, and --verbose, with the same meanings as when they are
          used with expire.


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

   Git 2.33.0.69.gc420321         08/27/2021                  GIT-REFLOG(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-gc(1) <../man1/git-gc.1.html>`__, 
`git-log(1) <../man1/git-log.1.html>`__, 
`git-prune(1) <../man1/git-prune.1.html>`__, 
`git-rebase(1) <../man1/git-rebase.1.html>`__, 
`git-reset(1) <../man1/git-reset.1.html>`__, 
`git-rev-list(1) <../man1/git-rev-list.1.html>`__, 
`git-shortlog(1) <../man1/git-shortlog.1.html>`__, 
`git-stash(1) <../man1/git-stash.1.html>`__, 
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
