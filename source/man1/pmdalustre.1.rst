.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdalustre(1) — Linux manual page
=================================

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

   PMDALUSTRE(1)            General Commands Manual           PMDALUSTRE(1)

NAME
-------------------------------------------------

::

          pmdalustre - lustre filesystem statistics performance metrics
          domain agent (PMDA)


---------------------------------------------------------------

::

          pmdalustre is a Performance Metrics Domain Agent (PMDA) which
          reads and exports metric values from the statistics interfaces of
          a Lustre filesystem.

          pmdalustre searches for statistics interfaces from several
          locations, which vary depending on the version of Lustre
          installed locally.

          Recent Lustre versions (v2.12 and later) export statistics from
          the kernel debugfs pseudo filesystem, in the directories
          /sys/kernel/debug/lustre/llite and /sys/kernel/debug/lnet.  If
          these interfaces are not found during startup, pmdalustre will
          automatically check if the statistics interfaces are available
          from the procfs pseudo filesystem below the /proc/fs/lustre/llite
          and /proc/sys/lnet directories.  These are the default locations
          of the statistics for Lustre versions less than v2.12.

          If neither of the above filesystem interfaces are detected, or if
          the user wants to override the default locations, pmdalustre also
          supports an optional configuration file named
          $PCP_PMDAS_DIR/lustre/lustre.conf.  Note that $PCP_PMDAS_DIR is
          set to /var/lib/pcp/pmdas on most Linux based  systems.  The
          configuration file supports perl(1) variable assignment syntax.
          An example configuration file suitable for Lustre v2.12 and later
          is:

                       $LLITE_PATH="/sys/kernel/debug/lustre/llite/";
                       $LNET_PATH="/sys/kernel/debug/lustre/lnet/";

          See comments in the shipped lustre.conf file for further details.
          By default, this file is installed with everything commented (and
          so it has no effect unless edited) because the built-in
          heuristics used by pmdalustre should suffice.

          Finally, overriding all of the above, the LUSTRE_LLITE_PATH and
          LUSTRE_LNET_PATH environment variables may be set (and exported)
          to specify the directory locations of the statistics interfaces
          to be used.  This mechanism using environment variabes is
          intended to be used for development and testing purposes only.

          The pmdalustre process runs as the root user because debugfs
          directories are not normally readable by unprivileged users.


-----------------------------------------------------------------

::

          Install pmdalustre by using the Install script as the root user:

               # cd $PCP_PMDAS_DIR/lustre
               # ./Install

          If you want to undo the installation, do the following as root:

               # cd $PCP_PMDAS_DIR/lustre
               # ./Remove

          pmdalustre is launched by pmcd(1) and should never be executed
          directly. The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


---------------------------------------------------

::

          $PCP_PMDAS_DIR/lustre/Install
              installation script for the pmdalustre agent

          $PCP_PMDAS_DIR/lustre/Remove
              undo installation script for the pmdalustre agent

          $PCP_LOG_DIR/pmcd/lustre.log
              default log file for error messages from pmdalustre

          $PCP_PMDAS_DIR/lustre/lustre.conf
              Configuration file for over-riding default statistics
              directories used by pmdalustre.


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

          PCPIntro(1), perl(1), pmcd(1) and llstat(1).

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

   Performance Co-Pilot               PCP                     PMDALUSTRE(1)

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
