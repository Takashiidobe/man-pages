.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmregisterderived(3) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SEMANTIC CHECKS AND RULE         |                                   |
| S <#SEMANTIC_CHECKS_AND_RULES>`__ |                                   |
| \|                                |                                   |
| `EXPRESSION EVALU                 |                                   |
| ATION <#EXPRESSION_EVALUATION>`__ |                                   |
| \| `CAVEATS <#CAVEATS>`__ \|      |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMREGISTERDERIVED(3)    Library Functions Manual    PMREGISTERDERIVED(3)

NAME
-------------------------------------------------

::

          pmRegisterDerived, pmRegisterDerivedMetric  - register a global
          derived metric name and definition


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          char *pmRegisterDerived(char *name, char *expr);
          int pmRegisterDerivedMetric(char *name, char *expr, char
          **errmsg);

          cc ... -lpcp


---------------------------------------------------------------

::

          Derived metrics provide a way of extending the Performance
          Metrics Name Space (PMNS) with new metrics defined at the PCP
          client-side using expressions over the existing performance
          metrics.

          Typical uses would be to aggregate a number of similar metrics to
          provide a higher-level summary metric or to support the ``delta V
          over delta V'' class of metrics that are not possible in the base
          data semantics of PCP.  An example of the latter class would be
          the average I/O size, defined as
                 delta(disk.dev.total_bytes) / delta(disk.dev.total)
          where both of the disk.dev metrics are counters, and what is
          required is to sample both metrics, compute the difference
          between the current and previous values and then calculate the
          ratio of these differences.

          The arguments to pmRegisterDerived are the name of the new
          derived metric and expr is an expression defining how the values
          of name should be computed.

          pmRegisterDerivedMetric is the exact functional equivalent to
          pmRegisterDerived except that it provides a simplified model of
          error handling, where a formatted message is returned via the
          errmsg parameter.

          Syntactic checking is performed at the time pmRegisterDerived is
          called, but semantic checking is deferred until each new PMAPI
          context is created with pmNewContext(3) or re-established with
          pmReconnectContext(3), at which time the PMNS and metadata is
          available to allow semantic checking and the metadata of the
          derived metrics to be determined.

          If pmRegisterDerived is called after one or more PMAPI contexts
          has been opened, then the newly registered metrics will be
          avaiable in those contexts, however the more normal use would be
          to make all calls to pmRegisterDerived (possibly via
          pmLoadDerivedConfig(3)) or pmRegisterDerivedMetric before calling
          pmNewContext(3).

          All of the defined global derived metrics are available in all
          PMAPI contexts.

          It is also possible to define per-context derived metrics once a
          PMAPI context has been establised.  These derived metrics are
          private to the context in which they are defined using the allied
          routines pmAddDerived(3) and pmAddDerivedMetric(3).

          name should follow the syntactic rules for the names of
          performance metrics, namely one or more components separated with
          a dot (``.''), and each component must begin with an alphabetic
          followed by zero or more characters drawn from the alphabetics,
          numerics and underscore (``_'').  For more details, refer to
          PCPIntro(1) and PMNS(5).

          name must be unique across all derived metrics and should not
          match the name of any regular metric in the PMNS.  It is
          acceptable for name to share some part of its prefix with an
          existing subtree of the PMNS, e.g. the average I/O size metric
          above could be named disk.dev.avgsz which would place it amongst
          the other disk.dev metrics in the PMNS.  Alternatively, derived
          metrics could populate their own subtree of the PMNS, e.g. the
          average I/O size metric above could be named
          my.summary.disk.avgsz.

          The expression expr follows these syntactic rules:

          * Terminal elements are either names of existing metrics or
            numeric constants.  Recursive definitions are not allowed, so
            only the names of regular metrics (not other derived metrics)
            may be used. Numeric constants are either integers constrained
            to the precision of 32-bit unsigned integers or double
            precision floating point numbers.

          * The usual binary arithmetic operators are supported, namely
            addition (``+''), subtraction (``-''), multiplication (``*'')
            and division (``/'') with the normal precedence rules where
            multiplication and division have higher precedence than
            addition and subtraction, so a+b*c is evaluated as a+(b*c).

          * Unary negation may be used, e.g.  -3*some.metric.

          * C-style relational operators are supported, namely ``<'',
            ``<='', ``=='', ``>='', ``>'' and ``!=''.  Relational
            expresssions return a value as a 32-bit unsigned number being 0
            for false and 1 for true.  The expected operator precedence
            rules apply, so arithmetic operators have higher precedence
            than relational operators, and a-b>c+d is evaluated as (a-
            b)>(c+d).  All the relational operators have equal precedence,
            so the (slightly odd) expression involving consecutive
            relational operators a>b!=c is evaluated as (a>b)!=c.

          * C-style boolean operators are supported, namely and (``&&'')
            and or (``||'').  Boolean expresssions return a value as a
            32-bit unsigned number being 0 for false and 1 for true.  The
            expected operator precedence rules apply, so relational
            operators have higher precedence than boolean operators, and
            a>b*c&&d<=e+f is evaluated as (a>(b*c))&&(d<=(e+f)).  Both the
            boolean operators have equal precedence, so the expression
            involving consecutive boolean operators a>=b||b>c&&d!=e||f>g is
            evaluated as (((a>=b)||(b>c))&&(d!=e))||(f>g).

          * Additionally, the ``!'' operator may be used to negate a
            boolean or relational expression, returning a value as a 32-bit
            unsigned number being 0 for false and 1 for true.  The expected
            operator precedence rules apply, so boolean (and relational)
            operators have higher precedence than boolean negation, and
            !a>b||c<d is evaluated as !((a>b)||(c<d)), while !a<b+c is
            evaluated as !(a<(b+c)).

          * C-style ternary conditional expressions are supported. In
            general terms the expression check ? foo : bar is evaluated as
            foo (the ``true'' operand) if check (the ``guard'') is true,
            else the expression evaluates to bar (the ``false'' operand).
            Some special semantic rules apply to the ``guard'' expression
            and the other two operand expressions:
            (a) Each expression may involve a singular value or a set of
                values (when the expression involves one or more metrics
                with an instance domain).
            (b) All expressions with a set of values must be defined over
                the same instance domain.
            (c) Both operand expressions must have the same metadata, so
                the same metric type, semantics and units (dimension and
                scale).
            (d) The ``guard'' expression must have an aritmetic or
                relational or boolean value, so that it can be evaluated as
                0 for false, else true.
            (e) If the ``guard'' expression has a singular value and one or
                more of the other operand expressions involves an instance
                domain, the ``guard'' applies to all instances.
            (f) If the ``guard'' expression has a set of values and one or
                more of the other operand expressions involves an instance
                domain, the ``guard'' is evaluated once for each instance
                (there must be one instance domain as per rule (b) above).
            (g) If one of the operand expressions has a singular value and
                the other has a set of values, and the singular value is
                selected based on the evaluation of the ``guard'', then the
                result is a set of values (all the same) with instance
                enumeration being taken from the other operand expression.
                For example in the expression: foo ? scalar : set, if foo
                is true, then the result is a set of values (all having the
                same value, scalar) over the instance domain of set.

          * Selection of a single instance can be specified by the
            construct ``[instance_name]'' which may be appended to a metric
            name or a parenthesized expression.  For example:
            fw.bytes = network.interface.in.bytes[eth1] + \
                       network.interface.out.bytes[eth1]
            or (equivalently):
            fw.bytes = (network.interface.in.bytes + \
                        network.interface.out.bytes)[eth1]

            All characters between the ``['' and ``]'' are considered to be
            part of the (external) instance name, so be careful to avoid
            any spurious white space.  A backslash may be used as an escape
            prefix in the (unlikely) event that the external instance name
            contains a ``]''.

          * Numeric constants can also be specified using the mkconst()
            constructor which takes a number of arguments: the first is a
            numeric constant (either integer or floating point), then
            follow one or more parameters of the form tag=value or tag=
            where the allowed values of tag and value are as follows:

              ┌──────────┬───────────────────────────────────────────────┐
              │   tag    │                     value                     │
              ├──────────┼───────────────────────────────────────────────┤
              │type      │ one of the numeric metric types from          │
              │          │ <pcp/pmapi.h>, stripped of the PM_TYPE_       │
              │          │ prefix, so 32, U32, 64, U64, FLOAT or DOUBLE. │
              ├──────────┼───────────────────────────────────────────────┤
              │semantics │ one of the semantic types from <pcp/pmapi.h>, │
              │          │ stripped of the PM_SEM_ prefix, so COUNTER,   │
              │          │ INSTANT or DISCRETE.                          │
              ├──────────┼───────────────────────────────────────────────┤
              │units     │ a specification of dimension and scale        │
              │          │ (together forming the units), in the syntax   │
              │          │ accepted by pmParseUnitsStr(3).               │
              └──────────┴───────────────────────────────────────────────┘
            The value may optionally be enclosed in double quotes, and may
            appear in any mix of upper and/or lower case.  The tag must be
            in lower case as shown in the table above.

            This is most useful when the expression semantics require
            matching type and/or semantics and/or units for operands, e.g.
            idle = mem.util.free > mkconst(10485760, units=Kbyte)
            avg_io_size = delta(disk.dev.total) == 0 ? \
                -mkconst(1.0, semantics=instant, units="kbyte / count") : \
                delta(disk.dev.total_bytes) / delta(disk.dev.total)

          * Expressions may be rescaled using the rescale function that
            takes two arguments.  The first is an arithmetic expression to
            be rescaled, and the second is the desired units after
            rescaling that is a string value in the syntax accepted by
            pmParseUnitsStr(3).  For example:
            rescale(network.interface.total.bytes, "Mbytes/hour")

            The expression and the desired units must both have the same
            dimension, e.g Space=1, Time=-1 and Count=0 in the example
            above.

          * The following unary functions operate on a single performance
            metric and return one or more values.  For all functions
            (except count(), defined() and instant()), the type of the
            operand metric must be arithmetic (integer of various sizes and
            signedness, float or double).

             ┌───────────┬───────────────────────────────────────────────┐
             │ Function  │                     Value                     │
             ├───────────┼───────────────────────────────────────────────┤
             │avg(x)     │ A singular instance being the average value   │
             │           │ across all instances for the metric x.        │
             ├───────────┼───────────────────────────────────────────────┤
             │count(x)   │ A singular instance being the count of the    │
             │           │ number of instances for the metric x.  As a   │
             │           │ special case, if fetching the metric x        │
             │           │ returns an error, then count(x) will be 0.    │
             ├───────────┼───────────────────────────────────────────────┤
             │defined(x) │ A boolean value that is true (``1'') if the   │
             │           │ metric x is defined in the PMNS, else false   │
             │           │ (``0'').  The function is evaluated when a    │
             │           │ new PMAPI context is created with             │
             │           │ pmNewContext(3) or re-established with        │
             │           │ pmReconnectContext(3).  So any subsequent     │
             │           │ changes to the PMNS after the PMAPI context   │
             │           │ has been established will not change the      │
             │           │ value of this function in the expression      │
             │           │ evaluation.                                   │
             ├───────────┼───────────────────────────────────────────────┤
             │delta(x)   │ Returns the difference in values for the      │
             │           │ metric x between one call to pmFetch(3) and   │
             │           │ the next. There is one value in the result    │
             │           │ for each instance that appears in both the    │
             │           │ current and the previous sample.  If the      │
             │           │ metric x is unsigned, then the type of the    │
             │           │ result is converted to ensure as much         │
             │           │ precision as possible can be retained, so if  │
             │           │ the metric x has type PM_TYPE_U32 then the    │
             │           │ result is of type PM_TYPE_64, else if the     │
             │           │ metric x has type PM_TYPE_U64 then the result │
             │           │ is of type PM_TYPE_DOUBLE.  Otherwise the     │
             │           │ type of the result is the same as the type of │
             │           │ the metric x.                                 │
             ├───────────┼───────────────────────────────────────────────┤
             │rate(x)    │ Returns the difference in values for the      │
             │           │ metric x between one call to pmFetch(3) and   │
             │           │ the next divided by the elapsed time between  │
             │           │ the calls to pmFetch(3).  The semantics of    │
             │           │ the derived metric are based on the semantics │
             │           │ of the metric x with the dimension in the     │
             │           │ time domain decreased by one and scaling if   │
             │           │ required in the time utilization case where   │
             │           │ the operand is in units of time, and the      │
             │           │ derived metric is unitless.  This mimics the  │
             │           │ rate conversion applied to counter metrics by │
             │           │ tools such as pmval(1), pmie(1) and           │
             │           │ pmchart(1).  There is one value in the result │
             │           │ for each instance that appears in both the    │
             │           │ current and the previous sample.              │
             ├───────────┼───────────────────────────────────────────────┤
             │instant(x) │ Returns the current value of the metric x,    │
             │           │ even it has the semantics of a counter, i.e.  │
             │           │ PM_SEM_COUNTER.  The semantics of the derived │
             │           │ metric are based on the semantics of the      │
             │           │ metric x; if x has semantics PM_SEM_COUNTER,  │
             │           │ the semantics of instant(x) is                │
             │           │ PM_SEM_INSTANT, otherwise the semantics of    │
             │           │ the derived metric is the same as the         │
             │           │ semantics of the metric x.                    │
             ├───────────┼───────────────────────────────────────────────┤
             │max(x)     │ A singular instance being the maximum value   │
             │           │ across all instances for the metric x.        │
             ├───────────┼───────────────────────────────────────────────┤
             │min(x)     │ A singular instance being the minimum value   │
             │           │ across all instances for the metric x.        │
             ├───────────┼───────────────────────────────────────────────┤
             │sum(x)     │ A singular instance being the sum of the      │
             │           │ values across all instances for the metric x. │
             └───────────┴───────────────────────────────────────────────┘
          * The matchinst function may be used to select a subset of the
            instances from an instance domain for a metric or expression.
            The function takes two arguments:
            (a) A instance filter that consists of an optional negation
                operator ``!'' followed by a regular expression delimited
                by ``/'' characters.  The regular expression follows the
                POSIX Extended Regular Expression syntax as described in
                regex(3).  Backslashes may be used as escape prefixes, but
                double backslash is required to escape any regular
                expression special characters, e.g. for the (extremely
                unlikely) case of wanting to match instance names like
                ``some*text/other[text]'' a regular expression of the form
                /some\\*text\/other\\[text]/ would be required.  If
                present, the negation operator reverses the sense of the
                filtering, so all instances not matching the regular
                expression will be selected.
            (b) A metric or expression that must be defined over an
                instance domain.

            For example, the following expression will have values for the
            metric network.interface.in.bytes for all network interfaces
            except the loopback and virtual bridge devices:
            matchinst(!/^(lo)|(vbir)/, network.interface.in.bytes)

          * The scalar function may be used convert a metric or expression
            defined over an instance domain into a scalar value that can be
            used in other expressions.  For example:
            net.in.bytes = scalar(network.interface.in.bytes[eth0]) + \
                       scalar(network.interface.in.bytes[eth1])

            The instance domain is removed from the metadata for the result
            and the instance identifier is removed from the value during
            fetching.

            If the metric or expression involves more than one instance
            then the result is formed by picking the first instance - this
            is arbitrary and implies the scalar function should only be
            used for metrics or expressions that are expected to contain
            zero or one instances, e.g.  the construct ``[instance_name]''
            or the matchinst function with a pattern that matches at most
            one instance.

          * Parenthesis may be used for explicit grouping.

          * Lines beginning with ``#'' are treated as comments and ignored.

          * White space is ignored.


