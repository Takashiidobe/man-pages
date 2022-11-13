.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-create(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
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

   LTTNG-CREATE(1)               LTTng Manual               LTTNG-CREATE(1)

NAME
-------------------------------------------------

::

          lttng-create - Create an LTTng tracing session


---------------------------------------------------------

::

          Local mode:

          lttng [GENERAL OPTIONS] create [SESSION] [--shm-path=PATH]
                [--no-output | --output=PATH | --set-url=file://PATH]

          Network streaming mode:

          lttng [GENERAL OPTIONS] create [SESSION] [--shm-path=PATH]
                (--set-url=URL | --ctrl-url=URL --data-url=URL)

          Snapshot mode:

          lttng [GENERAL OPTIONS] create [SESSION] --snapshot
                [--shm-path=PATH] [--set-url=URL | --ctrl-url=URL --data-url=URL]

          Live mode:

          lttng [GENERAL OPTIONS] create [SESSION] --live[=DELAYUS]
                [--shm-path=PATH] [--set-url=URL | --ctrl-url=URL --data-url=URL]


---------------------------------------------------------------

::

          The lttng create command creates a new tracing session.

          A tracing session is a named container of channels, which in turn
          contain event rules. It is domain-agnostic, in that channels and
          event rules can be enabled for the user space tracer and/or the
          Linux kernel tracer.

          On execution, an .lttngrc file is created, if it does not exist,
          in the user’s home directory. This file contains the name of the
          current tracing session. When creating a new tracing session with
          lttng create, the current tracing session is set to this new
          tracing session. The lttng-set-session(1) command can be used to
          set the current tracing session without manually editing the
          .lttngrc file.

          If SESSION is omitted, a session name is automatically created
          having this form: auto-YYYYmmdd-HHMMSS. SESSION must not contain
          the character /.

          The --shm-path option can be used to specify the path to the
          shared memory holding the ring buffers. Specifying a location on
          an NVRAM file system makes it possible to retrieve the latest
          recorded trace data when the system reboots after a crash. To
          view the events of ring buffer files after a system crash, use
          the lttng-crash(1) utility.

          Tracing sessions are destroyed using the lttng-destroy(1)
          command.

      Creation modes
          There are four tracing session modes:

          Local mode
              Traces the local system and writes the trace to the local
              file system. The --output option specifies the trace path.
              Using --set-url=file://PATH is the equivalent of using
              --output=PATH. The file system output can be disabled using
              the --no-output option.

              If none of the options mentioned above are used, then the
              trace is written locally in the $LTTNG_HOME/lttng-traces
              directory ($LTTNG_HOME defaults to $HOME).

          Network streaming mode
              Traces the local system and sends the trace over the network
              to a listening relay daemon (see lttng-relayd(8)). The --set-
              url, or --ctrl-url and --data-url options set the trace
              output destination (see the URL format section below).

          Snapshot mode
              Traces the local system without writing the trace to the
              local file system (implicit --no-output option). Channels are
              automatically configured to be snapshot-ready on creation
              (see lttng-enable-channel(1)). The lttng-snapshot(1) command
              is used to take snapshots of the current ring buffers. The
              --set-url, or --ctrl-url and --data-url options set the
              default snapshot output destination.

          Live mode
              Traces the local system, sending trace data to an LTTng relay
              daemon over the network (see lttng-relayd(8)). The --set-url,
              or --ctrl-url and --data-url options set the trace output
              destination. The live output URLs cannot use the file://
              protocol (see the URL format section below).

      URL format
          The --set-url, --ctrl-url, and --data-url options' arguments are
          URLs.

          The format of those URLs is one of:

              file://TRACEPATH
              NETPROTO://(HOST | IPADDR)[:CTRLPORT[:DATAPORT]][/TRACEPATH]

          The file:// protocol targets the local file system and can only
          be used as the --set-url option’s argument when the session is
          created in local or snapshot mode.

          TRACEPATH
              Absolute path to trace files on the local file system.

          The other version is available when the session is created in
          network streaming, snapshot, or live mode.

          NETPROTO
              Network protocol, amongst:

              net
                  TCP over IPv4; the default values of CTRLPORT and
                  DATAPORT are respectively 5342 and 5343.

              net6
                  TCP over IPv6: same default ports as the net protocol.

              tcp
                  Same as the net protocol; can only be used with the
                  --ctrl-url and --data-url options together.

              tcp6
                  Same as the net6 protocol; can only be used with the
                  --ctrl-url and --data-url options together.

          (HOST | IPADDR)
              Hostname or IP address (IPv6 address must be enclosed in
              brackets ([ and ]); see RFC 2732
              <https://www.ietf.org/rfc/rfc2732.txt>).

          CTRLPORT
              Control port.

          DATAPORT
              Data port.

          TRACEPATH
              Path of trace files on the remote file system. This path is
              relative to the base output directory set on the relay daemon
              side; see lttng-relayd(8).


-------------------------------------------------------

::

          General options are described in lttng(1).

      Mode selection
          --live[=DELAYUS]
              Create the session in live mode.

              The optional DELAYUS parameter, given in microseconds, is the
              maximum time the user can wait for the data to be flushed.
              This mode can be set with a network URL (options --set-url,
              or --ctrl-url and --data-url) and must have a relay daemon
              listening (see lttng-relayd(8)).

              By default, DELAYUS is 1000000 and the network URL is set to
              net://127.0.0.1.

          --snapshot
              Create the session in snapshot mode. This is the equivalent
              of using the --no-output option and creating all the channels
              of this new tracing session in overwrite mode with an mmap
              output type.

      Output
          --no-output
              In local mode, do not output any trace data.

          -o PATH, --output=PATH
              In local mode, set trace output path to PATH.

          --shm-path=PATH
              Create shared memory holding buffers at PATH.

      URL
          See the URL format section above for more information about the
          syntax of the following options' URL argument.

          -C URL, --ctrl-url=URL
              Set control path URL to URL (must use --data-url option
              also).

          -D URL, --data-url=URL
              Set data path URL to URL (must use --ctrl-url option also).

          -U URL, --set-url=URL
              Set URL destination of the trace data to URL. It is
              persistent for the session lifetime. This option sets both
              data (--data-url option) and control (--ctrl-url option) URLs
              at the same time.

              In local mode, URL must start with file:// followed by the
              destination path on the local file system.

      Program information
          -h, --help
              Show command help.

              This option, like lttng-help(1), attempts to launch
              /usr/bin/man to view the command’s man page. The path to the
              man pager can be overridden by the LTTNG_MAN_BIN_PATH
              environment variable.

          --list-options
              List available command options.


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

          lttng-destroy(1), lttng-set-session(1), lttng(1)

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

   LTTng 2.12.0-pre               10/29/2018                LTTNG-CREATE(1)

--------------

Pages that refer to this page: `lttng(1) <../man1/lttng.1.html>`__, 
`lttng-add-context(1) <../man1/lttng-add-context.1.html>`__, 
`lttng-calibrate(1) <../man1/lttng-calibrate.1.html>`__, 
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
`babeltrace2-source.ctf.lttng-live(7) <../man7/babeltrace2-source.ctf.lttng-live.7.html>`__, 
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
