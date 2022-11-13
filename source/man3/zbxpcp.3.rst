.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

zbxpcp(3) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ZBXPCP(3)               Library Functions Manual               ZBXPCP(3)

NAME
-------------------------------------------------

::

          zbxpcp - Zabbix Agent Loadable PCP Module


---------------------------------------------------------------

::

          The zbxpcp loadable module extends Zabbix agent by making
          Performance Co-Pilot (PCP) metrics available to it.  With the
          zbxpcp module configured in zabbix_agentd.conf all the PCP
          metrics are available from the Zabbix agent like any other agent
          items.  As a loadable module (DSO) zbxpcp does not rely on any
          external programs but directly uses the PCP APIs to fetch PCP
          metrics when requested.

          A typical Linux PCP installation offers over 1,000 metrics by
          default and is in turn extensible with its own plugins, or PMDAs
          (``Performance Metrics Domain Agents'').  In addition to very
          complete /proc based statistics, readily available PCP PMDAs
          provide support for such system and application level components
          as 389 Directory Server, Apache, containers, HAProxy, GFS2,
          Gluster, libvirt, MySQL, NFS, Oracle, Postfix, PostgreSQL, Samba,
          and Sendmail, among others.  PCP also runs on many platforms,
          including Linux, Mac OS X, FreeBSD, NetBSD, Solaris, and Windows.

          For PCP introduction, see PCPIntro(1).  To investigate the
          available PCP metrics, use for example pminfo(1).  The PCP Quick
          Reference Guide is available at the PCP home page
          https://pcp.io/.

          For general information about Zabbix data collection and loadable
          modules, see
          https://www.zabbix.com/documentation/3.0/manual/config/items.
          For Zabbix introduction and downloads, see
          https://www.zabbix.com/.

          zbxpcp is compatible with the Zabbix module API version 1.


-------------------------------------------------------------------

::

          First make sure PCP is installed and configured properly, see the
          above references for instructions and use for example pminfo(1)
          to make sure the PCP metrics can be fetched.  To enable the
          zbxpcp loadable module in a Zabbix agent, the following lines
          must be added to the Zabbix agent configuration file
          zabbix_agentd.conf (make sure to use the correct LoadModulePath):

              LoadModulePath=/usr/lib64/zabbix/agent/
              LoadModule=zbxpcp.so

          After restarting the Zabbix agent all the PCP metrics will be
          available with the ``pcp.''  prefix like all the other agent
          items.  This can be verified with the commands:

              $ pminfo -t
              $ zabbix_agentd -p
              $ pminfo -f kernel.all.sysfork
              $ zabbix_get -s 127.0.0.1 -p 10050 -k pcp.kernel.all.sysfork

          Then to collect PCP metrics from Zabbix agents, the Zabbix server
          side configuration is as usual (see Zabbix documentation if
          needed).

          The PCP pmcd service must always be running when starting up a
          zbxpcp enabled Zabbix agent, otherwise the module will fail to
          load and the PCP metrics will not become available.  Special care
          must be taken to make sure this happens also when rebooting the
          system.


---------------------------------------------------

::

          /etc/zabbix/zabbix_agentd.conf
                 Typical Zabbix agent configuration file location.

          /etc/zabbix/zbxpcp-derived-metrics.conf
                 Optional PCP derived metrics configuration file for
                 zbxpcp.  See pmLoadDerivedConfig(3) for more info on
                 derived metrics.

          $PCP_LIB_DIR/zabbix/agent/zbxpcp.so
                 Zabbix agent loadable PCP module.


---------------------------------------------------------

::

          PCPIntro(1), pminfo(1), pmrep(1), zabbix_get(1),
          pmLoadDerivedConfig(3) and zabbix_agentd(8).

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

   Performance Co-Pilot               PCP                         ZBXPCP(3)

--------------

Pages that refer to this page:
`pcp2zabbix(1) <../man1/pcp2zabbix.1.html>`__

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
