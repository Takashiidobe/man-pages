.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

babeltrace2-log(1) — Linux manual page
======================================

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

   BABELTRACE2-LOG(1)          Babeltrace manual         BABELTRACE2-LOG(1)

NAME
-------------------------------------------------

::

          babeltrace2-log - Convert a Linux kernel ring buffer to a CTF
          trace


---------------------------------------------------------

::

          babeltrace2-log [--with-timestamps] OUTPUT-PATH


---------------------------------------------------------------

::

          The babeltrace2-log tool reads the lines of a Linux kernel ring
          buffer, as printed by the dmesg(1) tool, from the standard input
          stream and converts them to a CTF (see <http://diamon.org/ctf/>)
          trace written to the OUTPUT-PATH directory.

          Usage example:

              $ dmesg | babeltrace2-log --with-timestamps my-trace

          The events of the generated CTF trace are named string and
          contain a single payload string field named str which contains
          the corresponding ring buffer line.

          By default, babeltrace2-log does not try to extract the
          timestamps of the kernel ring buffer lines to use them as the
          created events’s timestamps. A typical dmesg(1) line looks like
          this:

              [87166.510937] PM: Finishing wakeup.

          In the last example, the [87166.510937] part is a timestamp which
          could be extracted. You can make babeltrace2-log extract
          timestamps from lines with the --with-timestamps option.


-------------------------------------------------------

::

          -t, --with-timestamps
              Extract timestamps from the kernel ring buffer lines: set the
              created event’s payload’s str field to the rest of the line,
              excluding any timestamp prefix.


-----------------------------------------------------------------------------------

::

          See the environment variables of
          babeltrace2-source.text.dmesg(7),
          babeltrace2-filter.utils.muxer(7), and
          babeltrace2-sink.ctf.fs(7).

      Babeltrace library
          BABELTRACE_COMMON_LOG_LEVEL
              Common functions’s log level. The available values are the
              same as for the --log-level option of babeltrace2(1).

          BABELTRACE_COMPAT_LOG_LEVEL
              Compatibility functions’s log level. The available values are
              the same as for the --log-level option of babeltrace2(1).

          BABELTRACE_TERM_COLOR
              Force the terminal color support. The available values are:

              AUTO
                  Only emit terminal color codes when the standard output
                  and error streams are connected to a color-capable
                  terminal.

              NEVER
                  Never emit terminal color codes.

              ALWAYS
                  Always emit terminal color codes.

          BABELTRACE_DISABLE_PYTHON_PLUGINS
              Set to 1 to disable the loading of any Babeltrace Python
              plugin.

          BABELTRACE_LOGGING_GLOBAL_LEVEL
              Babeltrace library’s global log level. The available values
              are the same as for the --log-level option of babeltrace2(1)

          BABELTRACE_NO_DLCLOSE
              Set to 1 to make the Babeltrace library leave any dynamically
              loaded modules (plugins and Python plugin provider) open at
              exit. This can be useful for debugging purposes.

          BABELTRACE_PLUGIN_PATH
              Colon-separated list of directories, in order, in which
              dynamic plugins can be found before other directories are
              considered.


---------------------------------------------------

::

          $HOME/.local/lib/babeltrace2/plugins
              User plugin directory.

          /usr/local/lib/babeltrace2/plugins
              System plugin directory.


---------------------------------------------------------------

::

          0 on success, 1 otherwise.


-------------------------------------------------

::

          If you encounter any issue or usability problem, please report it
          on the Babeltrace bug tracker (see
          <https://bugs.linuxfoundation.org/buglist.cgi?product=Diamon&component=Babeltrace>).


-----------------------------------------------------------

::

          The Babeltrace project shares some communication channels with
          the LTTng project (see <http://lttng.org/>).

          •   Babeltrace website (see <http://diamon.org/babeltrace>)

          •   Git repository (see
              <http://git.linuxfoundation.org/?p=diamon/babeltrace.git>)

          •   EfficiOS GitHub organization (see
              <http://github.com/efficios/>)

          •   Continuous integration (see
              <https://ci.lttng.org/job/babeltrace_master_build/>)

          •   Mailing list (see <http://lists.lttng.org>) for support and
              development: lttng-dev@lists.lttng.org

          •   IRC channel (see <irc://irc.oftc.net/lttng>): #lttng on
              irc.oftc.net


-------------------------------------------------------

::

          The Babeltrace project is the result of efforts by many regular
          developers and occasional contributors.

          The current project maintainer is Jérémie Galarneau
          <mailto:jeremie.galarneau@efficios.com>.


-----------------------------------------------------------

::

          This program is part of the Babeltrace project.

          Babeltrace is distributed under the MIT license (see
          <https://opensource.org/licenses/MIT>).


---------------------------------------------------------

::

          babeltrace2-intro(7), babeltrace2-source.text.dmesg(7),
          babeltrace2-filter.utils.muxer(7), babeltrace2-sink.ctf.fs(7)

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

   Babeltrace 2.0.0-pre6        5 October 2017           BABELTRACE2-LOG(1)

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
