.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmreconnectcontext(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMRECONNECTCONTEXT(3)   Library Functions Manual   PMRECONNECTCONTEXT(3)

NAME
-------------------------------------------------

::

          pmReconnectContext - reconnect to a PMAPI context


-------------------------------------------------------------

::

          #include <pcp/pmapi.h>

          int pmReconnectContext(int handle);

          cc ... -lpcp


---------------------------------------------------------------

::

          As a consequence of network, host or Performance Metrics
          Collector Daemon (PMCD) failures, an application's connection to
          a PMCD may be established and then subsequently lost.

          The routine pmReconnectContext allows an application to request
          that the context identified by handle should be re-established,
          provided the associated metrics source is accessible.

          When the source of metrics associated with the context handle is
          pmcd(1), then to avoid flooding the system with reconnect
          requests, pmReconnectContext will only attempt a reconnection
          after a suitable delay from the previous unsuccessful attempt to
          reconnect this context. This imposed restriction on the reconnect
          re-try time interval uses an exponential back-off so that the
          initial delay is 5 seconds after the first unsuccessful attempt,
          then 10 seconds, then 20 seconds, then 40 seconds and then 80
          seconds thereafter.

          The environment variable PMCD_RECONNECT_TIMEOUT may be used to
          redefine the back-off intervals, see PMAPI(3).

          Calling pmReconnectContext with a handle identifying a currently
          connected pmcd(1) context will cause the connection to be broken
          before any reconnection is attempted.

          If handle identifies a context associated with an archive source
          of metrics, pmReconnectContext returns without delay.

          If the reconnection succeeds, pmReconnectContext returns handle.

          As a side-effect of reconnecting, any derived metrics that have
          previously been defined using pmRegisterDerived(3),
          pmRegisterDerivedMetric(3) or pmLoadDerivedConfig(3) will be re-
          processed and re-bound to the available metrics from the
          reconnected source.  The support of dynamic definition for
          derived metrics provides one use case where pmReconnectContext
          may be called even if the connection to the metrics source has
          not been lost.

          Note that even in the case of a successful reconnection,
          pmReconnectContext does not change the current Performance
          Metrics Application Programming Interface (PMAPI) context, so
          handle remains valid.

          When attempting to connect to a remote pmcd(1) on a machine that
          is booting, pmReconnectContext could potentially block for a long
          time until the remote machine finishes its initialization.
          pmReconnectContext will abort and return an error if the
          connection has not been established after some specified interval
          has elapsed.  The default interval is 5 seconds.  This may be
          modified by setting PMCD_CONNECT_TIMEOUT in the environment to a
          real number of seconds for the desired timeout.  This is most
          useful in cases where the remote host is at the end of a slow
          network, requiring longer latencies to establish the connection
          correctly.


-----------------------------------------------------

::

          Applications that use gethostbyname(3) should exercise caution
          because the static fields in struct hostent may not be preserved
          across some PMAPI(3) calls.  In particular, pmNewContext(3) and
          pmReconnectContext(3) both may call gethostbyname(3) internally.


---------------------------------------------------------------

::

          PM_ERR_NOCONTEXT

                 handle does not identify a valid PMAPI context

          -ETIMEDOUT

                 The re-try time has not elapsed, or the reconnection is
                 attempted and fails.


---------------------------------------------------------------

::

          PMCD_CONNECT_TIMEOUT
                 Timeout period (in seconds) for pmcd(1) connection
                 attempts.

          PMCD_RECONNECT_TIMEOUT
                 Redefines the back-off intervals - refer to PMAPI(3).


---------------------------------------------------------

::

          pmcd(1), PMAPI(3), pmLoadDerivedConfig(3), pmNewContext(3),
          pmRegisterDerived(3), pmRegisterDerivedMetric(3) and
          pmUseContext(3).

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

   Performance Co-Pilot               PCP             PMRECONNECTCONTEXT(3)

--------------

Pages that refer to this page:
`pmnewcontext(3) <../man3/pmnewcontext.3.html>`__, 
`pmreconnectcontext(3) <../man3/pmreconnectcontext.3.html>`__, 
`pmregisterderived(3) <../man3/pmregisterderived.3.html>`__

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
