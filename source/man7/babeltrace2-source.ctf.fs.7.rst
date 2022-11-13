.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

babeltrace2-source.ctf.fs(7) — Linux manual page
================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INITIALIZATION PARAMETER         |                                   |
| S <#INITIALIZATION_PARAMETERS>`__ |                                   |
| \| `PORTS <#PORTS>`__ \|          |                                   |
| `                                 |                                   |
| QUERY OBJECTS <#QUERY_OBJECTS>`__ |                                   |
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

   BABELTRACE2-SOURCE()                                BABELTRACE2-SOURCE()

NAME
-------------------------------------------------

::

          babeltrace2-source.ctf.fs - Babeltrace 2's file system CTF source
          component class


---------------------------------------------------------------

::

          A Babeltrace 2 source.ctf.fs message iterator reads one or more
          CTF (see <https://diamon.org/ctf/>) 1.8 streams on the file
          system and emits corresponding messages.

              CTF streams on
              the file system
                |
                |   +---------------------+
                |   |      src.ctf.fs     |
                |   |                     |
                '-->|    ...5c847 | 0 | 0 @--> Stream 0 messages
                    |    ...5c847 | 0 | 1 @--> Stream 1 messages
                    |    ...5c847 | 0 | 2 @--> Stream 2 messages
                    +---------------------+

          See babeltrace2-intro(7) to learn more about the Babeltrace 2
          project and its core concepts.

      Input
          A source.ctf.fs component opens a single logical CTF trace. A
          logical CTF trace contains one or more physical CTF traces. A
          physical CTF trace on the file system is a directory which
          contains:

          •   One metadata stream file named metadata.

          •   One or more data stream files, that is, any file with a name
              that does not start with .  and which is not metadata.

          •   Optional: One LTTng (see <https://lttng.org/>) index
              directory named index.

          If the logical CTF trace to handle contains more than one
          physical CTF trace, then all the physical CTF traces must have a
          trace UUID and all UUIDs must be the same. Opening more than one
          physical CTF trace to constitute a single logical CTF trace is
          needed to support LTTng’s tracing session rotation feature, for
          example (see lttng-rotate(1) starting from LTTng 2.11).

          You specify which physical CTF traces to open and read with the
          inputs array parameter. Each entry in this array is the path to a
          physical CTF trace directory, that is, the directory directly
          containing the stream files.

          A source.ctf.fs component does not recurse into directories to
          find CTF traces. However, the component class provides the
          babeltrace.support-info query object which indicates whether or
          not a given directory looks like a CTF trace directory (see
          “babeltrace.support-info”).

          The component creates one output port for each logical CTF data
          stream. More than one physical CTF data stream file can support a
          single logical CTF data stream (LTTng’s trace file rotation and
          tracing session rotation can cause this).

          If two or more data stream files contain the same packets, a
          source.ctf.fs message iterator reads each of them only once so
          that it never emits duplicated messages. This feature makes it
          possible, for example, to open overlapping LTTng snapshots (see
          <https://lttng.org/docs/#doc-taking-a-snapshot>) with a single
          source.ctf.fs component and silently discard the duplicated
          packets.

      Trace quirks
          Many tracers produce CTF traces. A source.ctf.fs component makes
          some effort to support as many CTF traces as possible, even those
          with malformed streams.

          Generally:

          •   If the timestamp_begin or timestamp_end packet context field
              class exists, but it is not mapped to a clock class, and
              there’s only one clock class at this point in the metadata
              stream, the component maps the field class to this unique
              clock class.

          A source.ctf.fs component has special quirk handling for some
          LTTng (see <https://lttng.org/>) and barectf (see
          <https://lttng.org/>) traces, depending on the tracer’s version:

          All LTTng versions

              •   The component sets the monotonic clock class’s origin to
                  the Unix epoch so that different LTTng traces are always
                  correlatable.

                  This is the equivalent of setting the force-clock-class-
                  origin-unix-epoch parameter to true.

              •   For a given data stream, for all the contiguous last
                  packets of which the timestamp_end context field is 0,
                  the message iterator uses the packet’s last event
                  record’s time as the packet end message’s time.

                  This is useful for the traces which lttng-crash(1)
                  generates.

          LTTng-UST up to, but excluding, 2.11.0, LTTng-modules up to, but
          excluding, 2.9.13, LTTng-modules from 2.10.0 to 2.10.9

              •   For a given packet, the message iterator uses the
                  packet’s last event record’s time as the packet end
                  message’s time, ignoring the packet context’s
                  timestamp_end field.

          barectf up to, but excluding, 2.3.1

              •   For a given packet, the message iterator uses the
                  packet’s first event record’s time as the packet
                  beginning message’s time, ignoring the packet context’s
                  timestamp_begin field.

      CTF compliance
          A source.ctf.fs component decodes traces as per CTF 1.8.3 (see
          <https://diamon.org/ctf/v1.8.3/>), except:

          •   It only supports integer field classes (TSDL integer block)
              with sizes from 1 to 64.

          •   It only supports 32-bit and 64-bit floating point number
              classes (TSDL floating_point block).

          •   It doesn’t support § 4.1.6 (“GNU/C bitfields”).

          •   It doesn’t support TSDL callsite blocks: the parser simply
              ignores them.

          •   It only supports a single clock class (TSDL clock block)
              reference per stream class (TSDL stream block).

          •   It doesn’t support the checksum, compression, and encryption
              features of metadata stream packets.


-------------------------------------------------------------------------------------------

::

          clock-class-offset-ns=NS [optional signed integer]
              Add NS nanoseconds to the offset of all the clock classes
              that the component creates.

              You can combine this parameter with the clock-class-offset-s
              parameter.

          clock-class-offset-s=SEC [optional signed integer]
              Add SEC seconds to the offset of all the clock classes that
              the component creates.

              You can combine this parameter with the clock-class-offset-ns
              parameter.

          force-clock-class-origin-unix-epoch=yes [optional boolean]
              Force the origin of all clock classes that the component
              creates to have a Unix epoch origin, whatever the detected
              tracer.

          inputs=DIRS [array of strings]
              Open and read the physical CTF traces located in DIRS.

              Each element of DIRS is the path to a physical CTF trace
              directory containing the trace’s stream files.

              All the specified physical CTF traces must belong to the same
              logical CTF trace. See “Input” to learn more about logical
              and physical CTF traces.

          trace-name=NAME [optional string]
              Set the name of the trace object that the component creates
              to NAME.


---------------------------------------------------

::

              +--------------------+
              |     src.ctf.fs     |
              |                    |
              |   ...5c847 | 0 | 1 @
              |                ... @
              +--------------------+

      Output
          A source.ctf.fs component creates one output port for each
          logical CTF data stream. See “Input” to learn more about logical
          and physical CTF data streams.

          Each output port’s name has one of the following forms:

              TRACE-ID | STREAM-CLASS-ID | STREAM-ID
              TRACE-ID | STREAM-ID

          The component uses the second form when the stream class ID is
          not available.

          TRACE-ID
              Trace’s UUID if available, otherwise trace’s absolute
              directory path.

          STREAM-CLASS-ID
              Stream class ID.

          STREAM-ID
              Stream ID if available, otherwise stream’s absolute file
              path.


-------------------------------------------------------------------

::

      babeltrace.support-info
          See babeltrace2-query-babeltrace.support-info(7) to learn more
          about this query object.

          For a directory input which is the path to a CTF trace directory,
          the result object contains:

          weight
              0.75

          group
              Trace’s UUID if available, otherwise the entry does not
              exist.

          You can leverage this query object’s group entry to assemble many
          physical CTF traces as a single logical CTF trace (see “Input” to
          learn more about logical and physical CTF traces). This is how
          the babeltrace2-convert(1) command makes it possible to specify
          as non-option arguments the paths to multiple physical CTF traces
          which belong to the same logical CTF trace and create a single
          source.ctf.fs component.

      babeltrace.trace-infos
          See babeltrace2-query-babeltrace.trace-infos(7) to learn more
          about this query object.

      metadata-info
          You can query the metadata-info object for a specific CTF trace
          to get its plain text metadata stream as well as whether or not
          it is packetized.

          Parameters:

          path=PATH [string]
              Path to the physical CTF trace directory which contains the
              metadata file.

          Result object (map):

          is-packetized [boolean]
              True if the metadata stream file is packetized.

          text [string]
              Plain text metadata stream.


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

          babeltrace2-intro(7), babeltrace2-plugin-ctf(7), lttng-crash(1)

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

                                                       BABELTRACE2-SOURCE()

--------------

Pages that refer to this page:
`babeltrace2(1) <../man1/babeltrace2.1.html>`__, 
`babeltrace2-convert(1) <../man1/babeltrace2-convert.1.html>`__, 
`babeltrace2-plugin-ctf(7) <../man7/babeltrace2-plugin-ctf.7.html>`__

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
