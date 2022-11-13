.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-rotate(1) — Linux manual page
===================================

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

   LTTNG-ROTATE(1)               LTTng Manual               LTTNG-ROTATE(1)

NAME
-------------------------------------------------

::

          lttng-rotate - Archive a tracing session's current trace chunk


---------------------------------------------------------

::

          lttng [GENERAL OPTIONS] rotate [--no-wait] [SESSION]


---------------------------------------------------------------

::

          The lttng rotate command archives the current trace chunk of the
          current tracing session, or of the tracing session named SESSION
          if provided, to the file system. This action is called a tracing
          session rotation.

          Once a trace chunk is archived, LTTng does not manage it anymore:
          you can read it, modify it, move it, or remove it.

          An archived trace chunk is a collection of metadata and data
          stream files which form a self-contained trace.

          The current trace chunk of a given tracing session includes:

          •   The stream files already written to the file system, and
              which are not part of a previously archived trace chunk,
              since the most recent event amongst:

              •   The first time the tracing session was started with
                  lttng-start(1).

              •   The last rotation, either an immediate one with lttng
                  rotate, or an automatic one from a rotation schedule
                  previously set with lttng-enable-rotation(1).

          •   The content of all the non-flushed sub-buffers of the tracing
              session’s channels.

          You can use lttng rotate either at any time when the tracing
          session is active (see lttng-start(1)), or a single time once the
          tracing session becomes inactive (see lttng-stop(1)).

          By default, the lttng rotate command ensures that the rotation is
          done before printing the archived trace chunk’s path and
          returning to the prompt. The printed path is absolute when the
          tracing session was created in normal mode and relative to the
          relay daemon’s output directory (see the --output option in
          lttng-relayd(8)) when it was created in network streaming mode
          (see lttng-create(1)).

          With the --no-wait option, the command finishes immediately,
          hence a rotation might not be completed when the command is done.
          In this case, there is no easy way to know when the current trace
          chunk is archived, and the command does not print the archived
          trace chunk’s path.

          Because a rotation causes the tracing session’s current
          sub-buffers to be flushed, archived trace chunks are never
          redundant, that is, they do not overlap over time like snapshots
          can (see lttng-snapshot(1)). Also, a rotation does not directly
          cause discarded event records or packets.

          See LIMITATIONS for important limitations regarding this command.

      Trace chunk archive naming
          A trace chunk archive is a subdirectory of a tracing session’s
          output directory (see the --output option in lttng-create(1))
          which contains, through tracing domain and possibly UID/PID
          subdirectories, metadata and data stream files.

          A trace chunk archive is, at the same time:

          •   A self-contained LTTng trace.

          •   A member of a set of trace chunk archives which form the
              complete trace of a tracing session.

          In other words, an LTTng trace reader can read both the tracing
          session output directory (all the trace chunk archives), or a
          single trace chunk archive.

          When a tracing session rotation occurs, the created trace chunk
          archive is named:

              BEGIN-END-ID

          BEGIN
              Date and time of the beginning of the trace chunk archive
              with the ISO 8601-compatible YYYYmmddTHHMMSS±HHMM form, where
              YYYYmmdd is the date and HHMMSS±HHMM is the time with the
              time zone offset from UTC.

              Example: 20171119T152407-0500

          END
              Date and time of the end of the trace chunk archive with the
              ISO 8601-compatible YYYYmmddTHHMMSS±HHMM form, where YYYYmmdd
              is the date and HHMMSS±HHMM is the time with the time zone
              offset from UTC.

              Example: 20180118T152407+0930

          ID
              Unique numeric identifier of the trace chunk within its
              tracing session.

          Trace chunk archive name example:
          20171119T152407-0500-20171119T151422-0500-3


-------------------------------------------------------

::

          General options are described in lttng(1).

          -n, --no-wait
              Do not ensure that the rotation is done before returning to
              the prompt.

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

          The lttng rotate command only works when:

          •   The tracing session is created in normal mode or in network
              streaming mode (see lttng-create(1)).

          •   No channel was created with a configured trace file count or
              size limit (see the --tracefile-size and --tracefile-count
              options in lttng-enable-channel(1)).

          •   No immediate rotation (lttng rotate) is currently happening.


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

          lttng-enable-rotation(1), lttng-disable-rotation(1), lttng(1)

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

   LTTng 2.12.0-pre               10/29/2018                LTTNG-ROTATE(1)

--------------

Pages that refer to this page: `lttng(1) <../man1/lttng.1.html>`__, 
`lttng-destroy(1) <../man1/lttng-destroy.1.html>`__, 
`lttng-enable-channel(1) <../man1/lttng-enable-channel.1.html>`__, 
`lttng-enable-rotation(1) <../man1/lttng-enable-rotation.1.html>`__, 
`lttng-regenerate(1) <../man1/lttng-regenerate.1.html>`__, 
`lttng-stop(1) <../man1/lttng-stop.1.html>`__, 
`babeltrace2-source.ctf.fs(7) <../man7/babeltrace2-source.ctf.fs.7.html>`__

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
