.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmlogger(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATION FILE SYNTA         |                                   |
| X <#CONFIGURATION_FILE_SYNTAX>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMLOGGER(1)              General Commands Manual             PMLOGGER(1)

NAME
-------------------------------------------------

::

          pmlogger - create archive log for performance metrics


---------------------------------------------------------

::

          pmlogger [-CLNoPruy?]  [-c conffile] [-h host] [-H hostname] [-K
          spec] [-l logfile] [-m note] [-n pmnsfile] [-p pid] [-s endsize]
          [-t interval] [-T endtime] [-U username] [-v volsize] [-V
          version] [-x fd] archive


---------------------------------------------------------------

::

          pmlogger creates the archive logs of performance metric values
          that may be ``played back'' by other Performance Co-Pilot (see
          PCPIntro(1)) tools.  These logs form the basis of the VCR
          paradigm and retrospective performance analysis services common
          to the PCP toolkit.

          The mandatory argument archive is the base name for the physical
          files that constitute an archive log.  The archive argument may
          contain strftime(3) meta-characters, which will be substituted
          prior to creating the archive log files.  When pmlogger is run as
          a service (see pmlogger_daily(1)), the standard archive base name
          template is %Y%m%d.%H.%M.

          The -V option specifies the version for the archive that is
          generated.  By default a version 2 archive is generated, and the
          only value currently supported for version is 2.

          Unless directed to another host by the -h option or when directly
          using PMDAs via the -o option, pmlogger will contact the
          Performance Metrics Collector Daemon (PMCD) on the local host and
          use that as the source of the metric values to be logged.

          To support the required flexibility and control over what is
          logged and when, pmlogger maintains an independent two level
          logging state for each instance of each performance metric.  At
          the first (mandatory) level, logging is allowed to be on (with an
          associated interval between samples), or off or maybe.  In the
          latter case, the second (advisory) level logging is allowed to be
          on (with an associated interval between samples), or off.

          The mandatory level allows universal specification that some
          metrics must be logged, or must not be logged.  The default state
          for all instances of all metrics when pmlogger starts is
          mandatory maybe and advisory off.

          Use pmlc(1) to interrogate and change the logging state once
          pmlogger is running.

          If a metric's state is mandatory (on or off) and a request is
          made to change it to mandatory maybe, the new state is mandatory
          maybe and advisory off.  If a metric's state is already advisory
          (on or off) and a request is made to change it to mandatory
          maybe, the current state is retained.

          It is not possible for pmlogger to log specific instances of a
          metric and all instances of the same metric concurrently.  If
          specific instances are being logged and a request to log all
          instances is made, then all instances of the metric will be
          logged according to the new request, superseding any prior
          logging request for the metric.  A request to log all instances
          of a metric will supersede any previous request to log all
          instances.  A request to log specific instances of a metric when
          all instances are already being logged is refused.  To do this
          one must turn off logging for all instances of the metric first.
          In each case, the validity of the request is checked first; for
          example a request to change a metric's logging state to advisory
          on when it is currently mandatory off is never permitted (it is
          necessary to change the state to mandatory maybe first).

          Optionally, each system running pmcd(1) may also be configured to
          run a ``primary'' pmlogger instance.  This pmlogger instance is
          launched by $PCP_RC_DIR/pmlogger, and is affected by the files
          $PCP_SYSCONF_DIR/pmlogger/control,
          $PCP_SYSCONF_DIR/pmlogger/control.d (use chkconfig(8),
          systemctl(1) or similar platform-specific commands to activate or
          disable the primary pmlogger instance),
          $PCP_SYSCONFIG_DIR/pmlogger (environment variable settings for
          the primary pmlogger) $PCP_SYSCONF_DIR/pmlogger/pmlogger.options
          (command line options passed to the primary pmlogger) and
          $PCP_VAR_DIR/config/pmlogger/config.default (the default initial
          configuration file for the primary pmlogger).

          The primary pmlogger instance is identified by the -P option.
          There may be at most one ``primary'' pmlogger instance on each
          system.  The primary pmlogger instance (if any) must be running
          on the same host as the pmcd(1) to which it connects (if any), so
          the -h and -P options are mutually exclusive.

          Logging of some metrics is possible even in the absence of a
          local pmcd(1), using the "local context" mode of operation.  This
          is activated using the -o option, and causes pmlogger to make use
          of local DSO PMDAs instead of communicating with pmcd(1).  When
          operating using a local context, the -K option may be used to
          control the DSO PMDAs that should be made accessible.  The spec
          argument conforms to the syntax described in pmSpecLocalPMDA(3).
          More than one -K option may be used.

          When launched as a non-primary instance, pmlogger will exit
          immediately if the configuration file causes no metric logging to
          be scheduled.  The -L option overrides this behavior, and causes
          a non-primary pmlogger instance to ``linger'', presumably pending
          some future dynamic re-configuration and state change via
          pmlc(1).  pmlogger will also linger without the -L option being
          used if all the metrics to be logged are logged as once only
          metrics.  When the once only metrics have been logged, a warning
          message will be generated stating that the event queue is empty
          and no more events will be scheduled.

          By default all diagnostics and errors from pmlogger are written
          to the file pmlogger.log in the directory where pmlogger is
          launched.  The -l option may be used to override the default
          behavior.  If the log file cannot be created or is not writable,
          output is written to standard error instead.  If the logfile for
          the -l option is "-" (i.e.  -l-) then log messages are written to
          the standard output stream.  This can be particularly useful when
          running pmlogger manually, rather than as a service daemon.

          The -N option directs pmlogger to notify a service manager,
          typically systemd(1), when it has started and is about to begin
          writing PCP archive logs.  This option would only normally be
          used when pmlogger is run as a daemon service under the control
          of a service manager.  For more details, see
          __pmServerNotifyServiceManagerReady(3) and systemd(1).  On
          platforms that do not use a service manager that supports
          notifications, the -N option is basically a no-op.

          If specified, the -s option instructs pmlogger to terminate after
          a certain size in records, bytes or time units has been
          accumulated.  If endsize is an integer then endsize records will
          be written to the log.  If endsize is an integer suffixed by b or
          bytes then endsize bytes of the archive data will be written out
          (note, however, that archive log record boundaries will not be
          broken and so this limit may be slightly surpassed).  Other
          viable file size units include: K, Kb, KiB, Kbyte, Kilobyte for
          kilobytes and M, Mb, MiB, Mbyte, Megabyte for megabytes and G,
          Gb, GiB, Gbyte, Gigabyte for gigabytes.  These units may be
          optionally suffixed by an s and may be of mixed case.
          Alternatively endsize may be an integer or a floating point
          number suffixed using a time unit as described in PCPIntro(1) for
          the interval argument (to the standard PCP -t command line
          option).
          Some examples of different formats:
             -s 100
             -s 100bytes
             -s 100K
             -s 100Mb
             -s 10Gbyte
             -s 10mins
             -s 1.5hours
          The default is for pmlogger to run forever.

          The -r option causes the size of the physical record(s) for each
          group of metrics and the expected contribution of the group to
          the size of the PCP archive for one full day of collection to be
          reported in the log file.  This information is reported the first
          time each group is successfully written to the archive.

          The -U option specifies the user account under which to run
          pmlogger.  The default is the current user account for
          interactive use.  When run as a daemon, the unprivileged "pcp"
          account is used in current versions of PCP, but in older versions
          the superuser account ("root") was used by default.

          The log file is potentially a multi-volume data set, and the -v
          option causes pmlogger to start a new volume after a certain size
          in records, bytes, or time units has been accumulated for the
          current volume.  The format of this size specification is
          identical to that of the -s option (see above).  The default is
          for pmlogger to create a single volume log.  Additional volume
          switches can also be forced asynchronously by either using
          pmlc(1) or sending pmlogger a SIGHUP signal (see below).  Note,
          if a scheduled volume switch is in operation due to the -v
          option, then its counters will be reset after an asynchronous
          switch.

          Independent of any -v option, each volume of an archive is
          limited to no more than 2^31 bytes, so pmlogger will
          automatically create a new volume for the archive before this
          limit is reached.

          Normally pmlogger operates on the distributed Performance Metrics
          Name Space (PMNS), however if the -n option is specified an
          alternative local PMNS is loaded from the file pmnsfile.

          Under normal circumstances, pmlogger will run forever (except for
          a -s option or a termination signal).  The -T option may be used
          to limit the execution time using the format of time as
          prescribed by PCPIntro(1).  The time is interpreted within the
          time zone of the PMCD server, unless the -y option is given,
          within which case the time zone at this logger host is used.
          Some examples of different formats:
             -T 10mins
             -T '@ 11:30'
          From this it can be seen that -T 10mins and -s 10mins perform
          identical actions.

          Alternatively, pmlogger runtime may be limited to the lifetime of
          another process by using the -p or --PID option to nominate the
          PID of the process of interest.  In this case the pmlogger will
          exit when the other process no longer exists.

          When pmlogger receives a SIGHUP signal, the current volume of the
          log is closed, and a new volume is opened.  This mechanism (or
          the alternative mechanism via pmlc(1)) may be used to manage the
          growth of the log files - once a log volume is closed, that file
          may be archived without ill-effect on the continued operation of
          pmlogger.  See also the -v option above.

          When pmlogger receives a SIGUSR2 signal, the current archive log
          is closed, and a new archive is opened.  For this to succeed, the
          original archive argument must include strftime(3) meta
          characters (e.g.  %Y%m%d.%H.%M), otherwise pmlogger will exit
          because the archive files will already exist and pmlogger will
          not over-write existing archive files.  Note that SIGUSR2
          triggers pmlogger to re-exec itself and re-parse all original
          arguments.  This means that any relative time limits placed on
          it's termination time or sampling limit are reset and begin
          again.  This only affects relative termination times, not
          absolute times e.g.  -T 5s is affected, but -T 5pm is not.

          Historically the buffers for the current log may be flushed to
          disk using the flush command of pmlc(1), or by using the -u
          option.  The current version of pmlogger and the libpcp routines
          that underpin pmlogger unconditionally use unbuffered writes and
          a single fwrite(3) for each logical record written, and so
          ``flushing'' does not force any additional data to be written to
          the file system.  The -u option and the pmlc(1) flush command are
          retained for backwards compatibility.

          When launched with the -x option, pmlogger will accept
          asynchronous control requests on the file descriptor fd.  This
          option is only expected to be used internally by PCP applications
          that support ``live record mode''.

          The -m option allows the string note to be appended to the map
          file for this instance of pmlogger in the $PCP_TMP_DIR/pmlogger
          directory.  This is currently used internally to document the
          file descriptor (fd) when the -x option is used, or to indicate
          that this pmlogger instance was started under the control of
          pmlogger_check(1), (-m pmlogger_check) or was re-exec'd (see
          execvp(3)) due to a SIGUSR2 signal being recieved as described
          above (-m reexec).

          The -H option allows the hostname written into the archive label
          to be overridden.  This mirrors the -H option of pmcd(1) , but
          allows it to be specified on the pmlogger process.  Without this
          option, the value returned from the logged pmcd(1) is used.

          The -C option will cause the configuration file to be parsed and
          pmlogger will then exit without creating an output archive, so
          when -C is specified, the archive command line argument is not
          required.  Any errors in the configuration file are reported.


