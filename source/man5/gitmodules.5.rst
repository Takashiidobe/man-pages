.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gitmodules(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GITMODULES(5)                  Git Manual                  GITMODULES(5)

NAME
-------------------------------------------------

::

          gitmodules - Defining submodule properties


---------------------------------------------------------

::

          $GIT_WORK_TREE/.gitmodules


---------------------------------------------------------------

::

          The .gitmodules file, located in the top-level directory of a Git
          working tree, is a text file with a syntax matching the
          requirements of git-config(1).

          The file contains one subsection per submodule, and the
          subsection value is the name of the submodule. The name is set to
          the path where the submodule has been added unless it was
          customized with the --name option of git submodule add. Each
          submodule section also contains the following required keys:

          submodule.<name>.path
              Defines the path, relative to the top-level directory of the
              Git working tree, where the submodule is expected to be
              checked out. The path name must not end with a /. All
              submodule paths must be unique within the .gitmodules file.

          submodule.<name>.url
              Defines a URL from which the submodule repository can be
              cloned. This may be either an absolute URL ready to be passed
              to git-clone(1) or (if it begins with ./ or ../) a location
              relative to the superproject’s origin repository.

          In addition, there are a number of optional keys:

          submodule.<name>.update
              Defines the default update procedure for the named submodule,
              i.e. how the submodule is updated by the git submodule update
              command in the superproject. This is only used by git
              submodule init to initialize the configuration variable of
              the same name. Allowed values here are checkout, rebase,
              merge or none. See description of update command in
              git-submodule(1) for their meaning. For security reasons, the
              !command form is not accepted here.

          submodule.<name>.branch
              A remote branch name for tracking updates in the upstream
              submodule. If the option is not specified, it defaults to the
              remote HEAD. A special value of .  is used to indicate that
              the name of the branch in the submodule should be the same
              name as the current branch in the current repository. See the
              --remote documentation in git-submodule(1) for details.

          submodule.<name>.fetchRecurseSubmodules
              This option can be used to control recursive fetching of this
              submodule. If this option is also present in the submodule’s
              entry in .git/config of the superproject, the setting there
              will override the one found in .gitmodules. Both settings can
              be overridden on the command line by using the
              --[no-]recurse-submodules option to git fetch and git pull.

          submodule.<name>.ignore
              Defines under what circumstances git status and the diff
              family show a submodule as modified. The following values are
              supported:

              all
                  The submodule will never be considered modified (but will
                  nonetheless show up in the output of status and commit
                  when it has been staged).

              dirty
                  All changes to the submodule’s work tree will be ignored,
                  only committed differences between the HEAD of the
                  submodule and its recorded state in the superproject are
                  taken into account.

              untracked
                  Only untracked files in submodules will be ignored.
                  Committed differences and modifications to tracked files
                  will show up.

              none
                  No modifications to submodules are ignored, all of
                  committed differences, and modifications to tracked and
                  untracked files are shown. This is the default option.

              If this option is also present in the submodule’s entry in
              .git/config of the superproject, the setting there will
              override the one found in .gitmodules.

              Both settings can be overridden on the command line by using
              the --ignore-submodules option. The git submodule commands
              are not affected by this setting.

          submodule.<name>.shallow
              When set to true, a clone of this submodule will be performed
              as a shallow clone (with a history depth of 1) unless the
              user explicitly asks for a non-shallow clone.


---------------------------------------------------

::

          Git does not allow the .gitmodules file within a working tree to
          be a symbolic link, and will refuse to check out such a tree
          entry. This keeps behavior consistent when the file is accessed
          from the index or a tree versus from the filesystem, and helps
          Git reliably enforce security checks of the file contents.


---------------------------------------------------------

::

          Consider the following .gitmodules file:

              [submodule "libfoo"]
                      path = include/foo
                      url = git://foo.com/git/lib.git

              [submodule "libbar"]
                      path = include/bar
                      url = git://bar.com/git/lib.git

          This defines two submodules, libfoo and libbar. These are
          expected to be checked out in the paths include/foo and
          include/bar, and for both submodules a URL is specified which can
          be used for cloning the submodules.


---------------------------------------------------------

::

          git-submodule(1), gitsubmodules(7), git-config(1)


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

   Git 2.33.0.69.gc420321         08/27/2021                  GITMODULES(5)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-commit(1) <../man1/git-commit.1.html>`__, 
`git-commit-tree(1) <../man1/git-commit-tree.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`git-diff(1) <../man1/git-diff.1.html>`__, 
`git-diff-files(1) <../man1/git-diff-files.1.html>`__, 
`git-diff-index(1) <../man1/git-diff-index.1.html>`__, 
`git-diff-tree(1) <../man1/git-diff-tree.1.html>`__, 
`git-fetch(1) <../man1/git-fetch.1.html>`__, 
`git-format-patch(1) <../man1/git-format-patch.1.html>`__, 
`git-log(1) <../man1/git-log.1.html>`__, 
`git-mv(1) <../man1/git-mv.1.html>`__, 
`git-pull(1) <../man1/git-pull.1.html>`__, 
`git-rm(1) <../man1/git-rm.1.html>`__, 
`git-show(1) <../man1/git-show.1.html>`__, 
`git-status(1) <../man1/git-status.1.html>`__, 
`git-submodule(1) <../man1/git-submodule.1.html>`__, 
`gitsubmodules(7) <../man7/gitsubmodules.7.html>`__

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
