.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

opcontrol(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OPTIONS (specific to Xen         |                                   |
| ) <#OPTIONS_(specific_to_Xen)>`__ |                                   |
| \|                                |                                   |
| `O                                |                                   |
| PTIONS (specific to System z) <#O |                                   |
| PTIONS_(specific_to_System_z)>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `VERSION <#VERSION>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   OPCONTROL(1)             General Commands Manual            OPCONTROL(1)

NAME
-------------------------------------------------

::

          opcontrol - control OProfile profiling


---------------------------------------------------------

::

          opcontrol [ options ]


---------------------------------------------------------------

::

          opcontrol can be used to start profiling, end a profiling
          session, dump profile data, and set up the profiling parameters.


-------------------------------------------------------

::

          --help / -?
                 Show help message.

          --version / -v
                 Show version.

          --list-events / -l
                 Shows the monitorable events.

          --init Load the OProfile module if required and make the OProfile
                 driver interface available.

          --setup
                 Followed by list options for profiling setup. Store setup
                 in ~root/.oprofile/daemonrc. Optional.

          --status
                 Show configuration information.

          --start-daemon
                 Start the oprofile daemon without starting profiling.

          --start / -s
                 Start data collection with either arguments provided by
                 --setup or with information saved in
                 ~root/.oprofile/daemonrc.

          --dump / -d
                 Force a flush of the collected profiling data to the
                 daemon.

          --stop / -t
                 Stop data collection.

          --shutdown / -h
                 Stop data collection and kill the daemon.

          --reset
                 Clear out data from current session, but leaves saved
                 sessions.

          --save=sessionname
                 Save data from current session to sessionname.

          --deinit
                 Shut down daemon. Unload the oprofile module and
                 oprofilefs.

          --session-dir=dir_path
                 Use sample database out of directory dir_path instead of
                 the default location (/var/lib/oprofile).

          --buffer-size=num
                 Set kernel buffer to num samples. The buffer watershed
                 needs to be tweaked when changing this value.  Rules:  A
                 non-zero value goes into effect after a '--shutdown/start'
                 sequence.  A value of zero sets this parameter back to
                 default value, but does not go into effect until after
                 '--deinit/init' sequence.

          --buffer-watershed=num
                 Set kernel buffer watershed to num samples. When buffer-
                 size - buffer-watershed free entries remain in the kernel
                 buffer, data will be flushed to the daemon.  Most useful
                 values are in the range [0.25 - 0.5] * buffer-size.  Same
                 rules as defined for buffer-size.

          --cpu-buffer-size=num
                 Set kernel per-cpu buffer to num samples. If you profile
                 at high rate it can help to increase this if the log file
                 show excessive count of sample lost cpu buffer overflow.
                 Same rules as defined for buffer-size.

          --event / -e [event|"default"]
                 Specify an event to measure for the hardware performance
                 counters, or "default" for the default event. The event is
                 of the form "CPU_CLK_UNHALTED:30000:0:1:1" where the
                 numeric values are count, unit mask, kernel-space
                 counting, user-space counting, respectively.  Note that
                 this over-rides all previous events selected; if you want
                 to profile with two or more events simultaneously, you
                 must specify them on the same opcontrol invocation. You
                 can specify unit mask values using either a numerical
                 value (hex values must begin with "0x") or a symbolic name
                 (if the name=<um_name> field is shown in the ophelp
                 output). For some named unit masks, the hex value is not
                 unique; thus, OProfile tools enforce specifying such unit
                 masks value by name.

          --separate / -p [none,lib,kernel,thread,cpu,all]
                 Separate samples based on the given separator. 'lib'
                 separates dynamically linked library samples per
                 application. 'kernel' separates kernel and kernel module
                 samples per application; 'kernel' implies 'library'.
                 'thread' gives separation for each thread and task.  'cpu'
                 separates for each CPU. 'all' implies all of the above
                 options and 'none' turns off separation.

          --callgraph / -c [#depth]
                 Enable callgraph sample collection with a maximum depth.
                 Use 0 to disable callgraph profiling. This option is
                 available on x86 using a 2.6+ kernel with callgraph
                 support enabled.  It is also available on PowerPC using a
                 2.6.17+ kernel.

          --image / -i [name,name...|"all"]
                 Only profile the given absolute paths to binaries, or
                 "all" to profile everything (the default).

          --vmlinux=file
                 vmlinux kernel image.

          --no-vmlinux
                 Use this when you don't have a kernel vmlinux file, and
                 you don't want to profile the kernel.

          --verbose / -V [options]
                 Be verbose in the daemon log. This has a high overhead.

          --kernel-range=start,end
                 Set kernel range vma address in hexadecimal.


-------------------------------------------------------------------------------------------

::

          --xen=file
                 Xen image

          --active-domains=<list>
                 List of domain ids participating in a multi-domain
                 profiling session. If more than one domain is specified in
                 <list> they should be separated using commas. This option
                 can only be used in domain 0 which is the only domain that
                 can coordinate a multi-domain profiling session. Including
                 domain 0 in the list of active domains is optional. (e.g.
                 --active-domains=2,5,6 and --active-domains=0,2,5,6 are
                 equivalent)


-----------------------------------------------------------------------------------------------------

::

          --s390hwsampbufsize=num
                 Number of 2MB areas used per CPU for storing sample data.
                 The best size for the sample memory depends on the
                 particular system and the workload to be measured.
                 Providing the sampler with too little memory results in
                 lost samples. Reserving too much system memory for the
                 sampler impacts the overall performance and, hence, also
                 the workload to be measured.


---------------------------------------------------------------

::

          No special environment variables are recognised by opcontrol.


---------------------------------------------------

::

          /root/.oprofile/daemonrc
                 Configuration file for opcontrol

          /var/lib/oprofile/samples/
                 The location of the generated sample files.


-------------------------------------------------------

::

          This man page is current for oprofile-1.0.0git.


---------------------------------------------------------

::

          /usr/local/share/doc/oprofile/, oprofile(1)

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

   4th Berkeley Distribution   Sun 20 July 2014                OPCONTROL(1)

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
