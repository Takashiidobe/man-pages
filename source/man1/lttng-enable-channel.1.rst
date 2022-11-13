.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-enable-channel(1) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `LIMITATIONS <#LIMITATIONS>`__ \| |                                   |
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

   LTTNG-ENABLE-CHANN(1)         LTTng Manual         LTTNG-ENABLE-CHANN(1)

NAME
-------------------------------------------------

::

          lttng-enable-channel - Create or enable LTTng channels


---------------------------------------------------------

::

          Create a Linux kernel channel:

          lttng [GENERAL OPTIONS] enable-channel --kernel
                [--overwrite] [--output=(mmap | splice)]
                [--subbuf-size=SIZE] [--num-subbuf=COUNT]
                [--switch-timer=PERIODUS] [--read-timer=PERIODUS]
                [--monitor-timer=PERIODUS]
                [--tracefile-size=SIZE] [--tracefile-count=COUNT]
                [--session=SESSION] CHANNEL

          Create a user space channel:

          lttng [GENERAL OPTIONS] enable-channel --userspace
                [--overwrite | --blocking-timeout=TIMEOUTUS] [--buffers-pid]
                [--subbuf-size=SIZE] [--num-subbuf=COUNT]
                [--switch-timer=PERIODUS] [--read-timer=PERIODUS]
                [--monitor-timer=PERIODUS]
                [--tracefile-size=SIZE] [--tracefile-count=COUNT]
                [--session=SESSION] CHANNEL

          Enable existing channel(s):

          lttng [GENERAL OPTIONS] enable-channel (--userspace | --kernel)
                [--session=SESSION] CHANNEL[,CHANNEL]...


---------------------------------------------------------------

