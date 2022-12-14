.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

automount(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ARGUMENTS <#ARGUMENTS>`__ \|     |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AUTOMOUNT(8)             System Manager's Manual            AUTOMOUNT(8)

NAME
-------------------------------------------------

::

          automount - manage autofs mount points


---------------------------------------------------------

::

          automount [options] [master_map]


---------------------------------------------------------------

::

          The automount program is used to manage mount points for autofs,
          the inlined Linux automounter.  automount works by reading the
          auto.master(5) map and sets up mount points for each entry in the
          master map allowing them to be automatically mounted when
          accessed. The file systems are then automatically umounted after
          a period of inactivity.


-------------------------------------------------------

::

          -h, --help
                 Print brief help on program usage.

          -p, --pid-file
                 Write the pid of the daemon to the specified file.

          -t <seconds>, --timeout <seconds>
                 Set the global minimum timeout, in seconds, until
                 directories are unmounted. The default is 10 minutes.
                 Setting the timeout to zero disables umounts completely.
                 The internal program default is 10 minutes, but the
                 default installed configuration overrides this and sets
                 the timeout to 5 minutes to be consistent with earlier
                 autofs releases.

          -M <seconds>, --master-wait <seconds>
                 Set the maximum time to wait for the master map to become
                 available if it cannot be read at program start.

          -n <seconds>, --negative-timeout <seconds>
                 Set the default timeout for caching failed key lookups.
                 The default is 60 seconds.

          -v, --verbose
                 Enables logging of general status and progress messages
                 for all autofs managed mounts.

          -d, --debug
                 Enables logging of general status and progress messages as
                 well as debugging messages for all autofs managed mounts.

          -Dvariable=value, --define variable=value
                 Define a global macro substitution variable. Global
                 definitions are over-ridden macro definitions of the same
                 name specified in mount entries.

          -S, --systemd-service
                 Used when running the automounter as a systemd service to
                 ensure log entry format is consistent with the log entry
                 format when running as a daemon.

          -f, --foreground
                 Run the daemon in the foreground and log to stderr instead
                 of syslog."

          -r, --random-multimount-selection
                 Enables the use of random selection when choosing a host
                 from a list of replicated servers.

          -m, --dumpmaps [<map type> <map name>]
                 With no parameters, list information about the configured
                 automounter maps, then exit.

                 If the dumpmaps option is given and is followed by two
                 parameters, "<map type> <map name>" then simple "<key,
                 value>" pairs that would be read in by a map read are
                 printed to stdout if the given map type and map name are
                 found in the map configuration.

                 If the map is an LDAP map and there is more than one map
                 of same name in different base dns only the first map
                 encountered by autofs will be listed. Similarly, if the
                 map is a file map and there is more than one map of the
                 same name in different directories, only the first map
                 encountered will be listed.

                 If the map type is an old style multi-map and any one of
                 the map names in the multi-map entry matches the given map
                 name the entries that would be used by autofs for the
                 whole multi-map will be listed.

          -O, --global-options
                 Allows the specification of global mount options used for
                 all master map entries. These options will either replace
                 or be appended to options given in a master map entry
                 depending on the APPEND_OPTIONS configuration setting.

          -V, --version
                 Display the version number, then exit.

          -l, --set-log-priority priority path [path,...]
                 Set the daemon log priority to the specified value.  Valid
                 values include the numbers 0-7, or the strings emerg,
                 alert, crit, err, warning, notice, info, or debug. Log
                 level debug will log everything, log levels info, warn (or
                 warning), or notice with enable the daemon verbose
                 logging. Any other level will set basic logging. Note that
                 enabling debug or verbose logging in the autofs global
                 configuration will override dynamic log level changes. For
                 example, if verbose logging is set in the configuration
                 then attempting to set logging to basic logging, by using
                 alert, crit, err or emerg won't stop the verbose logging.
                 However, setting logging to debug will lead to everything
                 (debug logging) being logged witch can then also be
                 disabled, returning the daemon to verbose logging. This
                 option can be specified to change the logging priority of
                 an already running automount process.

                 The path argument corresponds to the automounted path name
                 as specified in the master map.

          -C, --dont-check-daemon
                 Don't check if the daemon is currently running (see
                 NOTES).

          -F, --force
                 Force an unlink umount of existing mounts under configured
                 autofs managed mount points during startup. This can cause
                 problems for processes with working directories within
                 these mounts (see NOTES).

          -U, --force-exit
                 Force an unlink umount of existing mounts under configured
                 autofs managed mount points and exit rather than
                 continuing the startup. This can cause problems for
                 processes with working directories within these mounts
                 (see NOTES).


