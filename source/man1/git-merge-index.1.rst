.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-merge-index(1) — Linux manual page
======================================

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

   GIT-MERGE-INDEX(1)             Git Manual             GIT-MERGE-INDEX(1)

NAME
-------------------------------------------------

::

          git-merge-index - Run a merge for files needing merging


---------------------------------------------------------

::

          git merge-index [-o] [-q] <merge-program> (-a | [--] <file>*)


---------------------------------------------------------------

::

          This looks up the <file>(s) in the index and, if there are any
          merge entries, passes the SHA-1 hash for those files as arguments
          1, 2, 3 (empty argument if no file), and <file> as argument 4.
          File modes for the three files are passed as arguments 5, 6 and
          7.


-------------------------------------------------------

::

          --
              Do not interpret any more arguments as options.

          -a
              Run merge against all files in the index that need merging.

          -o
              Instead of stopping at the first failed merge, do all of them
              in one shot - continue with merging even when previous merges
              returned errors, and only return the error code after all the
              merges.

          -q
              Do not complain about a failed merge program (a merge program
              failure usually indicates conflicts during the merge). This
              is for porcelains which might want to emit custom messages.

          If git merge-index is called with multiple <file>s (or -a) then
          it processes them in turn only stopping if merge returns a
          non-zero exit code.

          Typically this is run with a script calling Git’s imitation of
          the merge command from the RCS package.

          A sample script called git merge-one-file is included in the
          distribution.

          ALERT ALERT ALERT! The Git "merge object order" is different from
          the RCS merge program merge object order. In the above ordering,
          the original is first. But the argument order to the 3-way merge
          program merge is to have the original in the middle. Don’t ask me
          why.

          Examples:

              torvalds@ppc970:~/merge-test> git merge-index cat MM
              This is MM from the original tree.              # original
              This is modified MM in the branch A.            # merge1
              This is modified MM in the branch B.            # merge2
              This is modified MM in the branch B.            # current contents

          or

              torvalds@ppc970:~/merge-test> git merge-index cat AA MM
              cat: : No such file or directory
              This is added AA in the branch A.
              This is added AA in the branch B.
              This is added AA in the branch B.
              fatal: merge program failed

          where the latter example shows how git merge-index will stop
          trying to merge once anything has returned an error (i.e., cat
          returned an error for the AA file, because it didn’t exist in the
          original, and thus git merge-index didn’t even try to merge the
          MM thing).


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

   Git 2.33.0.69.gc420321         08/27/2021             GIT-MERGE-INDEX(1)

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