::

          The lttng enable-channel command can create a new channel, or
          enable one or more existing and disabled ones.

          A channel is the owner of sub-buffers holding recorded events.
          Event, rules, when created using lttng-enable-event(1), are
          always assigned to a channel. When creating a new channel, many
          parameters related to those sub-buffers can be fine-tuned. They
          are described in the subsections below.

          When CHANNEL does not name an existing channel, a channel named
          CHANNEL is created. Otherwise, the disabled channel named CHANNEL
          is enabled.

          Note that the lttng-enable-event(1) command can automatically
          create default channels when no channel exist.

          A channel is always contained in a tracing session (see
          lttng-create(1) for creating a tracing session). The session in
          which a channel is created using lttng enable-channel can be
          specified using the --session option. If the --session option is
          omitted, the current tracing session is targeted.

          Existing enabled channels can be disabled using
          lttng-disable-channel(1). Channels of a given session can be
          listed using lttng-list(1).

          See the LIMITATIONS section below for a list of limitations of
          this command to consider.

      Event loss modes
          LTTng tracers are non-blocking by default: when no empty
          sub-buffer exists, losing events is acceptable when the
          alternative would be to cause substantial delays in the
          instrumented application’s execution.

          LTTng privileges performance over integrity, aiming at perturbing
          the traced system as little as possible in order to make tracing
          of subtle race conditions and rare interrupt cascades possible.

          You can allow the user space tracer to block with a --blocking-
          timeout option set to a positive value or to inf, and with an
          application which is instrumented with LTTng-UST started with a
          set LTTNG_UST_ALLOW_BLOCKING environment variable. See
          lttng-ust(3) for more details.

          When it comes to losing events because no empty sub-buffer is
          available, the channel’s event loss mode, specified by one of the
          --discard and --overwrite options, determines what to do amongst:

          Discard
              Drop the newest events until a sub-buffer is released.

          Overwrite
              Clear the sub-buffer containing the oldest recorded events
              and start recording the newest events there. This mode is
              sometimes called flight recorder mode because it behaves like
              a flight recorder: always keep a fixed amount of the latest
              data.

          Which mechanism to choose depends on the context: prioritize the
          newest or the oldest events in the ring buffer?

          Beware that, in overwrite mode (--overwrite option), a whole
          sub-buffer is abandoned as soon as a new event doesn’t find an
          empty sub-buffer, whereas in discard mode (--discard option),
          only the event that doesn’t fit is discarded.

          Also note that a count of lost events is incremented and saved in
          the trace itself when an event is lost in discard mode, whereas
          no information is kept when a sub-buffer gets overwritten before
          being committed.

          The probability of losing events, if it is experience in a given
          context, can be reduced by fine-tuning the sub-buffers count and
          size (see next subsection).

      Sub-buffers count and size
          The --num-subbuf and --subbuf-size options respectively set the
          number of sub-buffers and their individual size when creating a
          new channel.

          Note that there is a noticeable tracer’s CPU overhead introduced
          when switching sub-buffers (marking a full one as consumable and
          switching to an empty one for the following events to be
          recorded). Knowing this, the following list presents a few
          practical situations along with how to configure sub-buffers for
          them when creating a channel in overwrite mode (--overwrite
          option):

          High event throughput
              In general, prefer bigger sub-buffers to lower the risk of
              losing events. Having bigger sub-buffers also ensures a lower
              sub-buffer switching frequency. The number of sub-buffers is
              only meaningful if the channel is enabled in overwrite mode:
              in this case, if a sub-buffer overwrite happens, the other
              sub-buffers are left unaltered.

          Low event throughput
              In general, prefer smaller sub-buffers since the risk of
              losing events is already low. Since events happen less
              frequently, the sub-buffer switching frequency should remain
              low and thus the tracer’s overhead should not be a problem.

          Low memory system
              If the target system has a low memory limit, prefer fewer
              first, then smaller sub-buffers. Even if the system is
              limited in memory, it is recommended to keep the sub-buffers
              as big as possible to avoid a high sub-buffer switching
              frequency.

          In discard mode (--discard option), the sub-buffers count
          parameter is pointless: using two sub-buffers and setting their
          size according to the requirements of the context is fine.

      Switch timer
          When a channel’s switch timer fires, a sub-buffer switch happens.
          This timer may be used to ensure that event data is consumed and
          committed to trace files periodically in case of a low event
          throughput.

          It’s also convenient when big sub-buffers are used to cope with
          sporadic high event throughput, even if the throughput is
          normally lower.

          Use the --switch-timer option to control the switch timer’s
          period of the channel to create.

      Read timer
          By default, an internal notification mechanism is used to signal
          a full sub-buffer so that it can be consumed. When such
          notifications must be avoided, for example in real-time
          applications, the channel’s read timer can be used instead. When
          the read timer fires, sub-buffers are checked for consumption
          when they are full.

          Use the --read-timer option to control the read timer’s period of
          the channel to create.

      Monitor timer
          When a channel’s monitor timer fires, its registered trigger
          conditions are evaluated using the current values of its
          properties (for example, the current usage of its sub-buffers).
          When a trigger condition is true, LTTng executes its associated
          action. The only type of action currently supported is to notify
          one or more user applications.

          See the installed C/C++ headers in lttng/action, lttng/condition,
          lttng/notification, and lttng/trigger to learn more about
          application notifications and triggers.

          Use the --monitor-timer option to control the monitor timer’s
          period of the channel to create.

      Buffering scheme
          In the user space tracing domain, two buffering schemes are
          available when creating a channel:

          Per-process buffering (--buffers-pid option)
              Keep one ring buffer per process.

          Per-user buffering (--buffers-uid option)
              Keep one ring buffer for all the processes of a single user.

          The per-process buffering scheme consumes more memory than the
          per-user option if more than one process is instrumented for
          LTTng-UST. However, per-process buffering ensures that one
          process having a high event throughput won’t fill all the shared
          sub-buffers, only its own.

          The Linux kernel tracing domain only has one available buffering
          scheme which is to use a single ring buffer for the whole system
          (--buffers-global option).

      Trace files limit and size
          By default, trace files can grow as large as needed. The maximum
          size of each trace file written by a channel can be set on
          creation using the --tracefile-size option. When such a trace
          file’s size reaches the channel’s fixed maximum size, another
          trace file is created to hold the next recorded events. A file
          count is appended to each trace file name in this case.

          If the --tracefile-size option is used, the maximum number of
          created trace files is unlimited. To limit them, the --tracefile-
          count option can be used. This option is always used in
          conjunction with the --tracefile-size option.

          For example, consider this command:

              $ lttng enable-channel --kernel --tracefile-size=4096 \
                                   --tracefile-count=32 my-channel

          Here, for each stream, the maximum size of each trace file is 4
          kiB and there can be a maximum of 32 different files. When there
          is no space left in the last file, trace file rotation happens:
          the first file is cleared and new sub-buffers containing events
          are written there.

          LTTng does not guarantee that you can view the trace of an active
          tracing session (before you run the lttng-stop(1) command), even
          with multiple trace files, because LTTng could overwrite them at
          any moment, or some of them could be incomplete. You can archive
          a tracing session’s current trace chunk while the tracing session
          is active to obtain an unmanaged and self-contained LTTng trace:
          see lttng-rotate(1) and lttng-enable-rotation(1).


-------------------------------------------------------

