.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-sh-setup(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FUNCTIONS <#FUNCTIONS>`__ \|     |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-SH-SETUP(1)                Git Manual                GIT-SH-SETUP(1)

NAME
-------------------------------------------------

::

          git-sh-setup - Common Git shell script setup code


---------------------------------------------------------

::

          . "$(git --exec-path)/git-sh-setup"


---------------------------------------------------------------

::

          This is not a command the end user would want to run. Ever. This
          documentation is meant for people who are studying the
          Porcelain-ish scripts and/or are writing new ones.

          The git sh-setup scriptlet is designed to be sourced (using .) by
          other shell scripts to set up some variables pointing at the
          normal Git directories and a few helper shell functions.

          Before sourcing it, your script should set up a few variables;
          USAGE (and LONG_USAGE, if any) is used to define message given by
          usage() shell function. SUBDIRECTORY_OK can be set if the script
          can run from a subdirectory of the working tree (some commands do
          not).

          The scriptlet sets GIT_DIR and GIT_OBJECT_DIRECTORY shell
          variables, but does not export them to the environment.


-----------------------------------------------------------

::

          die
              exit after emitting the supplied error message to the
              standard error stream.

          usage
              die with the usage message.

          set_reflog_action
              Set GIT_REFLOG_ACTION environment to a given string
              (typically the name of the program) unless it is already set.
              Whenever the script runs a git command that updates refs, a
              reflog entry is created using the value of this string to
              leave the record of what command updated the ref.

          git_editor
              runs an editor of user’s choice (GIT_EDITOR, core.editor,
              VISUAL or EDITOR) on a given file, but error out if no editor
              is specified and the terminal is dumb.

          is_bare_repository
              outputs true or false to the standard output stream to
              indicate if the repository is a bare repository (i.e. without
              an associated working tree).

          cd_to_toplevel
              runs chdir to the toplevel of the working tree.

          require_work_tree
              checks if the current directory is within the working tree of
              the repository, and otherwise dies.

          require_work_tree_exists
              checks if the working tree associated with the repository
              exists, and otherwise dies. Often done before calling
              cd_to_toplevel, which is impossible to do if there is no
              working tree.

          require_clean_work_tree <action> [<hint>]
              checks that the working tree and index associated with the
              repository have no uncommitted changes to tracked files.
              Otherwise it emits an error message of the form Cannot
              <action>: <reason>. <hint>, and dies. Example:

                  require_clean_work_tree rebase "Please commit or stash them."

          get_author_ident_from_commit
              outputs code for use with eval to set the GIT_AUTHOR_NAME,
              GIT_AUTHOR_EMAIL and GIT_AUTHOR_DATE variables for a given
              commit.

          create_virtual_base
              modifies the first file so only lines in common with the
              second file remain. If there is insufficient common material,
              then the first file is left empty. The result is suitable as
              a virtual base input for a 3-way merge.


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

   Git 2.33.0.69.gc420321         08/27/2021                GIT-SH-SETUP(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__

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
