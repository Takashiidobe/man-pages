.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

babeltrace2-sink.text.details(7) — Linux manual page
====================================================

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

          babeltrace2-sink.text.details - Babeltrace 2's detailed plain
          text sink component class


---------------------------------------------------------------

::

          A Babeltrace 2 sink.text.details component deterministically
          prints the messages it consumes, with all the possible details,
          to the standard output.

                          +-------------------+
                          | sink.text.details |
                          |                   +--> Detailed messages to the
              Messages -->@ in                |    standard output
                          +-------------------+

          See babeltrace2-intro(7) to learn more about the Babeltrace 2
          project and its core concepts.

          The purpose of a sink.text.details component is to always print
          the same text for the same sequence of consumed messages,
          whatever the build configuration of the Babeltrace 2 project.
          This can be helpful for testing, debugging, and support.

          The output format is optimized for human reading, with colors
          when the terminal supports it. You can control how the component
          prints color codes with the color parameter.

          To achieve a reproducible output, a sink.text.details component
          sorts the members of all unordered sets before it prints them.
          For example, the component sorts enumeration field class mappings
          by label and, for each mapping, sorts the contained ranges.

          In normal mode, each message has at least three lines, the three
          first being:

           1. Timing information (cycles and nanoseconds since origin).

              Example:

                  [102,423,274,041,829 cycles, 1,441,852,841,550,867,846 ns from origin]

           2. Unique stream identifier.

              To be able to follow a specific trace object (the name and
              UUID properties of a trace object are optional), the
              component assigns a unique numeric ID to the trace object
              when it first encounters it in a stream beginning message.

              Example:

                  {Trace 1, Stream class ID 0, Stream ID 2}

           3. Message type and basic information.

              Examples:

                  Packet beginning:

                  Event `lttng_ust_statedump:build_id` (Class ID 2):

          What follows depend on the specific message type. The component
          prints all the available properties and fields in a
          human-readable, structured format.

          When a sink.text.details component consumes a stream beginning or
          an event message, it can print a metadata block for all the
          metadata objects which it did not print yet. You can use the
          with-metadata parameter to disable this.

          You can hide specific properties with the with-stream-class-name,
          with-stream-name, with-time, with-trace-name, and with-uuid
          parameters.

          To make the component hide many message details and print a
          single message per line, you can enable the compact mode with the
          compact parameter.


-------------------------------------------------------------------------------------------

::

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

          compact=yes [optional boolean]
              Enable compact mode.

              In compact mode, the component prints one line per message,
              omitting many details about messages. This is useful if you
              only need the time, type, and very basic information of
              messages.

              In compact mode, the component still prints the full metadata
              blocks. You can remove such blocks with the with-metadata
              parameter.

          with-metadata=no [optional boolean]
              Do not print metadata blocks.

          with-stream-class-name=no [optional boolean]
              Do not print stream class names.

          with-stream-name=no [optional boolean]
              Do not print stream names.

          with-time=no [optional boolean]
              Do not print timing information.

          with-trace-name=no [optional boolean]
              Do not print trace names.

          with-uuid=no [optional boolean]
              Do not print UUIDs.


---------------------------------------------------

::

              +-------------------+
              | sink.text.details |
              |                   |
              @ in                |
              +-------------------+

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
