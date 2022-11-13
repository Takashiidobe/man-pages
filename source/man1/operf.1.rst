.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

operf(1) — Linux manual page
============================

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

   OPERF(1)                 General Commands Manual                OPERF(1)

NAME
-------------------------------------------------

::

          operf - Performance profiler tool for Linux


---------------------------------------------------------

::

          operf [ options ] [ --system-wide | --pid <pid> | [ command [
          args ] ] ]


---------------------------------------------------------------

::

          Operf is the profiler tool provided with OProfile. Operf uses the
          Linux Performance Events Subsystem and, thus, does not require
          the obsolete oprofile kernel driver.

          By default, operf uses <current_dir>/oprofile_data as the
          session-dir and stores profiling data there.  You can change this
          by way of the --session-dir option. The usual post-profiling
          analysis tools such as opreport(1) and opannotate(1) can be used
          to generate profile reports. Unless a session-dir is specified,
          the post-processing analysis tools will search for samples in
          <current_dir>/oprofile_data first. If that directory does not
          exist, the post-processing tools use the standard session-dir of
          /var/lib/oprofile.

          Statistics, such as total samples received and lost samples, are
          written to the operf.log file that can be found in the
          <session_dir>/samples directory.


-----------------------------------------------------------

::

          One (and only one) of the following run modes must be specified:

          command[args]
                 The command or application to be profiled.  args are the
                 input arguments that the command or application requires.

          --pid / -p PID
                 This option enables operf to profile a running
                 application.  PID should be the process ID of the process
                 you wish to profile.  When finished profiling (e.g., when
                 the profiled process ends), press Ctrl-c to stop operf. If
                 you run operf --pid as a background job (i.e., with the
                 &), you must stop it in a controlled manner in order for
                 it to process the profile data it has collected.  Use kill
                 -SIGINT <operf-PID> for this purpose.

                 Limitation: When using this option to profile a multi-
                 threaded application that also forks new processes, be
                 aware that samples for processes that are forked before
                 profiling is started may not be recorded (depending on
                 timing of thread creation and when operf is started).

          --system-wide / -s
                 This option is for performing a system-wide profile.  You
                 must have root authority to run operf in this mode.  When
                 finished profiling, Ctrl-c to stop operf. If you run operf
                 --system-wide as a background job (i.e., with the &), you
                 must stop it in a controlled manner in order for it to
                 process the profile data it has collected.  Use kill
                 -SIGINT <operf-PID> for this purpose.  It is recommended
                 that when running operf with this option, the user's
                 current working directory should be /root or a
                 subdirectory of /root to avoid storing sample data files
                 in locations accessible by regular users.


-------------------------------------------------------------------

