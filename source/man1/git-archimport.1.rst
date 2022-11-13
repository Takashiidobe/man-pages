.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-archimport(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MERGES <#MERGES>`__ \|           |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-ARCHIMPORT(1)              Git Manual              GIT-ARCHIMPORT(1)

NAME
-------------------------------------------------

::

          git-archimport - Import a GNU Arch repository into Git


---------------------------------------------------------

::

          git archimport [-h] [-v] [-o] [-a] [-f] [-T] [-D depth] [-t tempdir]
                         <archive/branch>[:<git-branch>] ...


---------------------------------------------------------------

::

          Imports a project from one or more GNU Arch repositories. It will
          follow branches and repositories within the namespaces defined by
          the <archive/branch> parameters supplied. If it cannot find the
          remote branch a merge comes from it will just import it as a
          regular commit. If it can find it, it will mark it as a merge
          whenever possible (see discussion below).

          The script expects you to provide the key roots where it can
          start the import from an initial import or tag type of Arch
          commit. It will follow and import new branches within the
          provided roots.

          It expects to be dealing with one project only. If it sees
          branches that have different roots, it will refuse to run. In
          that case, edit your <archive/branch> parameters to define
          clearly the scope of the import.

          git archimport uses tla extensively in the background to access
          the Arch repository. Make sure you have a recent version of tla
          available in the path. tla must know about the repositories you
          pass to git archimport.

          For the initial import, git archimport expects to find itself in
          an empty directory. To follow the development of a project that
          uses Arch, rerun git archimport with the same parameters as the
          initial import to perform incremental imports.

          While git archimport will try to create sensible branch names for
          the archives that it imports, it is also possible to specify Git
          branch names manually. To do so, write a Git branch name after
          each <archive/branch> parameter, separated by a colon. This way,
          you can shorten the Arch branch names and convert Arch jargon to
          Git jargon, for example mapping a "PROJECT--devo--VERSION" branch
          to "master".

          Associating multiple Arch branches to one Git branch is possible;
          the result will make the most sense only if no commits are made
          to the first branch, after the second branch is created. Still,
          this is useful to convert Arch repositories that had been rotated
          periodically.


-----------------------------------------------------

::

          Patch merge data from Arch is used to mark merges in Git as well.
          Git does not care much about tracking patches, and only considers
          a merge when a branch incorporates all the commits since the
          point they forked. The end result is that Git will have a good
          idea of how far branches have diverged. So the import process
          does lose some patch-trading metadata.

          Fortunately, when you try and merge branches imported from Arch,
          Git will find a good merge base, and it has a good chance of
          identifying patches that have been traded out-of-sequence between
          the branches.


-------------------------------------------------------

::

          -h
              Display usage.

          -v
              Verbose output.

          -T
              Many tags. Will create a tag for every commit, reflecting the
              commit name in the Arch repository.

          -f
              Use the fast patchset import strategy. This can be
              significantly faster for large trees, but cannot handle
              directory renames or permissions changes. The default
              strategy is slow and safe.

          -o
              Use this for compatibility with old-style branch names used
              by earlier versions of git archimport. Old-style branch names
              were category--branch, whereas new-style branch names are
              archive,category--branch--version. In both cases, names given
              on the command-line will override the automatically-generated
              ones.

          -D <depth>
              Follow merge ancestry and attempt to import trees that have
              been merged from. Specify a depth greater than 1 if patch
              logs have been pruned.

          -a
              Attempt to auto-register archives at
              http://mirrors.sourcecontrol.net This is particularly useful
              with the -D option.

          -t <tmpdir>
              Override the default tempdir.

          <archive/branch>
              Archive/branch identifier in a format that tla log
              understands.


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

   Git 2.33.0.69.gc420321         08/27/2021              GIT-ARCHIMPORT(1)

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
