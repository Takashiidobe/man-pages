.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-kmem(1) — Linux manual page
================================

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

   PERF-KMEM(1)                   perf Manual                  PERF-KMEM(1)

NAME
-------------------------------------------------

::

          perf-kmem - Tool to trace/measure kernel memory properties


---------------------------------------------------------

::

          perf kmem {record|stat} [<options>]


---------------------------------------------------------------

::

          There are two variants of perf kmem:

              'perf kmem record <command>' to record the kmem events
              of an arbitrary workload.

              'perf kmem stat' to report kernel memory statistics.


-------------------------------------------------------

::

          -i <file>, --input=<file>
              Select the input file (default: perf.data unless stdin is a
              fifo)

          -f, --force
              Don’t do ownership validation

          -v, --verbose
              Be more verbose. (show symbol address, etc)

          --caller
              Show per-callsite statistics

          --alloc
              Show per-allocation statistics

          -s <key[,key2...]>, --sort=<key[,key2...]>
              Sort the output (default: frag,hit,bytes for slab and
              bytes,hit for page). Available sort keys are ptr, callsite,
              bytes, hit, pingpong, frag for slab and page, callsite,
              bytes, hit, order, migtype, gfp for page. This option should
              be preceded by one of the mode selection options - i.e.
              --slab, --page, --alloc and/or --caller.

          -l <num>, --line=<num>
              Print n lines only

          --raw-ip
              Print raw ip instead of symbol

          --slab
              Analyze SLAB allocator events.

          --page
              Analyze page allocator events

          --live
              Show live page stat. The perf kmem shows total allocation
              stat by default, but this option shows live (currently
              allocated) pages instead. (This option works with --page
              option only)

          --time=<start>,<stop>
              Only analyze samples within given time window:
              <start>,<stop>. Times have the format seconds.microseconds.
              If start is not given (i.e., time string is ,x.y) then
              analysis starts at the beginning of the file. If stop time is
              not given (i.e, time string is x.y,) then analysis goes to
              end of file.


---------------------------------------------------------

::

          perf-record(1)

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

   perf                           2018-02-16                   PERF-KMEM(1)

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
