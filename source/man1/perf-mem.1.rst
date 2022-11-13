.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-mem(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `RE                               |                                   |
| CORD OPTIONS <#RECORD_OPTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-MEM(1)                    perf Manual                   PERF-MEM(1)

NAME
-------------------------------------------------

::

          perf-mem - Profile memory accesses


---------------------------------------------------------

::

          perf mem [<options>] (record [<command>] | report)


---------------------------------------------------------------

::

          "perf mem record" runs a command and gathers memory operation
          data from it, into perf.data. Perf record options are accepted
          and are passed through.

          "perf mem report" displays the result. It invokes perf report
          with the right set of options to display a memory access profile.
          By default, loads and stores are sampled. Use the -t option to
          limit to loads or stores.

          Note that on Intel systems the memory latency reported is the
          use-latency, not the pure load (or store latency). Use latency
          includes any pipeline queueing delays in addition to the memory
          subsystem latency.


-------------------------------------------------------

::

          <command>...
              Any command you can specify in a shell.

          -i, --input=<file>
              Input file name.

          -f, --force
              Don’t do ownership validation

          -t, --type=<type>
              Select the memory operation type: load or store (default:
              load,store)

          -D, --dump-raw-samples
              Dump the raw decoded samples on the screen in a format that
              is easy to parse with one sample per line.

          -x, --field-separator=<separator>
              Specify the field separator used when dump raw samples (-D
              option). By default, The separator is the space character.

          -C, --cpu=<cpu>
              Monitor only on the list of CPUs provided. Multiple CPUs can
              be provided as a comma-separated list with no space: 0,1.
              Ranges of CPUs are specified with -: 0-2. Default is to
              monitor all CPUS.

          -U, --hide-unresolved
              Only display entries resolved to a symbol.

          -p, --phys-data
              Record/Report sample physical addresses

          --data-page-size
              Record/Report sample data address page size


---------------------------------------------------------------------

::

          -e, --event <event>
              Event selector. Use perf mem record -e list to list available
              events.

          -K, --all-kernel
              Configure all used events to run in kernel space.

          -U, --all-user
              Configure all used events to run in user space.

          -v, --verbose
              Be more verbose (show counter open errors, etc)

          --ldlat <n>
              Specify desired latency for loads event. (x86 only)

          In addition, for report all perf report options are valid, and
          for record all perf record options.


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

   perf                           2021-01-20                    PERF-MEM(1)

--------------

Pages that refer to this page: `perf(1) <../man1/perf.1.html>`__, 
`perf-c2c(1) <../man1/perf-c2c.1.html>`__

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
