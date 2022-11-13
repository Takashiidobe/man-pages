.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

babeltrace2-query-babeltrace.trace-infos(7) — Linux manual page
===============================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `                                 |                                   |
| RESULT OBJECT <#RESULT_OBJECT>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
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

   BABELTRACE2-QUERY-(7)      Babeltrace 2 manual     BABELTRACE2-QUERY-(7)

NAME
-------------------------------------------------

::

          babeltrace2-query-babeltrace.trace-infos - Babeltrace 2's trace
          infos query object


---------------------------------------------------------------

::

          The babeltrace.trace-infos Babeltrace 2 query object indicates
          time range information about specific traces and their streams,
          and which output ports of an eventual source component will serve
          the messages for a given stream.

          The babeltrace2-convert(1) command queries this object from all
          the source component classes to support the --stream-intersection
          feature.


-------------------------------------------------------------

::

          The parameters for this query operation are exactly the same as
          you would pass as the initialization parameters of a component
          created from the queried component class.


-------------------------------------------------------------------

::

          The result object is an array of trace info maps (see “Trace info
          map”).

      Trace info map
          A trace info map contains:

          stream-infos=STREAM-INFOS [array of stream info maps]
              Stream info maps (see “Stream info map”) for this trace.

      Stream info map
          A stream info map contains:

          range-ns=RANGE [range map]
              The time range of this stream, a map containing:

              begin=NS [signed integer]
                  Beginning time of this stream (nanoseconds since the
                  stream class’s default clock class’s origin).

              end=NS [signed integer]
                  End time of this stream (nanoseconds since the stream
                  class’s default clock class’s origin).

          port-name=PORT-NAME [string]
              For an eventual source component initialized with the same
              parameters: name of the output port which serves the messages
              of this stream.


---------------------------------------------------------

::

      Result object
          Example 1. Two trace infos: one with three stream infos, one with
          two stream infos.

              - stream-infos:
                - range-ns:
                    begin: 1509556764975082000
                    end: 1509557102181554400
                  port-name: trace0-cpu0
                - range-ns:
                    begin: 1509556764947050800
                    end: 1509557102182771000
                  port-name: trace0-cpu1
                - range-ns:
                    begin: 1509556764956409300
                    end: 1509557102182770400
                  port-name: trace0-cpu2
              - stream-infos:
                - range-ns:
                    begin: 1509556764918082000
                    end: 1509557103849928400
                  port-name: trace1-cpu0
                - range-ns:
                    begin: 1509556761888820000
                    end: 1509557109928100400
                  port-name: trace1-cpu1


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

          This query object is part of the Babeltrace 2 project.

          Babeltrace is distributed under the MIT license (see
          <https://opensource.org/licenses/MIT>).


---------------------------------------------------------

::

          babeltrace2-intro(7), babeltrace2-query(1),
          babeltrace2-convert(1)

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

   Babeltrace 2.1.0-rc1        14 September 2019      BABELTRACE2-QUERY-(7)

--------------

Pages that refer to this page:
`babeltrace2-convert(1) <../man1/babeltrace2-convert.1.html>`__, 
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
