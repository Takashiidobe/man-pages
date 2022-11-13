.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stg(1) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ST                               |                                   |
| GIT COMMANDS <#STGIT_COMMANDS>`__ |                                   |
| \|                                |                                   |
| `CONFIGURATION MECHAN             |                                   |
| ISM <#CONFIGURATION_MECHANISM>`__ |                                   |
| \| `TEMPLATES <#TEMPLATES>`__ \|  |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STG(1)                        StGit Manual                        STG(1)

NAME
-------------------------------------------------

::

          stg - Manage stacks of patches using the Git content tracker


---------------------------------------------------------

::

          stg [--version | --help]
          stg [--help <command> | <command> --help]
          stg <command> [COMMAND OPTIONS] [ARGS]


---------------------------------------------------------------

::

          StGit (Stacked Git) is an application that provides a convenient
          way to maintain a patch stack on top of a Git branch:

          •   The topmost (most recent) commits of a branch are given
              names. Such a named commit is called a patch.

          •   After making changes to the worktree, you can incorporate the
              changes into an existing patch; this is called refreshing.
              You may refresh any patch, not just the topmost one.

          •   You can pop a patch: temporarily putting it aside, so that
              the patch below it becomes the topmost patch. Later you may
              push it onto the stack again. Pushing and popping can be used
              to reorder patches.

          •   You can easily rebase your patch stack on top of any other
              Git commit. (The base of a patch stack is the most recent Git
              commit that is not an StGit patch.) For example, if you
              started making patches on top of someone else’s branch, and
              that person publishes an updated branch, you can take all
              your patches and apply them on top of the updated branch.

          •   As you would expect, changing what is below a patch can cause
              that patch to no longer apply cleanly — this can occur when
              you reorder patches, rebase patches, or refresh a non-topmost
              patch. StGit uses Git’s rename-aware three-way merge
              capability to automatically fix up what it can; if it still
              fails, it lets you manually resolve the conflict just like
              you would resolve a merge conflict in Git.

          •   The patch stack is just some extra metadata attached to
              regular Git commits, so you can continue to use most Git
              tools along with StGit.

      Typical uses
          Tracking branch
              Tracking changes from a remote branch, while maintaining
              local modifications against that branch, possibly with the
              intent of sending some patches upstream. You can modify your
              patch stack as much as you want, and when your patches are
              finally accepted upstream, the permanent recorded Git history
              will contain just the final sequence of patches, and not the
              messy sequence of edits that produced them.

              Commands of interest in this workflow are e.g. rebase and
              mail.

          Development branch
              Even if you have no "upstream" to send patches to, you can
              use StGit as a convenient way to modify the recent history of
              a Git branch. For example, instead of first committing change
              A, then change B, and then A2 to fix A because it wasn’t
              quite right, you could incorporate the fix directly into A.
              This way of working results in a much more readable Git
              history than if you had immortalized every misstep you made
              on your way to the right solution.

              Commands of interest in this workflow are e.g. uncommit,
              which can be used to move the patch stack base downwards —
              i.e., turn Git commits into StGit patches after the fact —
              and commit, its inverse.

          For more information, see the tutorial[1].

      Specifying patches
          Many StGit commands take references to StGit patches as
          arguments. Patches in the stack are identified with short names,
          each of which must be unique in the stack.

          Patches in the current branch are simply referred to by their
          name. Some commands allow you to specify a patch in another
          branch of the repository; this is done by prefixing the patch
          name with the branch name and a colon (e.g.
          otherbranch:thatpatch).

      Specifying commits
          Some StGit commands take Git commits as arguments. StGit accepts
          all commit expressions that Git does; and in addition, a patch
          name (optionally prefixed by a branch name and a colon) is
          allowed in this context. The usual Git modifiers ^ and ~ are also
          allowed; e.g., abranch:apatch~2 is the grandparent of the commit
          that is the patch apatch on branch abranch.

          Instead of a patch name, you can say {base} to refer to the stack
          base (the commit just below the bottommost patch); so,
          abranch:{base} is the base of the stack in branch abranch.

          If you need to pass a given StGit reference to a Git command,
          stg-id(1) will convert it to a Git commit id for you.


-------------------------------------------------------

::

          The following generic option flags are available. Additional
          options are available for (and documented with) the different
          subcommands.

          --version
              Prints the StGit version, as well as version of other
              components used, such as Git and Python.

          --help
              Prints the synopsis and a list of all subcommands. If an
              StGit subcommand is given, prints the synposis for that
              subcommand.


---------------------------------------------------------------------

