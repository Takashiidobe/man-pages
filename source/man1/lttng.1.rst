.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
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

   LTTNG(1)                      LTTng Manual                      LTTNG(1)

NAME
-------------------------------------------------

::

          lttng - LTTng 2 tracer control command-line tool


---------------------------------------------------------

::

          lttng [--group=GROUP] [--mi=TYPE] [--no-sessiond | --sessiond-path=PATH]
                [--quiet | -v | -vv | -vvv] COMMAND [COMMAND OPTIONS]


---------------------------------------------------------------

::

          The Linux Trace Toolkit: next generation <https://lttng.org/> is
          an open source software package used for correlated tracing of
          the Linux kernel, user applications, and user libraries.

          LTTng consists of Linux kernel modules (for Linux kernel tracing)
          and dynamically loaded libraries (for user application and
          library tracing).

          An LTTng session daemon, lttng-sessiond(8), receives commands
          from the command-line interface lttng to control the LTTng
          tracers. All interactions with the LTTng tracers happen through
          the lttng tool or through the liblttng-ctl library shipped with
          the LTTng-tools package.

          A tracing domain is a tracer category. There are five available
          domains. For some commands, the domain needs to be specified with
          a command-line option. The domain options are:

          -j, --jul
              Apply command to the java.util.logging (JUL) domain.

          -k, --kernel
              Apply command to the Linux kernel domain.

          -l, --log4j
              Apply command to the Apache log4j 1.2
              <https://logging.apache.org/log4j/1.2/> (Java) domain.

          -p, --python
              Apply command to the Python <https://www.python.org/> domain.

          -u, --userspace
              Apply command to the user space domain (application using
              liblttng-ust directly; see lttng-ust(3)).

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

              Note
              It is highly recommended to start the session daemon at boot
              time for stable and long-term tracing.

          User applications instrumented with LTTng automatically register
          to the root session daemon and to user session daemons. This
          allows any session daemon to list the available traceable
          applications and event sources (see lttng-list(1)).

          By default, the lttng-create(1) command automatically spawns a
          user session daemon if none is currently running. The --no-
          sessiond general option can be set to avoid this.


-------------------------------------------------------

::

          -g GROUP, --group=GROUP
              Use GROUP as Unix tracing group (default: tracing).

          -m TYPE, --mi=TYPE
              Print the command’s result using the machine interface type
              TYPE instead of a human-readable output.

              Supported types: xml.

              The machine interface (MI) mode converts the traditional
              pretty-printing to a machine output syntax. The MI mode
              provides a change-resistant way to access information
              generated by the lttng command-line program.

              When using the MI mode, the data is printed to the standard
              output. Errors and warnings are printed on the standard error
              with the pretty-print default format.

              If any error occurs during the execution of a command, the
              return value of the command will be different than 0. In this
              case, lttng does NOT guarantee the syntax and data validity
              of the generated MI output.

              For the xml MI type, an XML schema definition (XSD) file used
              for validation is available: see the src/common/mi_lttng.xsd
              file in the LTTng-tools source tree.

          -n, --no-sessiond
              Do not automatically spawn a session daemon.

          -q, --quiet
              Suppress all messages, including warnings and errors.

          --sessiond-path=PATH
              Set the session daemon binary’s absolute path to PATH.

          -v, --verbose
              Increase verbosity.

              Three levels of verbosity are available, which are triggered
              by appending additional v letters to the option (that is, -vv
              and -vvv).

      Program information
          -h, --help
              Show help.

          --list-commands
              List available commands.

          --list-options
              List available general options.

          -V, --version
              Show version.


---------------------------------------------------------