-------------------------------------------------------------------------------------------

::

          The configuration file may be specified with the -c option.  If
          it is not, configuration specifications are read from standard
          input.

          If conffile does not exist, then a search is made in the
          directory $PCP_VAR_DIR/config/pmlogger for a file of the same
          name, and if found that file is used, e.g. if config.mumble does
          not exist in the current directory and the file
          $PCP_VAR_DIR/config/pmlogger/config.mumble does exist, then -c
          config.mumble and -c $PCP_VAR_DIR/config/pmlogger/config.mumble
          are equivalent.

          The syntax for the configuration file is as follows.

          1.   Words are separated by white space (space, tab or newline).

          2.   The symbol ``#'' (hash) introduces a comment, and all text
               up to the next newline is ignored.

          3.   Keywords (shown in bold below) must appear literally (i.e.
               in lower case).

          4.   Each specification begins with the optional keyword log,
               followed by one of the states mandatory on, mandatory off,
               mandatory maybe, advisory on or advisory off.

          5.   For the on states, a logging interval must follow using the
               syntax ``once'', or ``default'', or ``every N timeunits'',
               or simply ``N timeunits'' - N is an unsigned integer, and
               timeunits is one of the keywords msec, millisecond, sec,
               second, min, minute, hour or the plural form of one of the
               above.
               Internal limitations require the interval to be smaller than
               (approximately) 74 hours.  An interval value of zero is a
               synonym for once.  An interval of default means to use the
               default logging interval of 60 seconds; this default value
               may be changed to interval with the -t command line option.

               The interval argument follows the syntax described in
               PCPIntro(1), and in the simplest form may be an unsigned
               integer (the implied units in this case are seconds).

          6.   Following the state and possible interval specifications
               comes a ``{'', followed by a list of one or more metric
               specifications and a closing ``}''.  The list is white space
               (or comma) separated.  If there is only one metric
               specification in the list, the braces are optional.

          7.   A metric specification consists of a metric name optionally
               followed by a set of instance names.  The metric name
               follows the standard PCP naming conventions, see PMNS(5),
               and if the metric name is a non-leaf node in the PMNS (see
               PMNS(5)), then pmlogger will recursively descend the PMNS
               and apply the logging specification to all descendent metric
               names that are leaf nodes in the PMNS.  The set of instance
               names is a ``['', followed by a list of one or more space
               (or comma) separated names, numbers or strings, and a
               closing ``]''.  Elements in the list that are numbers are
               assumed to be internal instance identifiers, other elements
               are assumed to be external instance identifiers - see
               pmGetInDom(3) for more information.

               If no instances are given, then the logging specification is
               applied to all instances of the associated metric.

          8.   There may be an arbitrary number of logging specifications.

          9.   As of PCP version 4.0 and later, any metric name
               specification that does not resolve to a leaf node in the
               PMNS is added to an internal list of possible dynamic
               subtree roots.  PMDAs can dynamically create new metrics
               below a dynamic root node in their PMNS, and send a
               notification to clients that the PMNS has changed, see
               pmdaExtSetFlags(3) and in particular the METRIC CHANGES
               section for API details.  This mechanism is currently
               supported by pmdaopenmetrics(1) and pmdammv(1).  When a
               fetch issued by pmlogger returns with the
               PMDA_EXT_NAMES_CHANGE flag set, pmlogger will traverse the
               internal list of possible dynamic subtree nodes and
               dynamically discover any new metrics.  In effect, as of PCP
               version 4.0 and later, pmlogger can be configured to
               dynamically log new metrics that appear in the future, after
               the configuration file is initially parsed.

          10.  Following all of the logging specifications, there may be an
               optional access control section, introduced by the literal
               token [access].  Thereafter come access control rules that
               allow or disallow operations from particular hosts or groups
               of hosts.

               The operations may be used to interrogate or control a
               running pmlogger using pmlc(1) and fall into the following
               classes:

               enquire
                      interrogate the status of pmlogger and the metrics it
                      is logging
               advisory
                      Change advisory logging.
               mandatory
                      Change mandatory logging.
               all    All of the above.

               Access control rules are of the form ``allow hostlist :
               operationlist ;'' and ``disallow hostlist : operationlist
               ;''.

               The hostlist follows the syntax and semantics for the access
               control mechanisms used by PMCD and are fully documented in
               pmcd(1).  An operationslist is a comma separated list of the
               operations advisory, mandatory, enquire and all.

               A missing [access] section allows all access and is
               equivalent to allow * : all;.

          The configuration (either from standard input or conffile) is
          initially scanned by pmcpp(1) with the options -rs and -I
          $PCP_VAR_DIR/config/pmlogger.  This extends the configuration
          file syntax with include file processing (%include), a common
          location to search for include files
          ($PCP_VAR_DIR/config/pmlogger), macro definitions (%define),
          macro expansion (%name and %{name}) and conditional inclusion of
          lines (%ifdef name ... %else ... %endif and %ifndef name ...
          %else ... %endif).


