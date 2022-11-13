.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-mv(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SUBMODULES <#SUBMODULES>`__ \|   |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-MV(1)                      Git Manual                      GIT-MV(1)

NAME
-------------------------------------------------

::

          git-mv - Move or rename a file, a directory, or a symlink


---------------------------------------------------------

::

          git mv <options>... <args>...


---------------------------------------------------------------

::

          Move or rename a file, directory or symlink.

              git mv [-v] [-f] [-n] [-k] <source> <destination>
              git mv [-v] [-f] [-n] [-k] <source> ... <destination directory>

          In the first form, it renames <source>, which must exist and be
          either a file, symlink or directory, to <destination>. In the
          second form, the last argument has to be an existing directory;
          the given sources will be moved into this directory.

          The index is updated after successful completion, but the change
          must still be committed.


-------------------------------------------------------

::

          -f, --force
              Force renaming or moving of a file even if the target exists

          -k
              Skip move or rename actions which would lead to an error
              condition. An error happens when a source is neither existing
              nor controlled by Git, or when it would overwrite an existing
              file unless -f is given.

          -n, --dry-run
              Do nothing; only show what would happen

          -v, --verbose
              Report the names of files as they are moved.


-------------------------------------------------------------

::

          Moving a submodule using a gitfile (which means they were cloned
          with a Git version 1.7.8 or newer) will update the gitfile and
          core.worktree setting to make the submodule work in the new
          location. It also will attempt to update the
          submodule.<name>.path setting in the gitmodules(5) file and stage
          that file (unless -n is used).


-------------------------------------------------

::

          Each time a superproject update moves a populated submodule (e.g.
          when switching between commits before and after the move) a stale
          submodule checkout will remain in the old location and an empty
          directory will appear in the new location. To populate the
          submodule again in the new location the user will have to run
          "git submodule update" afterwards. Removing the old directory is
          only safe when it uses a gitfile, as otherwise the history of the
          submodule will be deleted too. Both steps will be obsolete when
          recursive submodule update has been implemented.


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

   Git 2.33.0.69.gc420321         08/27/2021                      GIT-MV(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-add(1) <../man1/git-add.1.html>`__, 
`git-commit(1) <../man1/git-commit.1.html>`__

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
