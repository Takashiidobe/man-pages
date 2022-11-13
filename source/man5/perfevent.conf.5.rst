.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

perfevent.conf(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILE FORMAT <#FILE_FORMAT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PERFEVENT.CONF(5)          File Formats Manual         PERFEVENT.CONF(5)

NAME
-------------------------------------------------

::

          perfevent.conf - the Performance Co-Pilot perfevent PMDA
          configuration file


---------------------------------------------------------

::

          $PCP_PMDAS_DIRS/perfevent/perfevent.conf


---------------------------------------------------------------

::

          The perfevent.conf configuration file defines which hardware
          performance counters are enabled by the perfevent PMDA.

          The configuration file contains a list of events that should be
          enabled for each PMU. The perfevent PMDA detects which PMUs
          present and programs the configured events. If multiple PMUs are
          available, the perfevent PMDA uses the order of the entries in
          the configuration file to determine which PMU settings to use.
          The entries at the top of the configuration file have higher
          precedence.  Only one PMU configuration setting is used. The
          configuration file may also contain perf derived events. A
          derived event has a list of events which must be listed as base
          events. The values for the counters in the derived events are
          aggregated and displayed.


---------------------------------------------------------------

::

          The file consists of one or more groups of PMUs and the events
          that go with them.

          The PMU identification string is enclosed in brackets and one or
          more events are listed below, one per line.

                 ["PMU identification string"]
                 EVENT_NAME [CPU OPTION]
                 ...

          For derived events, one or more groups of events can be specified
          where, counters in one group can be specific to one architecture
          and the counters in other group can be specific to some other
          architecture. Else, only one group can be specified.
          EVENT_NAME_1, EVENT_NAME_2 etc. belong to group 1 and
          EVENT_NAME_3, EVENT_NAME_4 belong to group 2 and so on. If any of
          the event in the first group is not available, entire group will
          be discarded. And, the next group will be checked. The first
          group with all the events available will be activated and
          monitored. The derived perf event is enclosed in brackets along
          with :derived as a suffix. Note that the EVENT_NAME listed under
          derived event must be present as a base event in the
          configuration file. And, all the events under a particular
          derived perf event group must have the same CPU_OPTION. || acts
          as a separator for different groups inside a single derived
          event. The syntax is :

                 [event:derived]
                 EVENT_NAME_1 [CPU_OPTION] [scale]
                 EVENT_NAME_2 [CPU_OPTION] [scale]
                 ...
                 ||
                 EVENT_NAME_3 [CPU_OPTION] [scale]
                 EVENT_NAME_4 [CPU_OPTION] [scale]
                 ...

                 The available event cpu options are as follows:

                 cpu    to add the counter to all cpus in the system

                 cpu_rr to add to one of the cpus in a round-robin
                        allocation strategy

                 node   to add the counter to the first cpu in each numa
                        node

                 node_rr
                        to add the counter to the cpus in each numa node in
                        a round-robin allocation strategy

                 [N]    where N is the numerical digit of the CPU index

                 if the CPU option is absent then the event is programmed
                 on all cpus.

                 scale is applicable for the counters in derived events. If
                 scale is given, the counters will be scaled to their
                 respective values. The options are as follows :

                 a float value
                        Can be a simple float value, or a value in
                        scientific notation.

                 perf_scale
                        The scale will be taken from the kernel sysfs scale
                        file entry for that event. Its generally specified
                        in
                        /sys/bus/event_source/device/events/<event_name>.scale

                 If no scale is given, the default scale will be taken as
                 1.0.

                 Blank lines are ignored. Lines that begin with the # sign
                 are ignored.

                 Multiple, comma separated, PMUs may be specified in the
                 PMU definition.


---------------------------------------------------------

::

          pmdaperfevent(1).

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

   Performance Co-Pilot               PCP                 PERFEVENT.CONF(5)

--------------

Pages that refer to this page:
`pmdaperfevent(1) <../man1/pmdaperfevent.1.html>`__

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