::

          General options are described in lttng(1).

      Domain
          One of:

          -k, --kernel
              Enable channel in the Linux kernel domain.

          -u, --userspace
              Enable channel in the user space domain.

      Target
          -s SESSION, --session=SESSION
              Create or enable channel in the tracing session named SESSION
              instead of the current tracing session.

      Event loss mode
          --blocking-timeout=TIMEOUTUS
              Set the channel’s blocking timeout value to TIMEOUTUS µs for
              instrumented applications executed with a set
              LTTNG_UST_ALLOW_BLOCKING environment variable:

              0 (default)
                  Do not block (non-blocking mode).

              inf
                  Block forever until room is available in the sub-buffer
                  to write the event record.

              n, a positive value
                  Wait for at most n µs when trying to write into a
                  sub-buffer. After n µs, discard the event record.

              This option is only available with the --userspace option and
              without the --overwrite option.

          One of:

          --discard
              Discard events when sub-buffers are full (default).

          --overwrite
              Flight recorder mode: always keep a fixed amount of the
              latest data.

      Sub-buffers
          --num-subbuf=COUNT
              Use COUNT sub-buffers. Rounded up to the next power of two.

              Default values:

              •   --userspace and --buffers-uid options: 4

              •   --userspace and --buffers-pid options: 4

              •   --kernel option: 4

              •   metadata channel: 2

          --output=TYPE
              Set channel’s output type to TYPE.

              Available types: mmap (always available) and splice (only
              available with the --kernel option).

              Default values:

              •   --userspace and --buffers-uid options: mmap

              •   --userspace and --buffers-pid options: mmap

              •   --kernel option: splice

              •   metadata channel: mmap

          --subbuf-size=SIZE
              Set the individual size of sub-buffers to SIZE bytes. The k
              (kiB), M (MiB), and G (GiB) suffixes are supported. Rounded
              up to the next power of two.

              The minimum sub-buffer size, for each tracer, is the maximum
              value between the default below and the system’s page size.
              The following command shows the current system’s page size:
              getconf PAGE_SIZE.

              Default values:

              •   --userspace and --buffers-uid options: 524288

              •   --userspace and --buffers-pid options: 16384

              •   --kernel option: 1048576

              •   metadata channel: 4096

      Buffering scheme
          One of:

          --buffers-global
              Use shared sub-buffers for the whole system (only available
              with the --kernel option).

          --buffers-pid
              Use different sub-buffers for each traced process (only
              available with the the --userspace option). This is the
              default buffering scheme for user space channels.

          --buffers-uid
              Use shared sub-buffers for all the processes of the user
              running the command (only available with the --userspace
              option).

      Trace files
          --tracefile-count=COUNT
              Limit the number of trace files created by this channel to
              COUNT. 0 means unlimited. Default: 0.

              Use this option in conjunction with the --tracefile-size
              option.

              The file count within a stream is appended to each created
              trace file. If COUNT files are created and more events need
              to be recorded, the first trace file of the stream is cleared
              and used again.

          --tracefile-size=SIZE
              Set the maximum size of each trace file written by this
              channel within a stream to SIZE bytes. 0 means unlimited.
              Default: 0.

              Note: traces generated with this option may inaccurately
              report discarded events as of CTF 1.8.

      Timers
          --monitor-timer
              Set the channel’s monitor timer’s period to PERIODUS µs. 0
              means a disabled monitor timer.

              Default values:

              •   --userspace and --buffers-uid options: 1000000

              •   --userspace and --buffers-pid options: 1000000

              •   --kernel option: 1000000

          --read-timer
              Set the channel’s read timer’s period to PERIODUS µs. 0 means
              a disabled read timer.

              Default values:

              •   --userspace and --buffers-uid options: 0

              •   --userspace and --buffers-pid options: 0

              •   --kernel option: 200000

              •   metadata channel: 0

          --switch-timer=PERIODUS
              Set the channel’s switch timer’s period to PERIODUS µs. 0
              means a disabled switch timer.

              Default values:

              •   --userspace and --buffers-uid options: 0

              •   --userspace and --buffers-pid options: 0

              •   --kernel option: 0

              •   metadata channel: 0

      Program information
          -h, --help
              Show command help.

              This option, like lttng-help(1), attempts to launch
              /usr/bin/man to view the command’s man page. The path to the
              man pager can be overridden by the LTTNG_MAN_BIN_PATH
              environment variable.

          --list-options
              List available command options.


---------------------------------------------------------------

::

          As of this version of LTTng, it is not possible to perform the
          following actions with the lttng enable-channel command:

          •   Reconfigure a channel once it is created.

          •   Re-enable a disabled channel once its tracing session has
              been active at least once.

          •   Create a channel once its tracing session has been active at
              least once.

          •   Create a user space channel with a given buffering scheme
              (--buffers-uid or --buffers-pid options) and create a second
              user space channel with a different buffering scheme in the
              same tracing session.


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

          lttng-disable-channel(1), lttng(1), lttng-ust(3)

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

   LTTng 2.12.0-pre               10/29/2018          LTTNG-ENABLE-CHANN(1)

--------------

Pages that refer to this page: `lttng(1) <../man1/lttng.1.html>`__, 
`lttng-add-context(1) <../man1/lttng-add-context.1.html>`__, 
`lttng-create(1) <../man1/lttng-create.1.html>`__, 
`lttng-disable-channel(1) <../man1/lttng-disable-channel.1.html>`__, 
`lttng-disable-rotation(1) <../man1/lttng-disable-rotation.1.html>`__, 
`lttng-enable-rotation(1) <../man1/lttng-enable-rotation.1.html>`__, 
`lttng-metadata(1) <../man1/lttng-metadata.1.html>`__, 
`lttng-regenerate(1) <../man1/lttng-regenerate.1.html>`__, 
`lttng-rotate(1) <../man1/lttng-rotate.1.html>`__, 
`lttng-ust(3) <../man3/lttng-ust.3.html>`__

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
