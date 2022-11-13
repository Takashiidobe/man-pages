.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmcd(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `AGENT CONFIG                     |                                   |
| URATION <#AGENT_CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `ACCESS CONTROL CONFIGURATION <   |                                   |
| #ACCESS_CONTROL_CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| AGENT FENCING <#AGENT_FENCING>`__ |                                   |
| \|                                |                                   |
| `RECONFIGUR                       |                                   |
| ING PMCD <#RECONFIGURING_PMCD>`__ |                                   |
| \|                                |                                   |
| `STARTING AND STOPPING PMCD       |                                   |
|  <#STARTING_AND_STOPPING_PMCD>`__ |                                   |
| \| `CAVEATS <#CAVEATS>`__ \|      |                                   |
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

   PMCD(1)                  General Commands Manual                 PMCD(1)

NAME
-------------------------------------------------

::

          pmcd - performance metrics collector daemon


---------------------------------------------------------

::

          pmcd [-AfQSv?]  [-c config] [-C dirname] [-H hostname] [-i
          ipaddress] [-l logfile] [-L bytes] [-M certname] [-[n|N]
          pmnsfile] [-p port[,port ...]]  [-P passfile] [-q timeout] [-s
          sockname] [-t timeout] [-T traceflag] [-U username] [-x file]


---------------------------------------------------------------

::

          pmcd is the collector used by the Performance Co-Pilot (see
          PCPIntro(1)) to gather performance metrics on a system.  As a
          rule, there must be an instance of pmcd running on a system for
          any performance metrics to be available to the PCP.

          pmcd accepts connections from client applications running either
          on the same machine or remotely and provides them with metrics
          and other related information from the machine that pmcd is
          executing on.  pmcd delegates most of this request servicing to a
          collection of Performance Metrics Domain Agents (or just agents),
          where each agent is responsible for a particular group of
          metrics, known as the domain of the agent.  For instance, the
          postgresql agent is responsible for reporting information
          relating to the PostgreSQL database, such as the transaction and
          query counts, indexing and replication statistics, and so on.

          The agents may be processes started by pmcd, independent
          processes or Dynamic Shared Objects (DSOs, see dlopen(3))
          attached to pmcd's address space.  The configuration section
          below describes how connections to agents are specified.

          Note that if a PDU exchange with an agent times out, the agent
          has violated the requirement that it delivers metrics with little
          or no delay.  This is deemed a protocol failure and the agent is
          disconnected from pmcd.  Any subsequent requests for information
          from the agent will fail with a status indicating that there is
          no agent to provide it.

          It is possible to specify access control to pmcd based on users,
          groups and hosts.  This allows one to prevent users, groups of
          users, and certain hosts from accessing the metrics provided by
          pmcd and is described in more detail in the access control
          section below.


-------------------------------------------------------

::

          The available command line options are:

          -A   Disable service advertisement.  By default, pmcd will
               advertise its presence on the network using any available
               mechanisms (such as Avahi/DNS-SD), assisting remote
               monitoring tools with finding it.  These mechanisms are
               disabled with this option.

          -c config, --config=config
               On startup pmcd uses a configuration file from either the
               $PCP_PMCDCONF_PATH, configuration variable in /etc/pcp.conf,
               or an environment variable of the same name.  However, these
               values may be overridden with config using this option.  The
               format of this configuration file is described below.

          -C dirname, --certdb=dirname
               Specify the path to the Network Security Services
               certificate database, for (optional) secure connections.
               The default is /etc/pki/nssdb.  Refer also to the -P option.
               If it does not already exist, this database can be created
               using the certutil utility.  This process and other
               certificate database maintenance information is provided in
               the PCPIntro(1) manual page and the online PCP tutorials.

          -f, --foreground
               By default pmcd is started as a daemon.  The -f option
               indicates that it should run in the foreground.  This is
               most useful when trying to diagnose problems with
               misbehaving agents.

          -H hostname, --hostname=hostname
               This option can be used to set the hostname that pmcd will
               use to represent this instance of itself.  This is used by
               client tools like pmlogger(1) when reporting on the
               (possibly remote) host.  If this option is not set, the
               pmcd.hostname metric will match that returned by
               pmhostname(1).  Refer to the manual page for that tool for
               full details on how the hostname is evaluated.

          -i ipaddress, --interface=ipaddress
               This option is usually only used on hosts with more than one
               network interface.  If no -i options are specified pmcd
               accepts connections made to any of its host's IP (Internet
               Protocol) addresses.  The -i option is used to specify
               explicitly an IP address that connections should be accepted
               on.  ipaddress should be in the standard dotted form (e.g.
               100.23.45.6).  The -i option may be used multiple times to
               define a list of IP addresses.  Connections made to any
               other IP addresses the host has will be refused.  This can
               be used to limit connections to one network interface if the
               host is a network gateway.  It is also useful if the host
               takes over the IP address of another host that has failed.
               In such a situation only the standard IP addresses of the
               host should be given (not the ones inherited from the failed
               host).  This allows PCP applications to determine that a
               host has failed, rather than connecting to the host that has
               assumed the identity of the failed host.

          -l logfile, --log=logfile
               By default a log file named pmcd.log is written in the
               directory $PCP_LOG_DIR/pmcd.  The -l option causes the log
               file to be written to logfile instead of the default.  If
               the log file cannot be created or is not writable, output is
               written to the standard error instead.

          -L bytes
               PDUs received by pmcd from monitoring clients are restricted
               to a maximum size of 65536 bytes by default to defend
               against Denial of Service attacks.  The -L option may be
               used to change the maximum incoming PDU size.

          -M certname, --certname=certname
               By default, pmcd will try to use a certificate called PCP
               Collector certificate.  The -M option allows this to be
               changed.

          -n pmnsfile, --namespace=pmnsfile
               Normally pmcd loads the default Performance Metrics Name
               Space (PMNS) from $PCP_VAR_DIR/pmns/root, however if the -n
               option is specified an alternative namespace is loaded from
               the file pmnsfile.

          -N pmnsfile, --uniqnames=pmnsfile
               Same function as -n, except for the handling of duplicate
               Performance Metric Identifiers (PMIDs) in pmnsfile -
               duplicate names are allowed with -n but they are not allowed
               with -N.

          -p port, --port=port
               Specify port to listen on.  By default port 44321 is used.

          -P passfile, --passfile=passfile
               Specify the path to a file containing the Network Security
               Services certificate database password for (optional) secure
               connections, and for databases that are password protected.
               Refer also to the -C option.  When using this option, great
               care should be exercised to ensure appropriate ownership
               ("pcp" user, typically) and permissions on this file (0400,
               so as to be unreadable by any user other than the user
               running the pmcd process).

          -q timeout
               The pmcd to agent version exchange protocol (new in PCP 2.0
               - introduced to provide backward compatibility) uses this
               timeout to specify how long pmcd should wait before assuming
               that no version response is coming from an agent.  If this
               timeout is reached, the agent is assumed to be an agent
               which does not understand the PCP 2.0 protocol.  The default
               timeout interval is five seconds, but the -q option allows
               an alternative timeout interval (which must be greater than
               zero) to be specified.  The unit of time is seconds.

          -Q, --remotecert
               Require that all remote client connections provide a
               certficate.

          -s sockname, --socket=sockname
               Specify the path to a local unix domain socket (for
               platforms supporting this socket family only).  The default
               value is $PCP_RUN_DIR/pmcd.socket.

          -S, --reqauth
               Require that all client connections provide user
               credentials.  This means that only unix domain sockets, or
               authenticated connections are permitted (requires secure
               sockets support).  If any user or group access control
               requirements are specified in the pmcd configuration file,
               then this mode of operation is automatically entered,
               whether the -S flag is specified or not.

          -t timeout
               To prevent misbehaving clients or agents from hanging the
               entire Performance Metrics Collection System (PMCS), pmcd
               uses timeouts on PDU exchanges with clients and agents
               running as processes.  By default the timeout interval is
               five seconds.  The -t option allows an alternative timeout
               interval in seconds to be specified.  If timeout is zero,
               timeouts are turned off.  It is almost impossible to use the
               debugger interactively on an agent unless timeouts have been
               turned off for its "parent" pmcd.

               Once pmcd is running, the timeout may be dynamically
               modified by storing an integer value (the timeout in
               seconds) into the metric pmcd.control.timeout via
               pmstore(1).

          -T traceflag, --trace=traceflag
               To assist with error diagnosis for agents and/or clients of
               pmcd that are not behaving correctly, an internal event
               tracing mechanism is supported within pmcd.  The value of
               traceflag is interpreted as a bit field with the following
               control functions:

               1   enable client connection tracing
               2   enable PDU tracing
               256 unbuffered event tracing

               By default, event tracing is buffered using a circular
               buffer that is over-written as new events are recorded.  The
               default buffer size holds the last 20 events, although this
               number may be over-ridden by using pmstore(1) to modify the
               metric pmcd.control.tracebufs.

               Similarly once pmcd is running, the event tracing control
               may be dynamically modified by storing 1 (enable) or 0
               (disable) into the metrics pmcd.control.traceconn,
               pmcd.control.tracepdu and pmcd.control.tracenobuf.  These
               metrics map to the bit fields associated with the traceflag
               argument for the -T option.

               When operating in buffered mode, the event trace buffer will
               be dumped whenever an agent connection is terminated by
               pmcd, or when any value is stored into the metric
               pmcd.control.dumptrace via pmstore(1).

               In unbuffered mode, every event will be reported when it
               occurs.

          -U username, --username=USER
               User account under which to run pmcd.  The default is the
               unprivileged "pcp" account in current versions of PCP, but
               in older versions the superuser account ("root") was used by
               default.

          -v, --verify
               Verify the pmcd configuration file, reporting on any errors
               then exiting with a status indicating verification success
               or failure.

          -x file
               Before the pmcd logfile can be opened, pmcd may encounter a
               fatal error which prevents it from starting.  By default,
               the output describing this error is sent to /dev/tty but it
               may redirected to file.

          -?, --help
               Display usage message and exit.


