.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmie(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `QUICK START <#QUICK_START>`__ \| |                                   |
| `EXPRESSI                         |                                   |
| ON SYNTAX <#EXPRESSION_SYNTAX>`__ |                                   |
| \|                                |                                   |
| `BOOLEAN EXPR                     |                                   |
| ESSIONS <#BOOLEAN_EXPRESSIONS>`__ |                                   |
| \| `RULESETS <#RULESETS>`__ \|    |                                   |
| `                                 |                                   |
| SCALE FACTORS <#SCALE_FACTORS>`__ |                                   |
| \| `MACROS <#MACROS>`__ \|        |                                   |
| `AUTOMATI                         |                                   |
| C RESTART <#AUTOMATIC_RESTART>`__ |                                   |
| \|                                |                                   |
| `EVENT                            |                                   |
| MONITORING <#EVENT_MONITORING>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| UNIX SEE ALSO <#UNIX_SEE_ALSO>`__ |                                   |
| \|                                |                                   |
| `WINDOW                           |                                   |
| S SEE ALSO <#WINDOWS_SEE_ALSO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `USER GUIDE <#USER_GUIDE>`__ \|   |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMIE(1)                  General Commands Manual                 PMIE(1)

NAME
-------------------------------------------------

::

          pmie - inference engine for performance metrics


---------------------------------------------------------

::

          pmie [-bCdeFfPqvVWxXz?]  [-a archive] [-A align] [-c filename]
          [-h host] [-l logfile] [-j stompfile] [-n pmnsfile] [-O offset]
          [-S starttime] [-t interval] [-T endtime] [-U username] [-Z
          timezone] [filename ...]


---------------------------------------------------------------

::

          pmie accepts a collection of arithmetic, logical, and rule
          expressions to be evaluated at specified frequencies.  The base
          data for the expressions consists of performance metrics values
          delivered in real-time from any host running the Performance
          Metrics Collection Daemon (PMCD), or using historical data from
          Performance Co-Pilot (PCP) archive logs.

          As well as computing arithmetic and logical values, pmie can
          execute actions (popup alarms, write system log messages, and
          launch programs) in response to specified conditions.  Such
          actions are extremely useful in detecting, monitoring and
          correcting performance related problems.

          The expressions to be evaluated are read from configuration files
          specified by one or more filename arguments.  In the absence of
          any filename, expressions are read from standard input.

          Output from pmie is directed to standard output and standard
          error as follows:

          stdout
               Expression values printed in the verbose -v mode and the
               output of print actions.

          stderr
               Error and warning messages for any syntactic or semantic
               problems during expression parsing, and any semantic or
               performance metrics availability problems during expression
               evaluation.


-------------------------------------------------------

::

          The available command line options are:

          -a archive, --archive=archive
               archive which is a comma-separated list of names, each of
               which may be the base name of an archive or the name of a
               directory containing one or more archives written by
               pmlogger(1).  Multiple instances of the -a flag may appear
               on the command line to specify a list of sets of archives.
               In this case, it is required that only one set of archives
               be present for any one host.  Also, any explicit host names
               occurring in a pmie expression must match the host name
               recorded in one of the archive labels.  In the case of
               multiple sets of archives, timestamps recorded in the
               archives are used to ensure temporal consistency.

          -A align, --align=align
               Force the initial time window to be aligned on the boundary
               of a natural time unit align.  Refer to PCPIntro(1) for a
               complete description of the syntax for align.

          -b, --buffer
               Output will be line buffered and standard output is attached
               to standard error.  This is most useful for background
               execution in conjunction with the -l option.  The -b option
               is always used for pmie instances launched from
               pmie_check(1).

          -c config, --config=config
               An alternative to specifying filename at the end of the
               command line.

          -C, --check
               Parse the configuration file(s) and exit before performing
               any evaluations.  Any errors in the configuration file are
               reported.

          -d, --interact
               Normally pmie would be launched as a non-interactive process
               to monitor and manage the performance of one or more hosts.
               Given the -d flag however, execution is interactive and the
               user is presented with a menu of options.  Interactive mode
               is useful mainly for debugging new expressions.

          -e, --timestamp
               When used with -V, -v or -W, this option forces timestamps
               to be reported with each expression.  The timestamps are in
               ctime(3) format, enclosed in parenthesis and appear after
               the expression name and before the expression value, e.g.
                    expr_1 (Tue Feb  6 19:55:10 2001): 12

          -f, --foreground
               If the -l option is specified and there is no -a option (ie.
               real-time monitoring) then pmie is run as a daemon in the
               background (in all other cases foreground is the default).
               The -f (and -F, see below) options force pmie to be run in
               the foreground, independent of any other options.

          -F, --systemd
               Like -f, the -F option runs pmie in the foreground, but also
               does some housekeeping (like create a pid file, change user
               id and notify systemd(1) when pmie has started or is
               shutting down).  This is intended for use when pmie is
               launched from systemd(1) and the daemonizing has already
               been done.  The -f and -F options are mutually exclusive.

          -h host, --host=host
               By default performance data is fetched from the local host
               (in real-time mode) or the host for the first named set of
               archives on the command line (in archive mode).  The host
               argument overrides this default.  It does not override hosts
               explicitly named in the expressions being evaluated.  The
               host argument is interpreted as a connection specification
               for pmNewContext, and is later mapped to the remote pmcd's
               self-reported host name for reporting purposes.  See also
               the %h vs. %c substitutions in rule action strings below.

          -l logfile, --logfile=logfile
               Standard error is sent to logfile.

          -j file
               An alternative STOMP protocol configuration is loaded from
               stompfile.  If this option is not used, and the stomp action
               is used in any rule, the default location
               $PCP_SYSCONF_DIR/pmie/config/stomp will be used.

          -n pmnsfile, --namespace=pmnsfile
               An alternative Performance Metrics Name Space (PMNS) is
               loaded from the file pmnsfile.

          -O origin, --origin=origin
               Specify the origin of the time window.  See PCPIntro(1) for
               complete description of this option.

          -P, --primary
               Identifies this as the primary pmie instance for a host.
               See the ``AUTOMATIC RESTART'' section below for further
               details.

          -q, --quiet
               Suppresses diagnostic messages that would be printed to
               standard output by default, especially the "evaluator
               exiting" message as this can confuse scripts.

          -S starttime, --start=starttime
               Specify the starttime of the time window.  See PCPIntro(1)
               for complete description of this option.

          -t interval, --interval=interval
               The interval argument follows the syntax described in
               PCPIntro(1), and in the simplest form may be an unsigned
               integer (the implied units in this case are seconds).  The
               value is used to determine the sample interval for
               expressions that do not explicitly set their sample interval
               using the pmie variable delta described below.  The default
               is 10.0 seconds.

          -T endtime, --finish=endtime
               Specify the endtime of the time window.  See PCPIntro(1) for
               complete description of this option.

          -U username, --username=username
               User account under which to run pmie.  The default is the
               current user account for interactive use.  When run as a
               daemon, the unprivileged "pcp" account is used in current
               versions of PCP, but in older versions the superuser account
               ("root") was used by default.

          -v   Unless one of the verbose options -V, -v or -W appears on
               the command line, expressions are evaluated silently, the
               only output is as a result of any actions being executed.
               In the verbose mode, specified using the -v flag, the value
               of each expression is printed as it is evaluated.  The
               values are in canonical units; bytes in the dimension of
               ``space'', seconds in the dimension of ``time'' and events
               in the dimension of ``count''.  See pmLookupDesc(3) for
               details of the supported dimension and scaling mechanisms
               for performance metrics.  The verbose mode is useful in
               monitoring the value of given expressions, evaluating
               derived performance metrics, passing these values on to
               other tools for further processing and in debugging new
               expressions.

          -V, --verbose
               This option has the same effect as the -v option, except
               that the name of the host and instance (if applicable) are
               printed as well as expression values.

          -W   This option has the same effect as the -V option described
               above, except that for boolean expressions, only those names
               and values that make the expression true are printed.  These
               are the same names and values accessible to rule actions as
               the %h, %i, %c and %v bindings, as described below.

          -x, --secret-agent
               Execute in domain agent mode.  This mode is used within the
               Performance Co-Pilot product to derive values for summary
               metrics, see pmdasummary(1).  Only restricted functionality
               is available in this mode (expressions with actions may not
               be used).

          -X, --secret-applet
               Run in secret applet mode (thin client).

          -z, --hostzone
               Change the reporting timezone to the timezone of the host
               that is the source of the performance metrics, as identified
               via either the -h option or the first named set of archives
               (as described above for the -a option).

          -Z timezone, --timezone=timezone
               Change the reporting timezone to timezone in the format of
               the environment variable TZ as described in environ(7).

          -?, --help
               Display usage message and exit.


---------------------------------------------------------

::

          The following example expressions demonstrate some of the
          capabilities of the inference engine.

          The directory $PCP_DEMOS_DIR/pmie contains a number of other
          annotated examples of pmie expressions.

          The variable delta controls expression evaluation frequency.
          Specify that subsequent expressions be evaluated once a second,
          until further notice:

               delta = 1 sec;

          If the total context switch rate exceeds 10000 per second per
          CPU, then display an alarm notifier:

               kernel.all.pswitch / hinv.ncpu > 10000 count/sec
               -> alarm "high context switch rate %v";

          If the high context switch rate is sustained for 10 consecutive
          samples, then launch top(1) in an xterm(1) window to monitor
          processes, but do this at most once every 5 minutes:

               all_sample (
                   kernel.all.pswitch @0..9 > 10 Kcount/sec * hinv.ncpu
               ) -> shell 5 min "xterm -e 'top'";

          The following rules are evaluated once every 20 seconds:

               delta = 20 sec;

          If any disk is performing more than 60 I/Os per second, then
          print a message identifying the busy disk to standard output and
          launch dkvis(1):

               some_inst (
                   disk.dev.total > 60 count/sec
               ) -> print "busy disks:" " %i" &
                    shell 5 min "dkvis";

          Refine the preceding rule to apply only between the hours of 9am
          and 5pm, and to require 3 of 4 consecutive samples to exceed the
          threshold before executing the action:

               $hour >= 9 && $hour <= 17 &&
               some_inst (
                 75 %_sample (
                   disk.dev.total @0..3 > 60 count/sec
                 )
               ) -> print "disks busy for 20 sec:" " [%h]%i";

          The following two rules are evaluated once every 10 minutes:

               delta = 10 min;

          If either the / or the /usr filesystem is more than 95% full,
          display an alarm popup, but not if it has already been displayed
          during the last 4 hours:

               filesys.free #'/dev/root' /
                   filesys.capacity #'/dev/root' < 0.05
               -> alarm 4 hour "root filesystem (almost) full";

               filesys.free #'/dev/usr' /
                   filesys.capacity #'/dev/usr' < 0.05
               -> alarm 4 hour "/usr filesystem (almost) full";

          The following rule requires a machine that supports the lmsensors
          metrics.  If the machine environment temperature rises more than
          2 degrees over a 10 minute interval, write an entry in the system
          log:

               lmsensors.coretemp_isa.temp1 @0 - lmsensors.coretemp_isa.temp1 @1 > 2
               -> alarm "temperature rising fast" &
                  syslog "machine room temperature rise alarm";

          And something interesting if you have performance problems with
          your Oracle database:

               // back to 30sec evaluations
               delta = 30 sec;
               sid = "ptg1";       # $ORACLE_SID setting
               lid = "223";        # latch ID from v$latch
               lru = "#'$sid/$lid cache buffers lru chain'";
               host = ":moomba.melbourne.sgi.com";
               gets = "oracle.latch.gets $host $lru";
               total = "oracle.latch.gets $host $lru +
                        oracle.latch.misses $host $lru +
                        oracle.latch.immisses $host $lru";

               $total > 100 && $gets / $total < 0.2
               -> alarm "high lru latch contention in database $sid";

          The following ruleset will emit exactly one message depending on
          the availability and value of the 1-minute load average.

               delta = 1 minute;
               ruleset
                    kernel.all.load #'1 minute' > 10 * hinv.ncpu ->
                        print "extreme load average %v"
               else kernel.all.load #'1 minute' > 2 * hinv.ncpu ->
                        print "moderate load average %v"
               unknown ->
                        print "load average unavailable"
               otherwise ->
                        print "load average OK"
               ;

          The following rule will emit a message when some filesystem is
          more than 75% full and is filling at a rate that if sustained
          would fill the filesystem to 100% in less than 30 minutes.

               some_inst (
                   100 * filesys.used / filesys.capacity > 75 &&
                   filesys.used + 30min * (rate filesys.used) > filesys.capacity
               ) -> print "filesystem will be full within 30 mins:" " %i";

          If the metric mypmda.errors counts errors then the following rule
          will emit a message if the rate of errors exceeds 1 per second
          provided the error count is less than 100.

               mypmda.errors > 1 && instant mypmda.errors < 100
               -> print "high error rate: %v";


---------------------------------------------------------------

::

          The pmie specification language is powerful and large.

          To expedite rapid development of pmie rules, the pmieconf(1) tool
          provides a facility for generating a pmie configuration file from
          a set of generalized pmie rules.  The supplied set of rules
          covers a wide range of performance scenarios.

          The Performance Co-Pilot User's and Administrator's Guide
          provides a detailed tutorial-style chapter covering pmie.


---------------------------------------------------------------------------

::

          This description is terse and informal.  For a more comprehensive
          description see the Performance Co-Pilot User's and
          Administrator's Guide.

          A pmie specification is a sequence of semicolon terminated
          expressions.

          Basic operators are modeled on the arithmetic, relational and
          Boolean operators of the C programming language.  Precedence
          rules are as expected, although the use of parentheses is
          encouraged to enhance readability and remove ambiguity.

          Operands are performance metric names (see PMNS(5)) and the
          normal literal constants.

          Operands involving performance metrics may produce sets of
          values, as a result of enumeration in the dimensions of hosts,
          instances and time.  Special qualifiers may appear after a
          performance metric name to define the enumeration in each
          dimension.  For example,

              kernel.percpu.cpu.user :foo :bar #cpu0 @0..2

          defines 6 values corresponding to the time spent executing in
          user mode on CPU 0 on the hosts ``foo'' and ``bar'' over the last
          3 consecutive samples.  The default interpretation in the absence
          of : (host), # (instance) and @ (time) qualifiers is all
          instances at the most recent sample time for the default source
          of PCP performance metrics.

          Host and instance names that do not follow the rules for
          variables in programming languages, ie. alphabetic optionally
          followed by alphanumerics, should be enclosed in single quotes.

          Expression evaluation follows the law of ``least surprises''.
          Where performance metrics have the semantics of a counter, pmie
          will automatically convert to a rate based upon consecutive
          samples and the time interval between these samples.  All numeric
          expressions are evaluated in double precision, and where
          appropriate, automatically scaled into canonical units of
          ``bytes'', ``seconds'' and ``counts''.

          A rule is a special form of expression that specifies a condition
          or logical expression, a special operator (->) and actions to be
          performed when the condition is found to be true.

          The following table summarizes the basic pmie operators:

          ┌────────────────┬────────────────────────────────────────────────┐
          │   Operators    │                  Explanation                   │
          ├────────────────┼────────────────────────────────────────────────┤
          │+ - * /         │ Arithmetic                                     │
          │< <= == >= > != │ Relational (value comparison)                  │
          │! && ||         │ Boolean                                        │
          │->              │ Rule                                           │
          │rising          │ Boolean, false to true transition              │
          │falling         │ Boolean, true to false transition              │
          │rate            │ Explicit rate conversion (rarely required)     │
          │instant         │ No automatic rate conversion (rarely required) │
          └────────────────┴────────────────────────────────────────────────┘
          All operators are supported for numeric-valued operands and
          expressions.  For string-valued operands, namely literal string
          constants enclosed in double quotes or metrics with a data type
          of string (PM_TYPE_STRING), only the operators == and != are
          supported.

          The rate and instant operators are the logical inverse of one
          another, so an arithmetic expression expr is equal to rate
          instant expr.  The more useful cases involve using rate with a
          metric that is not a counter to determine the rate of change over
          time or instant with a metric that is a counter to determine if
          the current value is above or below some threshold.

          Aggregate operators may be used to aggregate or summarize along
          one dimension of a set-valued expression.  The following
          aggregate operators map from a logical expression to a logical
          expression of lower dimension.

         ┌─────────────────────────┬─────────────┬──────────────────────────┐
         │       Operators         │    Type     │       Explanation        │
         ├─────────────────────────┼─────────────┼──────────────────────────┤
         │some_inst                │ Existential │ True if at least one set │
         │some_host                │             │ member is true in the    │
         │some_sample              │             │ associated dimension     │
         ├─────────────────────────┼─────────────┼──────────────────────────┤
         │all_inst                 │ Universal   │ True if all set members  │
         │all_host                 │             │ are true in the          │
         │all_sample               │             │ associated dimension     │
         ├─────────────────────────┼─────────────┼──────────────────────────┤
         │N%_inst                  │ Percentile  │ True if at least N       │
         │N%_host                  │             │ percent of set members   │
         │N%_sample                │             │ are true in the          │
         │                         │             │ associated dimension     │
         └─────────────────────────┴─────────────┴──────────────────────────┘
          The following instantial operators may be used to filter or limit
          a set-valued logical expression, based on regular expression
          matching of instance names.  The logical expression must be a set
          involving the dimension of instances, and the regular expression
          is of the form used by egrep(1) or the Extended Regular
          Expressions of regcomp(3).

              ┌─────────────┬──────────────────────────────────────────┐
              │ Operators   │               Explanation                │
              ├─────────────┼──────────────────────────────────────────┤
              │match_inst   │ For each value of the logical expression │
              │             │ that is ``true'', the result is ``true'' │
              │             │ if the associated instance name matches  │
              │             │ the regular expression.  Otherwise the   │
              │             │ result is ``false''.                     │
              ├─────────────┼──────────────────────────────────────────┤
              │nomatch_inst │ For each value of the logical expression │
              │             │ that is ``true'', the result is ``true'' │
              │             │ if the associated instance name does not │
              │             │ match the regular expression.  Otherwise │
              │             │ the result is ``false''.                 │
              └─────────────┴──────────────────────────────────────────┘
          For example, the expression below will be ``true'' for disks
          attached to controllers 2 or 3 performing more than 20 operations
          per second:
               match_inst "^dks[23]d" disk.dev.total > 20;

          The following aggregate operators map from an arithmetic
          expression to an arithmetic expression of lower dimension.

          ┌─────────────────────────┬───────────┬──────────────────────────┐
          │       Operators         │   Type    │       Explanation        │
          ├─────────────────────────┼───────────┼──────────────────────────┤
          │min_inst                 │ Extrema   │ Minimum value across all │
          │min_host                 │           │ set members in the       │
          │min_sample               │           │ associated dimension     │
          ├─────────────────────────┼───────────┼──────────────────────────┤
          │max_inst                 │ Extrema   │ Maximum value across all │
          │max_host                 │           │ set members in the       │
          │max_sample               │           │ associated dimension     │
          ├─────────────────────────┼───────────┼──────────────────────────┤
          │sum_inst                 │ Aggregate │ Sum of values across all │
          │sum_host                 │           │ set members in the       │
          │sum_sample               │           │ associated dimension     │
          ├─────────────────────────┼───────────┼──────────────────────────┤
          │avg_inst                 │ Aggregate │ Average value across all │
          │avg_host                 │           │ set members in the       │
          │avg_sample               │           │ associated dimension     │
          └─────────────────────────┴───────────┴──────────────────────────┘
          The aggregate operators count_inst, count_host and count_sample
          map from a logical expression to an arithmetic expression of
          lower dimension by counting the number of set members for which
          the expression is true in the associated dimension.

          For action rules, the following actions are defined:

                ┌──────────┬────────────────────────────────────────┐
                │Operators │              Explanation               │
                ├──────────┼────────────────────────────────────────┤
                │alarm     │ Raise a visible alarm with xconfirm(1) │
                │print     │ Display on standard output             │
                │shell     │ Execute with sh(1)                     │
                │stomp     │ Send a STOMP message to a JMS server   │
                │syslog    │ Append a message to system log file    │
                └──────────┴────────────────────────────────────────┘
          Multiple actions may be separated by the & and | operators to
          specify respectively sequential execution (both actions are
          executed) and alternate execution (the second action will only be
          executed if the execution of the first action returns a non-zero
          error status.

          Arguments to actions are an optional suppression time, and then
          one or more expressions (a string is an expression in this
          context).  Strings appearing as arguments to an action may
          include the following special selectors that will be replaced at
          the time the action is executed.

          %h  Host name(s) that make the left-most top-level expression in
              the condition true.

          %c  Connection specification string(s) or files for a PCP tool to
              reach the hosts or archives that make the left-most top-level
              expression in the condition true.

          %i  Instance(s) that make the left-most top-level expression in
              the condition true.

          %v  One value from the left-most top-level expression in the
              condition for each host and instance pair that makes the
              condition true.

          Note that expansion of the special selectors is done by repeating
          the whole argument once for each unique binding to any of the
          qualifying special selectors.  For example if a rule were true
          for the host mumble with instances grunt and snort, and for host
          fumble the instance puff makes the rule true, then the action
               ...
               -> shell myscript "Warning: %h:%i busy ";
          will execute myscript with the argument string "Warning:
          mumble:grunt busy Warning: mumble:snort busy Warning: fumble:puff
          busy".

          By comparison, if the action
               ...
               -> shell myscript "Warning! busy:" " %h:%i";
          were executed under the same circumstances, then myscript would
          be executed with the argument string "Warning! busy: mumble:grunt
          mumble:snort fumble:puff".

          The semantics of the expansion of the special selectors leads to
          a common usage pattern in an action, where one argument is a
          constant (contains no special selectors) the second argument
          contains the desired special selectors with minimal separator
          characters, and an optional third argument provides a constant
          postscript (e.g. to terminate any argument quoting from the first
          argument).  If necessary post-processing (eg. in myscript) can
          provide the necessary enumeration over each unique expansion of
          the string containing just the special selectors.

          For complex conditions, the bindings to these selectors is not
          obvious.  It is strongly recommended that pmie be used in the
          debugging mode (specify the -W command line option in particular)
          during rule development.


-------------------------------------------------------------------------------

::

          pmie expressions that have the semantics of a Boolean, e.g.
          foo.bar > 10 or some_inst ( my.table < 0 ) are assigned the
          values true or false or unknown.  A value is unknown if one or
          more of the underlying metric values is unavailable, e.g.
          pmcd(1) on the host cannot be contacted, the metric is not in the
          PCP archive, no values are currently available, insufficient
          values have been fetched to allow a rate converted value to be
          computed or insufficient values have been fetched to instantiate
          the required number of samples in the temporal domain.

          Boolean operators follow the normal rules of Kleene logic (aka
          3-valued logic) when combining values that include unknown:

                      ┌────────────┬───────────────────────────┐
                      │            │             B             │
                      │  A and B   ├─────────┬───────┬─────────┤
                      │            │  true   │ false │ unknown │
                      ├──┬─────────┼─────────┼───────┼─────────┤
                      │  │  true   │  true   │ false │ unknown │
                      │  ├─────────┼─────────┼───────┼─────────┤
                      │A │  false  │  false  │ false │  false  │
                      │  ├─────────┼─────────┼───────┼─────────┤
                      │  │ unknown │ unknown │ false │ unknown │
                      └──┴─────────┴─────────┴───────┴─────────┘
                      ┌────────────┬──────────────────────────┐
                      │            │            B             │
                      │  A or B    ├──────┬─────────┬─────────┤
                      │            │ true │  false  │ unknown │
                      ├──┬─────────┼──────┼─────────┼─────────┤
                      │  │  true   │ true │  true   │  true   │
                      │  ├─────────┼──────┼─────────┼─────────┤
                      │A │  false  │ true │  false  │ unknown │
                      │  ├─────────┼──────┼─────────┼─────────┤
                      │  │ unknown │ true │ unknown │ unknown │
                      └──┴─────────┴──────┴─────────┴─────────┘
                                 ┌────────┬─────────┐
                                 │   A    │  not A  │
                                 ├────────┼─────────┤
                                 │ true   │  false  │
                                 ├────────┼─────────┤
                                 │ false  │  true   │
                                 ├────────┼─────────┤
                                 │unknown │ unknown │
                                 └────────┴─────────┘


---------------------------------------------------------

::

          The ruleset clause is used to define a set of rules and actions
          that are evaluated in order until some action is executed, at
          which point the remaining rules and actions are skipped until the
          ruleset is again scheduled for evaluation.  The keyword else is
          used to separate rules.  After one or more regular rules (with a
          predicate and an action), a ruleset may include an optional
               unknown -> action
          clause, optionally followed by a
               otherwise -> action
          clause.

          If all of the predicates in the rules evaluate to unknown and an
          unknown clause has been specified then action associated with the
          unknown clause will be executed.

          If no rule predicate is true and the unknown action is either not
          specified or not executed and an otherwise clause has been
          specified, then the action associated with the otherwise clause
          will be executed.


-------------------------------------------------------------------

::

          Scale factors may be appended to arithmetic expressions and force
          linear scaling of the value to canonical units.  Simple scale
          factors are constructed from the keywords: nanosecond, nanosec,
          nsec, microsecond, microsec, usec, millisecond, millisec, msec,
          second, sec, minute, min, hour, byte, Kbyte, Mbyte, Gbyte, Tbyte,
          count, Kcount and Mcount, and the operator /, for example
          ``Kbytes / hour''.


-----------------------------------------------------

::

          Macros are defined using expressions of the form:

               name = constexpr;

          Where name follows the normal rules for variables in programming
          languages, ie. alphabetic optionally followed by alphanumerics.
          constexpr must be a constant expression, either a string
          (enclosed in double quotes) or an arithmetic expression
          optionally followed by a scale factor.

          Macros are expanded when their name, prefixed by a dollar ($)
          appears in an expression, and macros may be nested within a
          constexpr string.

          The following reserved macro names are understood.

          minute Current minute of the hour.

          hour   Current hour of the day, in the range 0 to 23.

          day    Current day of the month, in the range 1 to 31.

          month  Current month of the year, in the range 0 (January) to 11
                 (December).

          year   Current year.

          day_of_week
                 Current day of the week, in the range 0 (Sunday) to 6
                 (Saturday).

          delta  Sample interval in effect for this expression.

          Dates and times are presented in the reporting time zone (see
          description of -Z and -z command line options above).


---------------------------------------------------------------------------

::

          It is often useful for pmie processes to be started and stopped
          when the local host is booted or shutdown, or when they have been
          detected as no longer running (when they have unexpectedly exited
          for some reason).  Refer to pmie_check(1) for details on
          automating this process.

          Optionally, each system running pmcd(1) may also be configured to
          run a ``primary'' pmie instance.  This pmie instance is launched
          by $PCP_RC_DIR/pmie, and is affected by the files
          $PCP_SYSCONF_DIR/pmie/control, $PCP_SYSCONF_DIR/pmie/control.d
          (use chkconfig(8), systemctl(1) or similar platform-specific
          commands to activate or disable the primary pmie instance) and
          $PCP_VAR_DIR/config/pmie/config.default (the default initial
          configuration file for the primary pmie).

          The primary pmie instance is identified by the -P option.  There
          may be at most one ``primary'' pmie instance on each system.  The
          primary pmie instance (if any) must be running on the same host
          as the pmcd(1) to which it connects (if any), so the -h and -P
          options are mutually exclusive.


-------------------------------------------------------------------------

::

          It is common for production systems to be monitored in a central
          location.  Traditionally on UNIX systems this has been performed
          by the system log facilities - see logger(1), and syslogd(1).  On
          Windows, communication with the system event log is handled by
          pcp-eventlog(1).

          pmie fits into this model when rules use the syslog action.  Note
          that if the action string begins with -p (priority) and/or -t
          (tag) then these are extracted from the string and treated in the
          same way as in logger(1) and pcp-eventlog(1).

          However, it is common to have other event monitoring frameworks
          also, into which you may wish to incorporate performance events
          from pmie.  You can often use the shell action to send events to
          these frameworks, as they usually provide their a program for
          injecting events into the framework from external sources.

          A final option is use of the stomp (Streaming Text Oriented
          Messaging Protocol) action, which allows pmie to connect to a
          central JMS (Java Messaging System) server and send events to the
          PMIE topic.  Tools can be written to extract these text messages
          and present them to operations people (via desktop popup windows,
          etc).  Use of the stomp action requires a stomp configuration
          file to be setup, which specifies the location of the JMS server
          host, port number, and username/password.

          The format of this file is as follows:

               host=messages.sgi.com   # this is the JMS server (required)
               port=61616              # and its listening here (required)
               timeout=2               # seconds to wait for server (optional)
               username=joe            # (required)
               password=j03ST0MP       # (required)
               topic=PMIE              # JMS topic for pmie messages (optional)

          The timeout value specifies the time (in seconds) that pmie
          should wait for acknowledgements from the JMS server after
          sending a message (as required by the STOMP protocol).  Note that
          on startup, pmie will wait indefinitely for a connection, and
          will not begin rule evaluation until that initial connection has
          been established.  Should the connection to the JMS server be
          lost at any time while pmie is running, pmie will attempt to
          reconnect on each subsequent truthful evaluation of a rule with a
          stomp action, but not more than once per minute.  This is to
          avoid contributing to network congestion.  In this situation,
          where the STOMP connection to the JMS server has been severed,
          the stomp action will return a non-zero error value.


-------------------------------------------------

::

          The lexical scanner and parser will attempt to recover after an
          error in the input expressions.  Parsing resumes after skipping
          input up to the next semi-colon (;), however during this skipping
          process the scanner is ignorant of comments and strings, so an
          embedded semi-colon may cause parsing to resume at an unexpected
          place.  This behavior is largely benign, as until the initial
          syntax error is corrected, pmie will not attempt any expression
          evaluation.


---------------------------------------------------

::

          $PCP_DEMOS_DIR/pmie/*
               annotated example rules

          $PCP_VAR_DIR/pmns/*
               default PMNS specification files

          $PCP_TMP_DIR/pmie
               pmie maintains files in this directory to identify the
               running pmie instances and to export runtime information
               about each instance - this data forms the basis of the
               pmcd.pmie performance metrics

          $PCP_PMIECONTROL_PATH
               the default set of pmie instances to start at boot time -
               refer to pmie_check(1) for details


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          When executing shell actions, pmie overrides two variables - IFS
          and PATH - in the environment of the child process.  IFS is set
          to "\t\n".  The PATH is set to a combination of a default path
          for all platforms ("/usr/sbin:/sbin:/usr/bin:/bin") and several
          configurable components.  These are (in this order):
          $PCP_BIN_DIR, $PCP_BINADM_DIR and $PCP_PLATFORM_PATHS.

          When executing popup alarm actions, pmie will use the value of
          $PCP_XCONFIRM_PROG as the visual notification program to run.
          This is typically set to pmconfirm(1), a cross-platform dialog
          box.


-------------------------------------------------------------------

::

          logger(1).


-------------------------------------------------------------------------

::

          pcp-eventlog(1).


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1), pmconfirm(1), pmdumplog(1), pmieconf(1),
          pmie_check(1), pminfo(1), pmlogger(1), pmval(1), systemd(1),
          PMAPI(3), pcp.conf(5), pcp.env(5) and PMNS(5).


-------------------------------------------------------------

::

          For a more complete description of the pmie language, refer to
          the Performance Co-Pilot Users and Administrators Guide.  This is
          available online from:
              https://pcp.readthedocs.io/en/latest/UAG/PerformanceMetricsInferenceEngine.html 

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

   Performance Co-Pilot               PCP                           PMIE(1)

--------------

Pages that refer to this page:
`autofsd-probe(1) <../man1/autofsd-probe.1.html>`__, 
`ganglia2pcp(1) <../man1/ganglia2pcp.1.html>`__, 
`iostat2pcp(1) <../man1/iostat2pcp.1.html>`__, 
`mrtg2pcp(1) <../man1/mrtg2pcp.1.html>`__, 
`pcp(1) <../man1/pcp.1.html>`__, 
`pcpcompat(1) <../man1/pcpcompat.1.html>`__, 
`pcpintro(1) <../man1/pcpintro.1.html>`__, 
`pmdamysql(1) <../man1/pmdamysql.1.html>`__, 
`pmdasummary(1) <../man1/pmdasummary.1.html>`__, 
`pmfind(1) <../man1/pmfind.1.html>`__, 
`pmfind_check(1) <../man1/pmfind_check.1.html>`__, 
`pmie2col(1) <../man1/pmie2col.1.html>`__, 
`pmie_check(1) <../man1/pmie_check.1.html>`__, 
`pmieconf(1) <../man1/pmieconf.1.html>`__, 
`pmie_dump_stats(1) <../man1/pmie_dump_stats.1.html>`__, 
`pmiestatus(1) <../man1/pmiestatus.1.html>`__, 
`pmlogger_check(1) <../man1/pmlogger_check.1.html>`__, 
`pmpost(1) <../man1/pmpost.1.html>`__, 
`sar2pcp(1) <../man1/sar2pcp.1.html>`__, 
`sheet2pcp(1) <../man1/sheet2pcp.1.html>`__, 
`telnet-probe(1) <../man1/telnet-probe.1.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__, 
`pmieconf(5) <../man5/pmieconf.5.html>`__

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