-------------------------------------------------------

::

          The available command line options are:

          -c conffile, --config=conffile
               Specify the conffile file to use.

          -C, --check
               Parse configuration and exit.

          -h host, --host=host
               Fetch performance metrics from pmcd(1) on host, rather than
               from the default localhost.

          -H hostname, --labelhost=hostname
               Specify the hostname to use instead of the one returned by
               pmcd(1).

          -K spec, --spec-local=spec
               When fetching metrics from a local context (see -o), the -K
               option may be used to control the DSO PMDAs that should be
               made accessible.  The spec argument conforms to the syntax
               described in pmSpecLocalPMDA(3).  More than one -K option
               may be used.

          -l logfile, --log=logfile
               Write all diagnostics to logfile instead of the default
               pmlogger.log.

          -L, --linger
               Run even if not the primary logger instance and nothing to
               log.

          -m note, --note=note
               Append note to the port map file for this instance.

          -n pmnsfile, --namespace=pmnsfile
               Load an alternative Performance Metrics Name Space (PMNS(5))
               from the file pmnsfile.

          -N, --notify
               Notify service manager such as systemd(1) as needed.

          -o, --local-PMDA
               Use a local context to collect metrics from DSO PMDAs on the
               local host without PMCD.  See also -K.

          -p PID, --PID=PID
               Log specified metrics for the lifetime of the pid PID.

          -P, --primary
               Run as primary logger instance.  See above for more detailed
               description of this.

          -r, --report
               Report record sizes and archive growth rate.

          -s endsize, --size=endsize
               Terminate after log size exceeds endsize.

          -t interval, --interval=interval
               Specify the logging interval.  The default value is 60
               seconds.

          -T endtime, --finish=endtime
               Specify the endtime when to end logging.

          -u   Use unbuffered output.  This is the default (so this option
               does nothing).

          -U username, --username=username
               When in daemon mode, run as user username.

          -v volsize, --volsize=volsize
               Switch log volumes after reaching log volume size volsize.

          -V version, --version=version
               Specify log archive version.  The default and the only
               accepted value is 2.

          -x fd
               Allow asynchronous control requests on the file descriptor
               fd.

          -y   Use local timezone instead of the timezone from the pmcd(1)
               host.

          -?, --help
               Display usage message and exit.


