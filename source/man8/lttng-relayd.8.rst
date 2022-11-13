.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-relayd(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `LIMITATIONS <#LIMITATIONS>`__ \| |                                   |
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

   LTTNG-RELAYD(8)               LTTng Manual               LTTNG-RELAYD(8)

NAME
-------------------------------------------------

::

          lttng-relayd - LTTng 2 relay daemon


---------------------------------------------------------

::

          lttng-relayd [--background | --daemonize]
                       [--control-port=URL] [--data-port=URL] [--live-port=URL]
                       [--output=PATH] [-v | -vv | -vvv]


---------------------------------------------------------------

::

          The Linux Trace Toolkit: next generation <https://lttng.org/> is
          an open source software package used for correlated tracing of
          the Linux kernel, user applications, and user libraries.

          LTTng consists of Linux kernel modules (for Linux kernel tracing)
          and dynamically loaded libraries (for user application and
          library tracing).

          The LTTng relay daemon is responsible for receiving trace data
          from possibly remote LTTng session/consumer daemons and for
          writing it to the local file system. The relay daemon also
          accepts LTTng live connections from compatible viewers; this is
          the official approach to viewing LTTng events as they are
          emitted.

          The relay daemon listens by default on all network interfaces to
          gather trace data, but only on localhost for LTTng live
          connections.

          The relay daemon does not require any particular permissions, as
          long as it can write to the output directory and listen on the
          configured ports. If a user is within a secured network and/or
          has proper firewall settings, lttng-relayd can listen to LTTng
          live connections from all network interfaces by specifying
          --live-port=tcp://localhost:5344.

          Once a trace has been streamed completely, the trace can be
          processed by any tool that can process an LTTng trace located on
          the local file system.

      Output directory
          By default, the relay daemon writes the traces to:

              $LTTNG_HOME/lttng-traces/HOSTNAME/SESSION/DOMAIN

          with:

          HOSTNAME
              Remote hostname.

          SESSION
              Full session name.

          DOMAIN
              Tracing domain.

          You can override the default output directory prefix
          ($LTTNG_HOME/lttng-traces) with the --output option. The other
          parts depend on the remote configuration.

      URL format
          The --control-port, --data-port, and --live-port options specify
          URLs.

          The format of those URLs is:

              tcp://(HOST | IPADDR):PORT

          with:

          (HOST | IPADDR)
              Binding hostname or IP address (IPv6 address must be enclosed
              in brackets ([ and ]); see RFC 2732
              <https://www.ietf.org/rfc/rfc2732.txt>).

          PORT
              TCP port.


-------------------------------------------------------

::

      Daemon
          -b, --background
              Start as Unix daemon, but keep file descriptors (console)
              open. Use the --daemonize option instead to close the file
              descriptors.

          -d, --daemonize
              Start as Unix daemon, and close file descriptors (console).
              Use the --background option instead to keep the file
              descriptors open.

          -g GROUP, --group=GROUP
              Use GROUP as Unix tracing group (default: tracing).

          -o PATH, --output=PATH
              Set base directory of written trace data to PATH.

              See the Output directory section above for more information.

          -v, --verbose
              Increase verbosity.

              Three levels of verbosity are available, which are triggered
              by appending additional v letters to the option (that is, -vv
              and -vvv).

      Ports
          See the URL format section above for more information about the
          syntax of the following options' URL argument.

          -C URL, --control-port=URL
              Listen to control data on URL URL (default:
              tcp://0.0.0.0:5342).

          -D URL, --data-port=URL
              Listen to trace data on URL URL (default:
              tcp://0.0.0.0:5343).

          -L URL, --live-port=URL
              Listen to LTTng live connections on URL URL (default:
              tcp://localhost:5344).

      Program information
          -h, --help
              Show help.

          -V, --version
              Show version.


-----------------------------------------------------------------------------------

::

          LTTNG_ABORT_ON_ERROR
              Set to 1 to abort the process after the first error is
              encountered.

          LTTNG_NETWORK_SOCKET_TIMEOUT
              Socket connection, receive and send timeout (milliseconds). A
              value of 0 or -1 uses the timeout of the operating system
              (default).

          LTTNG_RELAYD_HEALTH
              Path to relay daemon health’s socket.

          LTTNG_RELAYD_TCP_KEEP_ALIVE
              Set to 1 to enable TCP keep-alive.

              The TCP keep-alive mechanism allows the detection of dead
              peers (lttng-sessiond(8)) in cases of unclean termination
              (for example, a hard reset) of a peer.

              Supported on Linux and Solaris only. The default behaviour of
              the TCP keep-alive mechanism is OS-specific.

              Search for tcp_keepalive in tcp(7) for more information.

          LTTNG_RELAYD_TCP_KEEP_ALIVE_ABORT_THRESHOLD
              The time threshold in seconds to abort a TCP connection after
              the keep-alive probing mechanism has failed.

              Set to 0 or -1 to use the value chosen by the operating
              system (default).

              Supported on Solaris 11 only.

              Search for tcp_keepalive_abort_threshold in tcp(7) for more
              information.

          LTTNG_RELAYD_TCP_KEEP_ALIVE_IDLE_TIME
              Number of seconds a connection needs to be idle before TCP
              begins sending out keep-alive probes.

              Set to 0 or -1 to use the value chosen by the operating
              system (default).

              Supported on Linux and Solaris 11 only.

              On Solaris 11, the accepted values are -1, 0, and 10 to
              864000.

              Search for tcp_keepalive_time and tcp_keepalive_interval in
              tcp(7) on Solaris 11 for more information.

          LTTNG_RELAYD_TCP_KEEP_ALIVE_MAX_PROBE_COUNT
              Maximum number of TCP keep-alive probes to send before giving
              up and killing the connection if no response is obtained from
              the other end.

              Set to 0 or -1 to use the value chosen by the operating
              system (default).

              Supported on Linux only.

              Search for tcp_keepalive_probes in tcp(7) for more
              information.

          LTTNG_RELAYD_TCP_KEEP_ALIVE_PROBE_INTERVAL
              Number of seconds between TCP keep-alive probes.

              Set to 0 or -1 to use the value chosen by the operating
              system (default).

              Supported on Linux only.

              Search for tcp_keepalive_intvl in tcp(7) for more
              information.


---------------------------------------------------

::

          $LTTNG_HOME/.lttng
              User LTTng runtime and configuration directory.

          $LTTNG_HOME/lttng-traces
              Default output directory of LTTng traces. This can be
              overridden with the --output option.

              Note
              $LTTNG_HOME defaults to $HOME when not explicitly set.


---------------------------------------------------------------

::

          0
              Success

          1
              Error

          3
              Fatal error


---------------------------------------------------------------

::

          As of this version, only the TCP protocol is supported for both
          control and data ports. In future versions, TCP will remain the
          sole available protocol for control data since those
          communications are low-volume and need absolute reliability;
          trace data could be carried over UDP.

          For an unprivileged user running lttng-relayd, the maximum number
          of file descriptors per process is usually 1024. This limits the
          number of connections and opened trace files. This limit can be
          configured with ulimit(3).


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

          lttng(1), lttng-sessiond(8), lttng-crash(1), lttng-ust(3),
          babeltrace(1)

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

   LTTng 2.12.0-pre               10/29/2018                LTTNG-RELAYD(8)

--------------

Pages that refer to this page: `lttng(1) <../man1/lttng.1.html>`__, 
`lttng-crash(1) <../man1/lttng-crash.1.html>`__, 
`lttng-create(1) <../man1/lttng-create.1.html>`__, 
`lttng-rotate(1) <../man1/lttng-rotate.1.html>`__, 
`babeltrace2-source.ctf.lttng-live(7) <../man7/babeltrace2-source.ctf.lttng-live.7.html>`__, 
`lttng-sessiond(8) <../man8/lttng-sessiond.8.html>`__

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
