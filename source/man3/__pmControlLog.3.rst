.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

\__pmcontrollog(3) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `C SYNOPSIS <#C_SYNOPSIS>`__ \|   |                                   |
| `CAVEAT <#CAVEAT>`__ \|           |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMCONTROLLOG(3)         Library Functions Manual         PMCONTROLLOG(3)

NAME
-------------------------------------------------

::

          __pmControlLog - enable, disable or enquire about logging of
          performance metrics


-------------------------------------------------------------

::

          #include "pmapi.h"
          #include "libpcp.h"

          int __pmControlLog(int fd, const pmResult *request, int control,
                  int state, int delta, pmResult **status);

          cc ... -lpcp


-----------------------------------------------------

::

          This documentation is intended for internal Performance Co-Pilot
          (PCP) developer use.

          These interfaces are not part of the PCP APIs that are guaranteed
          to remain fixed across releases, and they may not work, or may
          provide different semantics at some point in the future.


---------------------------------------------------------------

::

          __pmControlLog may be used to enable or disable the archive
          logging for particular performance metrics, as identified by the
          request parameter; see pmFetch(3) for an explanation of the
          pmResult structure.

          The application must have previously issued a call to
          __pmConnectLogger(3) to establish a control-port connection to
          the pmlogger(1) instance to whom the control request is to be
          directed, and fd (the result from __pmConnectLogger(3))
          identifies this connection.

          Within request, only the details of the performance metrics and
          their associated instances will be used, i.e.  the values of the
          metrics, if any, will be ignored.  request would typically be
          constructed as the result of an earlier call to pmFetch(3).  For
          metrics with a singular value (having an instance domain of
          PM_INDOM_NULL) the corresponding pmValueSet should have the value
          one in the numval field and PM_IN_NULL as the inst field of the
          single pmValue supplied.  If multiple explicit instances are to
          be logged, the numval field of the pmValueSet should contain the
          number of instances supplied and the inst fields of the pmValue
          structures should contain specific instance identifiers (which
          may not have the reserved value PM_IN_NULL).

          If the numval field within any of the pmValueSet structures in
          request has a value of zero, it indicates that all available
          instances of the metric should be used.  Enumeration of the
          instance domain is deferred until the logger fetches the metric
          prior to writing it to the log, rather than being performed when
          the __pmControlLog request is received.  This is useful for
          metrics with instance domains that change over time.  It is an
          error to specify numval equal to zero if the corresponding metric
          has a singular value (no instance domain).

          There are several sorts of logging control available, namely
          mandatory or advisory, as defined by the control argument, and
          on, off or maybe as defined by the state argument. These
          different types of control may be used to ensure that some
          performance metrics can be guaranteed to always be in the log,
          while others may be dynamically enabled or disabled as determined
          by the level and type of system activity.

          The actual action to be performed is defined by the combination
          of control and state as follows.  If control is PM_LOG_MANDATORY
          and state is PM_LOG_ON, then logging is enabled.  If control is
          PM_LOG_MANDATORY and state is PM_LOG_OFF, then logging is
          disabled.  If control is PM_LOG_MANDATORY and state is
          PM_LOG_MAYBE, then subsequent advisory controls will be honored.
          If the logging state prior to the request was mandatory (on or
          off), the state is changed to advisory off.  If the logging state
          was already advisory (either on or off), it remains unchanged.
          If control is PM_LOG_ADVISORY and the last mandatory control for
          the metric was PM_LOG_MAYBE, then logging is enabled or disabled
          as specified by the state argument, i.e.  PM_LOG_ON or
          PM_LOG_OFF.  When the arguments state and control specify a
          request to change the logging behavior, the argument delta
          defines the logging interval in milliseconds to be applied to all
          metrics and instances identified in request.

          The result argument status returns the current logging state for
          each of the nominated performance metrics.  There is a 1:1
          correspondence between the elements of request and status.  For
          metrics in request that have pmValueSets with numval equal to
          zero, the corresponding pmValueSet in result will contain a value
          for each available instance at the time of the call.  Each metric
          value in status will have the current logging state encoded in
          it.  The detailed outcome of the operation for each metric can be
          determined by comparing these values to that requested via
          control, state and delta.

          Macros defined in libpcp.h may be used to extract the state and
          logging interval from the returned metric values.  PMLC_GET_ON
          returns true if logging is on, or false if it is off;
          PMLC_GET_MAND returns true if logging is mandatory, or false if
          it is advisory; PMLC_GET_INLOG returns true if the metric has
          been logged at least once, or false otherwise; PMLC_GET_AVAIL
          returns true if the metric was available from its source the last
          time it was supposed to be logged, or false if it was
          unavailable; and PMLC_GET_DELTA returns the current logging
          interval for the metric (in milliseconds).  PMLC_MAX_DELTA
          defines the greatest delta that can be returned in an encoded
          metric value.

          As a special case, when control is PM_LOG_ENQUIRE, state and
          delta are ignored, and status returns the current logging state
          of the nominated performance metrics (this variant makes no
          changes to the logging state).

          If the value of the logging interval is 0, either for delta in a
          request to change state to PM_LOG_ON, or encoded in the value
          returned from PM_LOG_ENQUIRE, then this corresponds to the
          special ``once only'' logging of metrics that appear once in the
          archive log, and are never logged again.

          __pmControlLog returns zero on success.


-------------------------------------------------

::

          This routine is not thread-safe as there is no serialization on
          the use of the communication channel between the sending of the
          request and receiving the reply.  It is assumed that the caller
          is single-threaded, which is true for the only current user of
          this routine, namely pmlc(1).


---------------------------------------------------------------

::

          PM_ERR_TOOSMALL
                 The number of metrics in request is less than one.

          PM_ERR_VALUE
                 One or more of the pmValueSets in request had numval (the
                 number of instances) less than one.

          EINVAL An invalid combination of control and state was specified,
                 or delta was negative.


---------------------------------------------------------

::

          pmlc(1), pmlogger(1), PMAPI(3), pmFetch(3) and
          __pmConnectLogger(3).

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

   Performance Co-Pilot               PCP                   PMCONTROLLOG(3)

--------------

Pages that refer to this page:
`\__pmconnectlogger(3) <../man3/__pmconnectlogger.3.html>`__

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
