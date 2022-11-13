.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdajbd2(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
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

   PMDAJBD2(1)              General Commands Manual             PMDAJBD2(1)

NAME
-------------------------------------------------

::

          pmdajbd2 - journal block device (JBD) performance metrics domain
          agent (PMDA)


---------------------------------------------------------

::

          $PCP_PMDAS_DIR/jbd2/pmdajbd2 [-d domain] [-l logfile] [-j path]
          [-U username]


---------------------------------------------------------------

::

          pmdajbd2 is a Performance Metrics Domain Agent (PMDA) which
          extracts performance metrics from the Journal Block Device
          subsystem (version 2) in the Linux kernel.  These metrics are
          exported by the kernel in procfs files, one file per block
          device.  The JBD2 subsystem is used by several filesystems
          including ext3, ext4 and ocfs2.

          The jbd2 PMDA exports metrics that measure detailed journal
          transaction information, such as time spent waiting and locked,
          request rates, blocks used and so on.

          A brief description of the pmdajbd2 command line options follows
          (these are only relevant when running the PMDA as a daemon, and
          not as a shared library):

          -d   It is absolutely crucial that the performance metrics domain
               number specified here is unique and consistent.  That is,
               domain should be different for every PMDA on the one host,
               and the same domain number should be used for the same PMDA
               on all hosts.

          -l   Location of the log file.  By default, when running as a
               daemon a log file named jbd2.log is written in the current
               directory of when pmdajbd2 is started, i.e.
               $PCP_LOG_DIR/pmcd.  If the log file cannot be created or is
               not writable, output is written to the standard error
               instead.  When running in shared library mode, and
               diagnostic information will be written into the pmcd log
               file, namely $PCP_LOG_DIR/pmcd/pmcd.log.

          -j   Allows an alternate path to the jbd2 statistics files to be
               specified.  The default path is /proc/fs/jbd2.

          -U   User account under which to run the agent.  The default is
               the unprivileged "pcp" account in current versions of PCP,
               but in older versions the superuser account ("root") was
               used by default.


-----------------------------------------------------------------

::

          This PMDA is installed by default and in the shared library mode
          (rather than as a separate daemon to pmcd(1)).  Thus, the names,
          help text and values for the jbd2 performance metrics should
          always be available.

          If you do not use these metrics you can remove this PMDA, do the
          following as root:

               # cd $PCP_PMDAS_DIR/jbd2
               # ./Remove

          If you want to enable the installation again, do the following as
          root:

               # cd $PCP_PMDAS_DIR/jbd2
               # ./Install

          pmdajbd2 is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.


---------------------------------------------------

::

          $PCP_PMCDCONF_PATH
                 command line options used to launch pmdajbd2
          $PCP_PMDAS_DIR/jbd2/help
                 default help text file for the jbd2 metrics
          $PCP_PMDAS_DIR/jbd2/Install
                 installation script for the pmdajbd2 agent
          $PCP_PMDAS_DIR/jbd2/Remove
                 undo installation script for the pmdajbd2 agent
          $PCP_LOG_DIR/pmcd/jbd2.log
                 default log file for error messages and other information
                 from pmdajbd2


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

          PCPIntro(1), pmcd(1), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                       PMDAJBD2(1)

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