---------------------------------------------------------

::

          For each PCP utility, there is a sample pmlogger configuration
          file that could be used to create an archive log suitable for
          replaying with that tool (i.e. includes all of the performance
          metrics used by the tool).  For a tool named foo this
          configuration file is located in
          $PCP_VAR_DIR/config/pmlogger/config.foo.

          The following is a simple default configuration file for a
          primary pmlogger instance, and demonstrates most of the
          capabilities of the configuration specification language.

               log mandatory on once { hinv.ncpu hinv.ndisk }
               log mandatory on every 10 minutes {
                   disk.all.write
                   disk.all.read
                   network.interface.in.packets [ "et0" ]
                   network.interface.out.packets [ "et0" ]
                   nfs.server.reqs [ "lookup" "getattr" "read" "write" ]
               }

               log advisory on every 30 minutes {
                   environ.temp
                   pmcd.pdu_in.total
                   pmcd.pdu_out.total
               }

               %include "macros.default"

               %ifdef %disk_detail
               log mandatory on %disk_detail_freq {
                   disk.dev
               }
               %endif

               [access]
               disallow * : all except enquire;
               allow localhost : mandatory, advisory;


---------------------------------------------------------------

::

          The archive logs are sufficiently precious that pmlogger will not
          truncate an existing physical file.  A message of the form
           ...: "foo.index" already exists, not over-written
           ...: File exists
          indicates this situation has arisen.  You must explicitly remove
          the files and launch pmlogger again.

          There may be at most one primary pmlogger instance per monitored
          host; attempting to bend this rule produces the error:
           pmlogger: there is already a primary pmlogger running

          Various other messages relating to the creation and/or deletion
          of files in $PCP_TMP_DIR/pmlogger suggest a permission problem on
          this directory, or some feral files have appeared therein.


