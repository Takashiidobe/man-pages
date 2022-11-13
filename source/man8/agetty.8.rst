.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

agetty(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SECU                             |                                   |
| RITY NOTICE <#SECURITY_NOTICE>`__ |                                   |
| \| `ISSUE FILES <#ISSUE_FILES>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AGETTY(8)                 System Administration                AGETTY(8)

NAME
-------------------------------------------------

::

          agetty - alternative Linux getty


---------------------------------------------------------

::

          agetty [options] port [baud_rate...] [term]


---------------------------------------------------------------

::

          agetty opens a tty port, prompts for a login name and invokes the
          /bin/login command. It is normally invoked by init(8).

          agetty has several non-standard features that are useful for
          hardwired and for dial-in lines:

          •   Adapts the tty settings to parity bits and to erase, kill,
              end-of-line and uppercase characters when it reads a login
              name. The program can handle 7-bit characters with even, odd,
              none or space parity, and 8-bit characters with no parity.
              The following special characters are recognized: Control-U
              (kill); DEL and backspace (erase); carriage return and line
              feed (end of line). See also the --erase-chars and
              --kill-chars options.

          •   Optionally deduces the baud rate from the CONNECT messages
              produced by Hayes(tm)-compatible modems.

          •   Optionally does not hang up when it is given an already
              opened line (useful for call-back applications).

          •   Optionally does not display the contents of the /etc/issue
              file.

          •   Optionally displays an alternative issue files or directories
              instead of /etc/issue or /etc/issue.d.

          •   Optionally does not ask for a login name.

          •   Optionally invokes a non-standard login program instead of
              /bin/login.

          •   Optionally turns on hardware flow control.

          •   Optionally forces the line to be local with no need for
              carrier detect.

          This program does not use the /etc/gettydefs (System V) or
          /etc/gettytab (SunOS 4) files.


-----------------------------------------------------------

::

          port
              A path name relative to the /dev directory. If a "-" is
              specified, agetty assumes that its standard input is already
              connected to a tty port and that a connection to a remote
              user has already been established.

              Under System V, a "-" port argument should be preceded by a
              "--".

          baud_rate,...
              A comma-separated list of one or more baud rates. Each time
              agetty receives a BREAK character it advances through the
              list, which is treated as if it were circular.

              Baud rates should be specified in descending order, so that
              the null character (Ctrl-@) can also be used for baud-rate
              switching.

              This argument is optional and unnecessary for virtual
              terminals.

              The default for serial terminals is keep the current baud
              rate (see --keep-baud) and if unsuccessful then default to
              '9600'.

          term
              The value to be used for the TERM environment variable. This
              overrides whatever init(1) may have set, and is inherited by
              login and the shell.

              The default is 'vt100', or 'linux' for Linux on a virtual
              terminal, or 'hurd' for GNU Hurd on a virtual terminal.


-------------------------------------------------------

::

          -8, --8bits
              Assume that the tty is 8-bit clean, hence disable parity
              detection.

          -a, --autologin username
              Automatically log in the specified user without asking for a
              username or password. Using this option causes an -f username
              option and argument to be added to the /bin/login command
              line. See --login-options, which can be used to modify this
              option’s behavior.

              Note that --autologin may affect the way in which getty
              initializes the serial line, because on auto-login agetty
              does not read from the line and it has no opportunity
              optimize the line setting.

          -c, --noreset
              Do not reset terminal cflags (control modes). See termios(3)
              for more details.

          -E, --remote
              Typically the login(1) command is given a remote hostname
              when called by something such as telnetd(8). This option
              allows agetty to pass what it is using for a hostname to
              login(1) for use in utmp(5). See --host, login(1), and
              utmp(5).

              If the --host fakehost option is given, then an -h fakehost
              option and argument are added to the /bin/login command line.

              If the --nohostname option is given, then an -H option is
              added to the /bin/login command line.

              See --login-options.

          -f, --issue-file path
              Specifies a ":" delimited list of files and directories to be
              displayed instead of /etc/issue (or other). All specified
              files and directories are displayed, missing or empty files
              are silently ignored. If the specified path is a directory
              then display all files with .issue file extension in
              version-sort order from the directory. This allows custom
              messages to be displayed on different terminals. The
              --noissue option will override this option.

          --show-issue
              Display the current issue file (or other) on the current
              terminal and exit. Use this option to review the current
              setting, it is not designed for any other purpose. Note that
              output may use some default or incomplete information as
              proper output depends on terminal and agetty command line.

          -h, --flow-control
              Enable hardware (RTS/CTS) flow control. It is left up to the
              application to disable software (XON/XOFF) flow protocol
              where appropriate.

          -H, --host fakehost
              Write the specified fakehost into the utmp file. Normally, no
              login host is given, since agetty is used for local hardwired
              connections and consoles. However, this option can be useful
              for identifying terminal concentrators and the like.

          -i, --noissue
              Do not display the contents of /etc/issue (or other) before
              writing the login prompt. Terminals or communications
              hardware may become confused when receiving lots of text at
              the wrong baud rate; dial-up scripts may fail if the login
              prompt is preceded by too much text.

          -I, --init-string initstring
              Set an initial string to be sent to the tty or modem before
              sending anything else. This may be used to initialize a
              modem. Non-printable characters may be sent by writing their
              octal code preceded by a backslash (\). For example, to send
              a linefeed character (ASCII 10, octal 012), write \12.

          -J, --noclear
              Do not clear the screen before prompting for the login name.
              By default the screen is cleared.

          -l, --login-program login_program
              Invoke the specified login_program instead of /bin/login.
              This allows the use of a non-standard login program. Such a
              program could, for example, ask for a dial-up password or use
              a different password file. See --login-options.

          -L, --local-line[=mode]
              Control the CLOCAL line flag. The optional mode argument is
              'auto', 'always' or 'never'. If the mode argument is omitted,
              then the default is 'always'. If the --local-line option is
              not given at all, then the default is 'auto'.

              always
                  Forces the line to be a local line with no need for
                  carrier detect. This can be useful when you have a
                  locally attached terminal where the serial line does not
                  set the carrier-detect signal.

              never
                  Explicitly clears the CLOCAL flag from the line setting
                  and the carrier-detect signal is expected on the line.

              auto
                  The agetty default. Does not modify the CLOCAL setting
                  and follows the setting enabled by the kernel.

          -m, --extract-baud
              Try to extract the baud rate from the CONNECT status message
              produced by Hayes(tm)-compatible modems. These status
              messages are of the form: "<junk><speed><junk>". agetty
              assumes that the modem emits its status message at the same
              speed as specified with (the first) baud_rate value on the
              command line.

              Since the --extract-baud feature may fail on heavily-loaded
              systems, you still should enable BREAK processing by
              enumerating all expected baud rates on the command line.

          --list-speeds
              Display supported baud rates. These are determined at
              compilation time.

          -n, --skip-login
              Do not prompt the user for a login name. This can be used in
              connection with the --login-program option to invoke a
              non-standard login process such as a BBS system. Note that
              with the --skip-login option, agetty gets no input from the
              user who logs in and therefore will not be able to figure out
              parity, character size, and newline processing of the
              connection. It defaults to space parity, 7 bit characters,
              and ASCII CR (13) end-of-line character. Beware that the
              program that agetty starts (usually /bin/login) is run as
              root.

          -N, --nonewline
              Do not print a newline before writing out /etc/issue.

          -o, --login-options login_options
              Options and arguments that are passed to login(1). Where \u
              is replaced by the login name. For example:

              --login-options '-h darkstar -- \u'

              See --autologin, --login-program and --remote.

              Please read the SECURITY NOTICE below before using this
              option.

          -p, --login-pause
              Wait for any key before dropping to the login prompt. Can be
              combined with --autologin to save memory by lazily spawning
              shells.

          -r, --chroot directory
              Change root to the specified directory.

          -R, --hangup
              Call vhangup(2) to do a virtual hangup of the specified
              terminal.

          -s, --keep-baud
              Try to keep the existing baud rate. The baud rates from the
              command line are used when agetty receives a BREAK character.
              If another baud rates specified then the original baud rate
              is also saved to the end of the wanted baud rates list. This
              can be used to return to the original baud rate after
              unexpected BREAKs.

          -t, --timeout timeout
              Terminate if no user name could be read within timeout
              seconds. Use of this option with hardwired terminal lines is
              not recommended.

          -U, --detect-case
              Turn on support for detecting an uppercase-only terminal.
              This setting will detect a login name containing only
              capitals as indicating an uppercase-only terminal and turn on
              some upper-to-lower case conversions. Note that this has no
              support for any Unicode characters.

          -w, --wait-cr
              Wait for the user or the modem to send a carriage-return or a
              linefeed character before sending the /etc/issue file (or
              others) and the login prompt. This is useful with the
              --init-string option.

          --nohints
              Do not print hints about Num, Caps and Scroll Locks.

          --nohostname
              By default the hostname will be printed. With this option
              enabled, no hostname at all will be shown.

          --long-hostname
              By default the hostname is only printed until the first dot.
              With this option enabled, the fully qualified hostname by
              gethostname(3P) or (if not found) by getaddrinfo(3) is shown.

          --erase-chars string
              This option specifies additional characters that should be
              interpreted as a backspace ("ignore the previous character")
              when the user types the login name. The default additional
              'erase' has been '#', but since util-linux 2.23 no additional
              erase characters are enabled by default.

          --kill-chars string
              This option specifies additional characters that should be
              interpreted as a kill ("ignore all previous characters") when
              the user types the login name. The default additional 'kill'
              has been '@', but since util-linux 2.23 no additional kill
              characters are enabled by default.

          --chdir directory
              Change directory before the login.

          --delay number
              Sleep seconds before open tty.

          --nice number
              Run login with this priority.

          --reload
              Ask all running agetty instances to reload and update their
              displayed prompts, if the user has not yet commenced logging
              in. After doing so the command will exit. This feature might
              be unsupported on systems without Linux inotify(7).

          --version
              Display version information and exit.

          --help
              Display help text and exit.


-------------------------------------------------------

::

          This section shows examples for the process field of an entry in
          the /etc/inittab file. You’ll have to prepend appropriate values
          for the other fields. See inittab(5) for more details.

          For a hardwired line or a console tty:

             /sbin/agetty 9600 ttyS1

          For a directly connected terminal without proper carrier-detect
          wiring (try this if your terminal just sleeps instead of giving
          you a password: prompt):

             /sbin/agetty --local-line 9600 ttyS1 vt100

          For an old-style dial-in line with a 9600/2400/1200 baud modem:

             /sbin/agetty --extract-baud --timeout 60 ttyS1
             9600,2400,1200

          For a Hayes modem with a fixed 115200 bps interface to the
          machine (the example init string turns off modem echo and result
          codes, makes modem/computer DCD track modem/modem DCD, makes a
          DTR drop cause a disconnection, and turns on auto-answer after 1
          ring):

             /sbin/agetty --wait-cr --init-string
             'ATE0Q1&D2&C1S0=1\015' 115200 ttyS1


-----------------------------------------------------------------------

::

          If you use the --login-program and --login-options options, be
          aware that a malicious user may try to enter lognames with
          embedded options, which then get passed to the used login
          program. Agetty does check for a leading "-" and makes sure the
          logname gets passed as one parameter (so embedded spaces will not
          create yet another parameter), but depending on how the login
          binary parses the command line that might not be sufficient.
          Check that the used login program cannot be abused this way.

          Some programs use "--" to indicate that the rest of the command
          line should not be interpreted as options. Use this feature if
          available by passing "--" before the username gets passed by \u.


---------------------------------------------------------------

::

          The default issue file is /etc/issue. If the file exists, then
          agetty also checks for /etc/issue.d directory. The directory is
          optional extension to the default issue file and content of the
          directory is printed after /etc/issue content. If the /etc/issue
          does not exist, then the directory is ignored. All files with
          .issue extension from the directory are printed in version-sort
          order. The directory can be used to maintain 3rd-party messages
          independently on the primary system /etc/issue file.

          Since version 2.35 additional locations for issue file and
          directory are supported. If the default /etc/issue does not
          exist, then agetty checks for /run/issue and /run/issue.d,
          thereafter for /usr/lib/issue and /usr/lib/issue.d. The directory
          /etc is expected for host specific configuration, /run is
          expected for generated stuff and /usr/lib for static distribution
          maintained configuration.

          The default path maybe overridden by --issue-file option. In this
          case specified path has to be file or directory and all the
          default issue file and directory locations are ignored.

          The issue file feature can be completely disabled by --noissue
          option.

          It is possible to review the current issue file by agetty
          --show-issue on the current terminal.

          The issue files may contain certain escape codes to display the
          system name, date, time et cetera. All escape codes consist of a
          backslash (\) immediately followed by one of the characters
          listed below.

          4 or 4{interface}
              Insert the IPv4 address of the specified network interface
              (for example: \4{eth0}). If the interface argument is not
              specified, then select the first fully configured (UP,
              non-LOCALBACK, RUNNING) interface. If not any configured
              interface is found, fall back to the IP address of the
              machine’s hostname.

          6 or 6{interface}
              The same as \4 but for IPv6.

          b
              Insert the baudrate of the current line.

          d
              Insert the current date.

          e or e{name}
              Translate the human-readable name to an escape sequence and
              insert it (for example: \e{red}Alert text.\e{reset}). If the
              name argument is not specified, then insert \033. The
              currently supported names are: black, blink, blue, bold,
              brown, cyan, darkgray, gray, green, halfbright, lightblue,
              lightcyan, lightgray, lightgreen, lightmagenta, lightred,
              magenta, red, reset, reverse, yellow and white. All unknown
              names are silently ignored.

          s
              Insert the system name (the name of the operating system).
              Same as 'uname -s'. See also the \S escape code.

          S or S{VARIABLE}
              Insert the VARIABLE data from /etc/os-release. If this file
              does not exist then fall back to /usr/lib/os-release. If the
              VARIABLE argument is not specified, then use PRETTY_NAME from
              the file or the system name (see \s). This escape code can be
              used to keep /etc/issue distribution and release independent.
              Note that \S{ANSI_COLOR} is converted to the real terminal
              escape sequence.

          l
              Insert the name of the current tty line.

          m
              Insert the architecture identifier of the machine. Same as
              uname -m.

          n
              Insert the nodename of the machine, also known as the
              hostname. Same as uname -n.

          o
              Insert the NIS domainname of the machine. Same as hostname
              -d.

          O
              Insert the DNS domainname of the machine.

          r
              Insert the release number of the OS. Same as uname -r.

          t
              Insert the current time.

          u
              Insert the number of current users logged in.

          U
              Insert the string "1 user" or "<n> users" where <n> is the
              number of current users logged in.

          v
              Insert the version of the OS, that is, the build-date and
              such.

          An example. On my system, the following /etc/issue file:

              This is \n.\o (\s \m \r) \t

          displays as:

              This is thingol.orcan.dk (Linux i386 1.1.9) 18:29:30


---------------------------------------------------

::

          /var/run/utmp
              the system status file.

          /etc/issue
              printed before the login prompt.

          /etc/os-release /usr/lib/os-release
              operating system identification data.

          /dev/console
              problem reports (if syslog(3) is not used).

          /etc/inittab
              init(8) configuration file for SysV-style init daemon.


-------------------------------------------------

::

          The baud-rate detection feature (the --extract-baud option)
          requires that agetty be scheduled soon enough after completion of
          a dial-in call (within 30 ms with modems that talk at 2400 baud).
          For robustness, always use the --extract-baud option in
          combination with a multiple baud rate command-line argument, so
          that BREAK processing is enabled.

          The text in the /etc/issue file (or other) and the login prompt
          are always output with 7-bit characters and space parity.

          The baud-rate detection feature (the --extract-baud option)
          requires that the modem emits its status message after raising
          the DCD line.


---------------------------------------------------------------

::

          Depending on how the program was configured, all diagnostics are
          written to the console device or reported via the syslog(3)
          facility. Error messages are produced if the port argument does
          not specify a terminal device; if there is no utmp entry for the
          current process (System V only); and so on.


-------------------------------------------------------

::

          Werner Fink <werner@suse.de>, Karel Zak <kzak@redhat.com>

          The original agetty for serial terminals was written by W.Z.
          Venema <wietse@wzv.win.tue.nl> and ported to Linux by Peter
          Orbaek <poe@daimi.aau.dk>.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The agetty command is part of the util-linux package which can be
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

   util-linux 2.37.294-0c7e       2021-08-19                      AGETTY(8)

--------------

Pages that refer to this page: `tty(4) <../man4/tty.4.html>`__, 
`ttyS(4) <../man4/ttyS.4.html>`__, 
`issue(5) <../man5/issue.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`ttytype(5) <../man5/ttytype.5.html>`__, 
`utmp(5) <../man5/utmp.5.html>`__, 
`systemd-getty-generator(8) <../man8/systemd-getty-generator.8.html>`__

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
