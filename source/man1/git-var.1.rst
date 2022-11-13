.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-var(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `VARIABLES <#VARIABLES>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-VAR(1)                     Git Manual                     GIT-VAR(1)

NAME
-------------------------------------------------

::

          git-var - Show a Git logical variable


---------------------------------------------------------

::

          git var ( -l | <variable> )


---------------------------------------------------------------

::

          Prints a Git logical variable.


-------------------------------------------------------

::

          -l
              Cause the logical variables to be listed. In addition, all
              the variables of the Git configuration file .git/config are
              listed as well. (However, the configuration variables listing
              functionality is deprecated in favor of git config -l.)


---------------------------------------------------------

::

              $ git var GIT_AUTHOR_IDENT
              Eric W. Biederman <ebiederm@lnxi.com> 1121223278 -0600


-----------------------------------------------------------

::

          GIT_AUTHOR_IDENT
              The author of a piece of code.

          GIT_COMMITTER_IDENT
              The person who put a piece of code into Git.

          GIT_EDITOR
              Text editor for use by Git commands. The value is meant to be
              interpreted by the shell when it is used. Examples: ~/bin/vi,
              $SOME_ENVIRONMENT_VARIABLE, "C:\Program Files\Vim\gvim.exe"
              --nofork. The order of preference is the $GIT_EDITOR
              environment variable, then core.editor configuration, then
              $VISUAL, then $EDITOR, and then the default chosen at compile
              time, which is usually vi.

          GIT_PAGER
              Text viewer for use by Git commands (e.g., less). The value
              is meant to be interpreted by the shell. The order of
              preference is the $GIT_PAGER environment variable, then
              core.pager configuration, then $PAGER, and then the default
              chosen at compile time (usually less).


---------------------------------------------------------

::

          git-commit-tree(1) git-tag(1) git-config(1)


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

   Git 2.33.0.69.gc420321         08/27/2021                     GIT-VAR(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-commit(1) <../man1/git-commit.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`git-replace(1) <../man1/git-replace.1.html>`__, 
`git-send-email(1) <../man1/git-send-email.1.html>`__, 
`gitfaq(7) <../man7/gitfaq.7.html>`__

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
