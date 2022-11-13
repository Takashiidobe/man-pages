.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-sessiond(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `LIMITATIONS <#LIMITATIONS>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `COPYRIGHTS <#COPYRIGHTS>`__ \|   |                                   |
| `THANKS <#THANKS>`__ \|           |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LTTNG-SESSIOND(8)             LTTng Manual             LTTNG-SESSIOND(8)

NAME
-------------------------------------------------

::

          lttng-sessiond - LTTng 2 tracing session daemon


---------------------------------------------------------

::

          lttng-sessiond [--background | --daemonize] [--sig-parent]
                         [--config=PATH] [--group=GROUP] [--load=PATH]
                         [--agent-tcp-port=PORT]
                         [--apps-sock=PATH] [--client-sock=PATH]
                         [--no-kernel | [--kmod-probes=PROBE[,PROBE]...]
                                        [--extra-kmod-probes=PROBE[,PROBE]...]
                                        [--kconsumerd-err-sock=PATH]
                                        [--kconsumerd-cmd-sock=PATH]]
                         [--ustconsumerd32-err-sock=PATH]
                         [--ustconsumerd64-err-sock=PATH]
                         [--ustconsumerd32-cmd-sock=PATH]
                         [--ustconsumerd64-cmd-sock=PATH]
                         [--consumerd32-path=PATH] [--consumerd32-libdir=PATH]
                         [--consumerd64-path=PATH] [--consumerd64-libdir=PATH]
                         [--quiet | [-v | -vv | -vvv] [--verbose-consumer]]


---------------------------------------------------------------

::

          The Linux Trace Toolkit: next generation <https://lttng.org/> is
          an open source software package used for correlated tracing of
          the Linux kernel, user applications, and user libraries.

          LTTng consists of Linux kernel modules (for Linux kernel tracing)
          and dynamically loaded libraries (for user application and
          library tracing).

          The LTTng session daemon is a tracing registry which allows the
          user to interact with multiple tracers (kernel and user space)
          within the same container, a tracing session. Traces can be
          gathered from the Linux kernel and/or from instrumented
          applications (see lttng-ust(3)). You can aggregate and read the
          events of LTTng traces using babeltrace(1).

          To trace the Linux kernel, the session daemon needs to be running
          as root. LTTng uses a tracing group to allow specific users to
          interact with the root session daemon. The default tracing group
          name is tracing. You can use the --group option to set the
          tracing group name to use.

          Session daemons can coexist. You can have a session daemon
          running as user Alice that can be used to trace her applications
          alongside a root session daemon or a session daemon running as
          user Bob.

          The LTTng session daemon manages trace data consumer daemons by
          spawning them when necessary. You do not need to manage the
          consumer daemons manually.

              Note
              It is highly recommended to start the session daemon at boot
              time for stable and long-term tracing.

      Automatic loading of tracing session configurations
          When the session daemon starts, it automatically loads session
          configuration files.

          The following directories are searched, non-recursively, in this
          order for configuration files to load on launch:

           1. $LTTNG_HOME/.lttng/sessions/auto ($LTTNG_HOME defaults to
              $HOME)

           2. /usr/local/etc/lttng/sessions/auto

          Note that both the directory containing the tracing session
          configurations and the session daemon binary must share the same
          UID for the configurations to be automatically loaded.

          The --load option overrides the default directories and the UID
          check. The session daemon simply checks if the path is accessible
          and tries to load every tracing session configuration in it. When
          this option is specified, the default directories are NOT
          searched for configuration files. When the option is not
          specified, both default directories are searched for
          configuration files.

          If the --load option’s argument is a directory, then all the
          tracing session configurations found in all the files in this
          directory are loaded. If the argument is a file, then all the
          tracing session configurations found in this file are loaded.


-------------------------------------------------------

::

      Daemon configuration
          -b, --background
              Start as Unix daemon, but keep file descriptors (console)
              open. Use the --daemonize option instead to close the file
              descriptors.

          -d, --daemonize
              Start as Unix daemon, and close file descriptors (console).
              Use the --background option instead to keep the file
              descriptors open.

          -f, --config=PATH
              Load session daemon configuration from path PATH.

          -g, --group=GROUP
              Use GROUP as Unix tracing group (default: tracing).

          -l, --load=PATH
              Automatically load tracing session configurations from PATH,
              either a directory or a file, instead of loading them from
              the default search directories.

          -S, --sig-parent
              Send SIGUSR1 to parent process to notify readiness.

                  Note
                  This is used by lttng(1) to get notified when the session
                  daemon is ready to accept commands. When building a third
                  party tool on liblttng-ctl, this option can be very handy
                  to synchronize the control tool and the session daemon.

      Linux kernel tracing
          --extra-kmod-probes=PROBE[,PROBE]...
              Load specific LTTng Linux kernel modules when kernel tracing
              is enabled (--no-kernel option is NOT specified), in addition
              to loading the default list of LTTng kernel modules.

              Only the name of the probe needs to be specified, without the
              lttng-probe- prefix and without the kernel module extension
              suffix. For example, specify sched to load the lttng-probe-
              sched.ko kernel module.

          --kmod-probes=PROBE[,PROBE]...
              Only load specific LTTng Linux kernel modules when kernel
              tracing is enabled (--no-kernel option is NOT specified).

              Only the name of the probe needs to be specified, without the
              lttng-probe- prefix and without the kernel module extension
              suffix. For example, specify sched to load the lttng-probe-
              sched.ko kernel module.

          --no-kernel
              Disable Linux kernel tracing.

      Paths and ports
          --agent-tcp-port=PORT
              Listen on TCP port PORT for agent application registrations
              (default: a port within the range [5345, 5354]).

          -a PATH, --apps-sock=PATH
              Set application Unix socket path to PATH.

          -c PATH, --client-sock=PATH
              Set client Unix socket path to PATH.

          --consumerd32-libdir=PATH
              Set 32-bit consumer daemon library directory to PATH.

          --consumerd32-path=PATH
              Set 32-bit consumer daemon binary path to PATH.

          --consumerd64-libdir=PATH
              Set 64-bit consumer daemon library directory to PATH.

          --consumerd64-path=PATH
              Set 64-bit consumer daemon binary path to PATH.

          --kconsumerd-cmd-sock=PATH
              Set Linux kernel consumer daemon’s command Unix socket path
              to PATH.

          --kconsumerd-err-sock=PATH
              Set Linux kernel consumer daemon’s error Unix socket path to
              PATH.

          --ustconsumerd32-cmd-sock=PATH
              Set 32-bit consumer daemon’s command Unix socket path to
              PATH.

          --ustconsumerd64-cmd-sock=PATH
              Set 64-bit consumer daemon’s command Unix socket path to
              PATH.

          --ustconsumerd32-err-sock=PATH
              Set 32-bit consumer daemon’s error Unix socket path to PATH.

          --ustconsumerd64-err-sock=PATH
              Set 64-bit consumer daemon’s error Unix socket path to PATH.

      Verbosity
          -q, --quiet
              Suppress all messages, including warnings and errors.

          -v, --verbose
              Increase verbosity.

              Three levels of verbosity are available, which are triggered
              by appending additional v letters to the option (that is, -vv
              and -vvv).

          --verbose-consumer
              Increase verbosity of consumer daemons spawned by this
              session daemon.

      Program information
          -h, --help
              Show help.

          -V, --version
              Show version.


-----------------------------------------------------------------------------------

::

          Note that command-line options override their equivalent
          environment variable.

          LTTNG_ABORT_ON_ERROR
              Set to 1 to abort the process after the first error is
              encountered.

          LTTNG_APP_SOCKET_TIMEOUT
              Application socket’s timeout (seconds) when sending/receiving
              commands. After this period of time, the application is
              unregistered by the session daemon. A value of 0 or -1 means
              an infinite timeout. Default value: 5.

          LTTNG_CONSUMERD32_BIN
              32-bit consumer daemon binary path.

              The --consumerd32-path option overrides this variable.

          LTTNG_CONSUMERD32_LIBDIR
              32-bit consumer daemon library path.

              The --consumerd32-libdir option overrides this variable.

          LTTNG_CONSUMERD64_BIN
              64-bit consumer daemon binary path.

              The --consumerd64-path option overrides this variable.

          LTTNG_CONSUMERD64_LIBDIR
              64-bit consumer daemon library path.

              The --consumerd64-libdir option overrides this variable.

          LTTNG_DEBUG_NOCLONE
              Set to 1 to disable the use of clone()/fork(). Setting this
              variable is considered insecure, but it is required to allow
              debuggers to work with the session daemon on some operating
              systems.

          LTTNG_EXTRA_KMOD_PROBES
              Load specific LTTng Linux kernel modules when kernel tracing
              is enabled (--no-kernel option is NOT specified), in addition
              to loading the default list of LTTng kernel modules.

              The --extra-kmod-probes option overrides this variable.

          LTTNG_KMOD_PROBES
              Only load specific LTTng Linux kernel modules when kernel
              tracing is enabled (--no-kernel option is NOT specified).

              The --kmod-probes option overrides this variable.

          LTTNG_NETWORK_SOCKET_TIMEOUT
              Socket connection, receive and send timeout (milliseconds). A
              value of 0 or -1 uses the timeout of the operating system
              (default).

          LTTNG_SESSION_CONFIG_XSD_PATH
              Tracing session configuration XML schema definition (XSD)
              path.


---------------------------------------------------

::

          $LTTNG_HOME/.lttng
              User LTTng runtime and configuration directory.

          $LTTNG_HOME/lttng-traces
              Default output directory of LTTng traces. This can be
              overridden with the --output option of the lttng-create(1)
              command.

          $LTTNG_HOME/.lttng/sessions/auto
              Directory from which user tracing configuration files are
              automatically loaded when the session daemon starts (see
              lttng-save(1) and lttng-load(1) for saving and loading
              tracing sessions).

          /usr/local/etc/lttng/sessions/auto
              Directory from which system-wide tracing configuration files
              are automatically loaded when the session daemon starts (see
              lttng-save(1) and lttng-load(1) for saving and loading
              tracing sessions).

          $LTTNG_HOME/.lttng/lttng.conf
              Default location of the session daemon configuration file
              (see the --config option).

          /usr/local/etc/lttng/lttng.conf
              System-wide location of the session daemon configuration file
              (see the --config option).

              Note
              $LTTNG_HOME defaults to $HOME when not explicitly set.


---------------------------------------------------------------

::

          0
              Success

          1
              Error

          3
              Fatal error


---------------------------------------------------------------

::

          For an unprivileged user running lttng-sessiond, the maximum
          number of file descriptors per process is usually 1024. This
          limits the number of traceable applications, since for each
          instrumented application, there is two file descriptors per CPU
          and one more socket for bidirectional communication.

          For the root user, the limit is bumped to 65535. A future version
          will deal with this limitation.


-------------------------------------------------

::

          If you encounter any issue or usability problem, please report it
          on the LTTng bug tracker <https://bugs.lttng.org/projects/lttng-
          tools>.


-----------------------------------------------------------

::

          •   LTTng project website <https://lttng.org>

          •   LTTng documentation <https://lttng.org/docs>

          •   Git repositories <http://git.lttng.org>

          •   GitHub organization <http://github.com/lttng>

          •   Continuous integration <http://ci.lttng.org/>

          •   Mailing list <http://lists.lttng.org> for support and
              development: lttng-dev@lists.lttng.org

          •   IRC channel <irc://irc.oftc.net/lttng>: #lttng on
              irc.oftc.net


-------------------------------------------------------------

::

          This program is part of the LTTng-tools project.

          LTTng-tools is distributed under the GNU General Public License
          version 2 <http://www.gnu.org/licenses/old-
          licenses/gpl-2.0.en.html>. See the LICENSE
          <https://github.com/lttng/lttng-tools/blob/master/LICENSE> file
          for details.


-----------------------------------------------------

::

          Special thanks to Michel Dagenais and the DORSAL laboratory
          <http://www.dorsal.polymtl.ca/> at École Polytechnique de
          Montréal for the LTTng journey.

          Also thanks to the Ericsson teams working on tracing which helped
          us greatly with detailed bug reports and unusual test cases.


-------------------------------------------------------

::

          LTTng-tools was originally written by Mathieu Desnoyers, Julien
          Desfossez, and David Goulet. More people have since contributed
          to it.

          LTTng-tools is currently maintained by Jérémie Galarneau
          <mailto:jeremie.galarneau@efficios.com>.


---------------------------------------------------------

::

          lttng(1), lttng-relayd(8), lttng-crash(1), lttng-ust(3),
          babeltrace(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the LTTng-Tools (    LTTng tools) project.
          Information about the project can be found at 
          ⟨http://lttng.org/⟩.  It is not known how to report bugs for this
          man page; if you know, please send a mail to man-pages@man7.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.lttng.org/lttng-tools.git⟩ on 2019-11-19.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2019-11-14.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   LTTng 2.12.0-pre               10/29/2018              LTTNG-SESSIOND(8)

--------------

Pages that refer to this page: `lttng(1) <../man1/lttng.1.html>`__, 
`lttng-add-context(1) <../man1/lttng-add-context.1.html>`__, 
`lttng-calibrate(1) <../man1/lttng-calibrate.1.html>`__, 
`lttng-crash(1) <../man1/lttng-crash.1.html>`__, 
`lttng-create(1) <../man1/lttng-create.1.html>`__, 
`lttng-destroy(1) <../man1/lttng-destroy.1.html>`__, 
`lttng-disable-channel(1) <../man1/lttng-disable-channel.1.html>`__, 
`lttng-disable-event(1) <../man1/lttng-disable-event.1.html>`__, 
`lttng-disable-rotation(1) <../man1/lttng-disable-rotation.1.html>`__, 
`lttng-enable-channel(1) <../man1/lttng-enable-channel.1.html>`__, 
`lttng-enable-event(1) <../man1/lttng-enable-event.1.html>`__, 
`lttng-enable-rotation(1) <../man1/lttng-enable-rotation.1.html>`__, 
`lttng-help(1) <../man1/lttng-help.1.html>`__, 
`lttng-list(1) <../man1/lttng-list.1.html>`__, 
`lttng-load(1) <../man1/lttng-load.1.html>`__, 
`lttng-metadata(1) <../man1/lttng-metadata.1.html>`__, 
`lttng-regenerate(1) <../man1/lttng-regenerate.1.html>`__, 
`lttng-rotate(1) <../man1/lttng-rotate.1.html>`__, 
`lttng-save(1) <../man1/lttng-save.1.html>`__, 
`lttng-set-session(1) <../man1/lttng-set-session.1.html>`__, 
`lttng-snapshot(1) <../man1/lttng-snapshot.1.html>`__, 
`lttng-start(1) <../man1/lttng-start.1.html>`__, 
`lttng-status(1) <../man1/lttng-status.1.html>`__, 
`lttng-stop(1) <../man1/lttng-stop.1.html>`__, 
`lttng-track(1) <../man1/lttng-track.1.html>`__, 
`lttng-untrack(1) <../man1/lttng-untrack.1.html>`__, 
`lttng-version(1) <../man1/lttng-version.1.html>`__, 
`lttng-view(1) <../man1/lttng-view.1.html>`__, 
`lttng-relayd(8) <../man8/lttng-relayd.8.html>`__

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