-------------------------------------------------------------------

::

          On startup pmcd looks for a configuration file named
          $PCP_PMCDCONF_PATH.  This file specifies which agents cover which
          performance metrics domains and how pmcd should make contact with
          the agents.  An optional section specifying access controls may
          follow the agent configuration data.

          Warning: pmcd is usually started as part of the boot sequence and
          runs initially as root.  The configuration file may contain shell
          commands to create agents, which will be executed by root.  To
          prevent security breaches the configuration file should be
          writable only by root.  The use of absolute path names is also
          recommended.

          The case of the reserved words in the configuration file is
          unimportant, but elsewhere, the case is preserved.

          Blank lines and comments are permitted (even encouraged) in the
          configuration file.  A comment begins with a ``#'' character and
          finishes at the end of the line.  A line may be continued by
          ensuring that the last character on the line is a ``\''
          (backslash).  A comment on a continued line ends at the end of
          the continued line.  Spaces may be included in lexical elements
          by enclosing the entire element in double quotes.  A double quote
          preceded by a backslash is always a literal double quote.  A
          ``#'' in double quotes or preceded by a backslash is treated
          literally rather than as a comment delimiter.  Lexical elements
          and separators are described further in the following sections.


-------------------------------------------------------------------------------

::

          Each line of the agent configuration section of the configuration
          file contains details of how to connect pmcd to one of its agents
          and specifies which metrics domain the agent deals with.  An
          agent may be attached as a DSO, or via a socket, or a pair of
          pipes.

          Each line of the agent configuration section of the configuration
          file must be either an agent specification, a comment, or a blank
          line.  Lexical elements are separated by whitespace characters,
          however a single agent specification may not be broken across
          lines unless a backslash is used to continue the line.

          Each agent specification must start with a textual label (string)
          followed by an integer in the range 1 to 510.  The label is a tag
          used to refer to the agent and the integer specifies the domain
          for which the agent supplies data.  This domain identifier
          corresponds to the domain portion of the PMIDs handled by the
          agent.  Each agent must have a unique label and domain
          identifier.

          For DSO agents a line of the form:

                 label domain-no dso entry-point path

          should appear.  Where,

          label  is a string identifying the agent
          domain-no
                 is an unsigned integer specifying the agent's domain in
                 the range 1 to 510
          entry-point
                 is the name of an initialization function which will be
                 called when the DSO is loaded
          path   designates the location of the DSO and this is expected to
                 be an absolute pathname.  pmcd is only able to load DSO
                 agents that have the same simabi (Subprogram Interface
                 Model ABI, or calling conventions) as it does (i.e. only
                 one of the simabi versions will be applicable).  The
                 simabi version of a running pmcd may be determined by
                 fetching pmcd.simabi.  Alternatively, the file(1) command
                 may be used to determine the simabi version from the pmcd
                 executable.

                        For a relative path the environment variable
                        PMCD_PATH defines a colon (:) separated list of
                        directories to search when trying to locate the
                        agent DSO.  The default search path is
                        $PCP_SHARE_DIR/lib:/usr/pcp/lib.

          For agents providing socket connections, a line of the form

                 label domain-no socket addr-family address [ command ]

          should appear.  Where,

          label  is a string identifying the agent
          domain-no
                 is an unsigned integer specifying the agent's domain in
                 the range 1 to 510
          addr-family
                 designates whether the socket is in the AF_INET, AF_INET6
                 or AF_UNIX domain, and the corresponding values for this
                 parameter are inet, ipv6 and unix respectively.
          address
                 specifies the address of the socket within the previously
                 specified addr-family.  For unix sockets, the address
                 should be the name of an agent's socket on the local host
                 (a valid address for the UNIX domain).  For inet and ipv6
                 sockets, the address may be either a port number or a port
                 name which may be used to connect to an agent on the local
                 host.  There is no syntax for specifying an agent on a
                 remote host as a pmcd deals only with agents on the same
                 machine.
          command
                 is an optional parameter used to specify a command line to
                 start the agent when pmcd initializes.  If command is not
                 present, pmcd assumes that the specified agent has already
                 been created.  The command is considered to start from the
                 first non-white character after the socket address and
                 finish at the next newline that isn't preceded by a
                 backslash.  After a fork(2) the command is passed
                 unmodified to execve(2) to instantiate the agent.

          For agents interacting with the pmcd via stdin/stdout, a line of
          the form:

                 label domain-no pipe protocol command

          should appear.  Where,

          label  is a string identifying the agent
          domain-no
                 is an unsigned integer specifying the agent's domain
          protocol
                 The value for this parameter should be binary.

                 Additionally, the protocol can include the notready
                 keyword to indicate that the agent must be marked as not
                 being ready to process requests from pmcd.  The agent will
                 explicitly notify the pmcd when it is ready to process the
                 requests by sending a PM_ERR_PMDAREADY PDU.  For further
                 details of this protocol, including a description of the
                 IPC parameters that can be specified in a PMDA Install
                 script with the ipc_prot parameter, see the relevant
                 section in PMDA(3).

          command
                 specifies a command line to start the agent when pmcd
                 initializes.  Note that command is mandatory for pipe-
                 based agents.  The command is considered to start from the
                 first non-white character after the protocol parameter and
                 finish at the next newline that isn't preceded by a
                 backslash.  After a fork(2) the command is passed
                 unmodified to execve(2) to instantiate the agent.


