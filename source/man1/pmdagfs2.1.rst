.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdagfs2(1) — Linux manual page
===============================

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

   PMDAGFS2(1)              General Commands Manual             PMDAGFS2(1)

NAME
-------------------------------------------------

::

          pmdagfs2 - Global Filesystem v2 (GFS2) PMDA


---------------------------------------------------------------

::

          pmdagfs2 is a Performance Metrics Domain Agent (PMDA) which
          exports metric values about mounted GFS2 filesystems from the
          debugfs filesystem.  This PMDA requires debugfs along with at
          least one mounted GFS2 filesystem to be mounted in order to be
          able to provide metric data.

          This PMDA can be used with GFS2 filesystems which are both
          mounted as local filesystems and filesystems which are  mounted
          as shared storage within a clustered environment. However there
          are some metrics which specifically require GFS2 to be setup in a
          clustered environment to be able to provide metric data. This is
          due to them expecting locking messages to be passed via the
          distributed lock manager (DLM) between nodes of a cluster in
          order to generate their output.

          These cluster-environment-only metrics can be distinguished by
          the inclusion of their corresponding control metrics so that they
          can be optionally enabled or disabled on systems where they are
          not desired to be monitored or not supported.

          pmstore(3) can be used to assign values to these control metrics
          in order to enable (1) or disable (0) them.  This mechanism is
          also useful on distributions that do not currently have full
          support for the GFS2 trace-points or provide older versions of
          the GFS2 driver.


-----------------------------------------------------------------

::

          Install the GFS2 PMDA by using the Install script as root:

              # cd $PCP_PMDAS_DIR/gfs2
              # ./Install

          To uninstall, do the following as root:

              # cd $PCP_PMDAS_DIR/gfs2
              # ./Remove

          pmdagfs2 is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd when the
          agent is installed or removed.


---------------------------------------------------

::

          $PCP_PMDAS_DIR/gfs2/help
              default help text file for the GFS2 metrics

          $PCP_PMDAS_DIR/gfs2/Install
              installation script for the pmdagfs2 agent

          $PCP_PMDAS_DIR/gfs2/Remove
              undo installation script for the pmdagfs2 agent

          $PCP_LOG_DIR/pmcd/gfs2.log
              default log file for error messages from pmdagfs2


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

          PCPIntro(1), pmcd(1), pmstore(1) and gfs2(5).

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

   Performance Co-Pilot               PCP                       PMDAGFS2(1)

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
