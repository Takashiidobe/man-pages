.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cups-files.conf(5) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cups-files.conf(5)             Apple Inc.             cups-files.conf(5)

NAME
-------------------------------------------------

::

          cups-files.conf - file and directory configuration file for cups


---------------------------------------------------------------

::

          The cups-files.conf file configures the files and directories
          used by the CUPS scheduler, cupsd(8).  It is normally located in
          the /etc/cups directory.

          Each line in the file can be a configuration directive, a blank
          line, or a comment.  Configuration directives typically consist
          of a name and zero or more values separated by whitespace.  The
          configuration directive name and values are case-insensitive.
          Comment lines start with the # character.

      DIRECTIVES
          The following directives are understood by cupsd(8):

          AccessLog

          AccessLog filename

          AccessLog stderr

          AccessLog syslog
               Defines the access log filename.  Specifying a blank
               filename disables access log generation.  The value "stderr"
               causes log entries to be sent to the standard error file
               when the scheduler is running in the foreground, or to the
               system log daemon when run in the background.  The value
               "syslog" causes log entries to be sent to the system log
               daemon.  The server name may be included in filenames using
               the string "%s", for example:

                   AccessLog /var/log/cups/%s-access_log

               The default is "/var/log/cups/access_log".

          CacheDir directory
               Specifies the directory to use for long-lived temporary
               (cache) files.  The default is "/var/spool/cups/cache" or
               "/var/cache/cups" depending on the platform.

          ConfigFilePerm mode
               Specifies the permissions for all configuration files that
               the scheduler writes.  The default is "0644" on macOS and
               "0640" on all other operating systems.

          Note: The permissions for the printers.conf file are currently
          masked to only allow access from the scheduler user (typically
          root).  This is done because printer device URIs sometimes
          contain sensitive authentication information that should not be
          generally known on the system.  There is no way to disable this
          security feature.

          CreateSelfSignedCerts yes

          CreateSelfSignedCerts no
               Specifies whether the scheduler automatically creates self-
               signed certificates for client connections using TLS.  The
               default is yes.

          DataDir path
               Specifies the directory where data files can be found.  The
               default is usually "/usr/share/cups".

          DocumentRoot directory
               Specifies the root directory for the CUPS web interface
               content.  The default is usually "/usr/share/doc/cups".

          ErrorLog

          ErrorLog filename

          ErrorLog stderr

          ErrorLog syslog
               Defines the error log filename.  Specifying a blank filename
               disables error log generation.  The value "stderr" causes
               log entries to be sent to the standard error file when the
               scheduler is running in the foreground, or to the system log
               daemon when run in the background.  The value "syslog"
               causes log entries to be sent to the system log daemon.  The
               server name may be included in filenames using the string
               "%s", for example:

                   ErrorLog /var/log/cups/%s-error_log

               The default is "/var/log/cups/error_log".

          FatalErrors none

          FatalErrors all -kind [ ... -kind ]

          FatalErrors kind [ ... kind ]
               Specifies which errors are fatal, causing the scheduler to
               exit.  The default is "config".  The kind strings are:

               none No errors are fatal.

               all  All of the errors below are fatal.

               browse
                    Browsing initialization errors are fatal, for example
                    failed connections to the DNS-SD daemon.

               config
                    Configuration file syntax errors are fatal.

               listen
                    Listen or Port errors are fatal, except for IPv6
                    failures on the loopback or "any" addresses.

               log  Log file creation or write errors are fatal.

               permissions
                    Bad startup file permissions are fatal, for example
                    shared TLS certificate and key files with world-read
                    permissions.

          Group group-name-or-number
               Specifies the group name or ID that will be used when
               executing external programs.  The default group is operating
               system specific but is usually "lp" or "nobody".

          LogFilePerm mode
               Specifies the permissions of all log files that the
               scheduler writes.  The default is "0644".

          PageLog [ filename ]

          PageLog stderr

          PageLog syslog
               Defines the page log filename.  The value "stderr" causes
               log entries to be sent to the standard error file when the
               scheduler is running in the foreground, or to the system log
               daemon when run in the background.  The value "syslog"
               causes log entries to be sent to the system log daemon.
               Specifying a blank filename disables page log generation.
               The server name may be included in filenames using the
               string "%s", for example:

                   PageLog /var/log/cups/%s-page_log

               The default is "/var/log/cups/page_log".

          PassEnv variable [ ... variable ]
               Passes the specified environment variable(s) to child
               processes.  Note: the standard CUPS filter and backend
               environment variables cannot be overridden using this
               directive.

          RemoteRoot username
               Specifies the username that is associated with
               unauthenticated accesses by clients claiming to be the root
               user.  The default is "remroot".

          RequestRoot directory
               Specifies the directory that contains print jobs and other
               HTTP request data.  The default is "/var/spool/cups".

          Sandboxing relaxed

          Sandboxing strict
               Specifies the level of security sandboxing that is applied
               to print filters, backends, and other child processes of the
               scheduler.  The default is "strict".  This directive is
               currently only used/supported on macOS.

          ServerBin directory
               Specifies the directory containing the backends, CGI
               programs, filters, helper programs, notifiers, and port
               monitors.  The default is "/usr/lib/cups" or
               "/usr/libexec/cups" depending on the platform.

          ServerKeychain path
               Specifies the location of TLS certificates and private keys.
               The default is "/Library/Keychains/System.keychain" on macOS
               and "/etc/cups/ssl" on all other operating systems.  macOS
               uses its keychain database to store certificates and keys
               while other platforms use separate files in the specified
               directory, *.crt for PEM-encoded certificates and *.key for
               PEM-encoded private keys.

          ServerRoot directory
               Specifies the directory containing the server configuration
               files.  The default is "/etc/cups".

          SetEnv variable value
               Set the specified environment variable to be passed to child
               processes.  Note: the standard CUPS filter and backend
               environment variables cannot be overridden using this
               directive.

          StateDir directory
               Specifies the directory to use for PID and local certificate
               files.  The default is "/var/run/cups" or "/etc/cups"
               depending on the platform.

          SyncOnClose Yes

          SyncOnClose No
               Specifies whether the scheduler calls fsync(2) after writing
               configuration or state files.  The default is "No".

          SystemGroup group-name [ ... group-name ]
               Specifies the group(s) to use for @SYSTEM group
               authentication.  The default contains "admin", "lpadmin",
               "root", "sys", and/or "system".

          TempDir directory
               Specifies the directory where short-term temporary files are
               stored.  The default is "/var/spool/cups/tmp".

          User username
               Specifies the user name or ID that is used when running
               external programs.  The default is "lp".

      DEPRECATED DIRECTIVES
          The following directives are deprecated and will be removed from
          a future version of CUPS:

          FileDevice Yes

          FileDevice No
               Specifies whether the file pseudo-device can be used for new
               printer queues.  The URI "file:///dev/null" is always
               allowed.  File devices cannot be used with "raw" print
               queues - a PPD file is required.  The specified file is
               overwritten for every print job.  Writing to directories is
               not supported.

          FontPath directory[:...:directoryN]
               Specifies a colon separated list of directories where fonts
               can be found.  On Linux the font-config(1) mechanism is used
               instead.  On macOS the Font Book application manages system-
               installed fonts.

           LPDConfigFile filename
               Specifies the LPD service configuration file to update.

          Printcap filename
               Specifies a file that is filled with a list of local print
               queues.

          PrintcapFormat bsd

          PrintcapFormat plist

          PrintcapFormat solaris
               Specifies the format to use for the Printcap file.  "bsd" is
               the historical LPD printcap file format.  "plist" is the
               Apple plist file format.  "solaris" is the historical
               Solaris LPD printcap file format.

          SMBConfigFile filename
               Specifies the SMB service configuration file to update.


