.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-patch-id(1) — Linux manual page
===================================

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

   GIT-PATCH-ID(1)                Git Manual                GIT-PATCH-ID(1)

NAME
-------------------------------------------------

::

          git-patch-id - Compute unique ID for a patch


---------------------------------------------------------

::

          git patch-id [--stable | --unstable]


---------------------------------------------------------------

::

          Read a patch from the standard input and compute the patch ID for
          it.

          A "patch ID" is nothing but a sum of SHA-1 of the file diffs
          associated with a patch, with whitespace and line numbers
          ignored. As such, it’s "reasonably stable", but at the same time
          also reasonably unique, i.e., two patches that have the same
          "patch ID" are almost guaranteed to be the same thing.

          IOW, you can use this thing to look for likely duplicate commits.

          When dealing with git diff-tree output, it takes advantage of the
          fact that the patch is prefixed with the object name of the
          commit, and outputs two 40-byte hexadecimal strings. The first
          string is the patch ID, and the second string is the commit ID.
          This can be used to make a mapping from patch ID to commit ID.


-------------------------------------------------------

::

          --stable
              Use a "stable" sum of hashes as the patch ID. With this
              option:

              •   Reordering file diffs that make up a patch does not
                  affect the ID. In particular, two patches produced by
                  comparing the same two trees with two different settings
                  for "-O<orderfile>" result in the same patch ID
                  signature, thereby allowing the computed result to be
                  used as a key to index some meta-information about the
                  change between the two trees;

              •   Result is different from the value produced by git 1.9
                  and older or produced when an "unstable" hash (see
                  --unstable below) is configured - even when used on a
                  diff output taken without any use of "-O<orderfile>",
                  thereby making existing databases storing such "unstable"
                  or historical patch-ids unusable.

                      This is the default if patchid.stable is set to true.

          --unstable
              Use an "unstable" hash as the patch ID. With this option, the
              result produced is compatible with the patch-id value
              produced by git 1.9 and older. Users with pre-existing
              databases storing patch-ids produced by git 1.9 and older
              (who do not deal with reordered patches) may want to use this
              option.

                  This is the default.


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

   Git 2.33.0.69.gc420321         08/27/2021                GIT-PATCH-ID(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-cherry(1) <../man1/git-cherry.1.html>`__, 
`git-range-diff(1) <../man1/git-range-diff.1.html>`__

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
