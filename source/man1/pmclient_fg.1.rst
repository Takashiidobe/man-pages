.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmclient(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMCLIENT(1)              General Commands Manual             PMCLIENT(1)

NAME
-------------------------------------------------

::

          pmclient, pmclient_fg - a simple performance metrics client


---------------------------------------------------------

::

          pmclient [-PVz?]  [-a archive] [-A align] [-h host] [-n pmnsfile]
          [-O origin] [-s samples] [-S starttime] [-t interval] [-T
          endtime] [-Z timezone]

          pmclient_fg ...


---------------------------------------------------------------

::

          pmclient and pmclient_fg are simple clients that use the
          Performance Metrics Application Programming Interface (PMAPI) to
          report some high-level system performance metrics.

          The real value of these tools is as sample clients using the
          PMAPI(3), interfaces and to this end the source code is included
          with the Performance Co-Pilot (PCP) package (see PCPIntro(1)),
          and is typically installed in /usr/share/pcp/demos/pmclient.

          The pmclient_fg program differs to pmclient in that it uses the
          fetchgroup API extension to the PMAPI, see pmFetchGroup(3).

          Normally pmclient operates on the distributed Performance Metrics
          Name Space (PMNS), however if the -n option is specified an
          alternative local PMNS is loaded from the file pmnsfile.

          Unless directed to another host by the -h option, or to an
          archive by the -a option, pmclient will contact the Performance
          Metrics Collector Daemon (PMCD) on the local host to obtain the
          required information.  The argument to -a is a comma-separated
          list of names, each of which may be the base name of an archive
          or the name of a directory containing one or more archives.  The
          -a and -h options are mutually exclusive.

          By default, pmclient reports the time of day according to the
          local timezone on the system where pmclient is run.  The -Z
          option changes the timezone to timezone in the format of the
          environment variable TZ as described in environ(7).  The -z
          option changes the timezone to the local timezone at the host
          that is the source of the performance metrics, as identified via
          either the -h or -a options.

          The output from pmclient is directed to standard output, and
          lists

          +  Aggregate CPU utilization, in the range 0 to 1.

          +  If the system has more than 1 CPU, the ordinal number of the
             busiest CPU, in the range 0 to ...

          +  If the system has more than 1 CPU, the CPU utilization for the
             busiest CPU.

          +  Real free memory in Mbytes.

          +  Aggregate physical disk I/O operations per second (IOPS).

          +  Load average over the last 1 minute and over the last 15
             minutes.


-------------------------------------------------------

::

          The available command line options are:

          -a archive, --archive=archive
               Performance metric values are retrieved from the set of
               Performance Co-Pilot (PCP) archive log files identified by
               the archive argument, which is a comma-separated list of
               names, each of which may be the base name of an archive or
               the name of a directory containing one or more archives.

          -A align, --align=align
               Force the initial sample to be aligned on the boundary of a
               natural time unit align.  Refer to PCPIntro(1) for a
               complete description of the syntax for align.

          -h host, --host=host
               Fetch performance metrics from pmcd(1) on host, rather than
               from the default localhost.

          -n pmnsfile, --namespace=pmnsfile
               Load an alternative Performance Metrics Name Space (PMNS(5))
               from the file pmnsfile.

          -O origin, --origin=origin
               When reporting archived metrics, start reporting at origin
               within the time window (see -S and -T).  Refer to
               PCPIntro(1) for a complete description of the syntax for
               origin.

          -P, --pause
               The default behavior for replaying a set of archives, is to
               replay at full speed.  The -P option may be used in
               conjunction with a set of archives, to request that the
               prevailing real-time delay be applied between samples (see
               -t) to effect a pause.

          -s samples, --samples=samples
               The samples argument defines the number of samples to be
               retrieved and reported.  If samples is 0 or -s is not
               specified, pmclient will sample and report continuously (in
               real time mode) or until the end of the set of PCP archives
               (in archive mode).

          -S starttime, --start=starttime
               The -S option may be used in conjunction with a set of
               archives to request that display start at the starttime from
               the start of the archive(s).  Refer to PCPIntro(1) for a
               complete description of the syntax for starttime.

          -t interval, --interval=interval
               Set the reporting interval to something other than the
               default 5 seconds.  The interval argument follows the syntax
               described in PCPIntro(1), and in the simplest form may be an
               unsigned integer (the implied units in this case are
               seconds).

          -T endtime, --finish=endtime
               When reporting archived metrics, the report will be
               restricted to those records logged before or at endtime.
               Refer to PCPIntro(1) for a complete description of the
               syntax for endtime.

          -V, --version
               Display version number and exit.

          -z, --hostzone
               Use the local timezone of the host that is the source of the
               performance metrics, as identified by either the -h or the
               -a options.  The default is to use the timezone of the local
               host.

          -Z timezone, --timezone=timezone
               Use timezone for the date and time.  Timezone is in the
               format of the environment variable TZ as described in
               environ(7).

          -?, --help
               Display usage message and exit.


---------------------------------------------------

::

          $PCP_DEMOS_DIR/pmclient
               source code, documentation, configuration files and Makefile
               when the PCP development package is installed


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

          PCPIntro(1), pmcd(1), pmchart(1), pmdumptext(1), pmgenmap(1),
          pminfo(1), pmrep(1), pmstat(1), pmval(1), PMAPI(3),
          pmFetchGroup(3), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                       PMCLIENT(1)

--------------

Pages that refer to this page: `pmstat(1) <../man1/pmstat.1.html>`__

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
