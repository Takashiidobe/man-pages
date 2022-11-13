.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

`Go to the version of this page provided by the util-linux
project <su.1.html>`__

--------------

su(1) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CAVEATS <#CAVEATS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXIT VALUES <#EXIT_VALUES>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SU(1)                         User Commands                        SU(1)

NAME
-------------------------------------------------

::

          su - change user ID or become superuser


---------------------------------------------------------

::

          su [options] [-] [username [ args ]]


---------------------------------------------------------------

::

          The su command is used to become another user during a login
          session. Invoked without a username, su defaults to becoming the
          superuser. The - option may be used to provide an environment
          similar to what the user would expect had the user logged in
          directly. The -c option may be used to treat the next argument as
          a command by most shells.

          Options are recognized everywhere in the argument list. You can
          use the -- argument to stop option parsing. The - option is
          special: it is also recognized after --, but has to be placed
          before username.

          The user will be prompted for a password, if appropriate. Invalid
          passwords will produce an error message. All attempts, both valid
          and invalid, are logged to detect abuse of the system.

          The current environment is passed to the new shell. The value of
          $PATH is reset to /bin:/usr/bin for normal users, or
          /sbin:/bin:/usr/sbin:/usr/bin for the superuser. This may be
          changed with the ENV_PATH and ENV_SUPATH definitions in
          /etc/login.defs.

          A subsystem login is indicated by the presence of a "*" as the
          first character of the login shell. The given home directory will
          be used as the root of a new file system which the user is
          actually logged into.


-------------------------------------------------------

::

          The options which apply to the su command are:

          -c, --command COMMAND
              Specify a command that will be invoked by the shell using its
              -c.

              The executed command will have no controlling terminal. This
              option cannot be used to execute interactive programs which
              need a controlling TTY.

          -, -l, --login
              Provide an environment similar to what the user would expect
              had the user logged in directly.

              When - is used, it must be specified before any username. For
              portability it is recommended to use it as last option,
              before any username. The other forms (-l and --login) do not
              have this restriction.

          -s, --shell SHELL
              The shell that will be invoked.

              The invoked shell is chosen from (highest priority first):

                  The shell specified with --shell.

                  If --preserve-environment is used, the shell specified by
                  the $SHELL environment variable.

                  The shell indicated in the /etc/passwd entry for the
                  target user.

                  /bin/sh if a shell could not be found by any above
                  method.

              If the target user has a restricted shell (i.e. the shell
              field of this user's entry in /etc/passwd is not listed in
              /etc/shells), then the --shell option or the $SHELL
              environment variable won't be taken into account, unless su
              is called by root.

          -m, -p, --preserve-environment
              Preserve the current environment, except for:

              $PATH
                  reset according to the /etc/login.defs options ENV_PATH
                  or ENV_SUPATH (see below);

              $IFS
                  reset to “<space><tab><newline>”, if it was set.

              If the target user has a restricted shell, this option has no
              effect (unless su is called by root).

              Note that the default behavior for the environment is the
              following:

                  The $HOME, $SHELL, $USER, $LOGNAME, $PATH, and $IFS
                  environment variables are reset.

                  If --login is not used, the environment is copied, except
                  for the variables above.

                  If --login is used, the $TERM, $COLORTERM, $DISPLAY, and
                  $XAUTHORITY environment variables are copied if they were
                  set.

                  Other environments might be set by PAM modules.


-------------------------------------------------------

::

          This version of su has many compilation options, only some of
          which may be in use at any particular site.


-------------------------------------------------------------------

::

          The following configuration variables in /etc/login.defs change
          the behavior of this tool:

          CONSOLE_GROUPS (string)
              List of groups to add to the user's supplementary groups set
              when logging in on the console (as determined by the CONSOLE
              setting). Default is none.

              Use with caution - it is possible for users to gain permanent
              access to these groups, even when not logged in on the
              console.

          DEFAULT_HOME (boolean)
              Indicate if login is allowed if we can't cd to the home
              directory. Default is no.

              If set to yes, the user will login in the root (/) directory
              if it is not possible to cd to her home directory.

          ENV_PATH (string)
              If set, it will be used to define the PATH environment
              variable when a regular user login. The value is a colon
              separated list of paths (for example /bin:/usr/bin) and can
              be preceded by PATH=. The default value is
              PATH=/bin:/usr/bin.

          ENV_SUPATH (string)
              If set, it will be used to define the PATH environment
              variable when the superuser login. The value is a colon
              separated list of paths (for example
              /sbin:/bin:/usr/sbin:/usr/bin) and can be preceded by PATH=.
              The default value is PATH=/sbin:/bin:/usr/sbin:/usr/bin.

          SULOG_FILE (string)
              If defined, all su activity is logged to this file.

          SU_NAME (string)
              If defined, the command name to display when running "su -".
              For example, if this is defined as "su" then a "ps" will
              display the command is "-su". If not defined, then "ps" would
              display the name of the shell actually being run, e.g.
              something like "-sh".

          SYSLOG_SU_ENAB (boolean)
              Enable "syslog" logging of su activity - in addition to sulog
              file logging.


---------------------------------------------------

::

          /etc/passwd
              User account information.

          /etc/shadow
              Secure user account information.

          /etc/login.defs
              Shadow password suite configuration.


---------------------------------------------------------------

::

          On success, su returns the exit value of the command it executed.

          If this command was terminated by a signal, su returns the number
          of this signal plus 128.

          If su has to kill the command (because it was asked to terminate,
          and the command did not terminate in time), su returns 255.

          Some exit values from su are independent from the executed
          command:

          0
              success (--help only)

          1
              System or authentication failure

          126
              The requested command was not found

          127
              The requested command could not be executed


---------------------------------------------------------

::

          login(1), login.defs(5), sg(1), sh(1).

COLOPHON
---------------------------------------------------------

::

          This page is part of the shadow-utils (utilities for managing
          accounts and shadow password files) project.  Information about
          the project can be found at 
          ⟨https://github.com/shadow-maint/shadow⟩.  If you have a bug
          report for this manual page, send it to
          pkg-shadow-devel@alioth-lists.debian.net.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/shadow-maint/shadow⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   shadow-utils 4.8.1             08/27/2021                          SU(1)

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
