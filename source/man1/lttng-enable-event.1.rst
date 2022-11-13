.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lttng-enable-event(1) — Linux manual page
=========================================

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
| `COPYRIGHTS <#COPYRIGHTS>`__ \|   |                                   |
| `THANKS <#THANKS>`__ \|           |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LTTNG-ENABLE-EVENT(1)         LTTng Manual         LTTNG-ENABLE-EVENT(1)

NAME
-------------------------------------------------

::

          lttng-enable-event - Create or enable LTTng event rules


---------------------------------------------------------

::

          Create or enable Linux kernel event rules:

          lttng [GENERAL OPTIONS] enable-event --kernel
                [--probe=SOURCE | --function=SOURCE | --syscall]
                [--filter=EXPR] [--session=SESSION]
                [--channel=CHANNEL] EVENT[,EVENT]...

          Create or enable an "all" Linux kernel event rule:

          lttng [GENERAL OPTIONS] enable-event --kernel --all [--syscall]
                [--filter=EXPR] [--session=SESSION] [--channel=CHANNEL]

          Create or enable application event rules:

          lttng [GENERAL OPTIONS] enable-event
                (--userspace | --jul | --log4j | --python)
                [--filter=EXPR] [--exclude=EVENT[,EVENT]...]
                [--loglevel=LOGLEVEL | --loglevel-only=LOGLEVEL]
                [--session=SESSION] [--channel=CHANNEL] (--all | EVENT[,EVENT]...)


---------------------------------------------------------------

