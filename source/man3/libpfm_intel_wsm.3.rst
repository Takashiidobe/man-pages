.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

libpfm_intel_wsm(3) — Linux manual page
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

          libpfm_intel_wsm - support for Intel Westmere core PMU


---------------------------------------------------------

::

          #include <perfmon/pfmlib.h>

          PMU name: wsm
          PMU desc: Intel Westmere
          PMU name: wsm_dp
          PMU desc: Intel Westmere DP


---------------------------------------------------------------

::

          The library supports the Intel Westmere core PMU. It should be
          noted that this PMU model only covers the each core's PMU and not
          the socket level PMU. It is provided separately. Support is
          provided for the Intel Core i7 and Core i5 processors (models 37,
          44).


-----------------------------------------------------------

::

          The following modifiers are supported on Intel Westmere
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

          t      Measure on both threads at the same time assuming hyper-
                 threading is enabled. This is a boolean modifier.

          ldlat  Pass a latency threshold to the
                 MEM_INST_RETIRED:LATENCY_ABOVE_THRESHOLD event.  This is
                 an integer attribute that must be in the range [3:65535].
                 It is required for this event.  Note that the event must
                 be used with precise sampling (PEBS).


---------------------------------------------------------------------------------------

::

          The library is able to encode the OFFCORE_RESPONSE_0 and
          OFFCORE_RESPONSE_1 events.  Those are special events because
          they, each, need a second MSR (0x1a6 and 0x1a7 respectively) to
          be programmed for the event to count properly. Thus two values
          are necessary for each event.  The first value can be programmed
          on any of the generic counters. The second value goes into the
          dedicated MSR (0x1a6 or 0x1a7).

          The OFFCORE_RESPONSE events are exposed as normal events with
          several umasks which are divided in two groups: request and
          response. The user must provide at least one umask from each
          group.  For instance, OFFCORE_RESPONSE_0:ANY_DATA:LOCAL_DRAM.

          When using pfm_get_event_encoding(), two 64-bit values are
          returned. The first value corresponds to what needs to be
          programmed into any of the generic counters. The second value
          must be programmed into the corresponding dedicated MSR (0x1a6 or
          0x1a7).

          When using an OS-specific encoding routine, the way the event is
          encoded is OS specific. Refer to the corresponding man page for
          more information.


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

                                September, 2009                   LIBPFM(3)

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
