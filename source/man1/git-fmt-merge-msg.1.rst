.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-fmt-merge-msg(1) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-FMT-MERGE-MSG(1)           Git Manual           GIT-FMT-MERGE-MSG(1)

NAME
-------------------------------------------------

::

          git-fmt-merge-msg - Produce a merge commit message


---------------------------------------------------------

::

          git fmt-merge-msg [-m <message>] [--log[=<n>] | --no-log]
          git fmt-merge-msg [-m <message>] [--log[=<n>] | --no-log] -F <file>


---------------------------------------------------------------

::

          Takes the list of merged objects on stdin and produces a suitable
          commit message to be used for the merge commit, usually to be
          passed as the <merge-message> argument of git merge.

          This command is intended mostly for internal use by scripts
          automatically invoking git merge.


-------------------------------------------------------

::

          --log[=<n>]
              In addition to branch names, populate the log message with
              one-line descriptions from the actual commits that are being
              merged. At most <n> commits from each merge parent will be
              used (20 if <n> is omitted). This overrides the merge.log
              configuration variable.

          --no-log
              Do not list one-line descriptions from the actual commits
              being merged.

          --[no-]summary
              Synonyms to --log and --no-log; these are deprecated and will
              be removed in the future.

          -m <message>, --message <message>
              Use <message> instead of the branch names for the first line
              of the log message. For use with --log.

          -F <file>, --file <file>
              Take the list of merged objects from <file> instead of stdin.


-------------------------------------------------------------------

::

          merge.branchdesc
              In addition to branch names, populate the log message with
              the branch description text associated with them. Defaults to
              false.

          merge.log
              In addition to branch names, populate the log message with at
              most the specified number of one-line descriptions from the
              actual commits that are being merged. Defaults to false, and
              true is a synonym for 20.

          merge.suppressDest
              By adding a glob that matches the names of integration
              branches to this multi-valued configuration variable, the
              default merge message computed for merges into these
              integration branches will omit "into <branch name>" from its
              title.

              An element with an empty value can be used to clear the list
              of globs accumulated from previous configuration entries.
              When there is no merge.suppressDest variable defined, the
              default value of master is used for backward compatibility.

          merge.summary
              Synonym to merge.log; this is deprecated and will be removed
              in the future.


---------------------------------------------------------

::

              $ git fetch origin master
              $ git fmt-merge-msg --log <$GIT_DIR/FETCH_HEAD

          Print a log message describing a merge of the "master" branch
          from the "origin" remote.


---------------------------------------------------------

::

          git-merge(1)


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

   Git 2.33.0.69.gc420321         08/27/2021           GIT-FMT-MERGE-MSG(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-merge(1) <../man1/git-merge.1.html>`__, 
`git-pull(1) <../man1/git-pull.1.html>`__

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
