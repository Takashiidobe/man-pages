.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-cvsexportcommit(1) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-CVSEXPORTCOMMIT(1)         Git Manual         GIT-CVSEXPORTCOMMIT(1)

NAME
-------------------------------------------------

::

          git-cvsexportcommit - Export a single commit to a CVS checkout


---------------------------------------------------------

::

          git cvsexportcommit [-h] [-u] [-v] [-c] [-P] [-p] [-a] [-d cvsroot]
                  [-w cvsworkdir] [-W] [-f] [-m msgprefix] [PARENTCOMMIT] COMMITID


---------------------------------------------------------------

::

          Exports a commit from Git to a CVS checkout, making it easier to
          merge patches from a Git repository into a CVS repository.

          Specify the name of a CVS checkout using the -w switch or execute
          it from the root of the CVS working copy. In the latter case
          GIT_DIR must be defined. See examples below.

          It does its best to do the safe thing, it will check that the
          files are unchanged and up to date in the CVS checkout, and it
          will not autocommit by default.

          Supports file additions, removals, and commits that affect binary
          files.

          If the commit is a merge commit, you must tell git
          cvsexportcommit what parent the changeset should be done against.


-------------------------------------------------------

::

          -c
              Commit automatically if the patch applied cleanly. It will
              not commit if any hunks fail to apply or there were other
              problems.

          -p
              Be pedantic (paranoid) when applying patches. Invokes patch
              with --fuzz=0

          -a
              Add authorship information. Adds Author line, and Committer
              (if different from Author) to the message.

          -d
              Set an alternative CVSROOT to use. This corresponds to the
              CVS -d parameter. Usually users will not want to set this,
              except if using CVS in an asymmetric fashion.

          -f
              Force the merge even if the files are not up to date.

          -P
              Force the parent commit, even if it is not a direct parent.

          -m
              Prepend the commit message with the provided prefix. Useful
              for patch series and the like.

          -u
              Update affected files from CVS repository before attempting
              export.

          -k
              Reverse CVS keyword expansion (e.g. $Revision: 1.2.3.4$
              becomes $Revision$) in working CVS checkout before applying
              patch.

          -w
              Specify the location of the CVS checkout to use for the
              export. This option does not require GIT_DIR to be set before
              execution if the current directory is within a Git
              repository. The default is the value of
              cvsexportcommit.cvsdir.

          -W
              Tell cvsexportcommit that the current working directory is
              not only a Git checkout, but also the CVS checkout.
              Therefore, Git will reset the working directory to the parent
              commit before proceeding.

          -v
              Verbose.


-------------------------------------------------------------------

::

          cvsexportcommit.cvsdir
              The default location of the CVS checkout to use for the
              export.


---------------------------------------------------------

::

          Merge one patch into CVS

                  $ export GIT_DIR=~/project/.git
                  $ cd ~/project_cvs_checkout
                  $ git cvsexportcommit -v <commit-sha1>
                  $ cvs commit -F .msg <files>

          Merge one patch into CVS (-c and -w options). The working
          directory is within the Git Repo

                          $ git cvsexportcommit -v -c -w ~/project_cvs_checkout <commit-sha1>

          Merge pending patches into CVS automatically — only if you really
          know what you are doing

                  $ export GIT_DIR=~/project/.git
                  $ cd ~/project_cvs_checkout
                  $ git cherry cvshead myhead | sed -n 's/^+ //p' | xargs -l1 git cvsexportcommit -c -p -v


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

   Git 2.33.0.69.gc420321         08/27/2021         GIT-CVSEXPORTCOMMIT(1)

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
