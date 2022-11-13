.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpfm_intel_knl(3) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `MODIFIERS <#MODIFIERS>`__ \|     |                                   |
| `OFFCORE_RESPONSE eve             |                                   |
| nts <#OFFCORE_RESPONSE_events>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LIBPFM(3)               Linux Programmer's Manual              LIBPFM(3)

NAME
-------------------------------------------------

::

          libpfm_intel_knl - support for Intel Kinghts Landing core PMU


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          PMU name: knl
          PMU desc: Intel Kinghts Landing


---------------------------------------------------------------

::

          The library supports the Intel Kinghts Landing core PMU. It
          should be noted that this PMU model only covers each core's PMU
          and not the socket level PMU.

          On Knights Landing, the number of generic counters is 4. There is
          4-way HyperThreading support.  The pfm_get_pmu_info() function
          returns the maximum number of generic counters in num_cntrs.


-----------------------------------------------------------

::

          The following modifiers are supported on Intel Kinghts Landing
          processors:

          u      Measure at user level which includes privilege levels 1,
                 2, 3. This corresponds to PFM_PLM3.  This is a boolean
                 modifier.

          k      Measure at kernel level which includes privilege level 0.
                 This corresponds to PFM_PLM0.  This is a boolean modifier.

          i      Invert the meaning of the event. The counter will now
                 count cycles in which the event is not occurring. This is
                 a boolean modifier

          e      Enable edge detection, i.e., count only when there is a
                 state transition from no occurrence of the event to at
                 least one occurrence. This modifier must be combined with
                 a counter mask modifier (m) with a value greater or equal
                 to one.  This is a boolean modifier.

          c      Set the counter mask value. The mask acts as a threshold.
                 The counter will count the number of cycles in which the
                 number of occurrences of the event is greater or equal to
                 the threshold. This is an integer modifier with values in
                 the range [0:255].

          t      Measure on any of the 4 hyper-threads at the same time
                 assuming hyper-threading is enabled. This is a boolean
                 modifier.  This modifier is only available on fixed
                 counters (unhalted_reference_cycles, instructions_retired,
                 unhalted_core_cycles).  Depending on the underlying kernel
                 interface, the event may be programmed on a fixed counter
                 or a generic counter, except for
                 unhalted_reference_cycles, in which case, this modifier
                 may be ignored or rejected.


---------------------------------------------------------------------------------------

::

          Intel Knights Landing provides two offcore_response events. They
          are called OFFCORE_RESPONSE_0 and OFFCORE_RESPONSE_1.

          Those events need special treatment in the performance monitoring
          infrastructure because each event uses an extra register to store
          some settings. Thus, in case multiple offcore_response events are
          monitored simultaneously, the kernel needs to manage the sharing
          of that extra register.

          The offcore_response events are exposed as normal events by the
          library. The extra settings are exposed as regular umasks. The
          library takes care of encoding the events according to the
          underlying kernel interface.

          On Intel Knights Landing, the umasks are divided into 4
          categories: request, supplier and snoop and average latency.
          Offcore_response event has two modes of operations: normal and
          average latency.  In the first mode, the two offcore_respnse
          events operate independently of each other. The user must provide
          at least one umask for each of the first 3 categories: request,
          supplier, snoop. In the second mode, the two offcore_response
          events are combined to compute an average latency per request
          type.

          For the normal mode, there is a special supplier (response) umask
          called ANY_RESPONSE. When this umask is used then it overrides
          any supplier and snoop umasks. In other words, users can specify
          either ANY_RESPONSE OR any combinations of supplier + snoops. In
          case no supplier or snoop is specified, the library defaults to
          using ANY_RESPONSE.

          For instance, the following are valid event selections:

          OFFCORE_RESPONSE_0:DMND_DATA_RD:ANY_RESPONSE

          OFFCORE_RESPONSE_0:ANY_REQUEST

          OFFCORE_RESPONSE_0:ANY_RFO:DDR_NEAR

          But the following is illegal:

          OFFCORE_RESPONSE_0:ANY_RFO:DDR_NEAR:ANY_RESPONSE

          In average latency mode, OFFCORE_RESPONSE_0 must be programmed to
          select the request types of interest, for instance, DMND_DATA_RD,
          and the OUTSTANDING umask must be set and no others. the library
          will enforce that restriction as soon as the OUTSTANDING umask is
          used. Then OFFCORE_RESPONSE_1 must be set with the same request
          types and the ANY_RESPONSE umask. It should be noted that the
          library encodes events independently of each other and therefore
          cannot verify that the requests are matching between the two
          events.  Example of average latency settings:

          OFFCORE_RESPONSE_0:DMND_DATA_RD:OUTSTANDING+OFFCORE_RESPONSE_1:DMND_DATA_RD:ANY_RESPONSE

          OFFCORE_RESPONSE_0:ANY_REQUEST:OUTSTANDING+OFFCORE_RESPONSE_1:ANY_REQUEST:ANY_RESPONSE

          The average latency for the request(s) is obtained by dividing
          the counts of OFFCORE_RESPONSE_0 by the count of
          OFFCORE_RESPONSE_1. The ratio is expressed in core cycles.


-------------------------------------------------------

::

          Stephane Eranian <eranian@gmail.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the perfmon2 (a performance monitoring
          library) project.  Information about the project can be found at
          ⟨http://perfmon2.sourceforge.net/⟩.  If you have a bug report for
          this manual page, send it to
          perfmon2-devel@lists.sourceforge.net.  This page was obtained
          from the project's upstream Git repository
          ⟨git://git.code.sf.net/p/perfmon2/libpfm4 perfmon2-libpfm4⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-04.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                  July, 2016                      LIBPFM(3)

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
