.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-list(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EVEN                             |                                   |
| T MODIFIERS <#EVENT_MODIFIERS>`__ |                                   |
| \|                                |                                   |
| `RAW HARDWARE EVENT DESCRIPTOR <# |                                   |
| RAW_HARDWARE_EVENT_DESCRIPTOR>`__ |                                   |
| \|                                |                                   |
| `AR                               |                                   |
| BITRARY PMUS <#ARBITRARY_PMUS>`__ |                                   |
| \|                                |                                   |
| `PER                              |                                   |
| SOCKET PMUS <#PER_SOCKET_PMUS>`__ |                                   |
| \|                                |                                   |
| `ACCESS RESTR                     |                                   |
| ICTIONS <#ACCESS_RESTRICTIONS>`__ |                                   |
| \| `TRACING <#TRACING>`__ \|      |                                   |
| `PARAMETERIZED                    |                                   |
| EVENTS <#PARAMETERIZED_EVENTS>`__ |                                   |
| \|                                |                                   |
| `EVENT GROUPS <#EVENT_GROUPS>`__  |                                   |
| \|                                |                                   |
| `LEAD                             |                                   |
| ER SAMPLING <#LEADER_SAMPLING>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-LIST(1)                   perf Manual                  PERF-LIST(1)

NAME
-------------------------------------------------

::

          perf-list - List all symbolic event types


---------------------------------------------------------

::

          perf list [--no-desc] [--long-desc]
                      [hw|sw|cache|tracepoint|pmu|sdt|metric|metricgroup|event_glob]


---------------------------------------------------------------

::

          This command displays the symbolic event types which can be
          selected in the various perf commands with the -e option.


-------------------------------------------------------

::

          -d, --desc
              Print extra event descriptions. (default)

          --no-desc
              Don’t print descriptions.

          -v, --long-desc
              Print longer event descriptions.

          --debug
              Enable debugging output.

          --details
              Print how named events are resolved internally into perf
              events, and also any extra expressions computed by perf stat.

          --deprecated
              Print deprecated events. By default the deprecated events are
              hidden.


-----------------------------------------------------------------------

::

          Events can optionally have a modifier by appending a colon and
          one or more modifiers. Modifiers allow the user to restrict the
          events to be counted. The following modifiers exist:

              u - user-space counting
              k - kernel counting
              h - hypervisor counting
              I - non idle counting
              G - guest counting (in KVM guests)
              H - host counting (not in KVM guests)
              p - precise level
              P - use maximum detected precise level
              S - read sample value (PERF_SAMPLE_READ)
              D - pin the event to the PMU
              W - group is weak and will fallback to non-group if not schedulable,
              e - group or event are exclusive and do not share the PMU

          The p modifier can be used for specifying how precise the
          instruction address should be. The p modifier can be specified
          multiple times:

              0 - SAMPLE_IP can have arbitrary skid
              1 - SAMPLE_IP must have constant skid
              2 - SAMPLE_IP requested to have 0 skid
              3 - SAMPLE_IP must have 0 skid, or uses randomization to avoid
                  sample shadowing effects.

          For Intel systems precise event sampling is implemented with PEBS
          which supports up to precise-level 2, and precise level 3 for
          some special cases

          On AMD systems it is implemented using IBS (up to precise-level
          2). The precise modifier works with event types 0x76 (cpu-cycles,
          CPU clocks not halted) and 0xC1 (micro-ops retired). Both events
          map to IBS execution sampling (IBS op) with the IBS Op Counter
          Control bit (IbsOpCntCtl) set respectively (see AMD64
          Architecture Programmer’s Manual Volume 2: System Programming,
          13.3 Instruction-Based Sampling). Examples to use IBS:

              perf record -a -e cpu-cycles:p ...    # use ibs op counting cycles
              perf record -a -e r076:p ...          # same as -e cpu-cycles:p
              perf record -a -e r0C1:p ...          # use ibs op counting micro-ops


---------------------------------------------------------------------------------------------------

::

          Even when an event is not available in a symbolic form within
          perf right now, it can be encoded in a per processor specific
          way.

          For instance For x86 CPUs NNN represents the raw register
          encoding with the layout of IA32_PERFEVTSELx MSRs (see [Intel® 64
          and IA-32 Architectures Software Developer’s Manual Volume 3B:
          System Programming Guide] Figure 30-1 Layout of IA32_PERFEVTSELx
          MSRs) or AMD’s PerfEvtSeln (see [AMD64 Architecture Programmer’s
          Manual Volume 2: System Programming], Page 344, Figure 13-7
          Performance Event-Select Register (PerfEvtSeln)).

          Note: Only the following bit fields can be set in x86 counter
          registers: event, umask, edge, inv, cmask. Esp. guest/host only
          and OS/user mode flags must be setup using EVENT MODIFIERS.

          Example:

          If the Intel docs for a QM720 Core i7 describe an event as:

              Event  Umask  Event Mask
              Num.   Value  Mnemonic    Description                        Comment

              A8H      01H  LSD.UOPS    Counts the number of micro-ops     Use cmask=1 and
                                        delivered by loop stream detector  invert to count
                                                                           cycles

          raw encoding of 0x1A8 can be used:

              perf stat -e r1a8 -a sleep 1
              perf record -e r1a8 ...

          It’s also possible to use pmu syntax:

              perf record -e r1a8 -a sleep 1
              perf record -e cpu/r1a8/ ...
              perf record -e cpu/r0x1a8/ ...

          You should refer to the processor specific documentation for
          getting these details. Some of them are referenced in the SEE
          ALSO section below.


---------------------------------------------------------------------

::

          perf also supports an extended syntax for specifying raw
          parameters to PMUs. Using this typically requires looking up the
          specific event in the CPU vendor specific documentation.

          The available PMUs and their raw parameters can be listed with

              ls /sys/devices/*/format

          For example the raw event "LSD.UOPS" core pmu event above could
          be specified as

              perf stat -e cpu/event=0xa8,umask=0x1,name=LSD.UOPS_CYCLES,cmask=0x1/ ...

              or using extended name syntax

              perf stat -e cpu/event=0xa8,umask=0x1,cmask=0x1,name=\'LSD.UOPS_CYCLES:cmask=0x1\'/ ...


-----------------------------------------------------------------------

::

          Some PMUs are not associated with a core, but with a whole CPU
          socket. Events on these PMUs generally cannot be sampled, but
          only counted globally with perf stat -a. They can be bound to one
          logical CPU, but will measure all the CPUs in the same socket.

          This example measures memory bandwidth every second on the first
          memory controller on socket 0 of a Intel Xeon system

              perf stat -C 0 -a uncore_imc_0/cas_count_read/,uncore_imc_0/cas_count_write/ -I 1000 ...

          Each memory controller has its own PMU. Measuring the complete
          system bandwidth would require specifying all imc PMUs (see perf
          list output), and adding the values together. To simplify
          creation of multiple events, prefix and glob matching is
          supported in the PMU name, and the prefix uncore_ is also ignored
          when performing the match. So the command above can be expanded
          to all memory controllers by using the syntaxes:

              perf stat -C 0 -a imc/cas_count_read/,imc/cas_count_write/ -I 1000 ...
              perf stat -C 0 -a *imc*/cas_count_read/,*imc*/cas_count_write/ -I 1000 ...

          This example measures the combined core power every second

              perf stat -I 1000 -e power/energy-cores/  -a


-------------------------------------------------------------------------------

::

          For non root users generally only context switched PMU events are
          available. This is normally only the events in the cpu PMU, the
          predefined events like cycles and instructions and some software
          events.

          Other PMUs and global measurements are normally root only. Some
          event qualifiers, such as "any", are also root only.

          This can be overridden by setting the kernel.perf_event_paranoid
          sysctl to -1, which allows non root to use these events.

          For accessing trace point events perf needs to have read access
          to /sys/kernel/debug/tracing, even when perf_event_paranoid is in
          a relaxed setting.


-------------------------------------------------------

::

          Some PMUs control advanced hardware tracing capabilities, such as
          Intel PT, that allows low overhead execution tracing. These are
          described in a separate intel-pt.txt document.


---------------------------------------------------------------------------------

::

          Some pmu events listed by perf-list will be displayed with ? in
          them. For example:

              hv_gpci/dtbp_ptitc,phys_processor_idx=?/

          This means that when provided as an event, a value for ? must
          also be supplied. For example:

              perf stat -C 0 -e 'hv_gpci/dtbp_ptitc,phys_processor_idx=0x2/' ...

          EVENT QUALIFIERS:

          It is also possible to add extra qualifiers to an event:

          percore:

          Sums up the event counts for all hardware threads in a core,
          e.g.:

              perf stat -e cpu/event=0,umask=0x3,percore=1/


-----------------------------------------------------------------

::

          Perf supports time based multiplexing of events, when the number
          of events active exceeds the number of hardware performance
          counters. Multiplexing can cause measurement errors when the
          workload changes its execution profile.

          When metrics are computed using formulas from event counts, it is
          useful to ensure some events are always measured together as a
          group to minimize multiplexing errors. Event groups can be
          specified using { }.

              perf stat -e '{instructions,cycles}' ...

          The number of available performance counters depend on the CPU. A
          group cannot contain more events than available counters. For
          example Intel Core CPUs typically have four generic performance
          counters for the core, plus three fixed counters for
          instructions, cycles and ref-cycles. Some special events have
          restrictions on which counter they can schedule, and may not
          support multiple instances in a single group. When too many
          events are specified in the group some of them will not be
          measured.

          Globally pinned events can limit the number of counters available
          for other groups. On x86 systems, the NMI watchdog pins a counter
          by default. The nmi watchdog can be disabled as root with

              echo 0 > /proc/sys/kernel/nmi_watchdog

          Events from multiple different PMUs cannot be mixed in a group,
          with some exceptions for software events.


-----------------------------------------------------------------------

::

          perf also supports group leader sampling using the :S specifier.

              perf record -e '{cycles,instructions}:S' ...
              perf report --group

          Normally all events in an event group sample, but with :S only
          the first event (the leader) samples, and it only reads the
          values of the other events in the group.

          However, in the case AUX area events (e.g. Intel PT or
          CoreSight), the AUX area event must be the leader, so then the
          second event samples, not the first.

.. _options-top-1:


-------------------------------------------------------

::

          Without options all known events will be listed.

          To limit the list use:

           1. hw or hardware to list hardware events such as cache-misses,
              etc.

           2. sw or software to list software events such as context
              switches, etc.

           3. cache or hwcache to list hardware cache events such as
              L1-dcache-loads, etc.

           4. tracepoint to list all tracepoint events, alternatively use
              subsys_glob:event_glob to filter by tracepoint subsystems
              such as sched, block, etc.

           5. pmu to print the kernel supplied PMU events.

           6. sdt to list all Statically Defined Tracepoint events.

           7. metric to list metrics

           8. metricgroup to list metricgroups with metrics.

           9. If none of the above is matched, it will apply the supplied
              glob to all events, printing the ones that match.

          10. As a last resort, it will do a substring search in all event
              names.

          One or more types can be used at the same time, listing the
          events for the types specified.

          Support raw format:

           1. --raw-dump, shows the raw-dump of all the events.

           2. --raw-dump [hw|sw|cache|tracepoint|pmu|event_glob], shows the
              raw-dump of a certain kind of events.


---------------------------------------------------------

::

          perf-stat(1), perf-top(1), perf-record(1), Intel® 64 and IA-32
          Architectures Software Developer’s Manual Volume 3B: System
          Programming Guide[1], AMD64 Architecture Programmer’s Manual
          Volume 2: System Programming[2]


---------------------------------------------------

::

           1. Intel® 64 and IA-32 Architectures Software Developer’s Manual
              Volume 3B: System Programming Guide
              http://www.intel.com/sdm/

           2. AMD64 Architecture Programmer’s Manual Volume 2: System
              Programming
              http://support.amd.com/us/Processor_TechDocs/24593_APM_v2.pdf

COLOPHON
---------------------------------------------------------

::

          This page is part of the perf (Performance analysis tools for
          Linux (in Linux source tree)) project.  Information about the
          project can be found at 
          ⟨https://perf.wiki.kernel.org/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, send it to
          linux-kernel@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-26.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   perf                           2020-10-14                   PERF-LIST(1)

--------------

Pages that refer to this page: `perf(1) <../man1/perf.1.html>`__, 
`perf-evlist(1) <../man1/perf-evlist.1.html>`__, 
`perf-record(1) <../man1/perf-record.1.html>`__, 
`perf-stat(1) <../man1/perf-stat.1.html>`__, 
`perf-top(1) <../man1/perf-top.1.html>`__

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
