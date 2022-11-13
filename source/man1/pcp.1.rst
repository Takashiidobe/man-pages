.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcp(1) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMAND MODE <#COMMAND_MODE>`__  |                                   |
| \|                                |                                   |
| `SUMMARY MODE <#SUMMARY_MODE>`__  |                                   |
| \|                                |                                   |
| `SUMMARY MODE O                   |                                   |
| PTIONS <#SUMMARY_MODE_OPTIONS>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCP(1)                   General Commands Manual                  PCP(1)

NAME
-------------------------------------------------

::

          pcp, pcp-summary - run a command or summarize an installation


---------------------------------------------------------

::

          pcp [pcp options...]  pcp-command [command options...]
          pcp [-LPV?]  [-a archive] [-h host] [-O origin] [-n pmnsfile]


---------------------------------------------------------------

::

          The pcp command is used in one of two modes.  By default, it
          summarizes the Performance Co-Pilot (PCP) installation on the
          local host.  This mode can also be used to summarize the
          installation from a remote host, or a historical installation
          from a set of PCP archives.  This mode indirectly invokes the
          pcp-summary command (in the absence of any other requested
          command).

          Alternatively, a command can be passed to pcp to run, again
          possibly in the context of a remote host or set of historical
          archives.


-----------------------------------------------------------------

::

          When pcp is invoked with a command to run, it will search for the
          named command in $PCP_BINADM_DIR and also $HOME/.pcp/bin (these
          are usually scripts, and are installed with a "pcp-" prefix).
          This mode of operation allows system performance tools to be
          implemented using PMAPI(3) services, while still preserving all
          of their usual command line options.  These options are thus
          (indirectly) augmented with the standard PCP option set, as
          described in PCPIntro(1).

          This provides a convenient mechanism for obtaining retrospective
          or remote monitoring capabilities while preserving the behaviour
          of the system tools.

          For example, the pcp-free(1) utility can be invoked as follows,
          for recorded data from host munch:

          $ pcp -a $PCP_LOG_DIR/pmlogger/munch/20140317 -O 11:35:50am free -m
                       total       used       free     shared    buffers     cached
          Mem:         23960      14554       9406          0        176       2137
          -/+ buffers/cache:      12240      11720
          Swap         12047          0      12047

          A complete list of the available and installed tools is provided
          along with the pcp(1) usage message, but some examples include:
          pcp-free(1), pcp-uptime(1) and pcp-numastat(1).


-----------------------------------------------------------------

::

          The summary report includes: the OS version, a summary of the
          hardware inventory, the local timezone, the PCP software version,
          the state of the pmcd(1) process and associated Performance
          Metrics Domain Agents (PMDAs), as well as information about any
          PCP archive loggers (pmlogger(1)) and PCP inference engines
          (pmie(1)) that are running.

          All of the displayed values are performance metric values and
          further information for each can be obtained using the command:

             $ pminfo -dtT metric

          The complete set of metrics required by pcp to produce its output
          is contained in $PCP_VAR_DIR/config/pmlogconf/tools/pcp-summary.


---------------------------------------------------------------------------------

::

          With no arguments, pcp reports on the local host, however the
          following options are accepted:

          -a archive, --archive=archive
               Report the PCP configuration as described in the set of PCP
               archive logs, archive, which is a comma-separated list of
               names, each of which may be the base name of an archive or
               the name of a directory containing one or more archives.

          -h host, --host=host
               Report the PCP configuration on host rather than the local
               host.

          -L, --local-PMDA
               Use a local context to collect metrics from DSO PMDAs on the
               local host without PMCD.

          -n pmnsfile, --namespace=pmnsfile
               Load an alternative Performance Metrics Name Space (PMNS(5))
               from the file pmnsfile.

          -O origin, --origin=origin
               When reporting archived metrics, start reporting at origin
               within the time window.

          -P, --pmie
               Display pmie(1) performance information - counts of rules
               evaluating to true, false, or indeterminate, as well as the
               expected rate of rule calculation, for each pmie process
               running on the default host.  Refer to the individual metric
               help text for full details on these values.

          -V, --version
               Display version number and exit.

          -?, --help
               Display usage message and exit.


---------------------------------------------------------------

::

          pcp will terminate with an exit status of 1 if pmcd on the target
          host could not be reached or the set of archives could not be
          opened, or 2 for any other error.


---------------------------------------------------

::

          $HOME/.pcp/bin
               Per-user location for command scripts.

          $PCP_BINADM_DIR
               System location for installed command scripts.

          $PCP_VAR_DIR/config/pmlogconf/tools/pcp-summary
               pmlogconf(1) configuration file for collecting all of the
               metrics required by pcp


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

          PCPIntro(1), pcp-free(1), pcp-numastat(1), pcp-python(1),
          pcp-uptime(1), pcp-verify(1), pmcd(1), pmie(1), pmlogconf(1),
          pmlogger(1), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                            PCP(1)

--------------

Pages that refer to this page: `pcp(1) <../man1/pcp.1.html>`__, 
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pcp-atop(1) <../man1/pcp-atop.1.html>`__, 
`pcp-atopsar(1) <../man1/pcp-atopsar.1.html>`__, 
`pcpcompat(1) <../man1/pcpcompat.1.html>`__, 
`pcp-dmcache(1) <../man1/pcp-dmcache.1.html>`__, 
`pcp-dstat(1) <../man1/pcp-dstat.1.html>`__, 
`pcp-free(1) <../man1/pcp-free.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pcp-iostat(1) <../man1/pcp-iostat.1.html>`__, 
`pcp-ipcs(1) <../man1/pcp-ipcs.1.html>`__, 
`pcp-mpstat(1) <../man1/pcp-mpstat.1.html>`__, 
`pcp-numastat(1) <../man1/pcp-numastat.1.html>`__, 
`pcp-pidstat(1) <../man1/pcp-pidstat.1.html>`__, 
`pcp-python(1) <../man1/pcp-python.1.html>`__, 
`pcp-shping(1) <../man1/pcp-shping.1.html>`__, 
`pcp-ss(1) <../man1/pcp-ss.1.html>`__, 
`pcp-tapestat(1) <../man1/pcp-tapestat.1.html>`__, 
`pcp-uptime(1) <../man1/pcp-uptime.1.html>`__, 
`pcp-verify(1) <../man1/pcp-verify.1.html>`__, 
`pmgetopt(1) <../man1/pmgetopt.1.html>`__, 
`pmpython(1) <../man1/pmpython.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmview(1) <../man1/pmview.1.html>`__, 
`pcp-atoprc(5) <../man5/pcp-atoprc.5.html>`__

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
