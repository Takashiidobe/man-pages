.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-merge-file(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-MERGE-FILE(1)              Git Manual              GIT-MERGE-FILE(1)

NAME
-------------------------------------------------

::

          git-merge-file - Run a three-way file merge


---------------------------------------------------------

::

          git merge-file [-L <current-name> [-L <base-name> [-L <other-name>]]]
                  [--ours|--theirs|--union] [-p|--stdout] [-q|--quiet] [--marker-size=<n>]
                  [--[no-]diff3] <current-file> <base-file> <other-file>


---------------------------------------------------------------

::

          git merge-file incorporates all changes that lead from the
          <base-file> to <other-file> into <current-file>. The result
          ordinarily goes into <current-file>. git merge-file is useful for
          combining separate changes to an original. Suppose <base-file> is
          the original, and both <current-file> and <other-file> are
          modifications of <base-file>, then git merge-file combines both
          changes.

          A conflict occurs if both <current-file> and <other-file> have
          changes in a common segment of lines. If a conflict is found, git
          merge-file normally outputs a warning and brackets the conflict
          with lines containing <<<<<<< and >>>>>>> markers. A typical
          conflict will look like this:

              <<<<<<< A
              lines in file A
              =======
              lines in file B
              >>>>>>> B

          If there are conflicts, the user should edit the result and
          delete one of the alternatives. When --ours, --theirs, or --union
          option is in effect, however, these conflicts are resolved
          favouring lines from <current-file>, lines from <other-file>, or
          lines from both respectively. The length of the conflict markers
          can be given with the --marker-size option.

          The exit value of this program is negative on error, and the
          number of conflicts otherwise (truncated to 127 if there are more
          than that many conflicts). If the merge was clean, the exit value
          is 0.

          git merge-file is designed to be a minimal clone of RCS merge;
          that is, it implements all of RCS merge's functionality which is
          needed by git(1).


-------------------------------------------------------

::

          -L <label>
              This option may be given up to three times, and specifies
              labels to be used in place of the corresponding file names in
              conflict reports. That is, git merge-file -L x -L y -L z a b
              c generates output that looks like it came from files x, y
              and z instead of from files a, b and c.

          -p
              Send results to standard output instead of overwriting
              <current-file>.

          -q
              Quiet; do not warn about conflicts.

          --diff3
              Show conflicts in "diff3" style.

          --ours, --theirs, --union
              Instead of leaving conflicts in the file, resolve conflicts
              favouring our (or their or both) side of the lines.


---------------------------------------------------------

::

          git merge-file README.my README README.upstream
              combines the changes of README.my and README.upstream since
              README, tries to merge them and writes the result into
              README.my.

          git merge-file -L a -L b -L c tmp/a123 tmp/b234 tmp/c345
              merges tmp/a123 and tmp/c345 with the base tmp/b234, but uses
              labels a and c instead of tmp/a123 and tmp/c345.


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

   Git 2.33.0.69.gc420321         08/27/2021              GIT-MERGE-FILE(1)

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
