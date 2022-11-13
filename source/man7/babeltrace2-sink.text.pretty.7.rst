.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

babeltrace2-sink.text.pretty(7) — Linux manual page
===================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INITIALIZATION PARAMETER         |                                   |
| S <#INITIALIZATION_PARAMETERS>`__ |                                   |
| \| `PORTS <#PORTS>`__ \|          |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `RESOURCES <#RESOURCES>`__ \|     |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BABELTRACE2-SINK.(7)       Babeltrace 2 manual      BABELTRACE2-SINK.(7)

NAME
-------------------------------------------------

::

          babeltrace2-sink.text.pretty - Babeltrace 2's pretty-printing
          sink component class


---------------------------------------------------------------

::

          A Babeltrace 2 sink.text.pretty component pretty-prints the
          events, discarded events, and discarded packets messages it
          consumes to the standard output or to a file.

                          +------------------+
                          | sink.text.pretty |
                          |                  +--> Pretty-printed messages to
              Messages -->@ in               |    the standard output or a file and
                          +------------------+    to the standard error

          See babeltrace2-intro(7) to learn more about the Babeltrace 2
          project and its core concepts.

          By default, a sink.text.pretty component pretty-prints to the
          standard output. You can use the path parameter to make the
          component write to a file instead.

          The component prints warnings on the standard error stream when
          it consumes a discarded events or discarded packets message.

          If you don’t use the path parameter and the application’s
          standard output is connected to a color-capable terminal, the
          component emits terminal color codes to enhance the text output.
          You can use the color parameter to force the color support or to
          disable it.

          This component class is equivalent to the text output format of
          babeltrace(1) (Babeltrace 1 command-line tool).


-------------------------------------------------------------------------------------------

::

          clock-cycles=yes [optional boolean]
              Print event times in clock cycles instead of hours, minutes,
              seconds, and nanoseconds.

          clock-date=yes [optional boolean]
              Print event times and dates.

          clock-gmt=yes [optional boolean]
              Print event times in the GMT time zone instead of the local
              time zone.

          clock-seconds=yes [optional boolean]
              Print event times in seconds instead of hours, minutes,
              seconds, and nanoseconds.

          color=(never | auto | always) [optional string]
              Force the terminal color support, one of:

              auto (default)
                  Only emit terminal color codes when the standard output
                  and error streams are connected to a color-capable
                  terminal.

              never
                  Never emit terminal color codes.

              always
                  Always emit terminal color codes.

              The BABELTRACE_TERM_COLOR environment variable overrides this
              parameter.

          field-default=(show | hide) [optional string]
              By default, show or hide all the fields. This sets the
              default value of all the parameters which start with field-.

          field-emf=(yes | no) [optional boolean]
              Show or hide the event’s Eclipse Modeling Framework URI
              field.

          field-loglevel=(yes | no) [optional boolean]
              Show or hide the event’s logging level field.

          field-trace=(yes | no) [optional boolean]
              Show or hide the trace name field.

          field-trace:domain=(yes | no) [optional boolean]
              Show or hide the tracing domain field.

          field-trace:hostname=(yes | no) [optional boolean]
              Show or hide the hostname field.

          field-trace:procname=(yes | no) [optional boolean]
              Show or hide the process name field.

          field-trace:vpid=(yes | no) [optional boolean]
              Show or hide the virtual process ID field.

          name-context=(yes | no) [optional boolean]
              Show or hide the field names in the context scopes.

          name-default=(show | hide) [optional string]
              By default, show or hide all the names. This sets the default
              value of all the parameters which start with name-.

          name-header=(yes | no) [optional boolean]
              Show or hide the field names in the header scopes.

          name-payload=(yes | no) [optional boolean]
              Show or hide the field names in the event payload scopes.

          name-scope=(yes | no) [optional boolean]
              Show or hide the scope names.

          no-delta=yes [optional boolean]
              Do not print the time delta between consecutive lines.

          path=PATH [optional string]
              Print the text output to the file PATH instead of the
              standard output.

          verbose=yes [optional boolean]
              Turn the verbose mode on.


---------------------------------------------------

::

              +------------------+
              | sink.text.pretty |
              |                  |
              @ in               |
              +------------------+

      Input
          in
              Single input port.


-----------------------------------------------------------------------------------

::

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

          This component class is part of the Babeltrace 2 project.

          Babeltrace is distributed under the MIT license (see
          <https://opensource.org/licenses/MIT>).


---------------------------------------------------------

::

          babeltrace2-intro(7), babeltrace2-plugin-text(7)

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

   Babeltrace 2.1.0-rc1        14 September 2019       BABELTRACE2-SINK.(7)

--------------

Pages that refer to this page:
`babeltrace2(1) <../man1/babeltrace2.1.html>`__, 
`babeltrace2-convert(1) <../man1/babeltrace2-convert.1.html>`__, 
`babeltrace2-plugin-text(7) <../man7/babeltrace2-plugin-text.7.html>`__

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