-------------------------------------------------------------------------------------------

::

          There are a number of conversions required to determine the
          metadata for a derived metric and to ensure the semantics of the
          expressions are sound.

          In an arithmetic expression or a relational expression, if the
          semantics of both operands is not a counter (i.e. PM_SEM_INSTANT
          or PM_SEM_DISCRETE) then the result will have semantics
          PM_SEM_INSTANT unless both operands are PM_SEM_DISCRETE in which
          case the result is also PM_SEM_DISCRETE.

          For an arithmetic expression, the dimension of each operand must
          be the same.  For a relational expression, the dimension of each
          operand must be the same, except that numeric constants (with no
          dimension) are allowed, e.g. in the expression
          network.interface.in.drops > 0 .

          To prevent arbitrary and non-sensical combinations some
          restrictions apply to expressions that combine metrics with
          counter semantics to produce a result with counter semantics.
          For an arithmetic expression, if both operands have the semantics
          of a counter, then only addition or subtraction is allowed, or if
          the left operand is a counter and the right operand is not, then
          only multiplication or division are allowed, or if the left
          operand is not a counter and the right operand is a counter, then
          only multiplication is allowed.

          Because relational expressions use the current value only and
          produce a result that is not a counter, either or both operands
          of a relational expression may be counters.

          The mapping of the pmUnits of the metadata uses the following
          rules:

          * If both operands have a dimension of Count and the scales are
            not the same, use the larger scale and convert the values of
            the operand with the smaller scale.

          * If both operands have a dimension of Time and the scales are
            not the same, use the larger scale and convert the values of
            the operand with the smaller scale.

          * If both operands have a dimension of Space and the scales are
            not the same, use the larger scale and convert the values of
            the operand with the smaller scale.

          * For addition and subtraction all dimensions for each of the
            operands and result are identical.

          * For multiplication, the dimensions of the result are the sum of
            the dimensions of the operands.

          * For division, the dimensions of the result are the difference
            of the dimensions of the operands.

          Scale conversion involves division if the dimension is positive
          else multiplication if the dimension is negative. If scale
          conversion is applied to either of the operands, the result is
          promoted to type PM_TYPE_DOUBLE.

          Putting all of this together in an example, consider the derived
          metric defined as follows:
          x = network.interface.speed - delta(network.interface.in.bytes) /
          delta(sample.milliseconds)
          The type, dimension and scale settings would propagate up the
          expression tree as follows.

          ┌────────────────────────┬────────┬───────────────┬──────────────┐
          │      Expression        │  Type  │  Dimension &  │  Scale       │
          │                        │        │  Scale        │  Factor(s)   │
          ├────────────────────────┼────────┼───────────────┼──────────────┤
          │sample.milliseconds     │ DOUBLE │ millisec      │              │
          │delta(...)              │ DOUBLE │ millisec      │              │
          │network...bytes         │ U64    │ byte          │              │
          │delta(...)              │ U64    │ byte          │              │
          │delta(...) / delta(...) │ DOUBLE │ byte/millisec │ /1048576 and │
          │                        │        │               │ *1000        │
          │network...speed         │ FLOAT  │ Mbyte/sec     │              │
          │x                       │ DOUBLE │ Mbyte/sec     │              │
          └────────────────────────┴────────┴───────────────┴──────────────┘
          Expressions involving single instance selection or the matchinst
          function must be associated with underlying metrics that have an
          instance domain.  These constructors make no sense for singular
          metrics.

          Because semantic checking cannot be done at the time
          pmRegisterDerived is called, errors found during semantic
          checking (when any subsequent calls to pmNewContext(3) or
          pmReconnectContext(3) succeed) are reported using pmprintf(3).
          These include:

          Error: derived metric <name1>: operand: <name2>: <reason>
                 There was a problem calling pmLookupName(3) to identify
                 the operand metric <name2> used in the definition of the
                 derived metric <name1>.

          Error: derived metric <name1>: operand (<name2> [<pmid2>]):
          <reason>
                 There was a problem calling pmLookupDesc(3) to identify
                 the operand metric <name2> with PMID <pmid2> used in the
                 definition of the derived metric <name1>.

          Semantic error: derived metric <name>: <operand> : <operand>
          Different <metadata> for ternary operands
                 For a ternary expression, the ``true'' operand and the
                 ``false'' operand must have exactly the same metadata, so
                 type, semantics, instance domain, and units (dimension and
                 scale).

          Semantic error: derived metric <name>: <operand> <op> <operand>:
          Dimensions are not the same
                 Operands must have the same units (dimension and scale)
                 for each of addition, subtraction, the relational
                 operators and the boolean ``and'' or ``or'' operators.

          Semantic error: derived metric <name>: <operand> <op> <operand>:
          Illegal operator for counter and non-counter
                 Only multiplication or division are allowed if the left
                 operand has the semantics of a counter and the right
                 operand is not a counter.

          Semantic error: derived metric <name>: <operand> <op> <operand>:
          Illegal operator for counters
                 If both operands have the semantics of counter, only
                 addition or subtraction make sense, so multiplication and
                 division are not allowed.

          Semantic error: derived metric <name>: <operand> <op> <operand>:
          Illegal operator for non-counter and counter
                 Only multiplication is allowed if the right operand has
                 the semantics of a counter and the left operand is not a
                 counter.

          Semantic error: derived metric <metric> <expr> RESCALE <units>:
          Incompatible dimensions
                 The parameters <expr> and <units> to the rescale function
                 must have the same dimension along the axes of Time, Space
                 and Count.

          Semantic error: derived metric <name>: Incorrect time dimension
          for operand
                 Rate conversion using the rate() function is only possible
                 for operand metrics with a Time dimension of 0 or 1 (see
                 pmLookupDesc(3)).  If the operand metric's Time dimension
                 is 0, then the derived metrics has a value "per second"
                 (Time dimension of -1).  If the operand metric's Time
                 dimension is 1, then the derived metrics has a value of
                 time utilization (Time dimension of 0).

          Semantic error: derived metric <name>: <function>(<operand>):
          Non-arithmetic operand for function
                 The unary functions are only defined if the operand has
                 arithmetic type.  Similarly the first argument to the
                 rescale function must be of arithmetic type.

          Semantic error: derived metric <name>: <expr> ? ...: Non-
          arithmetic operand for ternary guard
                 The first expression for a ternary operator must have an
                 arithmetic type.

          Semantic error: derived metric <name>: ... - ...: Non-arithmetic
          operand for unary negation
                 Unary negation only makes sense if the following
                 expression has an arithmetic type.

          Semantic error: derived metric <name>: <operand> <op> <operand>:
          Non-arithmetic type for <left-or-right> operand
                 The binary arithmetic operators are only allowed with
                 operands with an arithmetic type (integer of various sizes
                 and signedness, float or double).

          Semantic error: derived metric <name>: <operand> <op> <operand>:
          Non-counter and not dimensionless <left-or-right> operand
                 For multiplication or division or any of the relational
                 operators, if one of the operands has the semantics of a
                 counter and the other has the semantics of a non-counter
                 (instantaneous or discrete) then the non-counter operand
                 must have no units (dimension and scale).

          Semantic error: derived metric <name>: <expr> ? <expr> : <expr>:
          Non-scalar ternary guard with scalar expressions
                 If the ``true'' and ``false'' operands of a ternary
                 expression have a scalar value, then the ``guard''
                 expression must also have a scalar value.

          Semantic error: derived metric <name>: <expr> <op> <expr>:
          Operands should have the same instance domain
                 For all of the binary operators (arithmetic and
                 relational), if both operands have non-scalar values, then
                 they must be defined over the same instance domain.