-------------------------------------------------------------------------------------------------

::

          The access control section of the configuration file is optional,
          but if present it must follow the agent configuration data.  The
          case of reserved words is ignored, but elsewhere case is
          preserved.  Lexical elements in the access control section are
          separated by whitespace or the special delimiter characters:
          square brackets (``['' and ``]''), braces (``{'' and ``}''),
          colon (``:''), semicolon (``;'') and comma (``,'').  The special
          characters are not treated as special in the agent configuration
          section.  Lexical elements may be quoted (double quotes) as
          necessary.

          The access control section of the file must start with a line of
          the form:

          [access]

          In addition to (or instead of) the access section in the pmcd
          configuration file, access control specifications are also read
          from a file having the same name as the pmcd configuration file,
          but with '.access' appended to the name.  This optional file must
          not contain the [access] keyword.

          Leading and trailing whitespace may appear around and within the
          brackets and the case of the access keyword is ignored.  No other
          text may appear on the line except a trailing comment.

          Following this line, the remainder of the configuration file
          should contain lines that allow or disallow operations from
          particular hosts or groups of hosts.

          There are two kinds of operations that occur via pmcd:

          fetch  allows retrieval of information from pmcd.  This may be
                 information about a metric (e.g. its description, instance
                 domain, labels or help text) or a value for a metric.  See
                 pminfo(1) for further information.

          store  allows pmcd to be used to store metric values in agents
                 that permit store operations.  This may be the actual
                 value of the metric (e.g. resetting a counter to zero).
                 Alternatively, it may be a value used by the PMDA to
                 introduce a change to some aspect of monitoring of that
                 metric (e.g. server side event filtering) - possibly even
                 only for the active client tool performing the store
                 operation, and not others.  See pmstore(1) for further
                 information.

          Access to pmcd can be granted in three ways - by user, group of
          users, or at a host level.  In the latter, all users on a host
          are granted the same level of access, unless the user or group
          access control mechanism is also in use.

          User names and group names will be verified using the local
          /etc/passwd and /etc/groups files (or an alternative directory
          service), using the getpwent(3) and getgrent(3) routines.

          Hosts may be identified by name, IP address, IPv6 address or by
          the special host specifications ``"unix:"'' or ``"local:"''.
          ``"unix:"'' refers to pmcd's unix domain socket, on supported
          platforms.  ``"local:"'' is equivalent to specifying ``"unix:"''
          and ``localhost``.

          Wildcards may also be specified by ending the host identifier
          with the single wildcard character ``*'' as the last-given
          component of an address.  The wildcard ``".*"'' refers to all
          inet (IPv4) addresses.  The wildcard ``":*"'' refers to all IPv6
          addresses.  If an IPv6 wildcard contains a ``::'' component, then
          the final ``*'' refers to the final 16 bits of the address only,
          otherwise it refers to the remaining unspecified bits of the
          address.

          The wildcard ``*'' refers to all users, groups or host addresses,
          including ``"unix:"''.  Names of users, groups or hosts may not
          be wildcarded.

          The following are all valid host identifiers:

               boing
               localhost
               giggle.melbourne.sgi.com
               129.127.112.2
               129.127.114.*
               129.*
               .*
               fe80::223:14ff:feaf:b62c
               fe80::223:14ff:feaf:*
               fe80:*
               :*
               "unix:"
               "local:"
               *

          The following are not valid host identifiers:

               *.melbourne
               129.127.*.*
               129.*.114.9
               129.127*
               fe80::223:14ff:*:*
               fe80::223:14ff:*:b62c
               fe80*

          The first example is not allowed because only (numeric) IP
          addresses may contain a wildcard.  The second and fifth examples
          are not valid because there is more than one wildcard character.
          The third and sixth contain an embedded wildcard, the fourth and
          seventh have a wildcard character that is not the last component
          of the address (the last components are 127* and fe80*
          respectively).

          The name localhost is given special treatment to make the
          behavior of host wildcarding consistent.  Rather than being
          127.0.0.1 and ::1, it is mapped to the primary inet and IPv6
          addresses associated with the name of the host on which pmcd is
          running.  Beware of this when running pmcd on multi-homed hosts.

          Access for users, groups or hosts are allowed or disallowed by
          specifying statements of the form:

                 allow users userlist : operations ;
                 disallow users userlist : operations ;
                 allow groups grouplist : operations ;
                 disallow groups grouplist : operations ;
                 allow hosts hostlist : operations ;
                 disallow hosts hostlist : operations ;

          list   userlist, grouplist and hostlist are comma separated lists
                 of one or more users, groups or host identifiers.

          operations
                 is a comma separated list of the operation types described
                 above, all (which allows/disallows all operations), or all
                 except operations (which allows/disallows all operations
                 except those listed).

          Either plural or singular forms of users, groups, and hosts
          keywords are allowed.  If this keyword is omitted, a default of
          hosts will be used.  This behaviour is for backward-compatibility
          only, it is preferable to be explicit.

          Where no specific allow or disallow statement applies to an
          operation, the default is to allow the operation from all users,
          groups and hosts.  In the trivial case when there is no access
          control section in the configuration file, all operations from
          all users, groups, and hosts are permitted.

          If a new connection to pmcd is attempted by a user, group or host
          that is not permitted to perform any operations, the connection
          will be closed immediately after an error response
          PM_ERR_PERMISSION has been sent to the client attempting the
          connection.

          Statements with the same level of wildcarding specifying
          identical hosts may not contradict each other.  For example if a
          host named clank had an IP address of 129.127.112.2, specifying
          the following two rules would be erroneous:

               allow host clank : fetch, store;
               disallow host 129.127.112.2 : all except fetch;

          because they both refer to the same host, but disagree as to
          whether the fetch operation is permitted from that host.

          Statements containing more specific host specifications override
          less specific ones according to the level of wildcarding.  For
          example a rule of the form

               allow host clank : all;

          overrides

               disallow host 129.127.112.* : all except fetch;

          because the former contains a specific host name (equivalent to a
          fully specified IP address), whereas the latter has a wildcard.
          In turn, the latter would override

               disallow host * : all;

          It is possible to limit the number of connections from a user,
          group or host to pmcd.  This may be done by adding a clause of
          the form

                 maximum n connections

          to the operations list of an allow statement.  Such a clause may
          not be used in a disallow statement.  Here, n is the maximum
          number of connections that will be accepted from the user, group
          or host matching the identifier(s) used in the statement.

          An access control statement with a list of user, group or host
          identifiers is equivalent to a set of access control statements,
          with each specifying one of the identifiers in the list and all
          with the same access controls (both permissions and connection
          limits).  A group should be used if you want users to contribute
          to a shared connection limit.  A wildcard should be used if you
          want hosts to contribute to a shared connection limit.

          When a new client requests a connection, and pmcd has determined
          that the client has permission to connect, it searches the
          matching list of access control statements for the most specific
          match containing a connection limit.  For brevity, this will be
          called the limiting statement.  If there is no limiting
          statement, the client is granted a connection.  If there is a
          limiting statement and the number of pmcd clients with user ID,
          group ID, or IP addresses that match the identifier in the
          limiting statement is less than the connection limit in the
          statement, the connection is allowed.  Otherwise the connection
          limit has been reached and the client is refused a connection.

          Group access controls and the wildcarding in host identifiers
          means that once pmcd actually accepts a connection from a client,
          the connection may contribute to the current connection count of
          more than one access control statement - the client's host may
          match more than one access control statement, and similarly the
          user ID may be in more than one group.  This may be significant
          for subsequent connection requests.

          Note that pmcd enters a mode where it runs effectively with a
          higher-level of security as soon as a user or group access
          control section is added to the configuration.  In this mode only
          authenticated connections are allowed - either from a SASL
          authenticated connection, or a Unix domain socket (which
          implicitly passes client credentials).  This is the same mode
          that is entered explicitly using the -S option.  Assuming
          permission is allowed, one can determine whether pmcd is running
          in this mode by querying the value of the
          pmcd.feature.creds_required metric.

          Note also that because most specific match semantics are used
          when checking the connection limit, for the host-based access
          control case, priority is given to clients with more specific
          host identifiers.  It is also possible to exceed connection
          limits in some situations.  Consider the following:

                 allow host clank : all, maximum 5 connections;
                 allow host * : all except store, maximum 2 connections;

          This says that only 2 client connections at a time are permitted
          for all hosts other than "clank", which is permitted 5.  If a
          client from host "boing" is the first to connect to pmcd, its
          connection is checked against the second statement (that is the
          most specific match with a connection limit).  As there are no
          other clients, the connection is accepted and contributes towards
          the limit for only the second statement above.  If the next
          client connects from "clank", its connection is checked against
          the limit for the first statement.  There are no other
          connections from "clank", so the connection is accepted.  Once
          this connection is accepted, it counts towards both statements'
          limits because "clank" matches the host identifier in both
          statements.  Remember that the decision to accept a new
          connection is made using only the most specific matching access
          control statement with a connection limit.  Now, the connection
          limit for the second statement has been reached.  Any connections
          from hosts other than "clank" will be refused.

          If instead, pmcd with no clients saw three successive connections
          arrived from "boing", the first two would be accepted and the
          third refused.  After that, if a connection was requested from
          "clank" it would be accepted.  It matches the first statement,
          which is more specific than the second, so the connection limit
          in the first is used to determine that the client has the right
          to connect.  Now there are 3 connections contributing to the
          second statement's connection limit.  Even though the connection
          limit for the second statement has been exceeded, the earlier
          connections from "boing" are maintained.  The connection limit is
          only checked at the time a client attempts a connection rather
          than being re-evaluated every time a new client connects to pmcd.

          This gentle scheme is designed to allow reasonable limits to be
          imposed on a first come first served basis, with specific
          exceptions.

          As illustrated by the example above, a client's connection is
          honored once it has been accepted.  However, pmcd reconfiguration
          (see the next section) re-evaluates all the connection counts and
          will cause client connections to be dropped where connection
          limits have been exceeded.


