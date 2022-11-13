.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-c2c(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RE                               |                                   |
| CORD OPTIONS <#RECORD_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `RE                               |                                   |
| PORT OPTIONS <#REPORT_OPTIONS>`__ |                                   |
| \| `C2C RECORD <#C2C_RECORD>`__   |                                   |
| \| `C2C REPORT <#C2C_REPORT>`__   |                                   |
| \| `NODE INFO <#NODE_INFO>`__ \|  |                                   |
| `COALESCE <#COALESCE>`__ \|       |                                   |
| `STDIO OUTPUT <#STDIO_OUTPUT>`__  |                                   |
| \| `TUI OUTPUT <#TUI_OUTPUT>`__   |                                   |
| \| `CREDITS <#CREDITS>`__ \|      |                                   |
| `C2C BLOG <#C2C_BLOG>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-C2C(1)                    perf Manual                   PERF-C2C(1)

NAME
-------------------------------------------------

::

          perf-c2c - Shared Data C2C/HITM Analyzer.


---------------------------------------------------------

::

          perf c2c record [<options>] <command>
          perf c2c record [<options>] — [<record command options>] <command>
          perf c2c report [<options>]


---------------------------------------------------------------

::

          C2C stands for Cache To Cache.

          The perf c2c tool provides means for Shared Data C2C/HITM
          analysis. It allows you to track down the cacheline contentions.

          On x86, the tool is based on load latency and precise store
          facility events provided by Intel CPUs. On PowerPC, the tool uses
          random instruction sampling with thresholding feature.

          These events provide: - memory address of the access - type of
          the access (load and store details) - latency (in cycles) of the
          load access

          The c2c tool provide means to record this data and report back
          access details for cachelines with highest contention - highest
          number of HITM accesses.

          The basic workflow with this tool follows the standard
          record/report phase. User uses the record command to record
          events data and report command to display it.


---------------------------------------------------------------------

::

          -e, --event=
              Select the PMU event. Use perf c2c record -e list to list
              available events.

          -v, --verbose
              Be more verbose (show counter open errors, etc).

          -l, --ldlat
              Configure mem-loads latency. (x86 only)

          -k, --all-kernel
              Configure all used events to run in kernel space.

          -u, --all-user
              Configure all used events to run in user space.


---------------------------------------------------------------------

::

          -k, --vmlinux=<file>
              vmlinux pathname

          -v, --verbose
              Be more verbose (show counter open errors, etc).

          -i, --input
              Specify the input file to process.

          -N, --node-info
              Show extra node info in report (see NODE INFO section)

          -c, --coalesce
              Specify sorting fields for single cacheline display.
              Following fields are available: tid,pid,iaddr,dso (see
              COALESCE)

          -g, --call-graph
              Setup callchains parameters. Please refer to perf-report man
              page for details.

          --stdio
              Force the stdio output (see STDIO OUTPUT)

          --stats
              Display only statistic tables and force stdio mode.

          --full-symbols
              Display full length of symbols.

          --no-source
              Do not display Source:Line column.

          --show-all
              Show all captured HITM lines, with no regard to HITM % 0.0005
              limit.

          -f, --force
              Don’t do ownership validation.

          -d, --display
              Switch to HITM type (rmt, lcl) to display and sort on. Total
              HITMs as default.

          --stitch-lbr
              Show callgraph with stitched LBRs, which may have more
              complete callgraph. The perf.data file must have been
              obtained using perf c2c record --call-graph lbr. Disabled by
              default. In common cases with call stack overflows, it can
              recreate better call stacks than the default lbr call stack
              output. But this approach is not full proof. There can be
              cases where it creates incorrect call stacks from incorrect
              matches. The known limitations include exception handing such
              as setjmp/longjmp will have calls/returns not match.


-------------------------------------------------------------

::

          The perf c2c record command setup options related to HITM
          cacheline analysis and calls standard perf record command.

          Following perf record options are configured by default: (check
          perf record man page for details)

              -W,-d,--phys-data,--sample-cpu

          Unless specified otherwise with -e option, following events are
          monitored by default on x86:

              cpu/mem-loads,ldlat=30/P
              cpu/mem-stores/P

          and following on PowerPC:

              cpu/mem-loads/
              cpu/mem-stores/

          User can pass any perf record option behind -- mark, like (to
          enable callchains and system wide monitoring):

              $ perf c2c record -- -g -a

          Please check RECORD OPTIONS section for specific c2c record
          options.


-------------------------------------------------------------

::

          The perf c2c report command displays shared data analysis. It
          comes in two display modes: stdio and tui (default).

          The report command workflow is following: - sort all the data
          based on the cacheline address - store access details for each
          cacheline - sort all cachelines based on user settings - display
          data

          In general perf report output consist of 2 basic views: 1) most
          expensive cachelines list 2) offsets details for each cacheline

          For each cacheline in the 1) list we display following data:
          (Both stdio and TUI modes follow the same fields output)

              Index
              - zero based index to identify the cacheline

              Cacheline
              - cacheline address (hex number)

              Rmt/Lcl Hitm
              - cacheline percentage of all Remote/Local HITM accesses

              LLC Load Hitm - Total, LclHitm, RmtHitm
              - count of Total/Local/Remote load HITMs

              Total records
              - sum of all cachelines accesses

              Total loads
              - sum of all load accesses

              Total stores
              - sum of all store accesses

              Store Reference - L1Hit, L1Miss
                L1Hit - store accesses that hit L1
                L1Miss - store accesses that missed L1

              Core Load Hit - FB, L1, L2
              - count of load hits in FB (Fill Buffer), L1 and L2 cache

              LLC Load Hit - LlcHit, LclHitm
              - count of LLC load accesses, includes LLC hits and LLC HITMs

              RMT Load Hit - RmtHit, RmtHitm
              - count of remote load accesses, includes remote hits and remote HITMs

              Load Dram - Lcl, Rmt
              - count of local and remote DRAM accesses

          For each offset in the 2) list we display following data:

              HITM - Rmt, Lcl
              - % of Remote/Local HITM accesses for given offset within cacheline

              Store Refs - L1 Hit, L1 Miss
              - % of store accesses that hit/missed L1 for given offset within cacheline

              Data address - Offset
              - offset address

              Pid
              - pid of the process responsible for the accesses

              Tid
              - tid of the process responsible for the accesses

              Code address
              - code address responsible for the accesses

              cycles - rmt hitm, lcl hitm, load
                - sum of cycles for given accesses - Remote/Local HITM and generic load

              cpu cnt
                - number of cpus that participated on the access

              Symbol
                - code symbol related to the 'Code address' value

              Shared Object
                - shared object name related to the 'Code address' value

              Source:Line
                - source information related to the 'Code address' value

              Node
                - nodes participating on the access (see NODE INFO section)


-----------------------------------------------------------

::

          The Node field displays nodes that accesses given cacheline
          offset. Its output comes in 3 flavors: - node IDs separated by ,
          - node IDs with stats for each ID, in following format: Node{cpus
          %hitms %stores} - node IDs with list of affected CPUs in
          following format: Node{cpu list}

          User can switch between above flavors with -N option or use n key
          to interactively switch in TUI mode.


---------------------------------------------------------

::

          User can specify how to sort offsets for cacheline.

          Following fields are available and governs the final output
          fields set for caheline offsets output:

              tid   - coalesced by process TIDs
              pid   - coalesced by process PIDs
              iaddr - coalesced by code address, following fields are displayed:
                         Code address, Code symbol, Shared Object, Source line
              dso   - coalesced by shared object

          By default the coalescing is setup with pid,iaddr.


-----------------------------------------------------------------

::

          The stdio output displays data on standard output.

          Following tables are displayed: Trace Event Information - overall
          statistics of memory accesses

              Global Shared Cache Line Event Information
              - overall statistics on shared cachelines

              Shared Data Cache Line Table
              - list of most expensive cachelines

              Shared Cache Line Distribution Pareto
              - list of all accessed offsets for each cacheline


-------------------------------------------------------------

::

          The TUI output provides interactive interface to navigate through
          cachelines list and to display offset details.

          For details please refer to the help window by pressing ? key.


-------------------------------------------------------

::

          Although Don Zickus, Dick Fowles and Joe Mario worked together to
          get this implemented, we got lots of early help from Arnaldo
          Carvalho de Melo, Stephane Eranian, Jiri Olsa and Andi Kleen.


---------------------------------------------------------

::

          Check Joe’s blog on c2c tool for detailed use case explanation:
          https://joemario.github.io/blog/2016/09/01/c2c-blog/ 


---------------------------------------------------------

::

          perf-record(1), perf-mem(1)

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

   perf                           2020-10-15                    PERF-C2C(1)

--------------

Pages that refer to this page: `perf(1) <../man1/perf.1.html>`__

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
