.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmproxy(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `STARTING AND STOPPING PMPROXY <# |                                   |
| STARTING_AND_STOPPING_PMPROXY>`__ |                                   |
| \| `DIAGNOSTICS <#DIAGNOSTICS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMPROXY(1)               General Commands Manual              PMPROXY(1)

NAME
-------------------------------------------------

::

          pmproxy - proxy for performance metrics collector and querying


---------------------------------------------------------

::

          pmproxy [-AdfFt?]  [-c conffile] [-C certdb] [-h host[,host ...]
          [-i ipaddress] [-l logfile] [-L bytes] [-M certname] [-p
          port[,port ...]  [-P passfile] [-r port[,port ...]  [-s sockname]
          [-U username] [-x outfile]


---------------------------------------------------------------

::

          pmproxy acts as a protocol proxy, allowing Performance Co-Pilot
          (PCP) monitoring clients to connect to one or more pmcd(1) and/or
          redis-server(1) instances via pmproxy.

          In its default mode of operation, on platforms supporting this,
          pmproxy provides the REST API for all PCP services (see
          PMWEBAPI(3) for details) and interfaces to the fast, scalable
          time series query capabilities offered by PCP in conjunction with
          a redis-server(1) (see pmseries(1) for details).

          pmproxy can be deployed in a firewall domain, or on a cluster
          ``head'' node where the IP (Internet Protocol) address of the
          hosts where pmcd and/or redis-server are running may be unknown
          to the PCP monitoring clients, but where the IP address of the
          host running pmproxy is known to these clients.  Similarly, the
          clients may have network connectivity only to the host where
          pmproxy is running, while there is network connectivity from that
          host to the hosts of interest where pmcd and/or redis-server are
          running.

          The behaviour of the PCP monitoring clients is controlled by
          either the PMPROXY_HOST environment variable or through the
          extended hostname specification (see PCPIntro(1) for details).
          If neither of these mechanisms is used, clients will make their
          PMAPI(3) connections directly to pmcd.  If the proxy hostname
          syntax is used or PMPROXY_HOST is set, then this should be the
          hostname or IP address of the system where pmproxy is running,
          and the clients will connect to pmcd or redis-server indirectly
          through the protocol proxy services of pmproxy.


-------------------------------------------------------

::

          The available command line options are:

          -A   Disable service advertisement.  By default, pmproxy will
               advertise its presence on the network using any available
               mechanisms (such as Avahi/DNS-SD), assisting remote
               monitoring tools with finding it.  These mechanisms are
               disabled with this option.

          -c conffile, --config=conffile
               Specify the path to an optional configuration conffile, with
               format as described in the ``CONFIGURATION'' section.  This
               option implies pmproxy is running in timeseries mode.

          -C certdb, --certdb=certdb
               Specify the path to the Network Security Services
               certificate database, for (optional) secure connections.
               This option implies pmproxy is running in deprecated mode.
               The default is /etc/pki/nssdb.  Refer also to the -P option.
               If it does not already exist, this database can be created
               using the certutil(1) utility.  This process and other
               certificate database maintenance information is provided in
               the PCPIntro(1) manual page and the online PCP tutorials.

          -d, --deprecated
               By default pmproxy prefers to run in the new timeseries
               mode, providing REST APIs, asynchronous network I/O,
               scalable time series, and secure connections using OpenSSL.
               However, legacy deployments may wish to use the original
               synchronous pmproxy implementation using NSS and libpcp
               networking; this can be achieved using this option.  Note
               that the -d and -t options are mutually exclusive.

          -f, --foreground
               By default pmproxy is started as a daemon.  The -f option
               indicates that it should run in the foreground.  This is
               most useful when trying to diagnose problems with
               establishing connections.

          -F, --systemd
               Like -f, the -F option runs pmproxy in the foreground, but
               also does some housekeeping (like create a ``pid'' file and
               change user id).  This is intended for use when pmproxy is
               launched from systemd(1) and the daemonizing has already
               been done by systemd(1) and does not need to be done again
               by pmproxy, which is the case when neither -f nor -F is
               specified.

               At most one of -f and -F may be specified.

          -h host, --redishost=host
               Specify an alternate Redis host to connect to for time
               series querying, overriding any configuration file settings.
               This option implies pmproxy is running in timeseries mode.

          -i ipaddress, --interface=ipaddress
               This option is usually only used on hosts with more than one
               network interface (very common for firewall and ``head''
               node hosts where pmproxy is likely to be deployed to
               arbitrate access to an internal network).  If no -i options
               are specified pmproxy accepts PCP client connections on any
               of its host's IP addresses.  The -i option is used to
               specify explicitly an IP address that PCP client connections
               should be accepted on.  ipaddress should be in the standard
               dotted form (e.g. 100.23.45.6).  The -i option may be used
               multiple times to define a list of IP addresses.  When one
               or more -i options is specified, attempted connections made
               on any other IP addresses will be refused.

          -l logfile, --log=logfile
               By default a log file named pmproxy.log is written in the
               current directory.  The -l option causes the log file to be
               written to a given logfile instead of the default.  If this
               logfile cannot be created or is not writable, output is
               written to the standard error instead.

          -L bytes
               PDUs received by pmproxy from PCP monitoring clients are
               restricted to a maximum size of 65536 bytes by default to
               defend against Denial of Service attacks.  The -L option may
               be used to change the maximum incoming PDU size.

          -M certname, --certname=certname
               By default pmproxy will try to use a certificate called PCP
               Collector certificate in its server role.  The -M option
               allows this certificate certname to be changed.  This option
               implies pmproxy is running in deprecated mode.

          -p port, --port=port
               Specify an alternate port number to listen on for client
               connections.  The default value is 44322.

          -P passfile, --passfile=passfile
               Specify the path to a passfile containing the Network
               Security Services certificate database password for
               (optional) secure connections, and for databases that are
               password protected.  This option implies pmproxy is running
               in deprecated mode.  Refer also to the -C option.  When
               using this option, great care should be exercised to ensure
               appropriate ownership ("pcp" user, typically) and
               permissions on this file (0400, so as to be unreadable by
               any user other than the user running the pmproxy process).

          -r port, --redisport=port
               Specify an alternate Redis port number to connect to for
               time series querying, overriding any configuration file
               settings.  This option implies pmproxy is running in
               timeseries mode.

          -s sockname, --socket=sockname
               Specify the path to a local unix domain socket (for
               platforms supporting this socket family only).  The default
               value is $PCP_RUN_DIR/pmproxy.socket.  This option implies
               pmproxy is running in timeseries mode.

          -t, --timeseries
               Operate in automatic archive timeseries discovery mode.
               This mode of operation will enable the PMWEBAPI(3) REST
               APIs, detect system archives created by pmlogger(1) and
               import them into a redis-server(1) automatically, for fast,
               scalable time series querying described in pmseries(1).

          -U username, --username=username
               Assume the identity of the given username before starting to
               accept incoming packets from PCP monitoring clients.

          -x outfile
               Before the pmproxy logfile can be opened, pmproxy may
               encounter a fatal error which prevents it from starting.  By
               default the output describing this error is sent to /dev/tty
               but it may redirected to outfile.

          -?, --help
               Display usage message and exit.


-------------------------------------------------------------------

::

          When running in the timeseries mode of operation, runtime
          configuration is relatively complex and typically handled via the
          $PCP_SYSCONF_DIR/pmproxy/pmproxy.conf file.  This file is in the
          common ``ini'' format, with section headers and individual
          variables and values with each section.  The configuration file
          installed as part of PCP documents every available section and
          option.

          At a high level, the [pmproxy] section can be used to explicitly
          enable or disable each of the different protocols.

          The [pmseries] section allows connection information for one or
          more backing redis-server processes to be configured (hostnames
          and ports).  Note to access multiple (scalable) Redis servers,
          the servers variable in this section can be a comma-separated
          list of hostname:port pairs.  Alternatively, it can be a single
          redis-server host that will be queried using the "CLUSTER INFO"
          command to automatically configure multiple backing hosts,
          described at https://redis.io/topics/cluster-spec .


---------------------------------------------------------------------------------------------------

::

          Normally, pmproxy is started automatically at boot time and
          stopped when the system is being brought down.  Under certain
          circumstances it is necessary to start or stop pmproxy manually.
          To do this one must become superuser and type

          # $PCP_RC_DIR/pmproxy start

          to start pmproxy, or

          # $PCP_RC_DIR/pmproxy stop

          to stop pmproxy.  Starting pmproxy when it is already running is
          the same as stopping it and then starting it again.

          Normally pmproxy listens for PCP client connections on TCP/IP
          port number 44322 (as well as 44323 with timeseries enabled)
          registered at https://www.iana.org/ .  Either the environment
          variable PMPROXY_PORT or the -p command line option may be used
          to specify alternative port number(s) when pmproxy is started; in
          each case, the specification is a comma-separated list of one or
          more numerical port numbers.  Should both methods be used or
          multiple -p options appear on the command line, pmproxy will
          listen on the union of the set of ports specified via all -p
          options and the PMPROXY_PORT environment variable.  If non-
          default ports are used with pmproxy care should be taken to
          ensure that PMPROXY_PORT is also set in the environment of any
          client application that will connect to pmproxy, or that the
          extended host specification syntax is used (see PCPIntro(1) for
          details).


---------------------------------------------------------------

::

          If pmproxy is already running the message "Error:
          OpenRequestSocket bind: Address already in use" will appear.
          This may also appear if pmproxy was shutdown with an outstanding
          request from a client.  In this case, a request socket has been
          left in the TIME_WAIT state and until the system closes it down
          (after some timeout period) it will not be possible to run
          pmproxy.

          In addition to the standard PCP debugging options, see pmdbg(1),
          pmproxy currently supports the debugging option context for
          tracing client connections and disconnections.


---------------------------------------------------

::

          PCP_PMPROXYOPTIONS_PATH
               command line options for pmproxy when launched from
               $PCP_RC_DIR/pmproxy All the command line option lines should
               start with a hyphen as the first character.

          $PCP_SYSCONFIG_DIR/pmproxy
               Environment variables that will be set when pmproxy
               executes.  Only settings of the form
               "PMPROXY_VARIABLE=value" will be honoured.

          ./pmproxy.log
               (or $PCP_LOG_DIR/pmproxy/pmproxy.log when started
               automatically)
               All messages and diagnostics are directed here

          /etc/pki/tls
               default OpenSSL certificate database directory, used for
               optional Secure Socket Layer connections in timeseries mode
               of operation.  These certificates can be created and queried
               using the openssl tool, amongst others.

          /etc/pki/nssdb
               default Network Sercity Services (NSS) database directory,
               used for optional Secure Socket Layer connections in
               deprecated mode of operation.  This database can be created
               and queried using the NSS certutil tool, amongst others.
               This is only used when pmproxy is running in deprecated
               mode.


---------------------------------------------------------------

::

          In addition to the PCP environment variables described in the PCP
          ENVIRONMENT section below, there are several environment
          variables that influence the interactions between a PCP
          monitoring client, pmproxy and pmcd.

          PMCD_PORT
                 For the PCP monitoring client this (or the default port
                 number) is passed to pmproxy and used to connect to pmcd.
                 In the environment of pmproxy PMCD_PORT is not used.

          PMPROXY_HOST
                 For the PCP monitoring client this is the hostname or IP
                 address of the host where pmproxy is running.  In recent
                 versions of PCP (since version 3) this has been superseded
                 by the extended hostname syntax (see PCPIntro(1) for
                 details).

          PMPROXY_PORT
                 For the PCP monitoring client this is the port on which
                 pmproxy will accept connections.  The default is 44322, as
                 well as 44323 with timeseries enabled.

          PMCD_CONNECT_TIMEOUT, PMCD_RECONNECT_TIMEOUT and
          PMCD_REQUEST_TIMEOUT
                 (see PCPIntro(1)) For the PCP monitoring client, setting
                 these environment variables will modify the timeouts used
                 for interactions between the client and pmproxy
                 (independent of which pmcd is being used).  For pmproxy
                 these same environment variables control the timeouts
                 between pmproxy and all pmcd(1) instances (independent of
                 which monitoring client is involved).

          If set to the value 1, the PMPROXY_LOCAL environment variable
          will cause pmproxy to run in a localhost-only mode of operation,
          where it binds only to the loopback interface.

          The PMPROXY_MAXPENDING variable can be set to indicate the
          maximum length to which the queue of pending client connections
          may grow.


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

          PCPIntro(1), pmcd(1), pmdbg(1), pmlogger(1), pmseries(1),
          redis-server(1), PMAPI(3), PMWEBAPI(3), pmGetOptions(3),
          pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                        PMPROXY(1)

--------------

Pages that refer to this page:
`pcpcompat(1) <../man1/pcpcompat.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pcp-kube-pods(1) <../man1/pcp-kube-pods.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__, 
`pmsearch(1) <../man1/pmsearch.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pmsocks(1) <../man1/pmsocks.1.html>`__, 
`pmdiscoverservices(3) <../man3/pmdiscoverservices.3.html>`__, 
`pmdiscoversetup(3) <../man3/pmdiscoversetup.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmparsehostattrsspec(3) <../man3/pmparsehostattrsspec.3.html>`__, 
`pmparsehostspec(3) <../man3/pmparsehostspec.3.html>`__, 
`pmsearchinfo(3) <../man3/pmsearchinfo.3.html>`__, 
`pmsearchsetup(3) <../man3/pmsearchsetup.3.html>`__, 
`pmsearchtextindom(3) <../man3/pmsearchtextindom.3.html>`__, 
`pmsearchtextquery(3) <../man3/pmsearchtextquery.3.html>`__, 
`pmsearchtextsuggest(3) <../man3/pmsearchtextsuggest.3.html>`__, 
`pmseriesdescs(3) <../man3/pmseriesdescs.3.html>`__, 
`pmseriesquery(3) <../man3/pmseriesquery.3.html>`__, 
`pmseriessetup(3) <../man3/pmseriessetup.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`pmwebtimerregister(3) <../man3/pmwebtimerregister.3.html>`__, 
`labels.conf(5) <../man5/labels.conf.5.html>`__

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
