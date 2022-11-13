.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-inject(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-INJECT(1)                 perf Manual                PERF-INJECT(1)

NAME
-------------------------------------------------

::

          perf-inject - Filter to augment the events stream with additional
          information


---------------------------------------------------------

::

          perf inject <options>


---------------------------------------------------------------

::

          perf-inject reads a perf-record event stream and repipes it to
          stdout. At any point the processing code can inject other events
          into the event stream - in this case build-ids (-b option) are
          read and injected as needed into the event stream.

          Build-ids are just the first user of perf-inject - potentially
          anything that needs userspace processing to augment the events
          stream with additional information could make use of this
          facility.


-------------------------------------------------------

::

          -b, --build-ids
              Inject build-ids into the output stream

          --buildid-all: Inject build-ids of all DSOs into the output
          stream

          -v, --verbose
              Be more verbose.

          -i, --input=
              Input file name. (default: stdin)

          -o, --output=
              Output file name. (default: stdout)

          -s, --sched-stat
              Merge sched_stat and sched_switch for getting events where
              and how long tasks slept. sched_switch contains a callchain
              where a task slept and sched_stat contains a timeslice how
              long a task slept.

          --kallsyms=<file>
              kallsyms pathname

          --itrace
              Decode Instruction Tracing data, replacing it with
              synthesized events. Options are:

                  i       synthesize instructions events
                  b       synthesize branches events (branch misses for Arm SPE)
                  c       synthesize branches events (calls only)
                  r       synthesize branches events (returns only)
                  x       synthesize transactions events
                  w       synthesize ptwrite events
                  p       synthesize power events (incl. PSB events for Intel PT)
                  o       synthesize other events recorded due to the use
                          of aux-output (refer to perf record)
                  e       synthesize error events
                  d       create a debug log
                  f       synthesize first level cache events
                  m       synthesize last level cache events
                  M       synthesize memory events
                  t       synthesize TLB events
                  a       synthesize remote access events
                  g       synthesize a call chain (use with i or x)
                  G       synthesize a call chain on existing event records
                  l       synthesize last branch entries (use with i or x)
                  L       synthesize last branch entries on existing event records
                  s       skip initial number of events
                  q       quicker (less detailed) decoding
                  Z       prefer to ignore timestamps (so-called "timeless" decoding)

                  The default is all events i.e. the same as --itrace=ibxwpe,
                  except for perf script where it is --itrace=ce

                  In addition, the period (default 100000, except for perf script where it is 1)
                  for instructions events can be specified in units of:

                  i       instructions
                  t       ticks
                  ms      milliseconds
                  us      microseconds
                  ns      nanoseconds (default)

                  Also the call chain size (default 16, max. 1024) for instructions or
                  transactions events can be specified.

                  Also the number of last branch entries (default 64, max. 1024) for
                  instructions or transactions events can be specified.

                  Similar to options g and l, size may also be specified for options G and L.
                  On x86, note that G and L work poorly when data has been recorded with
                  large PEBS. Refer linkperf:perf-intel-pt[1] man page for details.

                  It is also possible to skip events generated (instructions, branches, transactions,
                  ptwrite, power) at the beginning. This is useful to ignore initialization code.

                  --itrace=i0nss1000000

                  skips the first million instructions.

                  The 'e' option may be followed by flags which affect what errors will or
                  will not be reported. Each flag must be preceded by either '+' or '-'.
                  The flags are:
                          o       overflow
                          l       trace data lost

                  If supported, the 'd' option may be followed by flags which affect what
                  debug messages will or will not be logged. Each flag must be preceded
                  by either '+' or '-'. The flags are:
                          a       all perf events

                  If supported, the 'q' option may be repeated to increase the effect.

          --strip
              Use with --itrace to strip out non-synthesized events.

          -j, --jit
              Process jitdump files by injecting the mmap records
              corresponding to jitted functions. This option also generates
              the ELF images for each jitted function found in the jitdumps
              files captured in the input perf.data file. Use this option
              if you are monitoring environment using JIT runtimes, such as
              Java, DART or V8.

          -f, --force
              Don’t complain, do it.

          --vm-time-correlation[=OPTIONS]
              Some architectures may capture AUX area data which contains
              timestamps affected by virtualization. This option will
              update those timestamps in place, to correlate with host
              timestamps. The in-place update means that an output file is
              not specified, and instead the input file is modified. The
              options are architecture specific, except that they may start
              with "dry-run" which will cause the file to be processed but
              without updating it. Currently this option is supported only
              by Intel PT, refer perf-intel-pt(1)


---------------------------------------------------------

::

          perf-record(1), perf-report(1), perf-archive(1), perf-intel-pt(1)

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

   perf                           2021-05-12                 PERF-INJECT(1)

--------------

Pages that refer to this page: `perf(1) <../man1/perf.1.html>`__, 
`perf-intel-pt(1) <../man1/perf-intel-pt.1.html>`__

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
