.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-annotate(1) — Linux manual page
====================================

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

   PERF-ANNOTATE(1)               perf Manual              PERF-ANNOTATE(1)

NAME
-------------------------------------------------

::

          perf-annotate - Read perf.data (created by perf record) and
          display annotated code


---------------------------------------------------------

::

          perf annotate [-i <file> | --input=file] [symbol_name]


---------------------------------------------------------------

::

          This command reads the input file and displays an annotated
          version of the code. If the object file has debug symbols then
          the source code will be displayed alongside assembly code.

          If there is no debug info in the object, then annotated assembly
          is displayed.


-------------------------------------------------------

::

          -i, --input=<file>
              Input file name. (default: perf.data unless stdin is a fifo)

          -d, --dsos=<dso[,dso...]>
              Only consider symbols in these dsos.

          -s, --symbol=<symbol>
              Symbol to annotate.

          -f, --force
              Don’t do ownership validation.

          -v, --verbose
              Be more verbose. (Show symbol address, etc)

          -q, --quiet
              Do not show any message. (Suppress -v)

          -n, --show-nr-samples
              Show the number of samples for each symbol

          -D, --dump-raw-trace
              Dump raw trace in ASCII.

          -k, --vmlinux=<file>
              vmlinux pathname.

          --ignore-vmlinux
              Ignore vmlinux files.

          --itrace
              Options for decoding instruction tracing data. The options
              are:

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

                  To disable decoding entirely, use --no-itrace.

          -m, --modules
              Load module symbols. WARNING: use only with -k and LIVE
              kernel.

          -l, --print-line
              Print matching source lines (may be slow).

          -P, --full-paths
              Don’t shorten the displayed pathnames.

          --stdio
              Use the stdio interface.

          --stdio2
              Use the stdio2 interface, non-interactive, uses the TUI
              formatting.

          --stdio-color=<mode>
              always, never or auto, allowing configuring color output via
              the command line, in addition to via "color.ui" .perfconfig.
              Use --stdio-color always to generate color even when
              redirecting to a pipe or file. Using just --stdio-color is
              equivalent to using always.

          --tui
              Use the TUI interface. Use of --tui requires a tty, if one is
              not present, as when piping to other commands, the stdio
              interface is used. This interfaces starts by centering on the
              line with more samples, TAB/UNTAB cycles through the lines
              with more samples.

          --gtk
              Use the GTK interface.

          -C, --cpu=<cpu>
              Only report samples for the list of CPUs provided. Multiple
              CPUs can be provided as a comma-separated list with no space:
              0,1. Ranges of CPUs are specified with -: 0-2. Default is to
              report samples on all CPUs.

          --asm-raw
              Show raw instruction encoding of assembly instructions.

          --show-total-period
              Show a column with the sum of periods.

          --source
              Interleave source code with assembly code. Enabled by
              default, disable with --no-source.

          --symfs=<directory>
              Look for files with symbols relative to this directory.

          -M, --disassembler-style=
              Set disassembler style for objdump.

          --objdump=<path>
              Path to objdump binary.

          --prefix=PREFIX, --prefix-strip=N
              Remove first N entries from source file path names in
              executables and add PREFIX. This allows to display source
              code compiled on systems with different file system layout.

          --skip-missing
              Skip symbols that cannot be annotated.

          --group
              Show event group information together

          --demangle
              Demangle symbol names to human readable form. It’s enabled by
              default, disable with --no-demangle.

          --demangle-kernel
              Demangle kernel symbol names to human readable form (for C++
              kernels).

          --percent-type
              Set annotation percent type from following choices:
              global-period, local-period, global-hits, local-hits

                  The local/global keywords set if the percentage is computed
                  in the scope of the function (local) or the whole data (global).
                  The period/hits keywords set the base the percentage is computed
                  on - the samples period or the number of samples (hits).


---------------------------------------------------------

::

          perf-record(1), perf-report(1)

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

   perf                           2021-06-16               PERF-ANNOTATE(1)

--------------

Pages that refer to this page: `perf(1) <../man1/perf.1.html>`__, 
`perf-report(1) <../man1/perf-report.1.html>`__

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
