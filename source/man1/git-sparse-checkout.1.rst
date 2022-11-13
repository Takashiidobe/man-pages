.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-sparse-checkout(1) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `SPAR                             |                                   |
| SE CHECKOUT <#SPARSE_CHECKOUT>`__ |                                   |
| \|                                |                                   |
| `FULL P                           |                                   |
| ATTERN SET <#FULL_PATTERN_SET>`__ |                                   |
| \|                                |                                   |
| `CONE P                           |                                   |
| ATTERN SET <#CONE_PATTERN_SET>`__ |                                   |
| \| `SUBMODULES <#SUBMODULES>`__   |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-SPARSE-CHECKOU(1)          Git Manual          GIT-SPARSE-CHECKOU(1)

NAME
-------------------------------------------------

::

          git-sparse-checkout - Initialize and modify the sparse-checkout
          configuration, which reduces the checkout to a set of paths given
          by a list of patterns.


---------------------------------------------------------

::

          git sparse-checkout <subcommand> [options]


---------------------------------------------------------------

::

          Initialize and modify the sparse-checkout configuration, which
          reduces the checkout to a set of paths given by a list of
          patterns.

          THIS COMMAND IS EXPERIMENTAL. ITS BEHAVIOR, AND THE BEHAVIOR OF
          OTHER COMMANDS IN THE PRESENCE OF SPARSE-CHECKOUTS, WILL LIKELY
          CHANGE IN THE FUTURE.


---------------------------------------------------------

