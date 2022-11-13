.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmfind(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `MECHANISMS <#MECHANISMS>`__ \|   |                                   |
| `SIGNALS <#SIGNALS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMFIND(1)                General Commands Manual               PMFIND(1)

NAME
-------------------------------------------------

::

          pmfind - find PCP services on the network


---------------------------------------------------------

::

          pmfind [-CqrSV?]  [-m mechanism] [-s service] [-t timeout]


---------------------------------------------------------------

::

          pmfind searches for instances of the specified PCP service being
          advertised on the network and prints a list of URLs corresponding
          to the services discovered.  It can be used in conjunction with
          pmfind_check(1) to automate the monitoring of remote PCP
          collector systems.


-------------------------------------------------------

::

          The available command line options are:

          -C, --containers
               Performs containers discovery as well, for each discovered
               pmcd(1) service.

          -m mechanism, --mechanism=mechanism
               This option sets the mechanism that pmfind uses when
               performing service discovery.  By default, or if the keyword
               all is specified, every available mechanism will be used
               (iteratively).  See the ``MECHANISMS'' section for a
               description of each available discovery mechanism.

          -q, --quiet
               This option suppresses all output on the standard output
               stream.

          -r, --resolve
               Requests that DNS name resolution be attempted for the
               addresses of any discovered services.  The default is to
               display the network addresses of any discovered services.

          -s service, --service=service
               By default pmfind will search for all supported PCP
               services, however a specific PCP service to discover can be
               specified using the -s option.  Supported services are
               pmcd(1), and pmproxy(1).

          -S, --sources
               Reports source identifiers for each discovered pmcd(1)
               service.  These identifiers are unique for each host, and
               are formed using the (non-optional) context labels available
               for every PCP collector.  Because the discovery process will
               often identify multiple paths to an individual collector
               host, this option is an important part of the process of
               using pmfind in conjunction with pmfind_check(1), to ensure
               only one pmie(1) and/or pmlogger(1) process is started for
               each discovered collector host.  The source identifiers
               reported by pmfind are the same as the source identifiers
               reported by the pminfo(1) and pmseries(1) commands.

          -t seconds, --timeout=seconds
               Sets the maximum amount of time in seconds that pmfind will
               take before interrupting the service discovery.  The time
               argument is a floating point number representing the number
               of seconds before timing out.  The default is to take as
               much time as is needed to complete the process.

          -V, --version
               Display version number and exit.

          -?, --help
               Display usage message and exit.


-------------------------------------------------------------

::

          Supported mechanisms for service discovery are:

          avahi  Searches for services which are broadcasting using mDNS
                 via avahi-daemon(8).  An optional suffix ",timeout=N" may
                 be added to limit the amount of time waiting for the
                 avahi-daemon.  N is a floating point number specifying the
                 number of seconds to wait.  The default is 0.5 seconds.
                 This timeout may also be specified by setting the
                 environment variable AVAHI_DISCOVERY_TIMEOUT to the
                 desired number of seconds.  If both are specified, then
                 the value specified in the environment variable takes
                 precedence.

          probe=<net-address>/<mask-bits>
                 Actively probes the given subnet for the requested PCP
                 service(s).  <net-address> is an Inet or IPv6 network
                 address and <mask-bits> is the number of bits used to
                 define the subnet.  For example, 192.168.1.0/24 defines an
                 8 bit subnet consisting of the addresses 192.168.1.0
                 through 192.168.1.255.  An optional suffix ",maxThreads=N"
                 may be added to limit the number of threads used while
                 probing.  The default is the value of FD_SETSIZE (which is
                 typically 1024) or the number of addresses in the subnet,
                 whichever is less.  An optional suffix ",timeout=N" may be
                 added to limit the amount of time spent waiting for each
                 connection attempt.  N is a floating point number
                 specifying the number of seconds to wait.  The default is
                 0.02 seconds (20 milliseconds).

          shell  Probes the list of addresses provided by scripts for
                 requested PCP service(s).  Several optional, comma-
                 separated parameters can also be provided.  The "path=DIR"
                 option specifies the directory where commands like
                 pcp-kube-pods(1) are located (defaults to
                 $PCP_BINADM_DIR/discover/).  This setting can be further
                 restricted to an individual command using the command=CMD
                 option, but the default is to use all available commands
                 from the path.  The "maxThreads=N" option limits the
                 number of threads used while probing.  The default is the
                 value of FD_SETSIZE (which is typically 1024) or the
                 number of addresses returned by the scripts, whichever is
                 less.  The "timeout=N" option may be added to limit the
                 amount of time spent waiting for each connection attempt.
                 N is a floating point number specifying the number of
                 seconds to wait.  The default is 0.02 seconds (20
                 milliseconds).


-------------------------------------------------------

::

          pmfind will interrupt the service discovery process when one of
          the following signals is received: SIGHUP, SIGPIPE, SIGINT,
          SIGTERM, SIGXFSZ, SIGXCPU.  pmfind will report any results which
          were discovered up to point of the interruption.


---------------------------------------------------------------

::

          The value of the exit status from the command is zero when
          services were successfully located, one if no services were
          found, and two if an error occurred.

          In the event of an error a message will be generated on standard
          error that is intended to be self-explanatory.


---------------------------------------------------

::

          $PCP_BINADM_DIR/discover
               default path to address discovery scripts


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1), pmfind_check(1), pmie(1), pminfo(1),
          pmlogger(1), pmproxy(1), pmseries(1), pcp-kube-pods(1), PMAPI(3),
          PMWEBAPI(3), pmDiscoverServices(3), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                         PMFIND(1)

--------------

Pages that refer to this page:
`pcpcompat(1) <../man1/pcpcompat.1.html>`__, 
`pcp-kube-pods(1) <../man1/pcp-kube-pods.1.html>`__, 
`pmfind_check(1) <../man1/pmfind_check.1.html>`__, 
`pmlogctl(1) <../man1/pmlogctl.1.html>`__, 
`pmdiscoverservices(3) <../man3/pmdiscoverservices.3.html>`__

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
