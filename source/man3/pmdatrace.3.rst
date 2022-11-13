.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdatrace(3) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `FORTRA                           |                                   |
| N SYNOPSIS <#FORTRAN_SYNOPSIS>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| JAVA SYNOPSIS <#JAVA_SYNOPSIS>`__ |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
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

   PMTRACE(3)              Library Functions Manual              PMTRACE(3)

NAME
-------------------------------------------------

::

          pmtracebegin, pmtraceend, pmtraceabort, pmtracepoint, pmtraceobs,
          pmtracecounter, pmtracestate, pmtraceerrstr - application-level
          performance instrumentation services


-------------------------------------------------------------

::

          #include <pcp/trace.h>

          int pmtracebegin(const char *tag);
          int pmtraceend(const char *tag);
          int pmtraceabort(const char *tag);
          int pmtracepoint(const char *tag);
          int pmtraceobs(const char *tag, double value);
          int pmtracecounter(const char *tag, double value);
          char *pmtraceerrstr(int code);
          int pmtracestate(int flags);

          cc ... -lpcp_trace


-------------------------------------------------------------------------

::

          character*(*) tag
          integer code
          integer flags
          integer state
          character*(*) estr
          real*8 value

          code = pmtracebegin(tag)
          code = pmtraceend(tag)
          code = pmtraceabort(tag)
          code = pmtracepoint(tag)
          code = pmtraceobs(tag, value)
          code = pmtracecounter(tag, value)
          pmtraceerrstr(code, estr)
          state = pmtracestate(flags)

          f77 ... -lpcp_trace  or  f90 ... -lpcp_trace


-------------------------------------------------------------------

::

          import sgi.pcp.trace;

          int trace.pmtracebegin(String tag);
          int trace.pmtraceend(String tag);
          int trace.pmtraceabort(String tag);
          int trace.pmtracepoint(String tag);
          int trace.pmtraceobs(String tag, double value);
          int trace.pmtracecounter(String tag, double value);
          String trace.pmtraceerrstr(int code);
          int trace.pmtracestate(int flags);


---------------------------------------------------------------

::

          The pcp_trace library functions provide a mechanism for
          identifying sections of a program as transactions or events for
          use by the trace Performance Metrics Domain Agent (refer to
          pmdatrace(1) and PMDA(3)).

          The monitoring of transactions using the Performance Co-Pilot
          (PCP) infrastructure is initiated through a call to pmtracebegin.
          Time will be recorded from the end of each pmtracebegin call to
          the start of the following call to pmtraceend, where the same tag
          identifier is used in both calls.  Following from this, no
          visible recording will occur until at least one call to
          pmtraceend is made referencing a tag previously used in a call to
          pmtracebegin.

          A transaction which is currently in progress can be cancelled by
          calling pmtraceabort.  No transaction data gathered for that
          particular transaction will be exported, although data from
          previous and subsequent successful transactions with that tag
          name are still exported.  This is most useful when an error
          condition arises during transaction processing and the
          transaction does not run to completion.

          The tag argument to pmtracebegin, pmtraceend and pmtraceabort is
          used to uniquely identify each transaction within the pcp_trace
          library and later by the trace PMDA as the instance domain
          identifiers for the transaction performance metrics which it
          exports.  These routines are most useful when used around blocks
          of code which are likely to be executed a number of times over
          some relatively long time period (in a daemon process, for
          example).

          pmtracebegin has two distinct roles - firstly as the initiator of
          a new transaction, and secondly as a mechanism for setting a new
          start time.  Similarly, pmtraceend is used to register a new tag
          and its initial state with the trace PMDA, or alternatively to
          update the statistics which the PMDA currently associates with
          the given tag.

          A second form of program instrumentation can be obtained from
          pmtracepoint.  This is a simpler form of monitoring as it exports
          only the number of times that a particular point in a program has
          been passed.  This differs to the transaction monitoring offered
          by pmtracebegin and pmtraceend, which exports a running count of
          successful transaction completions as well as statistics on the
          time interval between the start and end points of each
          transaction.  This function is most useful when start and end
          points are not well defined.  Examples of this would be when the
          code branches in such a way that a transaction cannot be clearly
          identified, or when processing does not follow a transactional
          model, or the desired instrumentation is akin to event rates
          rather than event service times.

          The pmtraceobs and pmtracecounter functions have similar
          semantics to pmtracepoint, but also allow an arbitrary numeric
          value to be passed to the trace PMDA.  The most recent value for
          each tag is then immediately available from the PMDA.  The only
          difference between pmtraceobs and pmtracecounter is that the
          value exported via pmtracecounter is assumed to be a
          monotonically increasing counter value (e.g. the number of bytes
          read from a socket), whereas the value exported via pmtraceobs
          can be any value at all.

          pmtracestate allows the application to set state flags which are
          honoured by subsequent calls to the pcp_trace library routines.
          There are currently two types of flag - debugging flags and the
          asynchronous protocol flag.  A single call may specify a number
          of flags together, combined using a (bitwise) logical OR
          operation, and overrides the previous state setting.

          The debugging flags to pmtracestate cause pcp_trace to print
          diagnostic messages on the standard output stream at important
          processing points.  The default protocol used between the trace
          PMDA and individual pcp_trace client applications is a
          synchronous protocol, which allows for dropped connections to be
          reestablished at a later stage should this become possible.  An
          asynchronous protocol is also available which does not provide
          the reconnection capability, but which does away with much of the
          overhead inherent in synchronous communication.  This behaviour
          can be toggled using the pmtracestate call, but must be called
          before other calls to the library.  This differs to the debugging
          state behaviour, which can be altered at any time.  pmtracestate
          returns the previous state (setting prior to being called).

          The following table describes each of the pmtracestate flags -
          examples of the use of these flags in each supported language are
          given in the demo applications (refer to the ``FILES'' section
          below).

            ┌────────────┬───────────────────────────────────────────────┐
            │State Flags │                   Semantics                   │
            ├────────────┼───────────────────────────────────────────────┤
            │0  NONE     │ Synchronous PDUs and no diagnostics (default) │
            │1  API      │ Shows processing just below the API (debug)   │
            │2  COMMS    │ Shows network-related activity (debug)        │
            │4  PDU      │ Shows app<->PMDA IPC traffic (debug)          │
            │8  PDUBUF   │ Shows internal IPC buffer management (debug)  │
            │16 NOAGENT  │ No PMDA communications at all (debug)         │
            │32 ASYNC    │ Use the asynchronous PDU protocol (control)   │
            └────────────┴───────────────────────────────────────────────┘
          Should any of the pcp_trace library functions return a negative
          value, an error has occurred.  This can be diagnosed further
          using the pmtraceerrstr routine, which takes the negative return
          value as its code argument, and in the C-callable interface
          returns a pointer to the associated error message.  This points
          into a static error table, and should therefore not be passed to
          free(3).  The Fortran-callable interface has a slightly different
          syntax, requiring the destination character array to be passed in
          as the second argument.  The Java-callable interface returns a
          UTF-8 string, created using the JNI (Java Native Interface)
          routine NewStringUTF.


