.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

babeltrace2-list-plugins(1) — Linux manual page
===============================================

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
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BABELTRACE2-LIST-P(1)      Babeltrace 2 manual     BABELTRACE2-LIST-P(1)

NAME
-------------------------------------------------

::

          babeltrace2-list-plugins - List Babeltrace 2 plugins and their
          properties


---------------------------------------------------------

::

          babeltrace2 [GENERAL OPTIONS] list-plugins


---------------------------------------------------------------

::

          The list-plugins command prints a list of available Babeltrace 2
          plugins along with their component classes and their properties.

          See babeltrace2-intro(7) to learn more about the Babeltrace 2
          project and its core concepts.


-------------------------------------------------------

::

      General
          You can use those options before the command name.

          See babeltrace2(1) for more details.

          -d, --debug
              Legacy option: this is equivalent to --log-level=TRACE.

          -l LVL, --log-level=LVL
              Set the log level of all known Babeltrace 2 loggers to LVL.

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

      Command information
          -h, --help
              Show the command’s help and quit.


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

          This command is part of the Babeltrace 2 project.

          Babeltrace is distributed under the MIT license (see
          <https://opensource.org/licenses/MIT>).


---------------------------------------------------------

::

          babeltrace2-intro(7), babeltrace2(1), babeltrace2-help(1)

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

   Babeltrace 2.1.0-rc1        14 September 2019      BABELTRACE2-LIST-P(1)

--------------

Pages that refer to this page:
`babeltrace2(1) <../man1/babeltrace2.1.html>`__, 
`babeltrace2-help(1) <../man1/babeltrace2-help.1.html>`__, 
`babeltrace2-intro(7) <../man7/babeltrace2-intro.7.html>`__

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