-----------------------------------------------------------------------------------

::

          For the binary arithmetic operators, if either operand must be
          scaled (e.g. convert bytes to Kbytes) then the result is promoted
          to PM_TYPE_DOUBLE.  Otherwise the type of the result is
          determined by the types of the operands, as per the following
          table which is evaluated from top to bottom until a match is
          found.

               ┌─────────────────────────┬──────────┬────────────────┐
               │     Operand Types       │ Operator │  Result Type   │
               ├─────────────────────────┼──────────┼────────────────┤
               │either is PM_TYPE_DOUBLE │ any      │ PM_TYPE_DOUBLE │
               ├─────────────────────────┼──────────┼────────────────┤
               │any                      │ division │ PM_TYPE_DOUBLE │
               ├─────────────────────────┼──────────┼────────────────┤
               │either is PM_TYPE_FLOAT  │ any      │ PM_TYPE_FLOAT  │
               ├─────────────────────────┼──────────┼────────────────┤
               │either is PM_TYPE_U64    │ any      │ PM_TYPE_U64    │
               ├─────────────────────────┼──────────┼────────────────┤
               │either is PM_TYPE_64     │ any      │ PM_TYPE_64     │
               ├─────────────────────────┼──────────┼────────────────┤
               │either is PM_TYPE_U32    │ any      │ PM_TYPE_U32    │
               ├─────────────────────────┼──────────┼────────────────┤
               │otherwise (both are      │ any      │ PM_TYPE_32     │
               │PM_TYPE_32)              │          │                │
               └─────────────────────────┴──────────┴────────────────┘


