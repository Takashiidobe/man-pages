.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lscpu(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LSCPU(1)                      User Commands                     LSCPU(1)

NAME
-------------------------------------------------

::

          lscpu - display information about the CPU architecture


---------------------------------------------------------

::

          lscpu [options]


---------------------------------------------------------------

::

          lscpu gathers CPU architecture information from sysfs,
          /proc/cpuinfo and any applicable architecture-specific libraries
          (e.g. librtas on Powerpc). The command output can be optimized
          for parsing or for easy readability by humans. The information
          includes, for example, the number of CPUs, threads, cores,
          sockets, and Non-Uniform Memory Access (NUMA) nodes. There is
          also information about the CPU caches and cache sharing, family,
          model, bogoMIPS, byte order, and stepping.

          The default output formatting on terminal is subject to change
          and maybe optimized for better readability. The output for
          non-terminals (e.g., pipes) is never affected by this
          optimization and it is always in "Field: data\n" format. Use for
          example "lscpu | less" to see the default output without
          optimizations.

          In virtualized environments, the CPU architecture information
          displayed reflects the configuration of the guest operating
          system which is typically different from the physical (host)
          system. On architectures that support retrieving physical
          topology information, lscpu also displays the number of physical
          sockets, chips, cores in the host system.

          Options that result in an output table have a list argument. Use
          this argument to customize the command output. Specify a
          comma-separated list of column labels to limit the output table
          to only the specified columns, arranged in the specified order.
          See COLUMNS for a list of valid column labels. The column labels
          are not case sensitive.

          Not all columns are supported on all architectures. If an
          unsupported column is specified, lscpu prints the column but does
          not provide any data for it.

          The cache sizes are reported as summary from all CPUs. The
          versions before v2.34 reported per-core sizes, but this output
          was confusing due to complicated CPUs topology and the way how
          caches are shared between CPUs. For more details about caches see
          --cache. Since version v2.37 lscpu follows cache IDs as provided
          by Linux kernel and it does not always start from zero.


-------------------------------------------------------

::

          -a, --all
              Include lines for online and offline CPUs in the output
              (default for -e). This option may only be specified together
              with option -e or -p.

          -B, --bytes
              Print the sizes in bytes rather than in a human-readable
              format.

          -b, --online
              Limit the output to online CPUs (default for -p). This option
              may only be specified together with option -e or -p.

          -C, --caches[=list]
              Display details about CPU caches. For details about available
              information see --help output.

              If the list argument is omitted, all columns for which data
              is available are included in the command output.

              When specifying the list argument, the string of option,
              equal sign (=), and list must not contain any blanks or other
              whitespace. Examples: '-C=NAME,ONE-SIZE' or
              '--caches=NAME,ONE-SIZE'.

              The default list of columns may be extended if list is
              specified in the format +list (e.g., lscpu -C=+ALLOC-POLICY).

          -c, --offline
              Limit the output to offline CPUs. This option may only be
              specified together with option -e or -p.

          -e, --extended[=list]
              Display the CPU information in human-readable format.

              If the list argument is omitted, the default columns are
              included in the command output. The default output is subject
              to change.

              When specifying the list argument, the string of option,
              equal sign (=), and list must not contain any blanks or other
              whitespace. Examples: '-e=cpu,node' or '--extended=cpu,node'.

              The default list of columns may be extended if list is
              specified in the format +list (e.g., lscpu -e=+MHZ).

          -h, --help
              Display help text and exit.

          -J, --json
              Use JSON output format for the default summary or extended
              output (see --extended).

          -p, --parse[=list]
              Optimize the command output for easy parsing.

              If the list argument is omitted, the command output is
              compatible with earlier versions of lscpu. In this compatible
              format, two commas are used to separate CPU cache columns. If
              no CPU caches are identified the cache column is omitted. If
              the list argument is used, cache columns are separated with a
              colon (:).

              When specifying the list argument, the string of option,
              equal sign (=), and list must not contain any blanks or other
              whitespace. Examples: '-p=cpu,node' or '--parse=cpu,node'.

              The default list of columns may be extended if list is
              specified in the format +list (e.g., lscpu -p=+MHZ).

          -s, --sysroot directory
              Gather CPU data for a Linux instance other than the instance
              from which the lscpu command is issued. The specified
              directory is the system root of the Linux instance to be
              inspected.

          -x, --hex
              Use hexadecimal masks for CPU sets (for example "ff"). The
              default is to print the sets in list format (for example
              0,1). Note that before version 2.30 the mask has been printed
              with 0x prefix.

          -y, --physical
              Display physical IDs for all columns with topology elements
              (core, socket, etc.). Other than logical IDs, which are
              assigned by lscpu, physical IDs are platform-specific values
              that are provided by the kernel. Physical IDs are not
              necessarily unique and they might not be arranged
              sequentially. If the kernel could not retrieve a physical ID
              for an element lscpu prints the dash (-) character.

              The CPU logical numbers are not affected by this option.

          -V, --version
              Display version information and exit.

          --output-all
              Output all available columns. This option must be combined
              with either --extended, --parse or --caches.


-------------------------------------------------

::

          The basic overview of CPU family, model, etc. is always based on
          the first CPU only.

          Sometimes in Xen Dom0 the kernel reports wrong data.

          On virtual hardware the number of cores per socket, etc. can be
          wrong.


-------------------------------------------------------

::

          Cai Qian <qcai@redhat.com>, Karel Zak <kzak@redhat.com>, Heiko
          Carstens <heiko.carstens@de.ibm.com>


---------------------------------------------------------

::

          chcpu(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The lscpu command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-06-17                       LSCPU(1)

--------------

Pages that refer to this page:
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`sched(7) <../man7/sched.7.html>`__, 
`chcpu(8) <../man8/chcpu.8.html>`__

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
