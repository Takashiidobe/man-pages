.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcp-mpstat(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCP-MPSTAT(1)            General Commands Manual           PCP-MPSTAT(1)

NAME
-------------------------------------------------

::

          pcp-mpstat - Report CPU and interrupt related statistics.


---------------------------------------------------------

::

          pcp [pcp options] mpstat [ -A ] [ -u ] [ -V ] [ -I { SUM | CPU |
          SCPU | ALL } ] [ -P { cpu1,cpu2 [,...] | ON | ALL } ] [ -t
          interval ] [ -s count ] [ -a archive ] [ -? ]


---------------------------------------------------------------

::

          pcp-mpstat command writes to standard output activities for each
          available processor, processor 0 being the first one.  If no
          activity/option has been selected, then the default report is the
          CPU utilization (-u) report.

          The interval parameter specifies the amount of time in seconds
          between each report.  The default is one second.  The value of
          count parameter determines the number of samples to be displayed.
          The default is continous.


-------------------------------------------------------

::

          When invoked via the pcp(1) command, the -h/--host, -a/--archive,
          -O/--origin, -s/--samples, -t/--interval, -Z/--timezone and
          several other pcp options become indirectly available; refer to
          PCPIntro(1) for a complete description of these options.

          The additional command line options available for pcp-mpstat are:

          -A     This option is equivalent to specifying -u -I ALL -P ALL

          -I { SUM | CPU | SCPU | ALL }
                 Report interrupts statistics.
                 With the SUM keyword, the pcp-mpstat command reports the
                 total number of interrupts per processor.  The following
                 values are displayed:

          CPU
                        Processor number.  The keyword all indicates that
                        statistics are calculated as averages among all
                        processors.

                 intr/s
                        Show the total number of interrupts received per
                        second by the CPU or CPUs.

                 With the CPU keyword, the number of each individual
                 interrupt received per second by the CPU or CPUs is
                 displayed.  Interrupts are those under the
                 kernel.percpu.interrupts metric tree.

                 With the SCPU keyword, the number of each individual
                 software interrupt received per second by the CPU or CPUs
                 is displayed.  Software interrupts are those under the
                 kernel.percpu.softirqs tree

                 The ALL keyword is equivalent to specifying all the
                 keywords above and therefore all the interrupts statistics
                 are displayed.

          -P { cpu1,cpu2[,...] | ON | ALL }
                 Indicate the processor number for which statistics are to
                 be reported.  cpu1 and cpu2 are the processor numbers.  A
                 list of required processor numbers can be provided.  Note
                 that processor 0 is the first processor.

                 The ON keyword indicates that statistics are to be
                 reported for every online processor, whereas the ALL
                 keyword indicates that statistics are to be reported for
                 all processors.

          -u     Report CPU utilization.  The following values are
                 displayed:

                 CPU
                        Processor number.  The keyword ALL indicates that
                        statistics are calculated as averages among all
                        processors.

                 %usr
                        Show the percentage of CPU utilization that
                        occurred while executing at the user level
                        (application).

                 %nice
                        Show the percentage of CPU utilization that
                        occurred while executing at the user level with
                        nice priority.

                 %sys
                        Show the percentage of CPU utilization that
                        occurred while executing at the system level
                        (kernel).  Note that this does not include time
                        spent servicing hardware and software interrupts.

                 %iowait
                        Show the percentage of time that the CPU or CPUs
                        were idle during which the system had an
                        outstanding disk I/O request.

                 %irq
                        Show the percentage of time spent by the CPU or
                        CPUs to service hardware interrupts.

                 %soft
                        Show the percentage of time spent by the CPU or
                        CPUs to service software interrupts.

                 %steal
                        Show the percentage of time spent in involuntary
                        wait by the virtual CPU or CPUs while the
                        hypervisor was servicing another virtual processor.

                 %guest
                        Show the percentage of time spent by the CPU or
                        CPUs to run a virtual processor.

                 %gnice
                        Show the percentage of time spent by the CPU or
                        CPUs to run a niced guest.

                 %idle
                        Show the percentage of time that the CPU or CPUs
                        were idle and the system did not have an
                        outstanding disk I/O request.

                 Note: On SMP machines a processor that does not have any
                 activity at all is a disabled (offline) processor.

          -s  N , --samples = N
                 Set the number of samples to be displayed.  Since the
                 first sample is used for the rate conversion of some of
                 the metrics, the total number of samples reported are one
                 less that N.  Default is continous.

          -t DELTA , --interval = DELTA
                 Set the interval between two samples.  The default is one
                 second.

          -a  FILE , --archive = FILE
                 Causes pcp-mpstat to use the specified archive than
                 connecting to PMCD.  The argument to -a is a comma-
                 separated list of names, each of which may be the base
                 name of an archive or the name of a directory containing
                 one or more archives.

          -V , --version
                 Print version number then exit.

          -? , --help
                 Print usage message then exit.


---------------------------------------------------------

::

          pcp-mpstat -t 2 -s 5
                 Display four reports of global statistics among all
                 processors at two second intervals.

          pcp mpstat -P ALL -t 2 -s 5
                 Display four reports of statistics for all processors at
                 two second intervals.


---------------------------------------------------

::

          pcp-mpstat is inspired by the mpstat(1) command and aims to be
          command line and output compatible with it.


---------------------------------------------------------------

::

          TZ and LC_TIME environment variables can be used to override the
          default date display format for pcp-mpstat.


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).

          For environment variables affecting PCP tools, see
          pmGetOptions(3).


---------------------------------------------------------

::

          PCPIntro(1), pcp(1), mpstat(1), pmParseInterval(3),
          pmTraversePMNS(3) and environ(7).

COLOPHON
---------------------------------------------------------

::

          This page is part of the PCP (Performance Co-Pilot) project.
          Information about the project can be found at 
          ⟨http://www.pcp.io/⟩.  If you have a bug report for this manual
          page, send it to pcp@groups.io.  This page was obtained from the
          project's upstream Git repository
          ⟨https://github.com/performancecopilot/pcp.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Performance Co-Pilot               PCP                     PCP-MPSTAT(1)

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