-----------------------------------------------------------

::

          automount takes one optional argument, the name of the master map
          to use.

          master_map
                 Location for autofs master map that defines autofs managed
                 mount points and the mount maps they will use. The default
                 is auto.master.


---------------------------------------------------

::

          If the automount daemon catches a USR1 signal, it will umount all
          currently unused autofs managed mounted file systems and continue
          running (forced expire).  If it catches the TERM signal it will
          umount all unused autofs managed mounted file systems and exit if
          there are no remaining busy file systems. If autofs has been
          compiled with the option to ignore busy mounts on exit it will
          exit leaving any busy mounts in place otherwise busy file systems
          will not be umounted and autofs will not exit.  Alternatively, if
          autofs has been compiled with the option to enable forced
          shutdown then a USR2 signal to the daemon will cause all mounts
          to be umounted and any busy mounts to be forcibly umounted,
          including autofs mount point directories (summary execution).
          Note that the forced umount is an unlink operation and the actual
          umount will not happen in the kernel until active file handles
          are released.  The daemon also responds to a HUP signal which
          triggers an update of the maps for each mount point.

          If any autofs mount point directories are busy when the daemon is
          sent an exit signal the daemon will not exit. The exception to
          this is if autofs has been built with configure options to either
          ignore busy mounts at exit or force umount at exit. If the ignore
          busy mounts at exit option is used the filesystems will be left
          in a catatonic (non-functional) state and can be manually
          umounted when they become unused. If the force umount at exit
          option is used the filesystems will be umounted but the mount
          will not be released by the kernel until they are no longer in
          use by the processes that held them busy.  If automount managed
          filesystems are found mounted when autofs is started they will be
          recovered unless they are no longer present in the map in which
          case they need to umounted manually.

          If the option to disable the check to see if the daemon is
          already running is used be aware that autofs currently may not
          function correctly for certain types of automount maps. The
          mounts of the separate daemons might interfere with one another.
          The implications of running multiple daemon instances needs to be
          checked and tested before we can say this is supported.

          If the option to force an unlink of mounts at startup is used
          then processes whose working directory is within unlinked
          automounted directories will not get the correct pwd from the
          system. This is because, after the mount is unlinked from the
          mount tree, anything that needs to walk back up the mount tree to
          construct a path, such as getcwd(2) and the proc filesystem
          /proc/<pid>/cwd, cannot work because the point from which the
          path is constructed has been detached from the mount tree.


---------------------------------------------------------

::

          autofs(5), autofs(8), autofs.conf(5), auto.master(5), mount(8),
          autofs_ldap_auth.conf(5).


-------------------------------------------------

::

          Don't know, I've fixed everything I know about.

          The documentation could be better.

          Please report other bugs along with a detailed description to
          <autofs@vger.kernel.org>. Visit
          http://vger.kernel.org/vger-lists.html#autofs for information
          about the list.


-----------------------------------------------------

::

          H. Peter Anvin <hpa@transmeta.com> and Ian Kent
          <raven@themaw.net>.

COLOPHON
---------------------------------------------------------

::

          This page is part of the autofs (automount) project.  Information
          about the project can be found at ⟨http://www.autofs.org/⟩.  If
          you have a bug report for this manual page, send it to
          autofs@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/storage/autofs/autofs.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-07-07.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  12 Apr 2006                  AUTOMOUNT(8)

--------------

Pages that refer to this page: `autofs(5) <../man5/autofs.5.html>`__, 
`autofs.conf(5) <../man5/autofs.conf.5.html>`__, 
`auto.master(5) <../man5/auto.master.5.html>`__, 
`nfs(5) <../man5/nfs.5.html>`__, 
`systemd.automount(5) <../man5/systemd.automount.5.html>`__, 
`autofs(8) <../man8/autofs.8.html>`__

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
