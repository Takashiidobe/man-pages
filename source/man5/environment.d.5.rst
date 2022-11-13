.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

environment.d(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATION DIRECTO            |                                   |
| RIES AND PRECEDENCE <#CONFIGURATI |                                   |
| ON_DIRECTORIES_AND_PRECEDENCE>`__ |                                   |
| \|                                |                                   |
| `CONFIGURATION                    |                                   |
| FORMAT <#CONFIGURATION_FORMAT>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| APPLICABILITY <#APPLICABILITY>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ENVIRONMENT.D(5)              environment.d             ENVIRONMENT.D(5)

NAME
-------------------------------------------------

::

          environment.d - Definition of user service environment


---------------------------------------------------------

::

          ~/.config/environment.d/*.conf

          /etc/environment.d/*.conf

          /run/environment.d/*.conf

          /usr/lib/environment.d/*.conf

          /etc/environment


---------------------------------------------------------------

::

          Configuration files in the environment.d/ directories contain
          lists of environment variable assignments for services started by
          the systemd user instance.  systemd-environment-d-generator(8)
          parses them and updates the environment exported by the systemd
          user instance. See below for an discussion of which processes
          inherit those variables.

          It is recommended to use numerical prefixes for file names to
          simplify ordering.

          For backwards compatibility, a symlink to /etc/environment is
          installed, so this file is also parsed.


-------------------------------------------------------------------------------------------------------------------------

::

          Configuration files are read from directories in /etc/, /run/,
          /usr/local/lib/, and /usr/lib/, in order of precedence, as listed
          in the SYNOPSIS section above. Files must have the ".conf"
          extension. Files in /etc/ override files with the same name in
          /run/, /usr/local/lib/, and /usr/lib/. Files in /run/ override
          files with the same name under /usr/.

          All configuration files are sorted by their filename in
          lexicographic order, regardless of which of the directories they
          reside in. If multiple files specify the same option, the entry
          in the file with the lexicographically latest name will take
          precedence. Thus, the configuration in a certain file may either
          be replaced completely (by placing a file with the same name in a
          directory with higher priority), or individual settings might be
          changed (by specifying additional settings in a file with a
          different name that is ordered later).

          Packages should install their configuration files in /usr/lib/
          (distribution packages) or /usr/local/lib/ (local installs).
          Files in /etc/ are reserved for the local administrator, who may
          use this logic to override the configuration files installed by
          vendor packages. It is recommended to prefix all filenames with a
          two-digit number and a dash, to simplify the ordering of the
          files.

          If the administrator wants to disable a configuration file
          supplied by the vendor, the recommended way is to place a symlink
          to /dev/null in the configuration directory in /etc/, with the
          same filename as the vendor configuration file. If the vendor
          configuration file is included in the initrd image, the image has
          to be regenerated.


---------------------------------------------------------------------------------

::

          The configuration files contain a list of "KEY=VALUE" environment
          variable assignments, separated by newlines. The right hand side
          of these assignments may reference previously defined environment
          variables, using the "${OTHER_KEY}" and "$OTHER_KEY" format. It
          is also possible to use "${FOO:-DEFAULT_VALUE}" to expand in the
          same way as "${FOO}" unless the expansion would be empty, in
          which case it expands to DEFAULT_VALUE, and use
          "${FOO:+ALTERNATE_VALUE}" to expand to ALTERNATE_VALUE as long as
          "${FOO}" would have expanded to a non-empty value. No other
          elements of shell syntax are supported.

          Each KEY must be a valid variable name. Empty lines and lines
          beginning with the comment character "#" are ignored.

      Example
          Example 1. Setup environment to allow access to a program
          installed in /opt/foo

          /etc/environment.d/60-foo.conf:

                      FOO_DEBUG=force-software-gl,log-verbose
                      PATH=/opt/foo/bin:$PATH
                      LD_LIBRARY_PATH=/opt/foo/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}
                      XDG_DATA_DIRS=/opt/foo/share:${XDG_DATA_DIRS:-/usr/local/share/:/usr/share/}


-------------------------------------------------------------------

::

          Environment variables exported by the user manager (systemd
          --user instance started in the user@uid.service system service)
          apply to any services started by that manager. In particular,
          this may include services which run user shells. For example in
          the GNOME environment, the graphical terminal emulator runs as
          the gnome-terminal-server.service user unit, which in turn runs
          the user shell, so that shell will inherit environment variables
          exported by the user manager. For other instances of the shell,
          not launched by the user manager, the environment they inherit is
          defined by the program that starts them. Hint: in general,
          systemd.service(5) units contain programs launched by systemd,
          and systemd.scope(5) units contain programs launched by something
          else.

          Specifically, for ssh logins, the sshd(8) service builds an
          environment that is a combination of variables forwarded from the
          remote system and defined by sshd, see the discussion in ssh(1).
          A graphical display session will have an analogous mechanism to
          define the environment. Note that some managers query the systemd
          user instance for the exported environment and inject this
          configuration into programs they start, using systemctl
          show-environment or the underlying D-Bus call.


---------------------------------------------------------

::

          systemd(1), systemd-environment-d-generator(8),
          systemd.environment-generator(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                             ENVIRONMENT.D(5)

--------------

Pages that refer to this page:
`systemd-environment-d-generator(8) <../man8/systemd-environment-d-generator.8.html>`__

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
