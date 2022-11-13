.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

vmstat(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FIELD DESCRIPTION FOR VM MODE <# |                                   |
| FIELD_DESCRIPTION_FOR_VM_MODE>`__ |                                   |
| \|                                |                                   |
| `FIE                              |                                   |
| LD DESCRIPTION FOR DISK MODE <#FI |                                   |
| ELD_DESCRIPTION_FOR_DISK_MODE>`__ |                                   |
| \|                                |                                   |
| `FIELD DESCRIPTION FOR D          |                                   |
| ISK PARTITION MODE <#FIELD_DESCRI |                                   |
| PTION_FOR_DISK_PARTITION_MODE>`__ |                                   |
| \|                                |                                   |
| `FIE                              |                                   |
| LD DESCRIPTION FOR SLAB MODE <#FI |                                   |
| ELD_DESCRIPTION_FOR_SLAB_MODE>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VMSTAT(8)                 System Administration                VMSTAT(8)

NAME
-------------------------------------------------

::

          vmstat - Report virtual memory statistics


---------------------------------------------------------

::

          vmstat [options] [delay [count]]


---------------------------------------------------------------

::

          vmstat reports information about processes, memory, paging, block
          IO, traps, disks and cpu activity.

          The first report produced gives averages since the last reboot.
          Additional reports give information on a sampling period of
          length delay.  The process and memory reports are instantaneous
          in either case.


-------------------------------------------------------

::

          delay  The delay between updates in seconds.  If no delay is
                 specified, only one report is printed with the average
                 values since boot.

          count  Number of updates.  In absence of count, when delay is
                 defined, default is infinite.

          -a, --active
                 Display active and  inactive memory, given a 2.5.41 kernel
                 or better.

          -f, --forks
                 The -f switch displays the number of forks since boot.
                 This includes the fork, vfork, and clone system calls, and
                 is equivalent to the total number of tasks created.  Each
                 process is represented by one or more tasks, depending on
                 thread usage.  This display does not repeat.

          -m, --slabs
                 Displays slabinfo.

          -n, --one-header
                 Display the header only once rather than periodically.

          -s, --stats
                 Displays a table of various event counters and memory
                 statistics.  This display does not repeat.

          -d, --disk
                 Report disk statistics (2.5.70 or above required).

          -D, --disk-sum
                 Report some summary statistics about disk activity.

          -p, --partition device
                 Detailed statistics about partition (2.5.70 or above
                 required).

          -S, --unit character
                 Switches outputs between 1000 (k), 1024 (K), 1000000 (m),
                 or 1048576 (M) bytes.  Note this does not change the block
                 (bi/bo) fields, which are always measured in blocks.

          -t, --timestamp
                 Append timestamp to each line

          -w, --wide
                 Wide output mode (useful for systems with higher amount of
                 memory, where the default output mode suffers from
                 unwanted column breakage).  The output is wider than 80
                 characters per line.

          -V, --version
                 Display version information and exit.

          -h, --help
                 Display help and exit.


---------------------------------------------------------------------------------------------------

::

      Procs
          r: The number of runnable processes (running or waiting for run time).
          b: The number of processes blocked waiting for I/O to complete.

      Memory
          These are affected by the --unit option.
          swpd: the amount of swap memory used.
          free: the amount of idle memory.
          buff: the amount of memory used as buffers.
          cache: the amount of memory used as cache.
          inact: the amount of inactive memory.  (-a option)
          active: the amount of active memory.  (-a option)

      Swap
          These are affected by the --unit option.
          si: Amount of memory swapped in from disk (/s).
          so: Amount of memory swapped to disk (/s).

      IO
          bi: Blocks received from a block device (blocks/s).
          bo: Blocks sent to a block device (blocks/s).

      System
          in: The number of interrupts per second, including the clock.
          cs: The number of context switches per second.

      CPU
          These are percentages of total CPU time.
          us: Time spent running non-kernel code.  (user time, including nice time)
          sy: Time spent running kernel code.  (system time)
          id: Time spent idle.  Prior to Linux 2.5.41, this includes IO-wait time.
          wa: Time spent waiting for IO.  Prior to Linux 2.5.41, included in idle.
          st: Time stolen from a virtual machine.  Prior to Linux 2.6.11, unknown.


-------------------------------------------------------------------------------------------------------

::

      Reads
          total: Total reads completed successfully
          merged: grouped reads (resulting in one I/O)
          sectors: Sectors read successfully
          ms: milliseconds spent reading

      Writes
          total: Total writes completed successfully
          merged: grouped writes (resulting in one I/O)
          sectors: Sectors written successfully
          ms: milliseconds spent writing

      IO
          cur: I/O in progress
          s: seconds spent for I/O


---------------------------------------------------------------------------------------------------------------------------

::

          reads: Total number of reads issued to this partition
          read sectors: Total read sectors for partition
          writes : Total number of writes issued to this partition
          requested writes: Total number of write requests made for partition


-------------------------------------------------------------------------------------------------------

::

          cache: Cache name
          num: Number of currently active objects
          total: Total number of available objects
          size: Size of each object
          pages: Number of pages with at least one active object


---------------------------------------------------

::

          vmstat does not require special permissions.

          These reports are intended to help identify system bottlenecks.
          Linux vmstat does not count itself as a running process.

          All linux blocks are currently 1024 bytes.  Old kernels may
          report blocks as 512 bytes, 2048 bytes, or 4096 bytes.

          Since procps 3.1.9, vmstat lets you choose units (k, K, m, M).
          Default is K (1024 bytes) in the default mode.

          vmstat uses slabinfo 1.1


---------------------------------------------------

::

          /proc/meminfo
          /proc/stat
          /proc/*/stat


---------------------------------------------------------

::

          free(1), iostat(1), mpstat(1), ps(1), sar(1), top(1)


-------------------------------------------------

::

          Does not tabulate the block io per device or count the number of
          system calls.


-------------------------------------------------------

::

          Written by Henry Ware ⟨al172@yfn.ysu.edu⟩.
          Fabian Frédérick ⟨ffrederick@users.sourceforge.net⟩ (diskstat,
          slab, partitions...)


---------------------------------------------------------------------

::

          Please send bug reports to ⟨procps@freelists.org⟩

COLOPHON
---------------------------------------------------------

::

          This page is part of the procps-ng (/proc filesystem utilities)
          project.  Information about the project can be found at 
          ⟨https://gitlab.com/procps-ng/procps⟩.  If you have a bug report
          for this manual page, see
          ⟨https://gitlab.com/procps-ng/procps/blob/master/Documentation/bugs.md⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://gitlab.com/procps-ng/procps.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   procps-ng                      2020-06-04                      VMSTAT(8)

--------------

Pages that refer to this page:
`cifsiostat(1) <../man1/cifsiostat.1.html>`__, 
`free(1) <../man1/free.1.html>`__, 
`iostat(1) <../man1/iostat.1.html>`__, 
`mpstat(1) <../man1/mpstat.1.html>`__, 
`nfsiostat-sysstat(1) <../man1/nfsiostat-sysstat.1.html>`__, 
`pidstat(1) <../man1/pidstat.1.html>`__, 
`pmrep(1) <../man1/pmrep.1.html>`__,  `sar(1) <../man1/sar.1.html>`__, 
`slabtop(1) <../man1/slabtop.1.html>`__, 
`top(1) <../man1/top.1.html>`__

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