---------------------------------------------------

::

          archive.meta
               metadata (metric descriptions, instance domains, etc.) for
               the archive log

          archive.0
               initial volume of metrics values (subsequent volumes have
               suffixes 1, 2, ...)

          archive.index
               temporal index to support rapid random access to the other
               files in the archive log

          $PCP_TMP_DIR/pmlogger
               pmlogger maintains the files in this directory as the map
               between the process id of the pmlogger instance and the IPC
               port that may be used to control each pmlogger instance (as
               used by pmlc(1))

          $PCP_VAR_DIR/config/pmlogger/config.default
               default configuration file for the primary logger instance
               launched from $PCP_RC_DIR/pmlogger

          $PCP_VAR_DIR/config/pmlogger/config.*
               assorted configuration files suitable for creating logs that
               may be subsequently replayed with the PCP visualization and
               monitoring tools

          $PCP_ARCHIVE_DIR/<hostname>
               Default directory for PCP archive files for performance
               metric values collected from the host <hostname>.

          $PCP_SYSCONFIG_DIR/pmlogger
               additional environment variables that will be set when the
               primary pmlogger instance executes.  Only settings of the
               form "PMLOGGER_VARIABLE=value" will be honoured.

          ./pmlogger.log
               (or $PCP_ARCHIVE_DIR/<hostname>/pmlogger.log when started
               automatically by either $PCP_RC_DIR/pmlogger or one of the
               pmlogger(1) monitoring scripts such as pmlogger_check(1))
               all messages and diagnostics are directed here


