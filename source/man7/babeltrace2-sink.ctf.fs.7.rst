.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

babeltrace2-sink.ctf.fs(7) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INITIALIZATION PARAMETER         |                                   |
| S <#INITIALIZATION_PARAMETERS>`__ |                                   |
| \| `PORTS <#PORTS>`__ \|          |                                   |
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

   BABELTRACE2-SINK.(7)       Babeltrace 2 manual      BABELTRACE2-SINK.(7)

NAME
-------------------------------------------------

::

          babeltrace2-sink.ctf.fs - Babeltrace 2's file system CTF sink
          component class


---------------------------------------------------------------

::

          A Babeltrace 2 sink.ctf.fs component writes the messages it
          consumes to one or more CTF (see <https://diamon.org/ctf/>) 1.8
          traces on the file system.

                          +-------------+
                          | sink.ctf.fs |
                          |             +--> CTF trace(s) on
              Messages -->@ in          |    the file system
                          +-------------+

          See babeltrace2-intro(7) to learn more about the Babeltrace 2
          project and its core concepts.

          A sink.ctf.fs component does not merge traces: it writes the
          messages of different input traces to different output traces.

      Special trace IR to CTF translations
          A sink.ctf.fs component makes a best effort to write CTF traces
          that are semantically equivalent to the input traces. As of this
          version, the component writes CTF 1.8 traces, so the following
          field class translations can occur:

          •   The component translates a boolean field class to a CTF
              unsigned 8-bit integer field class.

              The unsigned integer field’s value is 0 when the boolean
              field’s value is false and 1 when the boolean field’s value
              is true.

          •   The component translates a bit array field to a CTF unsigned
              integer field class having the same length.

          •   The component translates an option field class to a CTF
              variant field class where the options are an empty structure
              field class and the optional field class itself.

              The empty structure field is selected when the option field
              has no field.

          In all the cases above, the component adds a comment in the
          metadata stream, above the field class, to indicate that a
          special translation occurred.

      Input message constraints
          Because of limitations in CTF 1.8 regarding how discarded events
          and packets are encoded:

          •   If a stream class supports discarded events and the ignore-
              discarded-events parameter is NOT true:

              •   The stream class must support packets.

              •   Discarded events messages must have times.

              •   Any discarded events message must occur between a packet
                  end and a packet beginning message.

              •   The beginning time of a discarded events message must be
                  the same as the time of the last packet end message.

              •   The end time of a discarded events message must be the
                  same as the time of the next packet end message.

              •   Time ranges of discarded events messages must not
                  overlap.

          •   If a stream class supports discarded packets and the ignore-
              discarded-packets parameter is NOT true:

              •   The stream class must support packets.

              •   Discarded packets messages must have times.

              •   The beginning time of a discarded events message must be
                  the same as the time of the last packet end message.

              •   The end time of a discarded events message must be the
                  same as the time of the next packet beginning message.

              •   Time ranges of discarded packets messages must not
                  overlap.

          The messages which a source.ctf.fs component creates satisfy all
          the requirements above.

          If a discarded events or packets message has no events/packets
          count, the sink.ctf.fs component adds 1 to the corresponding CTF
          stream’s counter.

      Alignment and byte order
          A sink.ctf.fs component always aligns data fields as such:

          Integer fields with a size which is not a multiple of 8
              1-bit.

          All other scalar fields (integer, enumeration, real, string)
              8-bit.

          The component writes fields using the machine’s native byte
          order. As of this version, there’s no way to force a custom byte
          order.

      Output path
          The path of a CTF trace is the directory which directly contains
          the metadata and data stream files.

          The current strategy to build a path in which to write the
          streams of a given input trace is, in this order:

           1. If the assume-single-trace parameter is true, then the output
              trace path to use for the single input trace is the directory
              specified by the path parameter.

           2. If the component recognizes the input trace as an LTTng (2.11
              or greater) trace, then it checks specific trace environment
              values to build a trace path relative to the directory
              specified by the path parameter:

              Linux kernel domain

                      HOST/SNAME-STIME/kernel

              User space domain, per-UID buffering

                      HOST/SNAME-STIME/ust/uid/UID/ARCHW-bit

              User space domain, per-PID buffering

                      HOST/SNAME-STIME/ust/pid/PNAME-PID-PTIME

              With:

              HOST
                  Target’s hostname.

              SNAME
                  Tracing session name.

              STIME
                  Tracing session creation date/time.

              UID
                  User ID.

              ARCHW
                  Architecture’s width (32 or 64).

              PNAME
                  Process name.

              PID
                  Process ID.

              PTIME
                  Process’s date/time.

           3. If the input trace has a name, then the component sanitizes
              this name and uses it as a relative path to the directory
              specified by the path parameter.

              The trace name sanitization operation:

              •   Replaces .  subdirectories with _.

              •   Replaces ..  subdirectories with __.

              •   Removes any trailing / character.

           4. The component uses the subdirectory trace relative to the
              directory specified by the path parameter.

          In all the cases above, if the effective output trace path
          already exists on the file system, the component appends a
          numeric suffix to the name of the last subdirectory. The suffix
          starts at 0 and increments until the path does not exist.


-------------------------------------------------------------------------------------------

::

          assume-single-trace=yes [optional boolean]
              Assume that the component only receives messages related to a
              single input trace.

              This parameter affects how the component builds the output
              trace path (see “Output path”).

          ignore-discarded-events=yes [optional boolean]
              Ignore discarded events messages.

          ignore-discarded-packets=yes [optional boolean]
              Ignore discarded packets messages.

          path=PATH [string]
              Base output path.

              See “Output path” to learn how the component uses this
              parameter to build the output path for a given input trace.

          quiet=yes [optional boolean]
              Do not write anything to the standard output.


---------------------------------------------------

::

              +-------------+
              | sink.ctf.fs |
              |             |
              @ in          |
              +-------------+

      Input
          in
              Single input port.


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

          babeltrace2-intro(7), babeltrace2-plugin-ctf(7)

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
`babeltrace2-log(1) <../man1/babeltrace2-log.1.html>`__, 
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