::

          The following commands also have their own --help option.

      Tracing sessions
          lttng-create(1)
              Create a tracing session.

          lttng-destroy(1)
              Tear down tracing sessions.

          lttng-load(1)
              Load tracing session configurations.

          lttng-regenerate(1)
              Manage an LTTng tracing session’s data regeneration.

          lttng-save(1)
              Save tracing session configurations.

          lttng-set-session(1)
              Set current tracing session.

      Channels
          lttng-add-context(1)
              Add context fields to a channel.

          lttng-disable-channel(1)
              Disable tracing channels.

          lttng-enable-channel(1)
              Create or enable tracing channels.

      Event rules
          lttng-disable-event(1)
              Disable event rules.

          lttng-enable-event(1)
              Create or enable event rules.

      Status
          lttng-list(1)
              List tracing sessions, domains, channels, and events.

          lttng-status(1)
              Get the status of the current tracing session.

      Control
          lttng-snapshot(1)
              Snapshot buffers of current tracing session.

          lttng-start(1)
              Start tracing.

          lttng-stop(1)
              Stop tracing.

      Tracing session rotation
          lttng-disable-rotation(1)
              Unset a rotation schedule.

          lttng-enable-rotation(1)
              Set a rotation schedule.

          lttng-rotate(1)
              Archive a tracing session’s current trace chunk.

      Resource tracking
          lttng-track(1)
              Track specific system resources.

          lttng-untrack(1)
              Untrack specific system resources.

      Miscellaneous
          lttng-help(1)
              Display help information about a command.

          lttng-version(1)
              Show version information.

          lttng-view(1)
              Start trace viewer.


-----------------------------------------------------------------------------------

::

          LTTNG_ABORT_ON_ERROR
              Set to 1 to abort the process after the first error is
              encountered.

          LTTNG_HOME
              Overrides the $HOME environment variable. Useful when the
              user running the commands has a non-writable home directory.

          LTTNG_MAN_BIN_PATH
              Absolute path to the man pager to use for viewing help
              information about LTTng commands (using lttng-help(1) or
              lttng COMMAND --help).

          LTTNG_SESSION_CONFIG_XSD_PATH
              Path in which the session.xsd session configuration XML
              schema may be found.

          LTTNG_SESSIOND_PATH
              Full session daemon binary path.

              The --sessiond-path option has precedence over this
              environment variable.

          Note that the lttng-create(1) command can spawn an LTTng session
          daemon automatically if none is running. See lttng-sessiond(8)
          for the environment variables influencing the execution of the
          session daemon.


---------------------------------------------------

::

          $LTTNG_HOME/.lttngrc
              User LTTng runtime configuration.

              This is where the per-user current tracing session is stored
              between executions of lttng(1). The current tracing session
              can be set with lttng-set-session(1). See lttng-create(1) for
              more information about tracing sessions.

          $LTTNG_HOME/lttng-traces
              Default output directory of LTTng traces. This can be
              overridden with the --output option of the lttng-create(1)
              command.

          $LTTNG_HOME/.lttng
              User LTTng runtime and configuration directory.

          $LTTNG_HOME/.lttng/sessions
              Default location of saved user tracing sessions (see
              lttng-save(1) and lttng-load(1)).

          /usr/local/etc/lttng/sessions
              System-wide location of saved tracing sessions (see
              lttng-save(1) and lttng-load(1)).

              Note
              $LTTNG_HOME defaults to $HOME when not explicitly set.


---------------------------------------------------------------

::

          0
              Success

          1
              Command error

          2
              Undefined command

          3
              Fatal error

          4
              Command warning (something went wrong during the command)


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

          lttng-sessiond(8), lttng-relayd(8), lttng-crash(1), lttng-ust(3),
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

   LTTng 2.12.0-pre               10/29/2018                       LTTNG(1)

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
`lttng-health-check(3) <../man3/lttng-health-check.3.html>`__, 
`lttng-ust(3) <../man3/lttng-ust.3.html>`__, 
`lttng-ust-cyg-profile(3) <../man3/lttng-ust-cyg-profile.3.html>`__, 
`lttng-ust-dl(3) <../man3/lttng-ust-dl.3.html>`__, 
`tracef(3) <../man3/tracef.3.html>`__, 
`tracelog(3) <../man3/tracelog.3.html>`__, 
`babeltrace2-filter.lttng-utils.debug-info(7) <../man7/babeltrace2-filter.lttng-utils.debug-info.7.html>`__, 
`lttng-relayd(8) <../man8/lttng-relayd.8.html>`__, 
`lttng-sessiond(8) <../man8/lttng-sessiond.8.html>`__

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
