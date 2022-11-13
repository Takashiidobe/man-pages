.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmtrace(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
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

   PMTRACE(1)               General Commands Manual              PMTRACE(1)

NAME
-------------------------------------------------

::

          pmtrace - command line performance instrumentation


---------------------------------------------------------

::

          pmtrace [-q?]  [-c value | -e command | -v value] [-h host] [-S
          state] tag


---------------------------------------------------------------

::

          pmtrace provides a simple command line interface to the trace
          Performance Metrics Domain Agent (PMDA) and the associated
          pcp_trace library.

          The default pmtrace behavior is to provide point trace data to
          the trace PMDA, using the tag argument as the identifying name
          associated with each trace point.  The tag then becomes an
          instance identifier within the set of trace.point metrics.


-------------------------------------------------------

::

          The available command line options are:

          -c value
               Allow an arbitrary counter value to be exported through the
               trace.count metrics.

          -e command
               Allow an arbitrary command to be executed.  This command
               will be measured as a transaction since it has well defined
               start and end points.  The information is made available
               through the trace.transact metrics.

          -h host
               Sent the trace data to the trace PMDA running on host,
               rather than the localhost.  This overrides use of the
               environment variable PCP_TRACE_HOST.

          -q   Suppress messages from a successful trace, so that pmtrace
               runs quietly.

          -S state
               Enable internal debugging and tracing.  The value of state
               is a bit-wise combination of debug flags as defined in
               pmtracestate(3), and may be specified using the decimal or
               hexadecimal syntax prescribed by strtol(3).

          -v value
               Allow an arbitrary floating point value to be exported
               through the trace.observe metrics.

          -?   Display usage message and exit.


---------------------------------------------------------------

::

          All are generated on standard error and are intended to be self-
          explanatory.

          The pmtrace exit status is always zero except when the -e option
          is in use, in which case the exit status of command is returned.


---------------------------------------------------

::

          $PCP_DEMOS_DIR/trace/pmtrace.c
               source code for pmtrace


---------------------------------------------------------------

::

          Since pmtrace uses the libpcp_trace library routines, the
          environment variables PCP_TRACE_HOST, PCP_TRACE_PORT, and
          PCP_TRACE_TIMEOUT are all honored.  Refer to pmdatrace(3) for a
          detailed description of the semantics of each.


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

          pmcd(1), pmdatrace(1), pmprobe(1), PMAPI(3) and pmdatrace(3).

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

   Performance Co-Pilot               PCP                        PMTRACE(1)

--------------

Pages that refer to this page:
`pmdatrace(1) <../man1/pmdatrace.1.html>`__, 
`pmdatrace(3) <../man3/pmdatrace.3.html>`__

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
