.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perf-kvm(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `STAT REPORT                      |                                   |
| OPTIONS <#STAT_REPORT_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `STAT LIV                         |                                   |
| E OPTIONS <#STAT_LIVE_OPTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERF-KVM(1)                    perf Manual                   PERF-KVM(1)

NAME
-------------------------------------------------

::

          perf-kvm - Tool to trace/measure kvm guest os


---------------------------------------------------------

::

          perf kvm [--host] [--guest] [--guestmount=<path>
                  [--guestkallsyms=<path> --guestmodules=<path> | --guestvmlinux=<path>]]
                  {top|record|report|diff|buildid-list} [<options>]
          perf kvm [--host] [--guest] [--guestkallsyms=<path> --guestmodules=<path>
                  | --guestvmlinux=<path>] {top|record|report|diff|buildid-list|stat} [<options>]
          'perf kvm stat [record|report|live] [<options>]


---------------------------------------------------------------

::

          There are a couple of variants of perf kvm:

              'perf kvm [options] top <command>' to generates and displays
              a performance counter profile of guest os in realtime
              of an arbitrary workload.

              'perf kvm record <command>' to record the performance counter profile
              of an arbitrary workload and save it into a perf data file. We set the
              default behavior of perf kvm as --guest, so if neither --host nor --guest
              is input, the perf data file name is perf.data.guest. If --host is input,
              the perf data file name is perf.data.kvm. If you want to record data into
              perf.data.host, please input --host --no-guest. The behaviors are shown as
              following:
                Default('')         ->  perf.data.guest
                --host              ->  perf.data.kvm
                --guest             ->  perf.data.guest
                --host --guest      ->  perf.data.kvm
                --host --no-guest   ->  perf.data.host

              'perf kvm report' to display the performance counter profile information
              recorded via perf kvm record.

              'perf kvm diff' to displays the performance difference amongst two perf.data
              files captured via perf record.

              'perf kvm buildid-list' to  display the buildids found in a perf data file,
              so that other tools can be used to fetch packages with matching symbol tables
              for use by perf report. As buildid is read from /sys/kernel/notes in os, then
              if you want to list the buildid for guest, please make sure your perf data file
              was captured with --guestmount in perf kvm record.

              'perf kvm stat <command>' to run a command and gather performance counter
              statistics.
              Especially, perf 'kvm stat record/report' generates a statistical analysis
              of KVM events. Currently, vmexit, mmio (x86 only) and ioport (x86 only)
              events are supported. 'perf kvm stat record <command>' records kvm events
              and the events between start and end <command>.
              And this command produces a file which contains tracing results of kvm
              events.

              'perf kvm stat report' reports statistical data which includes events
              handled time, samples, and so on.

              'perf kvm stat live' reports statistical data in a live mode (similar to
              record + report but with statistical data updated live at a given display
              rate).


-------------------------------------------------------

::

          -i, --input=<path>
              Input file name, for the report, diff and buildid-list
              subcommands.

          -o, --output=<path>
              Output file name, for the record subcommand. Doesn’t work
              with report, just redirect the output to a file when using
              report.

          --host
              Collect host side performance profile.

          --guest
              Collect guest side performance profile.

          --guestmount=<path>
              Guest os root file system mount directory. Users mounts guest
              os root directories under <path> by a specific filesystem
              access method, typically, sshfs. For example, start 2 guest
              os. The one’s pid is 8888 and the other’s is 9999. #mkdir
              /guestmount; cd/guestmount #sshfs -o allow_other,direct_io -p
              5551 localhost:/ 8888/ #sshfs -o allow_other,direct_io -p
              5552 localhost:/ 9999/ #perf kvm --host --guest
              --guestmount=~/guestmount top

          --guestkallsyms=<path>
              Guest os /proc/kallsyms file copy.  perf kvm' reads it to get
              guest kernel symbols. Users copy it out from guest os.

          --guestmodules=<path>
              Guest os /proc/modules file copy.  perf kvm' reads it to get
              guest kernel module information. Users copy it out from guest
              os.

          --guestvmlinux=<path>
              Guest os kernel vmlinux.

          -v, --verbose
              Be more verbose (show counter open errors, etc).


-------------------------------------------------------------------------------

::

          --vcpu=<value>
              analyze events which occur on this vcpu. (default: all vcpus)

          --event=<value>
              event to be analyzed. Possible values: vmexit, mmio (x86
              only), ioport (x86 only). (default: vmexit)

          -k, --key=<value>
              Sorting key. Possible values: sample (default, sort by
              samples number), time (sort by average time).

          -p, --pid=
              Analyze events only for given process ID(s) (comma separated
              list).


---------------------------------------------------------------------------

::

          -d, --display
              Time in seconds between display updates

          -m, --mmap-pages=
              Number of mmap data pages (must be a power of two) or size
              specification with appended unit character - B/K/M/G. The
              size is rounded up to have nearest pages power of two value.

          -a, --all-cpus
              System-wide collection from all CPUs.

          -p, --pid=
              Analyze events only for given process ID(s) (comma separated
              list).

          --vcpu=<value>
              analyze events which occur on this vcpu. (default: all vcpus)

          --event=<value>
              event to be analyzed. Possible values: vmexit, mmio (x86
              only), ioport (x86 only). (default: vmexit)

          -k, --key=<value>
              Sorting key. Possible values: sample (default, sort by
              samples number), time (sort by average time).

          --duration=<value>
              Show events other than HLT (x86 only) or Wait state (s390
              only) that take longer than duration usecs.

          --proc-map-timeout
              When processing pre-existing threads /proc/XXX/mmap, it may
              take a long time, because the file may be huge. A time out is
              needed in such cases. This option sets the time out limit.
              The default value is 500 ms.


---------------------------------------------------------

::

          perf-top(1), perf-record(1), perf-report(1), perf-diff(1),
          perf-buildid-list(1), perf-stat(1)

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

   perf                           2019-12-02                    PERF-KVM(1)

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
