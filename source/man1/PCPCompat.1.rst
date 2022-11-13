.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pcpcompat(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `INTRODUCTION <#INTRODUCTION>`__  |                                   |
| \| `SAR2PCP <#SAR2PCP>`__ \|      |                                   |
| `PMLO                             |                                   |
| GCONF-SETUP <#PMLOGCONF-SETUP>`__ |                                   |
| \| `PMMGR <#PMMGR>`__ \|          |                                   |
| `PCP-COLLECTL <#PCP-COLLECTL>`__  |                                   |
| \| `PCP-WEBAPPS <#PCP-WEBAPPS>`__ |                                   |
| \| `PMWEBD <#PMWEBD>`__ \|        |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PCPCOMPAT(1)             General Commands Manual            PCPCOMPAT(1)

NAME
-------------------------------------------------

::

          PCPCompat, pcp-collectl, pmmgr, pmwebd - backward-compatibility
          in the Performance Co-Pilot (PCP)


-----------------------------------------------------------------

::

          The Performance Co-Pilot (PCP) is a toolkit designed for
          monitoring and managing system-level performance.  These services
          are distributed and scalable to accommodate the most complex
          system configurations and performance problems.

          In order to achieve these goals effectively, protocol and on-disk
          compatibility is provided between different versions of PCP.  It
          is feasible (and indeed encouraged) to use current PCP tools to
          interrogate any remote, down-rev or up-rev pmcd(1) and also to
          replay any historical PCP archive (the PCP testsuite includes PCP
          archives created over 20 years ago!).

          From time to time the PCP developers deprecate and remove PCP
          utilities, replacing them with new versions of utilities
          providing comparable features.  This page describes replacement
          utilities for historical PCP tools.


-------------------------------------------------------

::

          The sar2pcp(1) utility is now deprecated, and will be retired in
          a future version of PCP (v6).  This is being replaced by native
          support for generating PCP archives within the tools of the
          sysstat package (which provides sar itself, as well as the sadf
          utility which produces PCP archives via the -l option).


-----------------------------------------------------------------------

::

          Earlier versions of PCP (prior to v5.1.1) provided a shell script
          that was used internally by pmlogconf(1), located in the
          PCP_BINADM_DIR directory, named pmlogconf-setup.  This script has
          been retired.  The equivalent functionality remains available in
          the unlikely event it should be needed via the -s or --setup
          option to pmlogconf(1).

          The version 1 pmlogconf-setup configuration file format (from
          IRIX) was also retired in this release, after more than 10 years
          of automatic transition to version 2 format by pmlogconf.


---------------------------------------------------

::

          The standalone PCP daemon manager pmmgr has been retired from PCP
          v5.2.0 onward.  It was phased out in favour of the simpler
          pmfind(1) service for setting up pmie(1) and pmlogger(1)
          ``farms'' of discovered PCP collector systems with
          pmfind_check(1).  The new mechanisms, especially when integrated
          with systemd, require no additional daemons and are better
          integrated with the pmie and pmlogger service management used
          elsewhere in PCP.


-----------------------------------------------------------------

::

          The pcp-collectl utility has been superceded by pmrep(1) from PCP
          v5 onward.

          The equivalent of pcp-collectl subsystem reporting is achieved as
          follows:

          pmrep :collectl-sc
                 Processor subsystem view.

          pmrep :collectl-sm
                 Memory subsystem view.

          pmrep :collectl-sd
                 Aggregate disks view.

          pmrep :collectl-sD
                 Per-disk-device view.

          pmrep :collectl-dm-sD
                 Device mapper view.

          pmrep :collectl-sn
                 Network subsystem view.


---------------------------------------------------------------

::

          The standalone web applications packaged with older PCP versions
          have been superceded by grafana-server(1) with the grafana-pcp
          plugin https://github.com/performancecopilot/grafana-pcp .

          This plugin provides an implementation of the Vector application,
          as well as data sources for pmdabpftrace(1) (bpftrace(8) scripts)
          and pmseries(1) (fast, scalable Redis-based time series
          analysis).


-----------------------------------------------------

::

          The pmwebd daemon has been superceded by pmproxy(1) from PCP v5
          onward.

          By default, pmproxy will now listen on both its original port
          (44322) and the PCP web API port (44323) when the time series
          support is built.

          pmproxy provides a compatible implementation of the live
          PMWEBAPI(3) interfaces used traditionally by the Vector web
          application (see the ``PCP-WEBAPPS'' section).  It also provides
          extensions to the original pmwebd REST APIs (such as derived
          metrics, namespace lookups and instance domain profiles), support
          for the HTTPS protocol, and fast, scalable time series querying
          using the pmseries(1) REST API and redis-server(1).

          The partial Graphite API emulation provided by pmwebd has not
          been re-implemented - applications wishing to use similar
          services could use the scalable time series REST APIs described
          on PMWEBAPI(3).


---------------------------------------------------------

::

          pcp(1), pmcd(1), sar2pcp(1), pmrep(1), pmfind(1),
          pmfind_check(1), pmlogconf(1), pmproxy(1), pmseries(1),
          pmdabpftrace(1), redis-server(1), grafana-server(1) and
          PMWEBAPI(3).

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

   Performance Co-Pilot               PCP                      PCPCOMPAT(1)

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
