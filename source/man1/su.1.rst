.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

Another version of this page is provided by the
`shadow-utils <su.1@@shadow-utils.html>`__ project

--------------

su(1) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SIGNALS <#SIGNALS>`__ \|         |                                   |
| `CONFIG FILES <#CONFIG_FILES>`__  |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SU(1)                         User Commands                        SU(1)

NAME
-------------------------------------------------

::

          su - run a command with substitute user and group ID


---------------------------------------------------------

::

          su [options] [-] [user [argument...]]


---------------------------------------------------------------

::

          su allows commands to be run with a substitute user and group ID.

          When called with no user specified, su defaults to running an
          interactive shell as root. When user is specified, additional
          arguments can be supplied, in which case they are passed to the
          shell.

          For backward compatibility, su defaults to not change the current
          directory and to only set the environment variables HOME and
          SHELL (plus USER and LOGNAME if the target user is not root). It
          is recommended to always use the --login option (instead of its
          shortcut -) to avoid side effects caused by mixing environments.

          This version of su uses PAM for authentication, account and
          session management. Some configuration options found in other su
          implementations, such as support for a wheel group, have to be
          configured via PAM.

          su is mostly designed for unprivileged users, the recommended
          solution for privileged users (e.g., scripts executed by root) is
          to use non-set-user-ID command runuser(1) that does not require
          authentication and provides separate PAM configuration. If the
          PAM session is not required at all then the recommended solution
          is to use command setpriv(1).

          Note that su in all cases uses PAM (pam_getenvlist(3)) to do the
          final environment modification. Command-line options such as
          --login and --preserve-environment affect the environment before
          it is modified by PAM.


-------------------------------------------------------