-------------------------------------------------------

::

          Derived metrics are not available when using pmFetchArchive(3) as
          this routine does not use a target list of PMIDs that could be
          remapped (as is done for pmFetch(3)).

          There is no pmUnregisterDerived method, so once registered a
          derived metric persists for the life of the application.


---------------------------------------------------------------

::

          On success, pmRegisterDerived returns NULL.

          If a syntactic error is found at the time of registration, the
          value returned by pmRegisterDerived is a pointer into expr
          indicating where the error was found.  To identify what the error
          was, the application should call pmDerivedErrStr(3) to retrieve
          the corresponding parser error message.

          pmRegisterDerivedMetric returns 0 and errmsg is undefined if the
          parsing is successful.

          If the given expr does not conform to the required syntax
          pmRegisterDerivedMetric returns -1 and a dynamically allocated
          error message string in errmsg.  The error message is terminated
          with a newline and includes both the input name and expr, along
          with an indicator of the position at which the error was
          detected.  e.g.
                    Error: pmRegisterDerivedMetric("my.disk.rates", ...)
                    syntax error
                    4rat(disk.dev.read)
                        ^

          The position indicator line may be followed by an additional
          diagnostic line describing the nature of the error, when
          available.

          In the case of an error, the caller is responsible for calling
          free(3) to release the space allocated for errmsg.


