.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-remote-ext(1) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \|                                |                                   |
| `ENVIRONMENT VARIABL              |                                   |
| ES PASSED TO COMMAND <#ENVIRONMEN |                                   |
| T_VARIABLES_PASSED_TO_COMMAND>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-REMOTE-EXT(1)              Git Manual              GIT-REMOTE-EXT(1)

NAME
-------------------------------------------------

::

          git-remote-ext - Bridge smart transport to external command.


---------------------------------------------------------

::

          git remote add <nick> "ext::<command>[ <arguments>...]"


---------------------------------------------------------------

::

          This remote helper uses the specified <command> to connect to a
          remote Git server.

          Data written to stdin of the specified <command> is assumed to be
          sent to a git:// server, git-upload-pack, git-receive-pack or
          git-upload-archive (depending on situation), and data read from
          stdout of <command> is assumed to be received from the same
          service.

          Command and arguments are separated by an unescaped space.

          The following sequences have a special meaning:

          '% '
              Literal space in command or argument.

          %%
              Literal percent sign.

          %s
              Replaced with name (receive-pack, upload-pack, or
              upload-archive) of the service Git wants to invoke.

          %S
              Replaced with long name (git-receive-pack, git-upload-pack,
              or git-upload-archive) of the service Git wants to invoke.

          %G (must be the first characters in an argument)
              This argument will not be passed to <command>. Instead, it
              will cause the helper to start by sending git:// service
              requests to the remote side with the service field set to an
              appropriate value and the repository field set to rest of the
              argument. Default is not to send such a request.

              This is useful if remote side is git:// server accessed over
              some tunnel.

          %V (must be first characters in argument)
              This argument will not be passed to <command>. Instead it
              sets the vhost field in the git:// service request (to rest
              of the argument). Default is not to send vhost in such
              request (if sent).


-----------------------------------------------------------------------------------

::

          GIT_TRANSLOOP_DEBUG
              If set, prints debugging information about various
              reads/writes.


-----------------------------------------------------------------------------------------------------------------------

::

          GIT_EXT_SERVICE
              Set to long name (git-upload-pack, etc...) of service helper
              needs to invoke.

          GIT_EXT_SERVICE_NOPREFIX
              Set to long name (upload-pack, etc...) of service helper
              needs to invoke.


---------------------------------------------------------

::

          This remote helper is transparently used by Git when you use
          commands such as "git fetch <URL>", "git clone <URL>", , "git
          push <URL>" or "git remote add <nick> <URL>", where <URL> begins
          with ext::. Examples:

          "ext::ssh -i /home/foo/.ssh/somekey user@host.example %S
          foo/repo"
              Like host.example:foo/repo, but use /home/foo/.ssh/somekey as
              keypair and user as user on remote side. This avoids needing
              to edit .ssh/config.

          "ext::socat -t3600 - ABSTRACT-CONNECT:/git-server %G/somerepo"
              Represents repository with path /somerepo accessible over git
              protocol at abstract namespace address /git-server.

          "ext::git-server-alias foo %G/repo"
              Represents a repository with path /repo accessed using the
              helper program "git-server-alias foo". The path to the
              repository and type of request are not passed on the command
              line but as part of the protocol stream, as usual with git://
              protocol.

          "ext::git-server-alias foo %G/repo %Vfoo"
              Represents a repository with path /repo accessed using the
              helper program "git-server-alias foo". The hostname for the
              remote server passed in the protocol stream will be "foo"
              (this allows multiple virtual Git servers to share a
              link-level address).

          "ext::git-server-alias foo %G/repo% with% spaces %Vfoo"
              Represents a repository with path /repo with spaces accessed
              using the helper program "git-server-alias foo". The hostname
              for the remote server passed in the protocol stream will be
              "foo" (this allows multiple virtual Git servers to share a
              link-level address).

          "ext::git-ssl foo.example /bar"
              Represents a repository accessed using the helper program
              "git-ssl foo.example /bar". The type of request can be
              determined by the helper using environment variables (see
              above).


---------------------------------------------------------

::

          gitremote-helpers(7)


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

   Git 2.33.0.69.gc420321         08/27/2021              GIT-REMOTE-EXT(1)

--------------

Pages that refer to this page:
`gitremote-helpers(1) <../man1/gitremote-helpers.1.html>`__, 
`gitnamespaces(7) <../man7/gitnamespaces.7.html>`__, 
`gitremote-helpers(7) <../man7/gitremote-helpers.7.html>`__

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