-------------------------------------------------------------------

::

          Preventing sampling during the life of a PMDA is sometimes
          desirable, for example if that sampling impacts on sensitive
          phases of a scheduled job.  A temporary ``fence'' can be raised
          to block all PMAPI client access to one or more agents in this
          situation.  This functionality is provided by the built-in PMCD
          PMDA and the pmstore(1) command, as in

               # pmstore -i nfsclient,kvm pmcd.agent.fenced 1

          If the optional comma-separated list of agent names is omitted,
          all agents will be fenced.  To resume normal operation, the
          ``fence'' can be lowered as follows

               # pmstore -i nfsclient,kvm pmcd.agent.fenced 0

          Lowering the fence for all PMDAs at once is performed using

               # pmstore pmcd.agent.fenced 0

          Elevated privileges are required to store to the
          pmcd.agent.fenced metric.  For additional information, see the
          help text associated with this metric, which can be accessed
          using the -T, --helptext option to pminfo(1).


-----------------------------------------------------------------------------

::

          If the configuration file has been changed or if an agent is not
          responding because it has terminated or the PMNS has been
          changed, pmcd may be reconfigured by sending it a SIGHUP, as in

               # pmsignal -a -s HUP pmcd

          When pmcd receives a SIGHUP, it checks the configuration file for
          changes.  If the file has been modified, it is reparsed and the
          contents become the new configuration.  If there are errors in
          the configuration file, the existing configuration is retained
          and the contents of the file are ignored.  Errors are reported in
          the pmcd log file.

          It also checks the PMNS file and any labels files for changes.
          If any of these files have been modified, then the PMNS and/or
          context labels are reloaded.  Use of tail(1) on the log file is
          recommended while reconfiguring pmcd.

          If the configuration for an agent has changed (any parameter
          except the agent's label is different), the agent is restarted.
          Agents whose configurations do not change are not restarted.  Any
          existing agents not present in the new configuration are
          terminated.  Any deceased agents are that are still listed are
          restarted.

          Sometimes it is necessary to restart an agent that is still
          running, but malfunctioning.  Simply stop the agent (e.g. using
          SIGTERM from pmsignal(1)), then send pmcd a SIGHUP, which will
          cause the agent to be restarted.


---------------------------------------------------------------------------------------------

::

          Normally, pmcd is started automatically at boot time and stopped
          when the system is being brought down.  Under certain
          circumstances it is necessary to start or stop pmcd manually.  To
          do this one must become superuser and type

               # $PCP_RC_DIR/pmcd start

          to start pmcd, or

               # $PCP_RC_DIR/pmcd stop

          to stop pmcd.  Starting pmcd when it is already running is the
          same as stopping it and then starting it again.

          Sometimes it may be necessary to restart pmcd during another
          phase of the boot process.  Time-consuming parts of the boot
          process are often put into the background to allow the system to
          become available sooner (e.g. mounting huge databases).  If an
          agent run by pmcd requires such a task to complete before it can
          run properly, it is necessary to restart or reconfigure pmcd
          after the task completes.  Consider, for example, the case of
          mounting a database in the background while booting.  If the PMDA
          which provides the metrics about the database cannot function
          until the database is mounted and available but pmcd is started
          before the database is ready, the PMDA will fail (however pmcd
          will still service requests for metrics from other domains).  If
          the database is initialized by running a shell script, adding a
          line to the end of the script to reconfigure pmcd (by sending it
          a SIGHUP) will restart the PMDA (if it exited because it couldn't
          connect to the database).  If the PMDA didn't exit in such a
          situation it would be necessary to restart pmcd because if the
          PMDA was still running pmcd would not restart it.

          Normally pmcd listens for client connections on TCP/IP port
          number 44321 (registered at http://www.iana.org/ ).  Either the
          environment variable PMCD_PORT or the -p command line option may
          be used to specify alternative port number(s) when pmcd is
          started; in each case, the specification is a comma-separated
          list of one or more numerical port numbers.  Should both methods
          be used or multiple -p options appear on the command line, pmcd
          will listen on the union of the set of ports specified via all -p
          options and the PMCD_PORT environment variable.  If non-default
          ports are used with pmcd care should be taken to ensure that
          PMCD_PORT is also set in the environment of any client
          application that will connect to pmcd, or that the extended host
          specification syntax is used (see PCPIntro(1) for details).


-------------------------------------------------------

::

          pmcd does not explicitly terminate its children (agents), it only
          closes their pipes.  If an agent never checks for a closed pipe
          it may not terminate.

          The configuration file parser will only read lines of less than
          1200 characters.  This is intended to prevent accidents with
          binary files.

          The timeouts controlled by the -t option apply to IPC between
          pmcd and the PMDAs it spawns.  This is independent of settings of
          the environment variables PMCD_CONNECT_TIMEOUT and
          PMCD_REQUEST_TIMEOUT (see PCPIntro(1)) which may be used
          respectively to control timeouts for client applications trying
          to connect to pmcd and trying to receive information from pmcd.


---------------------------------------------------------------

::

          If pmcd is already running the message "Error: OpenRequestSocket
          bind: Address may already be in use" will appear.  This may also
          appear if pmcd was shutdown with an outstanding request from a
          client.  In this case, a request socket has been left in the
          TIME_WAIT state and until the system closes it down (after some
          timeout period) it will not be possible to run pmcd.

          In addition to the standard PCP debugging flags, see pmdbg(1),
          pmcd currently uses the options: appl0 for tracing I/O and
          termination of agents, appl1 for tracing access control and appl2
          for tracing the configuration file scanner and parser.


---------------------------------------------------

::

          $PCP_PMCDCONF_PATH
               default configuration file

          $PCP_PMCDCONF_PATH.access
               optional access control specification file

          $PCP_PMCDOPTIONS_PATH
               command line options to pmcd when launched from
               $PCP_RC_DIR/pmcd All the command line option lines should
               start with a hyphen as the first character.

          $PCP_SYSCONFIG_DIR/pmcd
               Environment variables that will be set when pmcd executes.
               Only settings of the form "PMCD_VARIABLE=value" or
               "PCP_VARIABLE=value" are honoured.

          $PCP_SYSCONF_DIR/labels.conf
               settings related to labels used globally throughout the
               PMCS.

          $PCP_SYSCONF_DIR/labels
               directory of files containing the global metric labels that
               will be set for every client context created by pmcd.  File
               names starting with a ``.'' are ignored, and files ending in
               ``.json'' are ``JSONB'' formatted name:value pairs.  The
               merged set can be queried via the pmcd.labels metric.
               Context labels are applied universally to all metrics.

          $PCP_SYSCONF_DIR/labels/optional
               directory of files containing the global metric labels that
               will be set for every client context created by pmcd, but
               which are flagged as optional.  These labels are exactly the
               same as other context labels except that they are not used
               in time series identifier calculations.

          ./pmcd.log
               (or $PCP_LOG_DIR/pmcd/pmcd.log when started automatically)
               All messages and diagnostics are directed here.

          $PCP_RUN_DIR/pmcd.pid
               contains an ascii decimal representation of the process ID
               of pmcd, when it's running.

          /etc/pki/nssdb
               default Network Security Services (NSS) certificate database
               directory, used for optional Secure Socket Layer
               connections.  This database can be created and queried using
               the NSS certutil tool, amongst others.

          /etc/passwd
               user names, user identifiers and primary group identifiers,
               used for access control specifications

          /etc/groups
               group names, group identifiers and group members, used for
               access control specifications


---------------------------------------------------------------

::

          The following variables are set in $PCP_SYSCONFIG_DIR/pmcd.

          In addition to the PCP environment variables described in the PCP
          ENVIRONMENT section below, the PMCD_PORT variable is also
          recognised as the TCP/IP port for incoming connections (default
          44321), and the PMCD_SOCKET variable is also recognised as the
          path to be used for the Unix domain socket.

          If set to the value 1, the PMCD_LOCAL environment variable will
          cause pmcd to run in a localhost-only mode of operation, where it
          binds only to the loopback interface.  The pmcd.feature.local
          metric can be queried to determine if pmcd is running in this
          mode.

          The PMCD_MAXPENDING variable can be set to indicate the maximum
          length to which the queue of pending client connections may grow.

          The PMCD_ROOT_AGENT variable controls whether or not pmcd or
          pmdaroot (when available), start subsequent pmdas.  When set to a
          non-zero value, pmcd will opt to have pmdaroot start, and stop,
          PMDAs.

          The PMCD_RESTART_AGENTS variable determines the behaviour of pmcd
          in the presence of child PMDAs that have been observed to exit
          (this is a typical response in the presence of very large,
          usually domain-induced, PDU latencies).  When set to a non-zero
          value, pmcd will attempt to restart such PMDAS once every minute.
          When set to zero, it uses the original behaviour of just logging
          the failure.


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

          PCPIntro(1), pmdbg(1), pmerr(1), pmgenmap(1), pminfo(1),
          pmrep(1), pmstat(1), pmstore(1), pmval(1), getpwent(3),
          getgrent(3), labels.conf(5), pcp.conf(5), pcp.env(5) and PMNS(5).

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

   Performance Co-Pilot               PCP                           PMCD(1)

--------------

Pages that refer to this page: `dbpmda(1) <../man1/dbpmda.1.html>`__, 
`dbprobe(1) <../man1/dbprobe.1.html>`__, 
`genpmda(1) <../man1/genpmda.1.html>`__, 
`pcp(1) <../man1/pcp.1.html>`__, 
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pcp-atopsar(1) <../man1/pcp-atopsar.1.html>`__, 
`pcpcompat(1) <../man1/pcpcompat.1.html>`__, 
`pcp-dstat(1) <../man1/pcp-dstat.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pcp-iostat(1) <../man1/pcp-iostat.1.html>`__, 
`pcp-kube-pods(1) <../man1/pcp-kube-pods.1.html>`__, 
`pcp-tapestat(1) <../man1/pcp-tapestat.1.html>`__, 
`pmcd_wait(1) <../man1/pmcd_wait.1.html>`__, 
`pmchart(1) <../man1/pmchart.1.html>`__, 
`pmclient(1) <../man1/pmclient.1.html>`__, 
`pmdaactivemq(1) <../man1/pmdaactivemq.1.html>`__, 
`pmdaapache(1) <../man1/pmdaapache.1.html>`__, 
`pmdabash(1) <../man1/pmdabash.1.html>`__, 
`pmdabcc(1) <../man1/pmdabcc.1.html>`__, 
`pmdabind2(1) <../man1/pmdabind2.1.html>`__, 
`pmdabonding(1) <../man1/pmdabonding.1.html>`__, 
`pmdabpftrace(1) <../man1/pmdabpftrace.1.html>`__, 
`pmdacifs(1) <../man1/pmdacifs.1.html>`__, 
`pmdacisco(1) <../man1/pmdacisco.1.html>`__, 
`pmdadbping(1) <../man1/pmdadbping.1.html>`__, 
`pmdadenki(1) <../man1/pmdadenki.1.html>`__, 
`pmdadm(1) <../man1/pmdadm.1.html>`__, 
`pmdadocker(1) <../man1/pmdadocker.1.html>`__, 
`pmdads389(1) <../man1/pmdads389.1.html>`__, 
`pmdads389log(1) <../man1/pmdads389log.1.html>`__, 
`pmdaelasticsearch(1) <../man1/pmdaelasticsearch.1.html>`__, 
`pmdagfs2(1) <../man1/pmdagfs2.1.html>`__, 
`pmdagluster(1) <../man1/pmdagluster.1.html>`__, 
`pmdagpfs(1) <../man1/pmdagpfs.1.html>`__, 
`pmdahacluster(1) <../man1/pmdahacluster.1.html>`__, 
`pmdahaproxy(1) <../man1/pmdahaproxy.1.html>`__, 
`pmdaib(1) <../man1/pmdaib.1.html>`__, 
`pmdajbd2(1) <../man1/pmdajbd2.1.html>`__, 
`pmdajson(1) <../man1/pmdajson.1.html>`__, 
`pmdakernel(1) <../man1/pmdakernel.1.html>`__, 
`pmdakvm(1) <../man1/pmdakvm.1.html>`__, 
`pmdalibvirt(1) <../man1/pmdalibvirt.1.html>`__, 
`pmdalio(1) <../man1/pmdalio.1.html>`__, 
`pmdalmsensors(1) <../man1/pmdalmsensors.1.html>`__, 
`pmdalogger(1) <../man1/pmdalogger.1.html>`__, 
`pmdalustre(1) <../man1/pmdalustre.1.html>`__, 
`pmdalustrecomm(1) <../man1/pmdalustrecomm.1.html>`__, 
`pmdamailq(1) <../man1/pmdamailq.1.html>`__, 
`pmdamemcache(1) <../man1/pmdamemcache.1.html>`__, 
`pmdamic(1) <../man1/pmdamic.1.html>`__, 
`pmdammv(1) <../man1/pmdammv.1.html>`__, 
`pmdamounts(1) <../man1/pmdamounts.1.html>`__, 
`pmdamssql(1) <../man1/pmdamssql.1.html>`__, 
`pmdamysql(1) <../man1/pmdamysql.1.html>`__, 
`pmdanetcheck(1) <../man1/pmdanetcheck.1.html>`__, 
`pmdanetfilter(1) <../man1/pmdanetfilter.1.html>`__, 
`pmdanfsclient(1) <../man1/pmdanfsclient.1.html>`__, 
`pmdanginx(1) <../man1/pmdanginx.1.html>`__, 
`pmdanutcracker(1) <../man1/pmdanutcracker.1.html>`__, 
`pmdanvidia(1) <../man1/pmdanvidia.1.html>`__, 
`pmdaopenmetrics(1) <../man1/pmdaopenmetrics.1.html>`__, 
`pmdaopenvswitch(1) <../man1/pmdaopenvswitch.1.html>`__, 
`pmdaoracle(1) <../man1/pmdaoracle.1.html>`__, 
`pmdaperfevent(1) <../man1/pmdaperfevent.1.html>`__, 
`pmdapipe(1) <../man1/pmdapipe.1.html>`__, 
`pmdapodman(1) <../man1/pmdapodman.1.html>`__, 
`pmdapostfix(1) <../man1/pmdapostfix.1.html>`__, 
`pmdapostgresql(1) <../man1/pmdapostgresql.1.html>`__, 
`pmdaproc(1) <../man1/pmdaproc.1.html>`__, 
`pmdarabbitmq(1) <../man1/pmdarabbitmq.1.html>`__, 
`pmdaredis(1) <../man1/pmdaredis.1.html>`__, 
`pmdaroomtemp(1) <../man1/pmdaroomtemp.1.html>`__, 
`pmdaroot(1) <../man1/pmdaroot.1.html>`__, 
`pmdarsyslog(1) <../man1/pmdarsyslog.1.html>`__, 
`pmdasample(1) <../man1/pmdasample.1.html>`__, 
`pmdasendmail(1) <../man1/pmdasendmail.1.html>`__, 
`pmdashping(1) <../man1/pmdashping.1.html>`__, 
`pmdasimple(1) <../man1/pmdasimple.1.html>`__, 
`pmdaslurm(1) <../man1/pmdaslurm.1.html>`__, 
`pmdasmart(1) <../man1/pmdasmart.1.html>`__, 
`pmdasockets(1) <../man1/pmdasockets.1.html>`__, 
`pmdastatsd(1) <../man1/pmdastatsd.1.html>`__, 
`pmdasummary(1) <../man1/pmdasummary.1.html>`__, 
`pmdasystemd(1) <../man1/pmdasystemd.1.html>`__, 
`pmdatrace(1) <../man1/pmdatrace.1.html>`__, 
`pmdatrivial(1) <../man1/pmdatrivial.1.html>`__, 
`pmdatxmon(1) <../man1/pmdatxmon.1.html>`__, 
`pmdaunbound(1) <../man1/pmdaunbound.1.html>`__, 
`pmdaweblog(1) <../man1/pmdaweblog.1.html>`__, 
`pmdaxfs(1) <../man1/pmdaxfs.1.html>`__, 
`pmdazfs(1) <../man1/pmdazfs.1.html>`__, 
`pmdazimbra(1) <../man1/pmdazimbra.1.html>`__, 
`pmdazswap(1) <../man1/pmdazswap.1.html>`__, 
`pmdumptext(1) <../man1/pmdumptext.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__, 
`pmfind_check(1) <../man1/pmfind_check.1.html>`__, 
`pmie(1) <../man1/pmie.1.html>`__, 
`pminfo(1) <../man1/pminfo.1.html>`__, 
`pmlc(1) <../man1/pmlc.1.html>`__, 
`pmlogconf(1) <../man1/pmlogconf.1.html>`__, 
`pmlogctl(1) <../man1/pmlogctl.1.html>`__, 
`pmlogextract(1) <../man1/pmlogextract.1.html>`__, 
`pmlogger(1) <../man1/pmlogger.1.html>`__, 
`pmlogpaste(1) <../man1/pmlogpaste.1.html>`__, 
`pmprobe(1) <../man1/pmprobe.1.html>`__, 
`pmproxy(1) <../man1/pmproxy.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmrepconf(1) <../man1/pmrepconf.1.html>`__, 
`pmseries(1) <../man1/pmseries.1.html>`__, 
`pmsocks(1) <../man1/pmsocks.1.html>`__, 
`pmstat(1) <../man1/pmstat.1.html>`__, 
`pmstore(1) <../man1/pmstore.1.html>`__, 
`pmtrace(1) <../man1/pmtrace.1.html>`__, 
`pmval(1) <../man1/pmval.1.html>`__, 
`pmview(1) <../man1/pmview.1.html>`__, 
`logimport(3) <../man3/logimport.3.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`pmapi(3) <../man3/pmapi.3.html>`__, 
`\__pmconnectlogger(3) <../man3/__pmconnectlogger.3.html>`__, 
`pmda(3) <../man3/pmda.3.html>`__, 
`pmdaconnect(3) <../man3/pmdaconnect.3.html>`__, 
`pmdadso(3) <../man3/pmdadso.3.html>`__, 
`pmdafetch(3) <../man3/pmdafetch.3.html>`__, 
`pmdainit(3) <../man3/pmdainit.3.html>`__, 
`pmdamain(3) <../man3/pmdamain.3.html>`__, 
`pmdaopenlog(3) <../man3/pmdaopenlog.3.html>`__, 
`pmdaprofile(3) <../man3/pmdaprofile.3.html>`__, 
`pmdarootconnect(3) <../man3/pmdarootconnect.3.html>`__, 
`pmdasenderror(3) <../man3/pmdasenderror.3.html>`__, 
`pmdatrace(3) <../man3/pmdatrace.3.html>`__, 
`pmdestroycontext(3) <../man3/pmdestroycontext.3.html>`__, 
`pmdiscoverservices(3) <../man3/pmdiscoverservices.3.html>`__, 
`pmdupcontext(3) <../man3/pmdupcontext.3.html>`__, 
`pmfetch(3) <../man3/pmfetch.3.html>`__, 
`pmgetoptions(3) <../man3/pmgetoptions.3.html>`__, 
`\__pmlocalpmda(3) <../man3/__pmlocalpmda.3.html>`__, 
`pmlookuplabels(3) <../man3/pmlookuplabels.3.html>`__, 
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmparsehostattrsspec(3) <../man3/pmparsehostattrsspec.3.html>`__, 
`pmparsehostspec(3) <../man3/pmparsehostspec.3.html>`__, 
`pmreconnectcontext(3) <../man3/pmreconnectcontext.3.html>`__, 
`pmrecord(3) <../man3/pmrecord.3.html>`__, 
`pmspeclocalpmda(3) <../man3/pmspeclocalpmda.3.html>`__, 
`pmtrimnamespace(3) <../man3/pmtrimnamespace.3.html>`__, 
`pmusecontext(3) <../man3/pmusecontext.3.html>`__, 
`pmwebapi(3) <../man3/pmwebapi.3.html>`__, 
`pmwhichcontext(3) <../man3/pmwhichcontext.3.html>`__, 
`labels.conf(5) <../man5/labels.conf.5.html>`__, 
`pmns(5) <../man5/pmns.5.html>`__

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