::

          The lttng enable-event command can create a new event rule, or
          enable one or more existing and disabled ones.

          An event rule created by lttng enable-event is a set of
          conditions that must be satisfied in order for an actual event to
          be emitted by an LTTng tracer when the execution of an
          application or the Linux kernel reaches an event source
          (tracepoint, system call, dynamic probe). Event sources can be
          listed with the lttng-list(1) command.

          The lttng-disable-event(1) command can be used to disable
          existing event rules.

          Event rules are always assigned to a channel when they are
          created. If the --channel option is omitted, a default channel
          named channel0 is used (and created automatically if it does not
          exist for the specified domain in the selected tracing session).

          If the --session option is omitted, the chosen channel is picked
          from the current tracing session.

          Events can be enabled while tracing is active (use lttng-start(1)
          to make a tracing session active).

      Event source types
          Four types of event sources are available in the Linux kernel
          tracing domain (--kernel option):

          Tracepoint (--tracepoint option; default)
              A Linux kernel tracepoint, that is, a static instrumentation
              point placed in the kernel source code. Standard tracepoints
              are designed and placed in the source code by developers and
              record useful payload fields.

          Dynamic probe (--probe option)
              A Linux kernel kprobe, that is, an instrumentation point
              placed dynamically in the compiled kernel code. Dynamic probe
              events do not record any payload field.

          Function probe (--function option)
              A Linux kernel kretprobe, that is, two instrumentation points
              placed dynamically where a function is entered and where it
              returns in the compiled kernel code. Function probe events do
              not record any payload field.

          System call (--syscall option)
              A Linux kernel system call. Two instrumentation points are
              statically placed where a system call function is entered and
              where it returns in the compiled kernel code. System call
              event sources record useful payload fields.

          The application tracing domains (--userspace, --jul, --log4j, or
          --python options) only support tracepoints. In the cases of the
          JUL, Apache log4j, and Python domains, the event names correspond
          to logger names.

      Understanding event rule conditions
          When creating an event rule with lttng enable-event, conditions
          are specified using options. The logical conjunction (logical
          AND) of all those conditions must be true when an event source is
          reached by an application or by the Linux kernel in order for an
          actual event to be emitted by an LTTng tracer.

          Any condition that is not explicitly specified on creation is
          considered a don’t care.

          For example, consider the following commands:

              $ lttng enable-event --userspace hello:world
              $ lttng enable-event --userspace hello:world --loglevel=TRACE_INFO

          Here, two event rules are created. The first one has a single
          condition: the tracepoint name must match hello:world. The second
          one has two conditions:

          •   The tracepoint name must match hello:world, and

          •   The tracepoint’s defined log level must be at least as severe
              as the TRACE_INFO level.

          In this case, the second event rule is pointless because the
          first one is more general: it does not care about the
          tracepoint’s log level. If an event source matching both event
          rules is reached by the application’s execution, only one event
          is emitted.

          The available conditions for the Linux kernel domain are:

          •   Tracepoint/system call name (EVENT argument with --tracepoint
              or --syscall options) or dynamic probe/function name/address
              (--probe or --function option’s argument) which must match
              event source’s equivalent.

              You can use * characters at any place in the tracepoint or
              system call name as wildcards to match zero or more
              characters. To use a literal * character, use \*.

          •   Filter expression (--filter option) executed against the
              dynamic values of event fields at execution time that must
              evaluate to true. See the Filter expression section below for
              more information.

          The available conditions for the application domains are:

          •   Tracepoint name (EVENT with --tracepoint option) which must
              match event source’s equivalent.

              You can use * characters at any place in the tracepoint name
              as wildcards to match zero or more characters. To use a
              literal * character, use \*. When you create an event rule
              with a tracepoint name containing a wildcard, you can exclude
              specific tracepoint names from the match with the --exclude
              option.

          •   Filter expression (--filter option) executed against the
              dynamic values of event fields at execution time that must
              evaluate to true. See the Filter expression section below for
              more information.

          •   Event’s log level that must be at least as severe as a given
              log level (--loglevel option) or match exactly a given log
              level (--loglevel-only option).

          When using lttng enable-event with a set of conditions that does
          not currently exist for the chosen tracing session, domain, and
          channel, a new event rule is created. Otherwise, the existing
          event rule is enabled if it is currently disabled (see
          lttng-disable-event(1)).

          The --all option can be used alongside the --tracepoint or
          --syscall options. When this option is used, no EVENT argument
          must be specified. This option defines a single event rule
          matching all the possible events of a given tracing domain for
          the chosen channel and tracing session. It is the equivalent of
          an EVENT argument named * (wildcard).

      Filter expression
          A filter expression can be specified with the --filter option
          when creating a new event rule. If the filter expression
          evaluates to true when executed against the dynamic values of an
          event’s fields when tracing, the filtering condition passes.

              Note
              Make sure to single-quote the filter expression when running
              the command from a shell, as filter expressions typically
              include characters having a special meaning for most shells.

          The filter expression syntax is similar to C language conditional
          expressions (expressions that can be evaluated by an if
          statement), albeit with a few differences:

          •   C integer and floating point number constants are supported,
              as well as literal strings between double quotes ("). You can
              use * characters at any place in a literal string as
              wildcards to match zero or more characters. To use a literal
              * character, use \*.

              Examples: 32, -0x17, 0755, 12.34, "a \"literal string\"",
              "src/*/*.h".

          •   The dynamic value of an event field is read by using its name
              as a C identifier.

              The dot and square bracket notations are available, like in
              the C language, to access nested structure and array/sequence
              fields. Only a constant, positive integer number can be used
              within square brackets. If the index is out of bounds, the
              whole filter expression evaluates to false (the event is
              discarded).

              An enumeration field’s value is an integer.

              When the expression’s field does not exist, the whole filter
              expression evaluates to false.

              Examples: my_field, target_cpu, seq[7],
              msg.user[1].data[2][17].

          •   The dynamic value of a statically-known context field is read
              by prefixing its name with $ctx.. Statically-known context
              fields are context fields added to channels without the $app.
              prefix using the lttng-add-context(1) command.

              When the expression’s statically-known context field does not
              exist, the whole filter expression evaluates to false.

              Examples: $ctx.prio, $ctx.preemptible, $ctx.perf:cpu:stalled-
              cycles-frontend.

          •   The dynamic value of an application-specific context field is
              read by prefixing its name with $app.  (follows the format
              used to add such a context field with the
              lttng-add-context(1) command).

              When the expression’s application-specific context field does
              not exist, the whole filter expression evaluates to false.

              Example: $app.server:cur_user.

          The following precedence table shows the operators which are
          supported in a filter expression. In this table, the highest
          precedence is 1. Parentheses are supported to bypass the default
          order.

              Important
              Unlike the C language, the lttng enable-event filter
              expression syntax’s bitwise AND and OR operators (& and |)
              take precedence over relational operators (<, <=, >, >=, ==,
              and !=). This means the filter expression 2 & 2 == 2 is true
              while the equivalent C expression is false.

          ┌───────────┬──────────┬───────────────┬───────────────┐
          │Precedence │ Operator │ Description   │ Associativity │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │1          │ -        │ Unary minus   │ Right-to-left │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │1          │ +        │ Unary plus    │ Right-to-left │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │1          │ !        │ Logical NOT   │ Right-to-left │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │1          │ ~        │ Bitwise NOT   │ Right-to-left │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │2          │ <<       │ Bitwise left  │ Left-to-right │
          │           │          │ shift         │               │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │2          │ >>       │ Bitwise right │ Left-to-right │
          │           │          │ shift         │               │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │3          │ &        │ Bitwise AND   │ Left-to-right │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │4          │ ^        │ Bitwise XOR   │ Left-to-right │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │5          │ |        │ Bitwise OR    │ Left-to-right │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │6          │ <        │ Less than     │ Left-to-right │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │6          │ <=       │ Less than or  │ Left-to-right │
          │           │          │ equal to      │               │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │6          │ >        │ Greater than  │ Left-to-right │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │6          │ >=       │ Greater than  │ Left-to-right │
          │           │          │ or equal to   │               │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │7          │ ==       │ Equal to      │ Left-to-right │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │7          │ !=       │ Not equal to  │ Left-to-right │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │8          │ &&       │ Logical AND   │ Left-to-right │
          ├───────────┼──────────┼───────────────┼───────────────┤
          │           │          │               │               │
          │9          │ ||       │ Logical OR    │ Left-to-right │
          └───────────┴──────────┴───────────────┴───────────────┘

          The arithmetic operators are NOT supported.

          All integer constants and fields are first casted to signed
          64-bit integers. The representation of negative integers is two’s
          complement. This means that, for example, the signed 8-bit
          integer field 0xff (-1) becomes 0xffffffffffffffff (still -1)
          once casted.

          Before a bitwise operator is applied, all its operands are casted
          to unsigned 64-bit integers, and the result is casted back to a
          signed 64-bit integer. For the bitwise NOT operator, it is the
          equivalent of this C expression:

              (int64_t) ~((uint64_t) val)

          For the binary bitwise operators, it is the equivalent of those C
          expressions:

              (int64_t) ((uint64_t) lhs >> (uint64_t) rhs)
              (int64_t) ((uint64_t) lhs << (uint64_t) rhs)
              (int64_t) ((uint64_t) lhs & (uint64_t) rhs)
              (int64_t) ((uint64_t) lhs ^ (uint64_t) rhs)
              (int64_t) ((uint64_t) lhs | (uint64_t) rhs)

          If the right-hand side of a bitwise shift operator (<< and >>) is
          not in the [0, 63] range, the whole filter expression evaluates
          to false.

              Note
              Although it is possible to filter the process ID of an event
              when the pid context has been added to its channel using, for
              example, $ctx.pid == 2832, it is recommended to use the PID
              tracker instead, which is much more efficient (see
              lttng-track(1)).

          Filter expression examples:

              msg_id == 23 && size >= 2048

              $ctx.procname == "lttng*" && (!flag || poel < 34)

              $app.my_provider:my_context == 17.34e9 || some_enum >= 14

              $ctx.cpu_id == 2 && filename != "*.log"

              eax_reg & 0xff7 == 0x240 && x[4] >> 12 <= 0x1234

      Log levels
          Tracepoints and log statements in applications have an attached
          log level. Application event rules can contain a log level
          condition.

          With the --loglevel option, the event source’s log level must be
          at least as severe as the option’s argument. With the --loglevel-
          only option, the event source’s log level must match the option’s
          argument.

          The available log levels are:

          User space domain (--userspace option)
              Shortcuts such as system are allowed.

              •   TRACE_EMERG (0)

              •   TRACE_ALERT (1)

              •   TRACE_CRIT (2)

              •   TRACE_ERR (3)

              •   TRACE_WARNING (4)

              •   TRACE_NOTICE (5)

              •   TRACE_INFO (6)

              •   TRACE_DEBUG_SYSTEM (7)

              •   TRACE_DEBUG_PROGRAM (8)

              •   TRACE_DEBUG_PROCESS (9)

              •   TRACE_DEBUG_MODULE (10)

              •   TRACE_DEBUG_UNIT (11)

              •   TRACE_DEBUG_FUNCTION (12)

              •   TRACE_DEBUG_LINE (13)

              •   TRACE_DEBUG (14)

          java.util.logging domain (--jul option)
              Shortcuts such as severe are allowed.

              •   JUL_OFF (INT32_MAX)

              •   JUL_SEVERE (1000)

              •   JUL_WARNING (900)

              •   JUL_INFO (800)

              •   JUL_CONFIG (700)

              •   JUL_FINE (500)

              •   JUL_FINER (400)

              •   JUL_FINEST (300)

              •   JUL_ALL (INT32_MIN)

          Apache log4j domain (--log4j option)
              Shortcuts such as severe are allowed.

              •   LOG4J_OFF (INT32_MAX)

              •   LOG4J_FATAL (50000)

              •   LOG4J_ERROR (40000)

              •   LOG4J_WARN (30000)

              •   LOG4J_INFO (20000)

              •   LOG4J_DEBUG (10000)

              •   LOG4J_TRACE (5000)

              •   LOG4J_ALL (INT32_MIN)

          Python domain (--python option)
              Shortcuts such as critical are allowed.

              •   PYTHON_CRITICAL (50)

              •   PYTHON_ERROR (40)

              •   PYTHON_WARNING (30)

              •   PYTHON_INFO (20)

              •   PYTHON_DEBUG (10)

              •   PYTHON_NOTSET (0)


-------------------------------------------------------

::

          General options are described in lttng(1).

      Domain
          One of:

          -j, --jul
              Create or enable event rules in the java.util.logging (JUL)
              domain.

          -k, --kernel
              Create or enable event rules in the Linux kernel domain.

          -l, --log4j
              Create or enable event rules in the Apache log4j domain.

          -p, --python
              Create or enable event rules in the Python domain.

          -u, --userspace
              Create or enable event rules in the user space domain.

      Target
          -c CHANNEL, --channel=CHANNEL
              Create or enable event rules in the channel named CHANNEL
              instead of the default channel name channel0.

          -s SESSION, --session=SESSION
              Create or enable event rules in the tracing session named
              SESSION instead of the current tracing session.

      Event source type
          One of:

          --function=SOURCE
              Linux kernel kretprobe. Only available with the --kernel
              domain option.  SOURCE is one of:

              •   Function address (0x prefix supported)

              •   Function symbol

              •   Function symbol and offset (SYMBOL+OFFSET format)

          --probe=SOURCE
              Linux kernel kprobe. Only available with the --kernel domain
              option.  SOURCE is one of:

              •   Address (0x prefix supported)

              •   Symbol

              •   Symbol and offset (SYMBOL+OFFSET format)

          --syscall
              Linux kernel system call. Only available with the --kernel
              domain option.

          --tracepoint
              Linux kernel or application tracepoint (default).

      Log level
          One of:

          --loglevel=LOGLEVEL
              Add log level condition to the event rule: the event source’s
              defined log level must be at least as severe as LOGLEVEL. See
              the Log levels section above for the available log levels.
              Only available with application domains.

          --loglevel-only=LOGLEVEL
              Add log level condition to the event rule: the event source’s
              defined log level must match LOGLEVEL. See the Log levels
              section above for the available log levels. Only available
              with application domains.

      Filtering and exclusion
          -x EVENT[,EVENT]..., --exclude=EVENT[,EVENT]...
              Exclude events named EVENT from the event rule. This option
              can be used when the command’s EVENT argument contains at
              least one wildcard star (*) to exclude specific names.  EVENT
              can also contain wildcard stars. To use a literal ,
              character, use \,. Only available with the --userspace
              domain.

          -f EXPR, --filter=EXPR
              Add filter expression condition to the event rule. Expression
              EXPR must evaluate to true when executed against the dynamic
              values of event fields. See the Filter expression section
              above for more information.

      Shortcuts
          -a, --all
              Equivalent to an EVENT argument named * (wildcard) when also
              using the --tracepoint (default) or --syscall option.

      Program information
          -h, --help
              Show command help.

              This option, like lttng-help(1), attempts to launch
              /usr/bin/man to view the command’s man page. The path to the
              man pager can be overridden by the LTTNG_MAN_BIN_PATH
              environment variable.

          --list-options
              List available command options.


-----------------------------------------------------------------------------------

::

          LTTNG_ABORT_ON_ERROR
              Set to 1 to abort the process after the first error is
              encountered.

          LTTNG_HOME
              Overrides the $HOME environment variable. Useful when the
              user running the commands has a non-writable home directory.

          LTTNG_MAN_BIN_PATH
              Absolute path to the man pager to use for viewing help
              information about LTTng commands (using lttng-help(1) or
              lttng COMMAND --help).

          LTTNG_SESSION_CONFIG_XSD_PATH
              Path in which the session.xsd session configuration XML
              schema may be found.

          LTTNG_SESSIOND_PATH
              Full session daemon binary path.

              The --sessiond-path option has precedence over this
              environment variable.

          Note that the lttng-create(1) command can spawn an LTTng session
          daemon automatically if none is running. See lttng-sessiond(8)
          for the environment variables influencing the execution of the
          session daemon.


---------------------------------------------------

::

          $LTTNG_HOME/.lttngrc
              User LTTng runtime configuration.

              This is where the per-user current tracing session is stored
              between executions of lttng(1). The current tracing session
              can be set with lttng-set-session(1). See lttng-create(1) for
              more information about tracing sessions.

          $LTTNG_HOME/lttng-traces
              Default output directory of LTTng traces. This can be
              overridden with the --output option of the lttng-create(1)
              command.

          $LTTNG_HOME/.lttng
              User LTTng runtime and configuration directory.

          $LTTNG_HOME/.lttng/sessions
              Default location of saved user tracing sessions (see
              lttng-save(1) and lttng-load(1)).

          /usr/local/etc/lttng/sessions
              System-wide location of saved tracing sessions (see
              lttng-save(1) and lttng-load(1)).

              Note
              $LTTNG_HOME defaults to $HOME when not explicitly set.


---------------------------------------------------------------

::

          0
              Success

          1
              Command error

          2
              Undefined command

          3
              Fatal error

          4
              Command warning (something went wrong during the command)


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

          lttng-disable-event(1), lttng(1)

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

   LTTng 2.12.0-pre               10/29/2018          LTTNG-ENABLE-EVENT(1)

--------------

Pages that refer to this page: `lttng(1) <../man1/lttng.1.html>`__, 
`lttng-disable-event(1) <../man1/lttng-disable-event.1.html>`__, 
`lttng-enable-channel(1) <../man1/lttng-enable-channel.1.html>`__, 
`lttng-track(1) <../man1/lttng-track.1.html>`__, 
`lttng-ust(3) <../man3/lttng-ust.3.html>`__, 
`tracef(3) <../man3/tracef.3.html>`__, 
`tracelog(3) <../man3/tracelog.3.html>`__, 
`babeltrace2-filter.lttng-utils.debug-info(7) <../man7/babeltrace2-filter.lttng-utils.debug-info.7.html>`__

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