---------------------------------------------------

::

          The scheduler MUST be restarted manually after making changes to
          the cups-files.conf file.  On Linux this is typically done using
          the systemctl(8) command, while on macOS the launchctl(8) command
          is used instead.


---------------------------------------------------------

::

          classes.conf(5), cups(1), cupsd(8), cupsd.conf(5), mime.convs(5),
          mime.types(5), printers.conf(5), subscriptions.conf(5), CUPS
          Online Help (http://localhost:631/help)


-----------------------------------------------------------

::

          Copyright © 2007-2019 by Apple Inc.

COLOPHON
---------------------------------------------------------

::

          This page is part of the CUPS (a standards-based, open source
          printing system) project.  Information about the project can be
          found at ⟨http://www.cups.org/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.cups.org/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/apple/cups⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   26 April 2019                     CUPS                cups-files.conf(5)

--------------

Pages that refer to this page:
`cupsd.conf(5) <../man5/cupsd.conf.5.html>`__, 
`cupsd-logs(5) <../man5/cupsd-logs.5.html>`__, 
`mime.convs(5) <../man5/mime.convs.5.html>`__, 
`mime.types(5) <../man5/mime.types.5.html>`__, 
`printers.conf(5) <../man5/printers.conf.5.html>`__, 
`subscriptions.conf(5) <../man5/subscriptions.conf.5.html>`__, 
`backend(7) <../man7/backend.7.html>`__, 
`filter(7) <../man7/filter.7.html>`__, 
`cupsd(8) <../man8/cupsd.8.html>`__

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
