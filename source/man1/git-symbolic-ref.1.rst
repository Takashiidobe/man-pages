.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-symbolic-ref(1) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-SYMBOLIC-REF(1)            Git Manual            GIT-SYMBOLIC-REF(1)

NAME
-------------------------------------------------

::

          git-symbolic-ref - Read, modify and delete symbolic refs


---------------------------------------------------------

::

          git symbolic-ref [-m <reason>] <name> <ref>
          git symbolic-ref [-q] [--short] <name>
          git symbolic-ref --delete [-q] <name>


---------------------------------------------------------------

::

          Given one argument, reads which branch head the given symbolic
          ref refers to and outputs its path, relative to the .git/
          directory. Typically you would give HEAD as the <name> argument
          to see which branch your working tree is on.

          Given two arguments, creates or updates a symbolic ref <name> to
          point at the given branch <ref>.

          Given --delete and an additional argument, deletes the given
          symbolic ref.

          A symbolic ref is a regular file that stores a string that begins
          with ref: refs/. For example, your .git/HEAD is a regular file
          whose contents is ref: refs/heads/master.


-------------------------------------------------------

::

          -d, --delete
              Delete the symbolic ref <name>.

          -q, --quiet
              Do not issue an error message if the <name> is not a symbolic
              ref but a detached HEAD; instead exit with non-zero status
              silently.

          --short
              When showing the value of <name> as a symbolic ref, try to
              shorten the value, e.g. from refs/heads/master to master.

          -m
              Update the reflog for <name> with <reason>. This is valid
              only when creating or updating a symbolic ref.


---------------------------------------------------

::

          In the past, .git/HEAD was a symbolic link pointing at
          refs/heads/master. When we wanted to switch to another branch, we
          did ln -sf refs/heads/newbranch .git/HEAD, and when we wanted to
          find out which branch we are on, we did readlink .git/HEAD. But
          symbolic links are not entirely portable, so they are now
          deprecated and symbolic refs (as described above) are used by
          default.

          git symbolic-ref will exit with status 0 if the contents of the
          symbolic ref were printed correctly, with status 1 if the
          requested name is not a symbolic ref, or 128 if another error
          occurs.


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

   Git 2.33.0.69.gc420321         08/27/2021            GIT-SYMBOLIC-REF(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`gitglossary(7) <../man7/gitglossary.7.html>`__

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