::

          -c, --command=command
              Pass command to the shell with the -c option.

          -f, --fast
              Pass -f to the shell, which may or may not be useful,
              depending on the shell.

          -g, --group=group
              Specify the primary group. This option is available to the
              root user only.

          -G, --supp-group=group
              Specify a supplementary group. This option is available to
              the root user only. The first specified supplementary group
              is also used as a primary group if the option --group is not
              specified.

          -, -l, --login
              Start the shell as a login shell with an environment similar
              to a real login:

              •   clears all the environment variables except TERM and
                  variables specified by --whitelist-environment

              •   initializes the environment variables HOME, SHELL, USER,
                  LOGNAME, and PATH

              •   changes to the target user’s home directory

              •   sets argv[0] of the shell to '-' in order to make the
                  shell a login shell

          -m, -p, --preserve-environment
              Preserve the entire environment, i.e., do not set HOME,
              SHELL, USER or LOGNAME. This option is ignored if the option
              --login is specified.

          -P, --pty
              Create a pseudo-terminal for the session. The independent
              terminal provides better security as the user does not share
              a terminal with the original session. This can be used to
              avoid TIOCSTI ioctl terminal injection and other security
              attacks against terminal file descriptors. The entire session
              can also be moved to the background (e.g., "su --pty -
              username -c application &"). If the pseudo-terminal is
              enabled, then su works as a proxy between the sessions (copy
              stdin and stdout).

              This feature is mostly designed for interactive sessions. If
              the standard input is not a terminal, but for example a pipe
              (e.g., echo "date" | su --pty), then the ECHO flag for the
              pseudo-terminal is disabled to avoid messy output.

          -s, --shell=shell
              Run the specified shell instead of the default. The shell to
              run is selected according to the following rules, in order:

              •   the shell specified with --shell

              •   the shell specified in the environment variable SHELL, if
                  the --preserve-environment option is used

              •   the shell listed in the passwd entry of the target user

              •   /bin/sh

          If the target user has a restricted shell (i.e., not listed in
          /etc/shells), the --shell option and the SHELL environment
          variables are ignored unless the calling user is root.

          --session-command=command
              Same as -c, but do not create a new session. (Discouraged.)

          -w, --whitelist-environment=list
              Don’t reset the environment variables specified in the
              comma-separated list when clearing the environment for
              --login. The whitelist is ignored for the environment
              variables HOME, SHELL, USER, LOGNAME, and PATH.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------

::

          Upon receiving either SIGINT, SIGQUIT or SIGTERM, su terminates
          its child and afterwards terminates itself with the received
          signal. The child is terminated by SIGTERM, after unsuccessful
          attempt and 2 seconds of delay the child is killed by SIGKILL.


-----------------------------------------------------------------

::

          su reads the /etc/default/su and /etc/login.defs configuration
          files. The following configuration items are relevant for su:

          FAIL_DELAY (number)
              Delay in seconds in case of an authentication failure. The
              number must be a non-negative integer.

          ENV_PATH (string)
              Defines the PATH environment variable for a regular user. The
              default value is /usr/local/bin:/bin:/usr/bin.

          ENV_ROOTPATH (string), ENV_SUPATH (string)
              Defines the PATH environment variable for root. ENV_SUPATH
              takes precedence. The default value is
              /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin.

          ALWAYS_SET_PATH (boolean)
              If set to yes and --login and --preserve-environment were not
              specified su initializes PATH.

              The environment variable PATH may be different on systems
              where /bin and /sbin are merged into /usr; this variable is
              also affected by the --login command-line option and the PAM
              system setting (e.g., pam_env(8)).


---------------------------------------------------------------

::

          su normally returns the exit status of the command it executed.
          If the command was killed by a signal, su returns the number of
          the signal plus 128.

          Exit status generated by su itself:

          1
              Generic error before executing the requested command

          126
              The requested command could not be executed

          127
              The requested command was not found


---------------------------------------------------

::

          /etc/pam.d/su
              default PAM configuration file

          /etc/pam.d/su-l
              PAM configuration file if --login is specified

          /etc/default/su
              command specific logindef config file

          /etc/login.defs
              global logindef config file


---------------------------------------------------

::

          For security reasons, su always logs failed log-in attempts to
          the btmp file, but it does not write to the lastlog file at all.
          This solution can be used to control su behavior by PAM
          configuration. If you want to use the pam_lastlog(8) module to
          print warning message about failed log-in attempts then
          pam_lastlog(8) has to be configured to update the lastlog file as
          well. For example by:

             session required pam_lastlog.so nowtmp


-------------------------------------------------------

::

          This su command was derived from coreutils' su, which was based
          on an implementation by David MacKenzie. The util-linux version
          has been refactored by Karel Zak.


---------------------------------------------------------

::

          setpriv(1), login.defs(5), shells(5), pam(8), runuser(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The su command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                          SU(1)

--------------

Pages that refer to this page: `flock(1) <../man1/flock.1.html>`__, 
`homectl(1) <../man1/homectl.1.html>`__, 
`login(1) <../man1/login.1.html>`__, 
`login(1@@shadow-utils) <../man1/login.1@@shadow-utils.html>`__, 
`machinectl(1) <../man1/machinectl.1.html>`__, 
`newgrp(1) <../man1/newgrp.1.html>`__, 
`runuser(1) <../man1/runuser.1.html>`__, 
`setpriv(1) <../man1/setpriv.1.html>`__, 
`sg(1) <../man1/sg.1.html>`__, 
`updatedb(1) <../man1/updatedb.1.html>`__, 
`pam(3) <../man3/pam.3.html>`__,  `pts(4) <../man4/pts.4.html>`__, 
`crontab(5) <../man5/crontab.5.html>`__, 
`login.defs(5) <../man5/login.defs.5.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`passwd(5@@shadow-utils) <../man5/passwd.5@@shadow-utils.html>`__, 
`shadow(5) <../man5/shadow.5.html>`__, 
`suauth(5) <../man5/suauth.5.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`PAM(8) <../man8/PAM.8.html>`__, 
`pam_rootok(8) <../man8/pam_rootok.8.html>`__, 
`pam_xauth(8) <../man8/pam_xauth.8.html>`__

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
