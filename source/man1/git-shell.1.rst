.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-shell(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `INTE                             |                                   |
| RACTIVE USE <#INTERACTIVE_USE>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-SHELL(1)                   Git Manual                   GIT-SHELL(1)

NAME
-------------------------------------------------

::

          git-shell - Restricted login shell for Git-only SSH access


---------------------------------------------------------

::

          chsh -s $(command -v git-shell) <user>
          git clone <user>@localhost:/path/to/repo.git
          ssh <user>@localhost


---------------------------------------------------------------

::

          This is a login shell for SSH accounts to provide restricted Git
          access. It permits execution only of server-side Git commands
          implementing the pull/push functionality, plus custom commands
          present in a subdirectory named git-shell-commands in the user’s
          home directory.


---------------------------------------------------------

::

          git shell accepts the following commands after the -c option:

          git receive-pack <argument>, git upload-pack <argument>, git
          upload-archive <argument>
              Call the corresponding server-side command to support the
              client’s git push, git fetch, or git archive --remote
              request.

          cvs server
              Imitate a CVS server. See git-cvsserver(1).

          If a ~/git-shell-commands directory is present, git shell will
          also handle other, custom commands by running
          "git-shell-commands/<command> <arguments>" from the user’s home
          directory.


-----------------------------------------------------------------------

::

          By default, the commands above can be executed only with the -c
          option; the shell is not interactive.

          If a ~/git-shell-commands directory is present, git shell can
          also be run interactively (with no arguments). If a help command
          is present in the git-shell-commands directory, it is run to
          provide the user with an overview of allowed actions. Then a
          "git> " prompt is presented at which one can enter any of the
          commands from the git-shell-commands directory, or exit to close
          the connection.

          Generally this mode is used as an administrative interface to
          allow users to list repositories they have access to, create,
          delete, or rename repositories, or change repository descriptions
          and permissions.

          If a no-interactive-login command exists, then it is run and the
          interactive shell is aborted.


---------------------------------------------------------

::

          To disable interactive logins, displaying a greeting instead:

              $ chsh -s /usr/bin/git-shell
              $ mkdir $HOME/git-shell-commands
              $ cat >$HOME/git-shell-commands/no-interactive-login <<\EOF
              #!/bin/sh
              printf '%s\n' "Hi $USER! You've successfully authenticated, but I do not"
              printf '%s\n' "provide interactive shell access."
              exit 128
              EOF
              $ chmod +x $HOME/git-shell-commands/no-interactive-login

          To enable git-cvsserver access (which should generally have the
          no-interactive-login example above as a prerequisite, as creating
          the git-shell-commands directory allows interactive logins):

              $ cat >$HOME/git-shell-commands/cvs <<\EOF
              if ! test $# = 1 && test "$1" = "server"
              then
                      echo >&2 "git-cvsserver only handles \"server\""
                      exit 1
              fi
              exec git cvsserver server
              EOF
              $ chmod +x $HOME/git-shell-commands/cvs


---------------------------------------------------------

::

          ssh(1), git-daemon(1), contrib/git-shell-commands/README


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

   Git 2.33.0.69.gc420321         08/27/2021                   GIT-SHELL(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`githooks(5) <../man5/githooks.5.html>`__, 
`gitcvs-migration(7) <../man7/gitcvs-migration.7.html>`__, 
`giteveryday(7) <../man7/giteveryday.7.html>`__

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