::

          We divide StGit commands in thematic groups, according to the
          primary type of object they create or change.

          Here is a short description of each command. A more detailed
          description is available in individual command manpages. Those
          manpages are named stg-<command>(1).

      Repository commands
          stg-clone(1)
              Make a local clone of a remote repository

          stg-id(1)
              Print the git hash value of a StGit reference

      Stack (branch) commands
          stg-branch(1)
              Branch operations: switch, list, create, rename, delete, ...

          stg-clean(1)
              Delete the empty patches in the series

          stg-commit(1)
              Permanently store the applied patches into the stack base

          stg-float(1)
              Push patches to the top, even if applied

          stg-goto(1)
              Push or pop patches to the given one

          stg-hide(1)
              Hide a patch in the series

          stg-init(1)
              Initialise the current branch for use with StGIT

          stg-log(1)
              Display or optionally clear the patch changelog

          stg-next(1)
              Print the name of the next patch

          stg-patches(1)
              Show the applied patches modifying a file

          stg-pop(1)
              Pop one or more patches from the stack

          stg-prev(1)
              Print the name of the previous patch

          stg-pull(1)
              Pull changes from a remote repository

          stg-push(1)
              Push one or more patches onto the stack

          stg-rebase(1)
              Move the stack base to another point in history

          stg-redo(1)
              Undo the last undo operation

          stg-repair(1)
              Fix StGit metadata if branch was modified with git commands

          stg-reset(1)
              Reset the patch stack to an earlier state

          stg-series(1)
              Print the patch series

          stg-sink(1)
              Send patches deeper down the stack

          stg-squash(1)
              Squash two or more patches into one

          stg-top(1)
              Print the name of the top patch

          stg-uncommit(1)
              Turn regular git commits into StGit patches

          stg-undo(1)
              Undo the last operation

          stg-unhide(1)
              Unhide a hidden patch

      Patch commands
          stg-delete(1)
              Delete patches

          stg-edit(1)
              Edit a patch description or diff

          stg-export(1)
              Export patches to a directory

          stg-files(1)
              Show the files modified by a patch (or the current patch)

          stg-fold(1)
              Integrate a GNU diff patch into the current patch

          stg-import(1)
              Import a GNU diff file as a new patch

          stg-mail(1)
              Send a patch or series of patches by e-mail

          stg-new(1)
              Create a new, empty patch

          stg-pick(1)
              Import a patch from a different branch or a commit object

          stg-refresh(1)
              Generate a new commit for the current patch

          stg-rename(1)
              Rename a patch

          stg-show(1)
              Show the commit corresponding to a patch

          stg-sync(1)
              Synchronise patches with a branch or a series

      Index/worktree commands
          stg-diff(1)
              Show the tree diff


---------------------------------------------------------------------------------------

::

          StGit uses the same configuration mechanism as Git. See git(7)
          for more details.


-----------------------------------------------------------

::

          A number of StGit commands make use of template files to provide
          useful default texts to be edited by the user. These <name>.tmpl
          template files are searched in the following directories:

           1. $GITDIR/ (in practice, the .git/ directory in your
              repository)

           2. $HOME/.stgit/templates/

           3. /usr/share/stgit/templates/


---------------------------------------------------

::

           1. tutorial
              https://stacked-git.github.io/guides/tutorial

COLOPHON
---------------------------------------------------------

::

          This page is part of the stgit (Stacked Git) project.
          Information about the project can be found at 
          ⟨http://www.procode.org/stgit/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.procode.org/stgit/⟩.  This page
          was obtained from the project's upstream Git repository
          ⟨http://repo.or.cz/stgit.git⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-04-20.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   StGit 1.0-10-ga6b3             08/27/2021                         STG(1)

--------------

Pages that refer to this page:
`stg-branch(1) <../man1/stg-branch.1.html>`__, 
`stg-clean(1) <../man1/stg-clean.1.html>`__, 
`stg-clone(1) <../man1/stg-clone.1.html>`__, 
`stg-commit(1) <../man1/stg-commit.1.html>`__, 
`stg-delete(1) <../man1/stg-delete.1.html>`__, 
`stg-diff(1) <../man1/stg-diff.1.html>`__, 
`stg-edit(1) <../man1/stg-edit.1.html>`__, 
`stg-export(1) <../man1/stg-export.1.html>`__, 
`stg-files(1) <../man1/stg-files.1.html>`__, 
`stg-float(1) <../man1/stg-float.1.html>`__, 
`stg-fold(1) <../man1/stg-fold.1.html>`__, 
`stg-goto(1) <../man1/stg-goto.1.html>`__, 
`stg-hide(1) <../man1/stg-hide.1.html>`__, 
`stg-id(1) <../man1/stg-id.1.html>`__, 
`stg-import(1) <../man1/stg-import.1.html>`__, 
`stg-init(1) <../man1/stg-init.1.html>`__, 
`stg-log(1) <../man1/stg-log.1.html>`__, 
`stg-mail(1) <../man1/stg-mail.1.html>`__, 
`stg-new(1) <../man1/stg-new.1.html>`__, 
`stg-next(1) <../man1/stg-next.1.html>`__, 
`stg-patches(1) <../man1/stg-patches.1.html>`__, 
`stg-pick(1) <../man1/stg-pick.1.html>`__, 
`stg-pop(1) <../man1/stg-pop.1.html>`__, 
`stg-prev(1) <../man1/stg-prev.1.html>`__, 
`stg-pull(1) <../man1/stg-pull.1.html>`__, 
`stg-push(1) <../man1/stg-push.1.html>`__, 
`stg-rebase(1) <../man1/stg-rebase.1.html>`__, 
`stg-redo(1) <../man1/stg-redo.1.html>`__, 
`stg-refresh(1) <../man1/stg-refresh.1.html>`__, 
`stg-rename(1) <../man1/stg-rename.1.html>`__, 
`stg-repair(1) <../man1/stg-repair.1.html>`__, 
`stg-reset(1) <../man1/stg-reset.1.html>`__, 
`stg-series(1) <../man1/stg-series.1.html>`__, 
`stg-show(1) <../man1/stg-show.1.html>`__, 
`stg-sink(1) <../man1/stg-sink.1.html>`__, 
`stg-squash(1) <../man1/stg-squash.1.html>`__, 
`stg-sync(1) <../man1/stg-sync.1.html>`__, 
`stg-top(1) <../man1/stg-top.1.html>`__, 
`stg-uncommit(1) <../man1/stg-uncommit.1.html>`__, 
`stg-undo(1) <../man1/stg-undo.1.html>`__, 
`stg-unhide(1) <../man1/stg-unhide.1.html>`__

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