::

          --vmlinux / -k vmlinux_path
                 A vmlinux file that matches the running kernel that has
                 symbol and/or debuginfo.  Kernel samples will be
                 attributed to this binary, allowing post-processing tools
                 (like opreport) to attribute samples to the appropriate
                 kernel symbols.

                 The kernel symbol information may be obtained from
                 /proc/kallsyms if the user does not specify a vmlinux
                 file.  The symbol addresses are given in /proc/kallsyms if
                 permitted by the setting of
                 /proc/sys/kernel/kptr_restrict.

                 If the --vmlinux option is not used and kernel symbols
                 cannot be obtained from /proc/kallsyms, then all kernel
                 samples are attributed to "no-vmlinux", which is simply a
                 bucket to hold the samples and not an actual file.

          --events / -e event1[,event2[,...]]
                 This option is for passing a comma-separated list of event
                 specifications for profiling. Each event spec is of the
                 form:
                    name:count[:unitmask[:kernel[:user]]]

                 The count value is used to control the sampling rate for
                 profiling; it is the number of events to occur between
                 samples. The rate is lowered by specifying a higher count
                 value — i.e., a higher number of events to occur between
                 samples.

                 You can specify unitmask values using either a numerical
                 value (hex values must begin with "0x") or a symbolic name
                 (if the name=<um_name> field is shown in the ophelp
                 output). For some named unit masks, the hex value is not
                 unique; thus, OProfile tools enforce specifying such unit
                 masks value by name.  If no unit mask is specified, the
                 default unit mask value for the event is used.

                 The kernel and user parts of the event specification are
                 binary values ('1' or '0') indicating whether or not to
                 collect samples for kernel space and user space.
                 Note: In order to specify the kernel/user bits, you must
                 also specify a unitmask value, even if the processor type
                 (or the specified event) does not use unit masks — in
                 which case, use the value '0' to signify a null unit mask;
                 for example:
                    -e INST_RETIRED_ANY_P:100000:0:1:0
                                          ^      ^ ^ ^
                                          |      | | |--- '0': do not
                 record user space samples
                                          |      | |-- '1': record kernel
                 space samples
                                          |      |-- '0': the null unit
                 mask
                                          |--count value

                 Event names for some IBM PowerPC systems include a _GRP<n>
                 (group number) suffix. You can pass either the full event
                 name or the base event name (i.e., without the suffix) to
                 operf.  If the base event name is passed, operf will
                 automatically choose an appropriate group number suffix
                 for the event; thus, OProfile post-processing tools will
                 always show real event names that include the group number
                 suffix.

                 When no event specification is given, the default event
                 for the running processor type will be used for profiling.
                 Use ophelp to list the available events for your processor
                 type.

          --callgraph / -g
                 This option enables the callgraph to be saved during
                 profiling. NOTE: The full callchain is recorded, so there
                 is no depth limit.

          --separate-thread / -t
                 This option categorizes samples by thread group ID (tgid)
                 and thread ID (tid).  The '--separate-thread' option is
                 useful for seeing per-thread samples in multi-threaded
                 applications.  When used in conjunction with the
                 '--system-wide' option, the '--separate-thread' option is
                 also useful for seeing per-process (i.e., per-thread
                 group) samples for the case where multiple processes are
                 executing the same program during a profiling run.

          --separate-cpu / -c
                 This option categorizes samples by cpu.

          --session-dir / -d path
                 This option specifies the session path to hold the sample
                 data. If not specified, the data is saved in the
                 oprofile_data directory on the current path.

          --lazy-conversion / -l
                 Use this option to reduce the overhead of operf during
                 profiling. Normally, profile data received from the kernel
                 is converted to OProfile format during profiling time.
                 This is typically not an issue when profiling a single
                 application. But when using the --system-wide option, this
                 on-the-fly conversion process can cause noticeable
                 overhead, particularly on busy multi-processor systems.
                 The --lazy-conversion option directs operf to wait until
                 profiling is completed to do the conversion of profile
                 data.

                 Note: This option is not recommended to be used in
                 conjunction with the --pid option for profiling multi-
                 threaded processes. Depending on the order of thread
                 creation (or forking of new processes), you may not get
                 any samples for the new threads/processes.

          --append / -a
                 By default, operf moves old profile data from
                 <session_dir>/samples/current to
                 <session_dir>/samples/previous.  If a 'previous' profile
                 already existed, it will be replaced.  If the --append
                 option is passed, old profile data is left in place and
                 new profile data will be added to it, and the 'previous'
                 profile (if one existed) will remain untouched.  To access
                 the 'previous' profile, simply add a session specification
                 to the normal invocation of oprofile post-processing
                 tools.  For example:
                    opreport session:previous

          --verbose / -V level
                 A comma-separated list of debugging control values, used
                 to increase the verbosity of the output.  Valid values
                 are:  debug, record, convert, misc, sfile, arcs, or the
                 special value, 'all'.

          --version / -v
                 Show operf version.

          --help / -h
                 Display brief usage message.

          --usage / -u
                 Display brief usage message.


-------------------------------------------------------

::

          $ operf make


-------------------------------------------------------

::

          This man page is current for oprofile-1.5.0git.


---------------------------------------------------------

::

          opreport(1), opannotate(1).

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

   oprofile 1.5.0git          Fri 27 August 2021                   OPERF(1)

--------------

Pages that refer to this page: `ocount(1) <../man1/ocount.1.html>`__

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
