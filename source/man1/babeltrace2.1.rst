.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

babeltrace2(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `PROJECT’                         |                                   |
| S PLUGINS <#PROJECT’S_PLUGINS>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BABELTRACE2(1)             Babeltrace 2 manual            BABELTRACE2(1)

NAME
-------------------------------------------------

::

          babeltrace2 - Convert or process one or more traces, and more


---------------------------------------------------------

::

          babeltrace2 [--debug | --verbose | --log-level=LVL]
                      [--omit-home-plugin-path] [--omit-system-plugin-path]
                      [--plugin-path=PATH[:PATH]...] [CMD] [CMD ARGS]


---------------------------------------------------------------

::

          babeltrace2 is an open-source trace converter and processor
          command-line program. The tool can open one or more traces and
          convert between multiple formats, possibly with one or more
          filters in the conversion path, and perform other operations
          depending on the command CMD (see “COMMANDS”).

              Note
              You might be looking for the babeltrace2-convert(1) command’s
              manual page; the convert command is the default command of
              babeltrace2 and is backward compatible with babeltrace(1).

              See “EXAMPLES” for convert command examples.

          See babeltrace2-intro(7) to learn more about the Babeltrace 2
          project and its core concepts.

          Most of the babeltrace2 commands load Babeltrace 2 plugins to
          perform their operation. The search path for Babeltrace 2 plugins
          is, in this order:

           1. The colon-separated (or semicolon, on Windows) list of
              directories in the BABELTRACE_PLUGIN_PATH environment
              variable.

           2. The colon-separated (or semicolon, on Windows) list of
              directories in the --plugin-path option.

           3. $HOME/.local/lib/babeltrace2/plugins

           4. /usr/local/lib/babeltrace2/plugins

          You can use the babeltrace2-list-plugins(1) command to
          dynamically list the available plugins and what they offer. See
          “PROJECT’S PLUGINS” for a list of plugins shipped with
          Babeltrace 2.


-------------------------------------------------------

::

          -d, --debug
              Legacy option: this is equivalent to --log-level=TRACE.

          -l LVL, --log-level=LVL
              Set the log level of all known Babeltrace 2 loggers to LVL,
              including individual components for the
              babeltrace2-convert(1) and babeltrace2-run(1) commands.

              You can override the log level of a specific component with
              the --log-level option of the babeltrace2-convert(1) or
              babeltrace2-run(1) commands.

              You can override the log level of the library with the
              LIBBABELTRACE2_INIT_LOG_LEVEL environment variable.

              You can override the log level of the CLI with the
              BABELTRACE_CLI_LOG_LEVEL environment variable.

              You can override the log level of the Babeltrace 2 Python
              bindings with the BABELTRACE_PYTHON_BT2_LOG_LEVEL environment
              variable.

              The available values for LVL are:

              NONE, N
                  Logging is disabled.

              FATAL, F
                  Severe errors that lead the execution to abort
                  immediately.

                  This level should be enabled in production.

              ERROR, E
                  Errors that might still allow the execution to continue.

                  Usually, once one or more errors are reported at this
                  level, the application, plugin, or library won’t perform
                  any more useful task, but it should still exit cleanly.

                  This level should be enabled in production.

              WARN, WARNING, W
                  Unexpected situations which still allow the execution to
                  continue.

                  This level should be enabled in production.

              INFO, I
                  Informational messages that highlight progress or
                  important states of the application, plugins, or library.

                  This level can be enabled in production.

              DEBUG, D
                  Debugging information, with a higher level of details
                  than the TRACE level.

                  This level should NOT be enabled in production.

              TRACE, T
                  Low-level debugging context information.

                  This level should NOT be enabled in production.

          --omit-home-plugin-path
              Do not search for plugins in
              $HOME/.local/lib/babeltrace2/plugins.

          --omit-system-plugin-path
              Do not search for plugins in
              /usr/local/lib/babeltrace2/plugins.

          --plugin-path=PATH[:PATH]...
              Add PATH to the list of paths in which plugins can be found.

          -v, --verbose
              Legacy option: this is equivalent to --log-level=INFO.

              If CMD is convert or is missing, then this also sets the
              verbose parameter of the implicit sink.text.pretty component
              (see babeltrace2-sink.text.pretty(7)) to true.

          -h, --help
              Show help and quit.

          -V, --version
              Show version and quit.


---------------------------------------------------------

::

          The following commands also have their own --help option.

          convert
              Convert one or more traces to a given format, possibly with
              filters in the conversion path.

              This is the default command: you don’t need to explicitly
              specify this command’s name to use it.

              This command is backward compatible with the babeltrace(1)
              program.

              See babeltrace2-convert(1).

          help
              Get help for a specific plugin or plugin’s component class.

              See babeltrace2-help(1).

          list-plugins
              List the available Babeltrace 2 plugins and their component
              classes.

              See babeltrace2-list-plugins(1).

          query
              Query an object from a component class.

              See babeltrace2-query(1).

          run
              Build a trace processing graph and run it.

              See babeltrace2-run(1).


---------------------------------------------------------------------------

::

          The following plugins are provided by the Babeltrace 2 project
          itself.

          babeltrace2-plugin-ctf(7)
              CTF trace input (from the file system and from the LTTng-live
              protocol) and output to the file system.

              Component classes:

              •   babeltrace2-source.ctf.fs(7)

              •   babeltrace2-source.ctf.lttng-live(7)

              •   babeltrace2-sink.ctf.fs(7)

          babeltrace2-plugin-lttng-utils(7)
              Processing graph utilities for LTTng traces.

              Component class:

              •   babeltrace2-filter.lttng-utils.debug-info(7)

          babeltrace2-plugin-text(7)
              Plain text input and output.

              Component classes:

              •   babeltrace2-source.text.dmesg(7)

              •   babeltrace2-sink.text.details(7)

              •   babeltrace2-sink.text.pretty(7)

          babeltrace2-plugin-utils(7)
              Processing graph utilities.

              Component classes:

              •   babeltrace2-filter.utils.muxer(7)

              •   babeltrace2-filter.utils.trimmer(7)

              •   babeltrace2-sink.utils.counter(7)

              •   babeltrace2-sink.utils.dummy(7)


---------------------------------------------------------

::

          The following examples are the same as the babeltrace2-convert(1)
          manual page’s examples because convert is the default babeltrace2
          program’s command.

          Example 1. Pretty-print the events, in order, of one or more CTF
          traces.

              $ babeltrace2 my-ctf-traces

              $ babeltrace2 my-ctf-traces

              $ babeltrace2 my-ctf-trace-1 my-ctf-trace-2 my-ctf-trace-3

          Example 2. Trim a CTF trace and pretty-print the events.

              $ babeltrace2 my-ctf-trace --begin=22:55:43.658582931 \
                                         --end=22:55:46.967687564

              $ babeltrace2 my-trace --begin=22:55:43.658582931

              $ babeltrace2 my-trace --end=22:55:46.967687564

              $ babeltrace2 my-trace --timerange=22:55:43,22:55:46.967687564

          Example 3. Trim a CTF trace, enable the stream intersection mode,
          and write a CTF trace.

              $ babeltrace2 my-ctf-trace --stream-intersection \
                            --timerange=22:55:43,22:55:46.967687564 \
                            --output-format=ctf --output=out-ctf-trace

          Example 4. Print the available remote LTTng sessions (through
          LTTng live).

              $ babeltrace2 --input-format=lttng-live net://localhost

          Example 5. Pretty-print LTTng live events.

              $ babeltrace2 net://localhost/host/myhostname/my-session-name

          Example 6. Record LTTng live traces to the file system (as CTF
          traces).

              $ babeltrace2 net://localhost/host/myhostname/my-session-name \
                            --params=session-not-found-action=end \
                            --output-format=ctf --output=out-ctf-traces

          Example 7. Read a CTF trace as fast as possible using a dummy
          output.

              $ babeltrace2 my-trace --output-format=dummy

          Example 8. Read three CTF traces in stream intersection mode, add
          debugging information, and pretty-print them to a file.

              $ babeltrace2 ctf-trace1 ctf-trace2 ctf-trace3 --stream-intersection \
                            --debug-info --output=pretty-out

          Example 9. Pretty-print a CTF trace and traces from an explicit
          source component, with the event times showed in seconds since
          the Unix epoch.

              $ babeltrace2 ctf-trace --component=src.my-plugin.my-src \
                            --params='path="spec-trace",output-some-event-type=yes' \
                            --clock-seconds

          Example 10. Send LTTng live events to an explicit sink component.

              $ babeltrace2 net://localhost/host/myhostname/mysession \
                            --component=sink.my-plugin.my-sink

          Example 11. Trim a CTF trace, add debugging information, apply an
          explicit filter component, and write as a CTF trace.

              $ babeltrace2 /path/to/ctf/trace --timerange=22:14:38,22:15:07 \
                            --debug-info --component=filter.my-plugin.my-filter \
                            --params=criteria=xyz,ignore-abc=yes \
                            --output-format=ctf --output=out-ctf-trace

          Example 12. Print the metadata text of a CTF trace.

              $ babeltrace2 /path/to/ctf/trace --output-format=ctf-metadata


-----------------------------------------------------------------------------------

::

      Babeltrace 2 library
          BABELTRACE_EXEC_ON_ABORT=CMDLINE
              Execute the command line CMDLINE, as parsed like a UNIX 98
              shell, when any part of the Babeltrace 2 project unexpectedly
              aborts.

              The application only aborts when the executed command
              returns, ignoring its exit status.

              This environment variable is ignored when the application has
              the setuid or the setgid access right flag set.

          BABELTRACE_TERM_COLOR=(AUTO | NEVER | ALWAYS)
              Force the terminal color support for the babeltrace2(1)
              program and the project’s plugins.

              The available values are:

              AUTO
                  Only emit terminal color codes when the standard output
                  and error streams are connected to a color-capable
                  terminal.

              NEVER
                  Never emit terminal color codes.

              ALWAYS
                  Always emit terminal color codes.

          BABELTRACE_TERM_COLOR_BRIGHT_MEANS_BOLD=0
              Set to 0 to emit SGR (see
              <https://en.wikipedia.org/wiki/ANSI_escape_code>) codes 90 to
              97 for bright colors instead of bold (SGR code 1) and
              standard color codes (SGR codes 30 to 37).

          BABELTRACE_PLUGIN_PATH=PATHS
              Set the list of directories, in order, in which dynamic
              plugins can be found before other directories are considered
              to PATHS (colon-separated, or semicolon on Windows).

          LIBBABELTRACE2_DISABLE_PYTHON_PLUGINS=1
              Disable the loading of any Babeltrace 2 Python plugin.

          LIBBABELTRACE2_INIT_LOG_LEVEL=LVL
              Force the Babeltrace 2 library’s initial log level to be LVL.

              If this environment variable is set, it overrides the log
              level set by the --log-level option for the Babeltrace 2
              library logger.

              The available values for LVL are:

              NONE, N
                  Logging is disabled.

              FATAL, F
                  Severe errors that lead the execution to abort
                  immediately.

                  This level should be enabled in production.

              ERROR, E
                  Errors that might still allow the execution to continue.

                  Usually, once one or more errors are reported at this
                  level, the application, plugin, or library won’t perform
                  any more useful task, but it should still exit cleanly.

                  This level should be enabled in production.

              WARN, WARNING, W
                  Unexpected situations which still allow the execution to
                  continue.

                  This level should be enabled in production.

              INFO, I
                  Informational messages that highlight progress or
                  important states of the application, plugins, or library.

                  This level can be enabled in production.

              DEBUG, D
                  Debugging information, with a higher level of details
                  than the TRACE level.

                  This level should NOT be enabled in production.

              TRACE, T
                  Low-level debugging context information.

                  This level should NOT be enabled in production.

          LIBBABELTRACE2_NO_DLCLOSE=1
              Make the Babeltrace 2 library leave any dynamically loaded
              modules (plugins and plugin providers) open at exit. This can
              be useful for debugging purposes.

          LIBBABELTRACE2_PLUGIN_PROVIDER_DIR=DIR
              Set the directory from which the Babeltrace 2 library
              dynamically loads plugin provider shared objects to DIR.

              If this environment variable is set, it overrides the default
              plugin provider directory.

      Babeltrace 2 Python bindings
          BABELTRACE_PYTHON_BT2_LOG_LEVEL=LVL
              Force the Babeltrace 2 Python bindings log level to be LVL.

              If this environment variable is set, it overrides the log
              level set by the --log-level option for the Python bindings
              logger.

              The available values for LVL are:

              NONE, N
                  Logging is disabled.

              FATAL, F
                  Severe errors that lead the execution to abort
                  immediately.

                  This level should be enabled in production.

              ERROR, E
                  Errors that might still allow the execution to continue.

                  Usually, once one or more errors are reported at this
                  level, the application, plugin, or library won’t perform
                  any more useful task, but it should still exit cleanly.

                  This level should be enabled in production.

              WARN, WARNING, W
                  Unexpected situations which still allow the execution to
                  continue.

                  This level should be enabled in production.

              INFO, I
                  Informational messages that highlight progress or
                  important states of the application, plugins, or library.

                  This level can be enabled in production.

              DEBUG, D
                  Debugging information, with a higher level of details
                  than the TRACE level.

                  This level should NOT be enabled in production.

              TRACE, T
                  Low-level debugging context information.

                  This level should NOT be enabled in production.

      CLI
          BABELTRACE_CLI_LOG_LEVEL=LVL
              Force babeltrace2 CLI’s log level to be LVL.

              If this environment variable is set, it overrides the log
              level set by the --log-level option for the CLI logger.

              The available values for LVL are:

              NONE, N
                  Logging is disabled.

              FATAL, F
                  Severe errors that lead the execution to abort
                  immediately.

                  This level should be enabled in production.

              ERROR, E
                  Errors that might still allow the execution to continue.

                  Usually, once one or more errors are reported at this
                  level, the application, plugin, or library won’t perform
                  any more useful task, but it should still exit cleanly.

                  This level should be enabled in production.

              WARN, WARNING, W
                  Unexpected situations which still allow the execution to
                  continue.

                  This level should be enabled in production.

              INFO, I
                  Informational messages that highlight progress or
                  important states of the application, plugins, or library.

                  This level can be enabled in production.

              DEBUG, D
                  Debugging information, with a higher level of details
                  than the TRACE level.

                  This level should NOT be enabled in production.

              TRACE, T
                  Low-level debugging context information.

                  This level should NOT be enabled in production.

          BABELTRACE_CLI_WARN_COMMAND_NAME_DIRECTORY_CLASH=0
              Disable the warning message which babeltrace2-convert(1)
              prints when you convert a trace with a relative path that’s
              also the name of a babeltrace2 command.

          BABELTRACE_DEBUG=1
              Legacy variable: equivalent to setting the --log-level option
              to TRACE.

          BABELTRACE_VERBOSE=1
              Legacy variable: equivalent to setting the --log-level option
              to INFO.


---------------------------------------------------

::

          $HOME/.local/lib/babeltrace2/plugins
              User plugin directory.

          /usr/local/lib/babeltrace2/plugins
              System plugin directory.

          /usr/local/lib/babeltrace2/plugin-providers
              System plugin provider directory.


---------------------------------------------------------------

::

          0 on success, 1 otherwise.


-------------------------------------------------

::

          If you encounter any issue or usability problem, please report it
          on the Babeltrace bug tracker (see
          <https://bugs.lttng.org/projects/babeltrace>).


-----------------------------------------------------------

::

          The Babeltrace project shares some communication channels with
          the LTTng project (see <https://lttng.org/>).

          •   Babeltrace website (see <https://babeltrace.org/>)

          •   Mailing list (see <https://lists.lttng.org>) for support and
              development: lttng-dev@lists.lttng.org

          •   IRC channel (see <irc://irc.oftc.net/lttng>): #lttng on
              irc.oftc.net

          •   Bug tracker (see
              <https://bugs.lttng.org/projects/babeltrace>)

          •   Git repository (see
              <https://git.efficios.com/?p=babeltrace.git>)

          •   GitHub project (see <https://github.com/efficios/babeltrace>)

          •   Continuous integration (see
              <https://ci.lttng.org/view/Babeltrace/>)

          •   Code review (see
              <https://review.lttng.org/q/project:babeltrace>)


-------------------------------------------------------

::

          The Babeltrace 2 project is the result of hard work by many
          regular developers and occasional contributors.

          The current project maintainer is Jérémie Galarneau
          <mailto:jeremie.galarneau@efficios.com>.


-----------------------------------------------------------

::

          This program is part of the Babeltrace 2 project.

          Babeltrace is distributed under the MIT license (see
          <https://opensource.org/licenses/MIT>).


---------------------------------------------------------

::

          babeltrace2-intro(7), babeltrace2-convert(1),
          babeltrace2-help(1), babeltrace2-list-plugins(1),
          babeltrace2-query(1), babeltrace2-run(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the babeltrace (trace read and write
          libraries and a trace converter) project.  Information about the
          project can be found at ⟨http://www.efficios.com/babeltrace⟩.  If
          you have a bug report for this manual page, send it to
          lttng-dev@lists.lttng.org.  This page was obtained from the
          project's upstream Git repository
          ⟨git://git.efficios.com/babeltrace.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-20.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Babeltrace 2.1.0-rc1        14 September 2019             BABELTRACE2(1)

--------------

Pages that refer to this page:
`babeltrace2(1) <../man1/babeltrace2.1.html>`__, 
`babeltrace2-convert(1) <../man1/babeltrace2-convert.1.html>`__, 
`babeltrace2-help(1) <../man1/babeltrace2-help.1.html>`__, 
`babeltrace2-list-plugins(1) <../man1/babeltrace2-list-plugins.1.html>`__, 
`babeltrace2-log(1) <../man1/babeltrace2-log.1.html>`__, 
`babeltrace2-query(1) <../man1/babeltrace2-query.1.html>`__, 
`babeltrace2-run(1) <../man1/babeltrace2-run.1.html>`__, 
`babeltrace2-intro(7) <../man7/babeltrace2-intro.7.html>`__, 
`babeltrace2-sink.text.details(7) <../man7/babeltrace2-sink.text.details.7.html>`__, 
`babeltrace2-sink.text.pretty(7) <../man7/babeltrace2-sink.text.pretty.7.html>`__

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
