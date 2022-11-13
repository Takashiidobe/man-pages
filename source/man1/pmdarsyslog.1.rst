.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdarsyslog(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `INSTALLATION <#INSTALLATION>`__  |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `PCP                              |                                   |
| ENVIRONMENT <#PCP_ENVIRONMENT>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PMDARSYSLOG(1)           General Commands Manual          PMDARSYSLOG(1)

NAME
-------------------------------------------------

::

          pmdarsyslog - rsyslog (reliable and extended syslog) PMDA


---------------------------------------------------------------

::

          pmdarsyslog is a Performance Metrics Domain Agent (PMDA) which
          exports metric values from the rsyslogd(8) server.

          Further details about rsyslog can be found at
          http://www.rsyslog.com/ .


-----------------------------------------------------------------

::

          If you want access to the names and values for the rsyslog
          performance metrics, do the following as root:

              # cd $PCP_PMDAS_DIR/rsyslog
              # ./Install

          To uninstall, do the following as root:

              # cd $PCP_PMDAS_DIR/rsyslog
              # ./Remove

          pmdarsyslog is launched by pmcd(1) and should never be executed
          directly. The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.

          In order to use this agent, rsyslog stats gathering must be
          enabled.  This is done by adding the lines:

              $ModLoad impstats
              $PStatsInterval 5       # log every 5 seconds
              syslog.info             |/var/log/pcp/rsyslog/stats

          to your rsyslog.conf(5) configuration file after installing the
          PMDA.  Take care to ensure the syslog.info messages do not get
          logged in any other file, as this could unexpectedly fill your
          filesystem.  Syntax useful for this is syslog.!=info for
          explicitly excluding these.


---------------------------------------------------

::

          $PCP_LOG_DIR/rsyslog/stats
              named pipe containing statistics exported from rsyslog,
              usually created by the PMDA Install script.

          $PCP_PMDAS_DIR/rsyslog/rsyslog.conf
              optional configuration file for pmdarsyslog

          $PCP_PMDAS_DIR/rsyslog/Install
              installation script for the pmdarsyslog agent

          $PCP_PMDAS_DIR/rsyslog/Remove
              undo installation script for the pmdarsyslog agent

          $PCP_LOG_DIR/pmcd/rsyslog.log
              default log file for error messages from pmdarsyslog


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP. On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1) and rsyslogd(1).

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

   Performance Co-Pilot               PCP                    PMDARSYSLOG(1)

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
