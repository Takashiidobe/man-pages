.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stg-branch(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `STGIT <#STGIT>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STG-BRANCH(1)                 StGit Manual                 STG-BRANCH(1)

NAME
-------------------------------------------------

::

          stg-branch - Branch operations: switch, list, create, rename,
          delete, ...


---------------------------------------------------------

::

          stg branch
          stg branch [--merge] [--] <branch>
          stg branch --list
          stg branch --create [--] <new-branch> [<committish>]
          stg branch --clone [--] [<new-branch>]
          stg branch --rename [--] [<old-name>] <new-name>
          stg branch --protect [--] [<branch>]
          stg branch --unprotect [--] [<branch>]
          stg branch --delete [--force] [--] <branch>
          stg branch --cleanup [--force] [--] [<branch>]
          stg branch --description=<description> [--] [<branch>]


---------------------------------------------------------------

::

          Create, clone, switch between, rename, or delete development
          branches within a git repository.

          stg branch
              Display the name of the current branch.

          stg branch <branch>
              Switch to the given branch.


-------------------------------------------------------

::

          -l, --list
              List each branch in the current repository, followed by its
              branch description (if any). The current branch is prefixed
              with >. Branches that have been initialized for StGit (with
              stg-init(1)) are prefixed with s. Protected branches are
              prefixed with p.

          -c, --create
              Create (and switch to) a new branch. The new branch is
              already initialized as an StGit patch stack, so you do not
              have to run stg-init(1) manually. If you give a committish
              argument, the new branch is based there; otherwise, it is
              based at the current HEAD.

              StGit will try to detect the branch off of which the new
              branch is forked, as well as the remote repository from which
              that parent branch is taken (if any), so that running
              stg-pull(1) will automatically pull new commits from the
              correct branch. It will warn if it cannot guess the parent
              branch (e.g. if you do not specify a branch name as
              committish).

          --clone
              Clone the current branch, under the name <new-branch> if
              specified, or using the current branch’s name plus a
              timestamp.

              The description of the new branch is set to tell it is a
              clone of the current branch. The parent information of the
              new branch is copied from the current branch.

          -r, --rename
              Rename an existing branch.

          -p, --protect
              Prevent StGit from modifying a branch — either the current
              one, or one named on the command line.

          -u, --unprotect
              Allow StGit to modify a branch — either the current one, or
              one named on the command line. This undoes the effect of an
              earlier stg branch --protect command.

          --delete
              Delete the named branch. If there are any patches left in the
              branch, StGit will refuse to delete it unless you give the
              --force flag.

              A protected branch cannot be deleted; it must be unprotected
              first (see --unprotect above).

              If you delete the current branch, you are switched to the
              "master" branch, if it exists.

          --cleanup
              Remove the StGit information for the current or given branch.
              If there are patches left in the branch, StGit refuses the
              operation unless --force is given.

              A protected branch cannot be cleaned up; it must be
              unprotected first (see --unprotect above).

              A cleaned up branch can be re-initialised using the stg init
              command.

          -d DESCRIPTION, --description DESCRIPTION
              Set the branch description.

          --merge
              Merge work tree changes into the other branch.

          --force
              Force a delete when the series is not empty.


---------------------------------------------------

::

          Part of the StGit suite - see stg(1)

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

   StGit 1.0-10-ga6b3             08/27/2021                  STG-BRANCH(1)

--------------

Pages that refer to this page: `stg(1) <../man1/stg.1.html>`__, 
`stg-clone(1) <../man1/stg-clone.1.html>`__

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
