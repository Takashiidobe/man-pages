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
`shadow-utils <login.1@@shadow-utils.html>`__ project

--------------

login(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIG F                         |                                   |
| ILE ITEMS <#CONFIG_FILE_ITEMS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOGIN(1)                      User Commands                     LOGIN(1)

NAME
-------------------------------------------------

::

          login - begin session on the system


---------------------------------------------------------

::

          login [-p] [-h host] [-H] [-f username|username]


---------------------------------------------------------------

::

          login is used when signing onto a system. If no argument is
          given, login prompts for the username.

          The user is then prompted for a password, where appropriate.
          Echoing is disabled to prevent revealing the password. Only a
          number of password failures are permitted before login exits and
          the communications link is severed. See LOGIN_RETRIES in CONFIG
          FILE ITEMS section.

          If password aging has been enabled for the account, the user may
          be prompted for a new password before proceeding. In such case
          old password must be provided and the new password entered before
          continuing. Please refer to passwd(1) for more information.

          The user and group ID will be set according to their values in
          the /etc/passwd file. There is one exception if the user ID is
          zero. In this case, only the primary group ID of the account is
          set. This should allow the system administrator to login even in
          case of network problems. The environment variable values for
          $HOME, $USER, $SHELL, $PATH, $LOGNAME, and $MAIL are set
          according to the appropriate fields in the password entry. $PATH
          defaults to /usr/local/bin:/bin:/usr/bin for normal users, and to
          /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin for
          root, if not otherwise configured.

          The environment variable $TERM will be preserved, if it exists,
          else it will be initialized to the terminal type on your tty.
          Other environment variables are preserved if the -p option is
          given.

          Then the user’s shell is started. If no shell is specified for
          the user in /etc/passwd, then /bin/sh is used. If there is no
          home directory specified in /etc/passwd, then / is used, followed
          by .hushlogin check as described below.

          If the file .hushlogin exists, then a "quiet" login is performed.
          This disables the checking of mail and the printing of the last
          login time and message of the day. Otherwise, if /var/log/lastlog
          exists, the last login time is printed, and the current login is
          recorded.


-------------------------------------------------------

::

          -p
              Used by getty(8) to tell login to preserve the environment.

          -f
              Used to skip a login authentication. This option is usually
              used by the getty(8) autologin feature.

          -h
              Used by other servers (such as telnetd(8) to pass the name of
              the remote host to login so that it can be placed in utmp and
              wtmp. Only the superuser is allowed use this option.

              Note that the -h option has an impact on the PAM service
              name. The standard service name is login, but with the -h
              option, the name is remote. It is necessary to create proper
              PAM config files (for example, /etc/pam.d/login and
              /etc/pam.d/remote).

          -H
              Used by other servers (for example, telnetd(8)) to tell login
              that printing the hostname should be suppressed in the login:
              prompt. See also LOGIN_PLAIN_PROMPT below.

          --help
              Display help text and exit.

          -V, --version
              Display version information and exit.


---------------------------------------------------------------------------

::

          login reads the /etc/login.defs configuration file (see
          login.defs(5)). Note that the configuration file could be
          distributed with another package (usually shadow-utils). The
          following configuration items are relevant for login:

          MOTD_FILE (string)
              Specifies a ":" delimited list of "message of the day" files
              and directories to be displayed upon login. If the specified
              path is a directory then displays all files with .motd file
              extension in version-sort order from the directory.

              The default value is
              /usr/share/misc/motd:/run/motd:/etc/motd. If the MOTD_FILE
              item is empty or a quiet login is enabled, then the message
              of the day is not displayed. Note that the same functionality
              is also provided by the pam_motd(8) PAM module.

              The directories in the MOTD_FILE are supported since version
              2.36.

              Note that login does not implement any filenames overriding
              behavior like pam_motd (see also MOTD_FIRSTONLY), but all
              content from all files is displayed. It is recommended to
              keep extra logic in content generators and use /run/motd.d
              rather than rely on overriding behavior hardcoded in system
              tools.

          MOTD_FIRSTONLY (boolean)
              Forces login to stop display content specified by MOTD_FILE
              after the first accessible item in the list. Note that a
              directory is one item in this case. This option allows login
              semantics to be configured to be more compatible with
              pam_motd. The default value is no.

          LOGIN_PLAIN_PROMPT (boolean)
              Tell login that printing the hostname should be suppressed in
              the login: prompt. This is an alternative to the -H command
              line option. The default value is no.

          LOGIN_TIMEOUT (number)
              Maximum time in seconds for login. The default value is 60.

          LOGIN_RETRIES (number)
              Maximum number of login retries in case of a bad password.
              The default value is 3.

          LOGIN_KEEP_USERNAME (boolean)
              Tell login to only re-prompt for the password if
              authentication failed, but the username is valid. The default
              value is no.

          FAIL_DELAY (number)
              Delay in seconds before being allowed another three tries
              after a login failure. The default value is 5.

          TTYPERM (string)
              The terminal permissions. The default value is 0600 or 0620
              if tty group is used.

          TTYGROUP (string)
              The login tty will be owned by the TTYGROUP. The default
              value is tty. If the TTYGROUP does not exist, then the
              ownership of the terminal is set to the user’s primary group.

              The TTYGROUP can be either the name of a group or a numeric
              group identifier.

          HUSHLOGIN_FILE (string)
              If defined, this file can inhibit all the usual chatter
              during the login sequence. If a full pathname (for example,
              /etc/hushlogins) is specified, then hushed mode will be
              enabled if the user’s name or shell are found in the file. If
              this global hush login file is empty then the hushed mode
              will be enabled for all users.

              If a full pathname is not specified, then hushed mode will be
              enabled if the file exists in the user’s home directory.

              The default is to check /etc/hushlogins and if it does not
              exist then ~/.hushlogin.

              If the HUSHLOGIN_FILE item is empty, then all the checks are
              disabled.

          DEFAULT_HOME (boolean)
              Indicate if login is allowed if we cannot change directory to
              the home directory. If set to yes, the user will login in the
              root (/) directory if it is not possible to change directory
              to their home. The default value is yes.

          LASTLOG_UID_MAX (unsigned number)
              Highest user ID number for which the lastlog entries should
              be updated. As higher user IDs are usually tracked by remote
              user identity and authentication services there is no need to
              create a huge sparse lastlog file for them. No
              LASTLOG_UID_MAX option present in the configuration means
              that there is no user ID limit for writing lastlog entries.
              The default value is ULONG_MAX.

          LOG_UNKFAIL_ENAB (boolean)
              Enable display of unknown usernames when login failures are
              recorded. The default value is no.

              Note that logging unknown usernames may be a security issue
              if a user enters their password instead of their login name.

          ENV_PATH (string)
              If set, it will be used to define the PATH environment
              variable when a regular user logs in. The default value is
              /usr/local/bin:/bin:/usr/bin.

          ENV_ROOTPATH (string), ENV_SUPATH (string)
              If set, it will be used to define the PATH environment
              variable when the superuser logs in. ENV_ROOTPATH takes
              precedence. The default value is
              /usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin.


---------------------------------------------------

::

          /var/run/utmp, /var/log/wtmp, /var/log/lastlog,
          /var/spool/mail/*, /etc/motd, /etc/passwd, /etc/nologin,
          /etc/pam.d/login, /etc/pam.d/remote, /etc/hushlogins,
          $HOME/.hushlogin


-------------------------------------------------

::

          The undocumented BSD -r option is not supported. This may be
          required by some rlogind(8) programs.

          A recursive login, as used to be possible in the good old days,
          no longer works; for most purposes su(1) is a satisfactory
          substitute. Indeed, for security reasons, login does a vhangup(2)
          system call to remove any possible listening processes on the
          tty. This is to avoid password sniffing. If one uses the command
          login, then the surrounding shell gets killed by vhangup(2)
          because it’s no longer the true owner of the tty. This can be
          avoided by using exec login in a top-level shell or xterm.


-------------------------------------------------------

::

          Derived from BSD login 5.40 (5/9/89) by Michael Glad
          <glad@daimi.dk> for HP-UX. Ported to Linux 0.12: Peter Orbaek
          <poe@daimi.aau.dk>. Rewritten to a PAM-only version by Karel Zak
          <kzak@redhat.com>


---------------------------------------------------------

::

          mail(1), passwd(1), passwd(5), utmp(5), environ(7), getty(8),
          init(8), lastlog(8), shutdown(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The login command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                       LOGIN(1)

--------------

Pages that refer to this page: `ac(1) <../man1/ac.1.html>`__, 
`bash(1) <../man1/bash.1.html>`__,  `chsh(1) <../man1/chsh.1.html>`__, 
`intro(1) <../man1/intro.1.html>`__, 
`last(1@@util-linux) <../man1/last.1@@util-linux.html>`__, 
`mesg(1) <../man1/mesg.1.html>`__, 
`newgrp(1) <../man1/newgrp.1.html>`__, 
`openvt(1) <../man1/openvt.1.html>`__,  `sg(1) <../man1/sg.1.html>`__, 
`su(1@@shadow-utils) <../man1/su.1@@shadow-utils.html>`__, 
`ul(1) <../man1/ul.1.html>`__,  `crypt(3) <../man3/crypt.3.html>`__, 
`pam(3) <../man3/pam.3.html>`__, 
`ttyslot(3) <../man3/ttyslot.3.html>`__, 
`group(5) <../man5/group.5.html>`__, 
`login.defs(5) <../man5/login.defs.5.html>`__, 
`motd(5) <../man5/motd.5.html>`__, 
`nologin(5) <../man5/nologin.5.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`passwd(5@@shadow-utils) <../man5/passwd.5@@shadow-utils.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`securetty(5) <../man5/securetty.5.html>`__, 
`shadow(5) <../man5/shadow.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`utmp(5) <../man5/utmp.5.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
`agetty(8) <../man8/agetty.8.html>`__, 
`faillog(8) <../man8/faillog.8.html>`__, 
`nologin(8) <../man8/nologin.8.html>`__, 
`nologin(8@@shadow-utils) <../man8/nologin.8@@shadow-utils.html>`__, 
`PAM(8) <../man8/PAM.8.html>`__

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
