.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ocount(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RUN MODES <#RUN_MODES>`__ \|     |                                   |
| `                                 |                                   |
| OTHER OPTIONS <#OTHER_OPTIONS>`__ |                                   |
| \| `EXAMPLE <#EXAMPLE>`__ \|      |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ocount(1)                General Commands Manual               ocount(1)

NAME
-------------------------------------------------

::

          ocount - Event counting tool for Linux


---------------------------------------------------------

::

          ocount [ options ] [ --system-wide | --process-list <pids> |
          --thread-list <tids> | --cpu-list <cpus> | [ command [ args ] ] ]


---------------------------------------------------------------

::

          ocount is an OProfile tool that can be used to count native
          hardware events occurring in either a given application, a set of
          processes or threads, a subset of active system processors, or
          the entire system. The data collected during a counting session
          is displayed to stdout by default or, optionally, to a file.

          When counting multiple events, the kernel may not be able to
          count all events simultaneously and, thus, may need to multiplex
          the counting of the events.  If this happens, the "Percent time
          enabled" column in the ocount output will be less than 100, but
          counts are scaled up to a 100% estimated value.


-----------------------------------------------------------

::

          One (and only one) of the following run modes must be specified.
          If you run ocount using a run mode other than command [args] ,
          press Ctrl-c to stop ocount when finished counting (e.g., when
          the monitored process ends).  If you background ocount (i.e.,
          with '&') while using one these run modes, you must stop it in a
          controlled manner so that the data collection process can be shut
          down cleanly and final results can be displayed. Use kill -SIGINT
          <ocount-PID> for this purpose.

          command [args]
                 The command is the application for which to count events.
                 args are the input arguments required by the application.
                 The command and its arguments must be positioned at the
                 end of the command line, after all ocount options.

          --process-list / -p pids
                 Use this option to count events for one or more already-
                 running applications, specified via a comma-separated list
                 ( pids ). Event counts will be collected for all children
                 of the passed process(es) as well. You must have
                 privileges for the user ID under which the specified
                 process(es) are running; e.g., for a non-root user, the
                 user ID of the process(es) is the same as that used for
                 running ocount. A lack of privileges will result in the
                 following failure message:
                         perf_event_open failed with Permission denied

          --thread-list / -r tids
                 Use this option to count events for one or more already-
                 running threads, specified via a comma-separated list (
                 tids ). Event counts will not be collected for any
                 children of the passed thread(s). See the description of
                 --process-list concerning required privileges.

          --system-wide / -s
                 This option is for counting events for all processes
                 running on your system.  You must have root authority to
                 run ocount in this mode.

          --cpu-list / -C cpus
                 This option is for counting events on a subset of
                 processors on your system. You must have root authority to
                 run ocount in this mode. This is a comma-separated list,
                 where each element in the list may be either a single
                 processor number or a range of processor numbers; for
                 example: '-C 2,3,4-11,15'.


-------------------------------------------------------------------

::

          --events / -e event1[,event2[,...]]
                 This option is for passing a comma-separated list of event
                 specifications for counting. Each event spec is of the
                 form:
                    name[:unitmask[:kernel[:user]]]
                 Note: Do not include a count value in the event spec, as
                 that parameter is only needed when profiling.

                 You can specify unitmask values using either a numerical
                 value (hex values must begin with "0x") or a symbolic name
                 (if the name=<um_name> field is shown in the ophelp
                 output). For some named unit masks, the hex value is not
                 unique; thus, OProfile tools enforce specifying such unit
                 masks value by name.  If no unit mask is specified, the
                 default unit mask value for the event is used.

                 The kernel and user parts of the event specification are
                 binary values ('1' or '0') indicating whether or not to
                 count events in kernel space and user space.
                 Note: In order to specify the kernel/user bits, you must
                 also specify a unitmask value, even if the running
                 processor type does not use unit masks — in which case,
                 use the value '0' to signify a null unit mask; for
                 example:
                    -e INST_RETIRED_ANY_P:0:1:0
                                          ^ ^ ^
                                          | | |--- '0': do not count user
                 space events
                                          | |-- '1': count kernel space
                 events
                                          |-- '0': the null unit mask

                 Event names for certain processor types include a _GRP<n>
                 suffix.  For such cases, the --events option may be
                 specified with or without the _GRP<n> suffix.

                 When no event specification is given, the default event
                 for the running processor type will be used for counting.
                 Use ophelp to list the available events for your processor
                 type.

          --separate-thread / -t
                 This option can be used in conjunction with either the
                 --process-list or --thread-list option to display event
                 counts on a per-thread (per-process) basis.  Without this
                 option, all counts are aggregated.

                 NOTE: If new threads are started by the process(es) being
                 monitored after counting begins, the counts for those
                 threads are aggregated with their parent's counts.

          --separate-cpu / -c
                 This option can be used in conjunction with either the
                 --system-wide or --cpu-list option to display event counts
                 on a per-cpu basis.  Without this option, all counts are
                 aggregated.

          --time-interval / -i interval_length[:num_intervals]

                 Note: The interval_length is given in milliseconds.
                 However, the current implementation only supports 100 ms
                 granularity, so the given interval_length will be rounded
                 to the nearest 100 ms.  Results collected for each time
                 interval are printed immediately instead of the default of
                 one dump of cumulative event counts at the end of the run.
                 Counters are reset to zero at the start of each interval.

                 If num_intervals is specified, ocount exits after the
                 specified number of intervals occur.

          --brief-format / -b
                 Use this option to print results in the following brief
                 format:
                     [cpu or
                 thread,]<event_name>[:umask[:K:U]],<count>,<percent_time_enabled>
                     [    <u32>    ,]<  string  >[< u32>[<bb>]],< u64 >,<
                 double       >

                 The umask, Kernel and User modes are only printed if the
                 values were specified as part of the event.  The 'K' and
                 'U' fields are binary fields separated by colons, where
                 the value for each binary field may be either '0' or '1'.

                 If --timer-interval is specified, a separate line
                 formatted as
                     timestamp,<num_seconds_since_epoch>[.n]
                 is printed ahead of each dump of event counts. If the time
                 interval specified is less than one second, the timestamp
                 will have 1/10 second precision.

          --output-file / -f outfile_name
                 Results are written to outfile_name instead of
                 interactively to the terminal.

          --verbose / -V
                 Use this option to increase the verbosity of the output.

          --version / -v
                 Show ocount version.

          --help / -h
                 Display brief usage message.

          --usage / -u
                 Display brief usage message.


-------------------------------------------------------

::

          $ ocount make


-------------------------------------------------------

::

          This man page is current for oprofile-1.5.0git.


---------------------------------------------------------

::

          operf(1).

COLOPHON
---------------------------------------------------------

::

          This page is part of the oprofile (a system-wide profiler for
          Linux) project.  Information about the project can be found at 
          ⟨http://oprofile.sourceforge.net/news/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://oprofile.sourceforge.net/bugs/⟩.  This page was obtained
          from the project's upstream Git repository ⟨git clone
          git://git.code.sf.net/p/oprofile/oprofile⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-03-10.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   oprofile 1.5.0git          Fri 27 August 2021                  ocount(1)

--------------

Pages that refer to this page: `oprofile(1) <../man1/oprofile.1.html>`__

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
