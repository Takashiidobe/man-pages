.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdakernel(1) — Linux manual page
=================================

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

   KERNEL_PMDAS(1)          General Commands Manual         KERNEL_PMDAS(1)

NAME
-------------------------------------------------

::

          pmdaaix, pmdadarwin, pmdafreebsd, pmdalinux, pmdanetbsd,
          pmdasolaris, pmdawindows - operating system kernel performance
          metrics domain agents


---------------------------------------------------------

::

          $PCP_PMDAS_DIR/aix/pmdaaix [-d domain] [-l logfile] [-U username]
          $PCP_PMDAS_DIR/darwin/pmdadarwin [-d domain] [-l logfile] [-U
          username]
          $PCP_PMDAS_DIR/freebsd/pmdafreebsd [-d domain] [-l logfile] [-U
          username]
          $PCP_PMDAS_DIR/linux/pmdalinux [-d domain] [-l logfile] [-U
          username]
          $PCP_PMDAS_DIR/netbsd/pmdanetbsd [-d domain] [-l logfile] [-U
          username]
          $PCP_PMDAS_DIR/solaris/pmdasolaris [-d domain] [-l logfile] [-U
          username]
          $PCP_PMDAS_DIR/windows/pmdawindows [-d domain] [-l logfile] [-U
          username]


---------------------------------------------------------------

::

          Each supported platform has a kernel Performance Metrics Domain
          Agent (PMDA) which extracts performance metrics from the kernel
          of that platfrom.  A variety of platform-specific metrics are
          available, with an equally varied set of access mechanisms -
          typically this involves special system calls, or reading from
          files in kernel virtual filesystems such as the Linux sysfs and
          procfs filesystems.

          The platform kernel PMDA is one of the most critical components
          of the PCP installation, and must be as efficient and reliable as
          possible.  In all installations the default kernel PMDA will be
          installed as a shared library and thus executes directly within
          the pmcd(1) process.  This slightly reduces overheads associated
          with querying the metadata and values associated with these
          metrics (no message passing is required).

          Unlike many other PMDAs, the kernel PMDA exports a number of
          metric namespace subtrees, such as kernel, network, swap, mem,
          ipc, filesys, nfs, disk and hinv (hardware inventory).

          Despite usually running as shared libraries, most installations
          also include a stand-alone executable for the kernel PMDA.  This
          is to aid profiling and debugging activities, with dbpmda(1) for
          example.  In this case (but not for shared libraries), the
          following command line options are available:

          -d   It is absolutely crucial that the performance metrics domain
               number specified here is unique and consistent.  That is,
               domain should be different for every PMDA on the one host,
               and the same domain number should be used for the same PMDA
               on all hosts.

          -l   Location of the log file.  By default, a log file named
               [platform].log is written in the current directory of
               pmcd(1) when pmda[platform] is started, i.e.
               $PCP_LOG_DIR/pmcd.  If the log file cannot be created or is
               not writable, output is written to the standard error
               instead.

          -U   User account under which to run the agent.  The default is
               the unprivileged "pcp" account in current versions of PCP,
               but in older versions the superuser account ("root") was
               used by default.


-----------------------------------------------------------------

::

          Access to the names, help text and values for the kernel
          performance metrics is available by default - unlike most other
          agents, no action is required to enable them and they should not
          be removed.


---------------------------------------------------

::

          $PCP_PMDAS_DIR/[platform]/help
                 default help text file for the the kernel metrics
          $PCP_LOG_DIR/pmcd/[platform].log
                 default log file for error messages and other information
                 from the kernel PMDA.


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

          PCPIntro(1), dbpmda(1), pmcd(1), pcp.conf(5) and pcp.env(5).

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

   Performance Co-Pilot               PCP                   KERNEL_PMDAS(1)

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