---------------------------------------------------------

::

          PCPIntro(1), free(3), pmAddDerived(3), pmAddDerivedMetric(3),
          PMAPI(3), pmDerivedErrStr(3), pmFetch(3), pmLoadDerivedConfig(3),
          pmNewContext(3), pmprintf(3), pmReconnectContext(3) and PMNS(5).

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

   Performance Co-Pilot                                PMREGISTERDERIVED(3)

--------------

Pages that refer to this page:
`pcp2elasticsearch(1) <../man1/pcp2elasticsearch.1.html>`__, 
`pcp2graphite(1) <../man1/pcp2graphite.1.html>`__, 
`pcp2influxdb(1) <../man1/pcp2influxdb.1.html>`__, 
`pcp2json(1) <../man1/pcp2json.1.html>`__, 
`pcp2spark(1) <../man1/pcp2spark.1.html>`__, 
`pcp2template(1) <../man1/pcp2template.1.html>`__, 
`pcp2xlsx(1) <../man1/pcp2xlsx.1.html>`__, 
`pcp2xml(1) <../man1/pcp2xml.1.html>`__, 
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__, 
`pmlogctl(1) <../man1/pmlogctl.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__, 
`pmaddderived(3) <../man3/pmaddderived.3.html>`__, 
`pmderivederrstr(3) <../man3/pmderivederrstr.3.html>`__, 
`pmfetchgroup(3) <../man3/pmfetchgroup.3.html>`__, 
`pmgetderivedcontrol(3) <../man3/pmgetderivedcontrol.3.html>`__, 
`pmloadderivedconfig(3) <../man3/pmloadderivedconfig.3.html>`__, 
`pmreconnectcontext(3) <../man3/pmreconnectcontext.3.html>`__, 
`pcp-dstat(5) <../man5/pcp-dstat.5.html>`__, 
`pmrep.conf(5) <../man5/pmrep.conf.5.html>`__

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
