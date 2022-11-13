.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdalibvirt(1) — Linux manual page
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

   PMDALIBVIRT(1)           General Commands Manual          PMDALIBVIRT(1)

NAME
-------------------------------------------------

::

          pmdalibvirt - libvirt PMDA


---------------------------------------------------------------

::

          pmdalibvirt is a Performance Metrics Domain Agent (PMDA) which
          extracts live performance data from libvirt hypervisor and
          domains (VMs).

          See the libvirt documentation for detailed description of each
          metric.


-----------------------------------------------------------------

::

          pmdalibvirt reads an optional ini-style configuration file

              • $PCP_PMDAS_DIR/libvirt/libvirt.conf

          This file can contain in its [pmda] section overriding values for
          the following PMDA options:

              • user
              • uri
              • backing
              • oldapi

          By default, root, qemu:///system, False, and False are used as
          values for these options, respectively.

          The backing setting can be used to expand block device
          information to cover backing chains with recent libvirt versions.

          The old API setting can be used in environments where recent
          libvirt API additions are not available (e.g., RHEL 6 /
          libvirt-0.10.2) to provide some of the metrics available with the
          newer API.  Regardless of the API version, no guest agent is
          needed for the metrics.

          Note that using non-root user typically requires also libvirt
          side configuration; please refer to libvirt documentation for
          further details on this.

          Once the needed setup is ready, you can test the connection and
          install the PMDA to enable access to the names and values for the
          libvirt performance metrics.  To install, do the following as
          root:

              # cd $PCP_PMDAS_DIR/libvirt
              # ./connect
              # ./Install

          To uninstall, do the following as root:

              # cd $PCP_PMDAS_DIR/libvirt
              # ./Remove

          pmdalibvirt is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


---------------------------------------------------

::

          $PCP_PMDAS_DIR/libvirt/libvirt.conf
                 configuration file for the pmdalibvirt agent

          $PCP_PMDAS_DIR/libvirt/connect
                 connection test helper using the pmdalibvirt agent
                 configuration

          $PCP_PMDAS_DIR/libvirt/Install
                 installation script for the pmdalibvirt agent

          $PCP_PMDAS_DIR/libvirt/Remove
                 undo installation script for the pmdalibvirt agent

          $PCP_LOG_DIR/pmcd/libvirt.log
                 default log file for messages from the pmdalibvirt agent


-----------------------------------------------------------------------

::

          Environment variables with the prefix PCP_ are used to
          parameterize the file and directory names used by PCP.  On each
          installation, the file /etc/pcp.conf contains the local values
          for these variables.  The $PCP_CONF variable may be used to
          specify an alternative configuration file, as described in
          pcp.conf(5).


---------------------------------------------------------

::

          PCPIntro(1), pmcd(1), virsh(1) and libvirtd(8).

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

   Performance Co-Pilot               PCP                    PMDALIBVIRT(1)

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