---------------------------------------------------------------

::

          Normally pmlogger creates a socket to receive control messages
          from pmlc(1) on the first available TCP/IP port numbered 4330 or
          higher.  The environment variable PMLOGGER_PORT may be used to
          specify an alternative starting port number.

          If set to the value 1, the PMLOGGER_LOCAL environment variable
          will cause pmlogger to run in a localhost-only mode of operation,
          where it binds only to the loopback interface.

          The PMLOGGER_REQUEST_TIMEOUT variable may be set by applications
          such as pmlc(1) to specify a timeout in seconds for connection
          requests to the pmlogger control port.  If not set, connections
          may block indefinitely.  This variable would not normally be set
          by pmlogger itself.

          The PMLOGGER_MAXPENDING variable can be set to indicate the
          maximum length to which the queue of pending pmlc connections may
          grow.

          The default sampling interval used by pmlogger can be set using
          the PMLOGGER_INTERVAL variable (if not set, 60 seconds will be
          used).  Both the command line and directives in the configuration
          file will override this value.  It is an integer in units of
          seconds.

          On platforms using systemd(1), and when the -N option is given,
          the NOTIFY_SOCKET environment variable would normally be set by
          the service manager prior to launching pmlogger.


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

          PCPIntro(1), pmcd(1), pmdumplog(1), pmlc(1), pmlogger_check(1),
          systemctl(1), systemd(1), execvp(3), pmSpecLocalPMDA(3),
          strftime(3), __pmServerNotifyServiceManagerReady(3), pcp.conf(5),
          pcp.env(5), pmlogger(5), PMNS(5) and chkconfig(8).

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

   Performance Co-Pilot               PCP                       PMLOGGER(1)

--------------