::

          list
              Describe the patterns in the sparse-checkout file.

          init
              Enable the core.sparseCheckout setting. If the
              sparse-checkout file does not exist, then populate it with
              patterns that match every file in the root directory and no
              other directories, then will remove all directories tracked
              by Git. Add patterns to the sparse-checkout file to
              repopulate the working directory.

              To avoid interfering with other worktrees, it first enables
              the extensions.worktreeConfig setting and makes sure to set
              the core.sparseCheckout setting in the worktree-specific
              config file.

              When --cone is provided, the core.sparseCheckoutCone setting
              is also set, allowing for better performance with a limited
              set of patterns (see CONE PATTERN SET below).

              Use the --[no-]sparse-index option to toggle the use of the
              sparse index format. This reduces the size of the index to be
              more closely aligned with your sparse-checkout definition.
              This can have significant performance advantages for commands
              such as git status or git add. This feature is still
              experimental. Some commands might be slower with a sparse
              index until they are properly integrated with the feature.

              WARNING: Using a sparse index requires modifying the index in
              a way that is not completely understood by external tools. If
              you have trouble with this compatibility, then run git
              sparse-checkout init --no-sparse-index to rewrite your index
              to not be sparse. Older versions of Git will not understand
              the sparse directory entries index extension and may fail to
              interact with your repository until it is disabled.

          set
              Write a set of patterns to the sparse-checkout file, as given
              as a list of arguments following the set subcommand. Update
              the working directory to match the new patterns. Enable the
              core.sparseCheckout config setting if it is not already
              enabled.

              When the --stdin option is provided, the patterns are read
              from standard in as a newline-delimited list instead of from
              the arguments.

              When core.sparseCheckoutCone is enabled, the input list is
              considered a list of directories instead of sparse-checkout
              patterns. The command writes patterns to the sparse-checkout
              file to include all files contained in those directories
              (recursively) as well as files that are siblings of ancestor
              directories. The input format matches the output of git
              ls-tree --name-only. This includes interpreting pathnames
              that begin with a double quote (") as C-style quoted strings.

          add
              Update the sparse-checkout file to include additional
              patterns. By default, these patterns are read from the
              command-line arguments, but they can be read from stdin using
              the --stdin option. When core.sparseCheckoutCone is enabled,
              the given patterns are interpreted as directory names as in
              the set subcommand.

          reapply
              Reapply the sparsity pattern rules to paths in the working
              tree. Commands like merge or rebase can materialize paths to
              do their work (e.g. in order to show you a conflict), and
              other sparse-checkout commands might fail to sparsify an
              individual file (e.g. because it has unstaged changes or
              conflicts). In such cases, it can make sense to run git
              sparse-checkout reapply later after cleaning up affected
              paths (e.g. resolving conflicts, undoing or committing
              changes, etc.).

          disable
              Disable the core.sparseCheckout config setting, and restore
              the working directory to include all files. Leaves the
              sparse-checkout file intact so a later git sparse-checkout
              init command may return the working directory to the same
              state.


-----------------------------------------------------------------------

::

          "Sparse checkout" allows populating the working directory
          sparsely. It uses the skip-worktree bit (see git-update-index(1))
          to tell Git whether a file in the working directory is worth
          looking at. If the skip-worktree bit is set, then the file is
          ignored in the working directory. Git will not populate the
          contents of those files, which makes a sparse checkout helpful
          when working in a repository with many files, but only a few are
          important to the current user.

          The $GIT_DIR/info/sparse-checkout file is used to define the
          skip-worktree reference bitmap. When Git updates the working
          directory, it updates the skip-worktree bits in the index based
          on this file. The files matching the patterns in the file will
          appear in the working directory, and the rest will not.

          To enable the sparse-checkout feature, run git sparse-checkout
          init to initialize a simple sparse-checkout file and enable the
          core.sparseCheckout config setting. Then, run git sparse-checkout
          set to modify the patterns in the sparse-checkout file.

          To repopulate the working directory with all files, use the git
          sparse-checkout disable command.


-------------------------------------------------------------------------

::

          By default, the sparse-checkout file uses the same syntax as
          .gitignore files.

          While $GIT_DIR/info/sparse-checkout is usually used to specify
          what files are included, you can also specify what files are not
          included, using negative patterns. For example, to remove the
          file unwanted:

              /*
              !unwanted


-------------------------------------------------------------------------

::

          The full pattern set allows for arbitrary pattern matches and
          complicated inclusion/exclusion rules. These can result in O(N*M)
          pattern matches when updating the index, where N is the number of
          patterns and M is the number of paths in the index. To combat
          this performance issue, a more restricted pattern set is allowed
          when core.sparseCheckoutCone is enabled.

          The accepted patterns in the cone pattern set are:

           1. Recursive: All paths inside a directory are included.

           2. Parent: All files immediately inside a directory are
              included.

          In addition to the above two patterns, we also expect that all
          files in the root directory are included. If a recursive pattern
          is added, then all leading directories are added as parent
          patterns.

          By default, when running git sparse-checkout init, the root
          directory is added as a parent pattern. At this point, the
          sparse-checkout file contains the following patterns:

              /*
              !/*/

          This says "include everything in root, but nothing two levels
          below root."

          When in cone mode, the git sparse-checkout set subcommand takes a
          list of directories instead of a list of sparse-checkout
          patterns. In this mode, the command git sparse-checkout set A/B/C
          sets the directory A/B/C as a recursive pattern, the directories
          A and A/B are added as parent patterns. The resulting
          sparse-checkout file is now

              /*
              !/*/
              /A/
              !/A/*/
              /A/B/
              !/A/B/*/
              /A/B/C/

          Here, order matters, so the negative patterns are overridden by
          the positive patterns that appear lower in the file.

          If core.sparseCheckoutCone=true, then Git will parse the
          sparse-checkout file expecting patterns of these types. Git will
          warn if the patterns do not match. If the patterns do match the
          expected format, then Git will use faster hash- based algorithms
          to compute inclusion in the sparse-checkout.

          In the cone mode case, the git sparse-checkout list subcommand
          will list the directories that define the recursive patterns. For
          the example sparse-checkout file above, the output is as follows:

              $ git sparse-checkout list
              A/B/C

          If core.ignoreCase=true, then the pattern-matching algorithm will
          use a case-insensitive check. This corrects for case mismatched
          filenames in the git sparse-checkout set command to reflect the
          expected cone in the working directory.


-------------------------------------------------------------

::

          If your repository contains one or more submodules, then
          submodules are populated based on interactions with the git
          submodule command. Specifically, git submodule init -- <path>
          will ensure the submodule at <path> is present, while git
          submodule deinit [-f] -- <path> will remove the files for the
          submodule at <path> (including any untracked files, uncommitted
          changes, and unpushed history). Similar to how sparse-checkout
          removes files from the working tree but still leaves entries in
          the index, deinitialized submodules are removed from the working
          directory but still have an entry in the index.

          Since submodules may have unpushed changes or untracked files,
          removing them could result in data loss. Thus, changing sparse
          inclusion/exclusion rules will not cause an already checked out
          submodule to be removed from the working copy. Said another way,
          just as checkout will not cause submodules to be automatically
          removed or initialized even when switching between branches that
          remove or add submodules, using sparse-checkout to reduce or
          expand the scope of "interesting" files will not cause submodules
          to be automatically deinitialized or initialized either.

          Further, the above facts mean that there are multiple reasons
          that "tracked" files might not be present in the working copy:
          sparsity pattern application from sparse-checkout, and submodule
          initialization state. Thus, commands like git grep that work on
          tracked files in the working copy may return results that are
          limited by either or both of these restrictions.


---------------------------------------------------------

::

          git-read-tree(1) gitignore(5)


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

   Git 2.33.0.69.gc420321         08/27/2021          GIT-SPARSE-CHECKOU(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`git-read-tree(1) <../man1/git-read-tree.1.html>`__, 
`git-rm(1) <../man1/git-rm.1.html>`__

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
