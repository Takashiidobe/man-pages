.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcp-ss(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `REPORT <#REPORT>`__ \|           |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCP-SS(1)                General Commands Manual               PCP-SS(1)

NAME
-------------------------------------------------

::

          pcp-ss - report socket statistics


---------------------------------------------------------

::

          pcp [pcp options] ss [ss options]


---------------------------------------------------------------

::

          pcp-ss reports socket statistics collected by the pmdasockets(1)
          PMDA agent.  The command is intended to be closely compatible
          with many of the ss(8) command line options and reporting
          formats, but also offer the advantages of local or remote
          monitoring (in live mode) and also historical replay from a
          previously recorded PCP archive.

          Live mode uses the pcp -h host option and requires the
          pmdasockets(1) PMDA to be installed and enabled on the target
          host (local or remote), see pmdasockets(1) for details on how to
          enable the sockets PMDA on a particular host.  The default source
          is live metrics collected on localhost, if neither of the -h or
          -a options are given.

          Historical/archive replay uses the pcp -a archive option, where
          archive is the basename of a previously recorded PCP archive.
          The archive replay feature is particularly useful because socket
          statistics can be reported for a designated time using the pcp
          --origin option (which defaults to the start time of the
          archive).


---------------------------------------------------------

::

          pcp ss
               Display default basic socket information for the local host.
               This includes Netid (tcp, udp, etc), State (ESTAB,
               TIME_WAIT, etc), Recv-Q and Send-Q queue lengths and the
               local and peer address and port for each socket.

          pcp -h somehost ss -noemitauO
               Display the same basic socket information as above for the
               host somehost, which may be the default localhost.  The
               additional command line arguments (-noemitauO) display one
               line per socket (-O), numeric (-n) service names (default),
               timer information (-o), extended socket details (-e), socket
               memory usage (-m), internal TCP information (-i), both udp
               (-u) and tcp sockets (-t) and both listening and non-
               listening sockets (-a).

          pcp -a somearchive -S'@Wed 16 Jun 2021 12:57:21' ss -noemitauO
               Display the same information as the above example, but for
               the archive somearchive starting at the given time Wed 16
               Jun 2021 12:57:21.  Note the literal @ prefix is required
               for an absolute time, see PCPIntro(1) for details.  The
               archive must of course contain data for the requested time.
               You can use pmdumplog -l somearchive to examine the time
               bounds of somearchive.

          pcp -a somearchive -O-0 ss -noemitauO
               As above, but with an offset of zero seconds (-O-0) before
               the current end of somearchive, i.e. the most recently
               logged data. Note that somearchive may be curently growing
               (i.e. being logged with pmlogger(1)).


-------------------------------------------------------

::

          Due to the large number of options supported by pcp-ss, the
          pcp(1) command should always be used to invoke pcp-ss in order to
          specify options such as the metrics source (host or archive) and
          also (in archive mode), the requested start time or offset, and
          timezone using the following options:

          -h, --host
               The remote hostname to connect to in live mode

          -a, --archive
               The archive file to use for historical sampling

          -O, --origin
               The time offset to use within an archive (implies -a)

          -S, --start
               The start time (e.g. in ctime(3) format) to use when
               replaying an archive.

          -Z, --timezone
               Use a specific timezone.  Since pcp-ss doesn't report
               timestamps, this only affects the interpretation of an
               absolute starting time (-S) or offset (-O).

          -z, --hostzone
               In archive mode, use the timezone of the archive rather than
               the timezone on the local machine running pcp-ss.  The
               timezone, start and finish times of the archive may be
               examined using pmdumplog(1) with the -L option.

          The above pcp options become indirectly available to the pcp-ss
          command via environment variables - refer to PCPIntro(1) for a
          complete description of these options.

          The additional command line options available for pcp-ss itself
          are:

          -h, --help
               show help message and exit

          -V, --version
               output version information

          -n, --numeric
               don't resolve service names

          -r, --resolve
               resolve host names

          -a, --all
               display all sockets

          -l, --listening
               display listening sockets

          -o, --options
               show timer information

          -e, --extended
               show detailed socket information

          -m, --memory
               show socket memory usage

          -p, --processes
               show process using socket

          -i, --info
               show internal TCP information

          -s, --summary
               show socket usage summary

          -b, --bpf
               show bpf filter socket information

          -E, --events
               continually display sockets as they are destroyed

          -Z, --context
               display process SELinux security contexts

          -z, --contexts
               display process and socket SELinux security contexts

          -N, --net
               switch to the specified network namespace name

          -4, --ipv4
               display only IP version 4 sockets

          -6, --ipv6
               display only IP version 6 sockets

          -0, --packet
               display PACKET sockets

          -t, --tcp
               display only TCP sockets

          -M, --mptcp
               display only MPTCP sockets

          -S, --sctp
               display only SCTP sockets

          -u, --udp
               display only UDP sockets

          -d, --dccp
               display only DCCP sockets

          -w, --raw
               display only RAW sockets

          -x, --unix
               display only Unix domain sockets

          -H, --noheader
               Suppress header line

          -O, --oneline
               socket's data printed on a single line


-----------------------------------------------------

::

          The columns in the pcp-ss report vary according to the command
          line options and have the same interpretation as described in
          ss(8).

          One difference with pcp-ss is that the first line in the report
          begins with '# Timestamp' followed by the timestamp (in the
          requested timezone, see -z and -Z above) of the sample data from
          the host or archive source.  Following the timestamp is the
          currently active filter string for the metrics source.  In
          archive mode, the active filter can be changed dynamically, even
          whilst the archive is being recorded.  This is different to ss(8)
          where the filter is optionally specified on the command line of
          the tool and is always 'live', i.e.  ss(8) does not support
          retrospective replay.  With pcp-ss, the filter is stored in the
          back-end PMDA, see pmdasockets(1), in the metric
          network.persocket.filter.  The default filter is state connected,
          which can be changed by storing a new string value in the
          network.persocket.filter metric using pmstore(1), e.g.  pmstore
          network.persocket.filter "state established".  This will override
          the persistent default filter, which is stored in a PMDA
          configuration file and loaded each time the sockets PMDA is
          started.  See pmdasockets(1) for further details and see ss(8)
          for details of the filter syntax and examples.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          For environment variables affecting PCP tools, see
          pmGetOptions(3).


---------------------------------------------------------

::

          PCPIntro(1), pcp(1), pmdasockets(1), pmlogger(1), pcp.conf(5) and
          ss(8).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                         PCP-SS(1)

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