Pages that refer to this page:
`ganglia2pcp(1) <../man1/ganglia2pcp.1.html>`__, 
`iostat2pcp(1) <../man1/iostat2pcp.1.html>`__, 
`mrtg2pcp(1) <../man1/mrtg2pcp.1.html>`__, 
`pcp(1) <../man1/pcp.1.html>`__, 
`pcp-atop(1) <../man1/pcp-atop.1.html>`__, 
`pcp-atopsar(1) <../man1/pcp-atopsar.1.html>`__, 
`pcpcompat(1) <../man1/pcpcompat.1.html>`__, 
`pcp-dstat(1) <../man1/pcp-dstat.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pcp-iostat(1) <../man1/pcp-iostat.1.html>`__, 
`pcp-ss(1) <../man1/pcp-ss.1.html>`__, 
`pcp-tapestat(1) <../man1/pcp-tapestat.1.html>`__, 
`pmcd(1) <../man1/pmcd.1.html>`__, 
`pmchart(1) <../man1/pmchart.1.html>`__, 
`pmcpp(1) <../man1/pmcpp.1.html>`__, 
`pmdaopenmetrics(1) <../man1/pmdaopenmetrics.1.html>`__, 
`pmdasockets(1) <../man1/pmdasockets.1.html>`__, 
`pmdatrace(1) <../man1/pmdatrace.1.html>`__, 
`pmdiff(1) <../man1/pmdiff.1.html>`__, 
`pmdumplog(1) <../man1/pmdumplog.1.html>`__, 
`pmdumptext(1) <../man1/pmdumptext.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__, 
`pmfind_check(1) <../man1/pmfind_check.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pmie_check(1) <../man1/pmie_check.1.html>`__, 
`pmlc(1) <../man1/pmlc.1.html>`__, 
`pmlogcheck(1) <../man1/pmlogcheck.1.html>`__, 
`pmlogconf(1) <../man1/pmlogconf.1.html>`__, 
`pmlogctl(1) <../man1/pmlogctl.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pmlogger_check(1) <../man1/pmlogger_check.1.html>`__, 
`pmlogger_daily_report(1) <../man1/pmlogger_daily_report.1.html>`__, 
`pmlogger_merge(1) <../man1/pmlogger_merge.1.html>`__, 
`pmlogger_rewrite(1) <../man1/pmlogger_rewrite.1.html>`__, 
`pmloglabel(1) <../man1/pmloglabel.1.html>`__, 
`pmlogmv(1) <../man1/pmlogmv.1.html>`__, 
`pmlogreduce(1) <../man1/pmlogreduce.1.html>`__, 
`pmlogrewrite(1) <../man1/pmlogrewrite.1.html>`__, 
`pmlogsize(1) <../man1/pmlogsize.1.html>`__, 
`pmlogsummary(1) <../man1/pmlogsummary.1.html>`__, 
`pmproxy(1) <../man1/pmproxy.1.html>`__, 
`pmsearch(1) <../man1/pmsearch.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pmsnap(1) <../man1/pmsnap.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pmview(1) <../man1/pmview.1.html>`__, 
`sar2pcp(1) <../man1/sar2pcp.1.html>`__, 
`sheet2pcp(1) <../man1/sheet2pcp.1.html>`__, 
`logimport(3) <../man3/logimport.3.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`\__pmaf(3) <../man3/__pmaf.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`\__pmconnectlogger(3) <../man3/__pmconnectlogger.3.html>`__, 
`\__pmcontrollog(3) <../man3/__pmcontrollog.3.html>`__, 
`pmdestroycontext(3) <../man3/pmdestroycontext.3.html>`__, 
`pmdiscoversetup(3) <../man3/pmdiscoversetup.3.html>`__, 
`pmdupcontext(3) <../man3/pmdupcontext.3.html>`__, 
`pmgetarchiveend(3) <../man3/pmgetarchiveend.3.html>`__, 
`pmgetarchivelabel(3) <../man3/pmgetarchivelabel.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmrecord(3) <../man3/pmrecord.3.html>`__, 
`pmsearchinfo(3) <../man3/pmsearchinfo.3.html>`__, 
`pmsearchsetup(3) <../man3/pmsearchsetup.3.html>`__, 
`pmsearchtextindom(3) <../man3/pmsearchtextindom.3.html>`__, 
`pmsearchtextquery(3) <../man3/pmsearchtextquery.3.html>`__, 
`pmsearchtextsuggest(3) <../man3/pmsearchtextsuggest.3.html>`__, 
`pmseriesdescs(3) <../man3/pmseriesdescs.3.html>`__, 
`pmseriesquery(3) <../man3/pmseriesquery.3.html>`__, 
`pmseriessetup(3) <../man3/pmseriessetup.3.html>`__, 
`pmtrimnamespace(3) <../man3/pmtrimnamespace.3.html>`__, 
`pmusecontext(3) <../man3/pmusecontext.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`pmwhichcontext(3) <../man3/pmwhichcontext.3.html>`__, 
`LOGARCHIVE(5) <../man5/LOGARCHIVE.5.html>`__

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