---------------------------------------------------

::

          The pcp_trace Java class interface has been developed and
          verified using version 1.1 of the Java Native Interface (JNI)
          specification.


-----------------------------------------------------

::

          Applications that use gethostbyname(3) should exercise caution
          because the static fields in struct hostent may not be preserved
          across some pcp_trace calls.  In particular, pmtracebegin,
          pmtraceend, pmtracepoint, pmtracecounter, and pmtraceobs may all
          call gethostbyname(3) internally.


---------------------------------------------------------------

::

          A negative return value from a pcp_trace function indicates that
          an error has occurred - if this is the case, the return value can
          be passed to pmtraceerrstr to obtain the associated error
          message.

          Success is indicated by a return value of zero.

          pmtracestate also returns an integer representing the state flags
          which were set prior to the call.


---------------------------------------------------

::

          $PCP_DEMOS_DIR/trace/*.c
                 Sample C programs and source for pmtrace(1).  Use make(1)
                 to build these programs.

          $PCP_DEMOS_DIR/trace/fapp1.f
                 Sample Fortran program.  Call `make fortran77' or `make
                 fortran90' to build this program.

          $PCP_DEMOS_DIR/trace/japp1.java
                 Sample Java program.  `make java' builds the java class
                 file.

          /usr/java/classes/sgi/pcp/trace.java
                 Java trace class definition.


---------------------------------------------------------------

::

          The pcp_trace routines communicate with the trace PMDA via a
          socket connection, which by default uses TCP/IP port number 4323.
          This can be over-ridden by setting PCP_TRACE_PORT to a different
          port number when the application is started.  The host where the
          trace PMDA is running is by default the localhost, but this can
          be changed using PCP_TRACE_HOST.  When attempting to connect to a
          remote trace PMDA, after some specified time interval has
          elapsed, the connection attempt will be aborted and an error
          status will be returned.  The default timeout interval is 3
          seconds, and this can be modified by setting PCP_TRACE_TIMEOUT in
          the environment to a real number of seconds for the desired
          timeout.  This is most useful in cases where the remote host is
          at the end of a slow network, requiring longer latencies to
          establish the connection correctly.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).  Values for these variables may be obtained
          programmatically using the pmGetConfig(3) function.


---------------------------------------------------------

::

          file:$PCP_DOC_DIR/Tutorial/trace.html, pcp.man.tutorial, Provided
          the, make(1), pmcd(1), pmdatrace(1), pmprobe(1), pmtrace(1),
          Relevant information is also available from the on-line PCP
          Tutorial.

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

   Performance Co-Pilot               PCP                        PMTRACE(3)

--------------

Pages that refer to this page:
`pmdatrace(1) <../man1/pmdatrace.1.html>`__, 
`pmtrace(1) <../man1/pmtrace.1.html>`__

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
