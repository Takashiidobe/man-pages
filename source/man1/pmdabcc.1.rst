.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pmdabcc(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFIGURATION <#CONFIGURATION>`__ |                                   |
| \|                                |                                   |
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

   PMDABCC(1)               General Commands Manual              PMDABCC(1)

NAME
-------------------------------------------------

::

          pmdabcc - BCC PMDA


---------------------------------------------------------------

::

          pmdabcc is a Performance Co-Pilot (PCP) Performance Metrics
          Domain Agent (PMDA) which extracts live performance data from
          extended BPF (Berkeley Packet Filter) in-kernel programs by using
          BCC (BPF Compiler Collection) Python frontend.

          pmdabcc loads and acts as a bridge for any number of configured,
          separate PCP BCC PMDA Python modules running BPF programs.
          Existing BCC Python tools and programs should be possible to be
          utilized with PCP BCC PMDA modules with reasonable effort.

          See the BPF and BCC documentation for detailed description of
          both.


-------------------------------------------------------------------

::

          pmdabcc reads a mandatory ini-style configuration file:

                 $PCP_PMDAS_DIR/bcc/bcc.conf

          This file must contain a [pmda] section.  The following PMDA
          options are available (their default values are shown in
          parenthesis), options marked with asterisk (*) can be overridden
          in module-specific configuration sections:

          modules (unset)
                 The pmdabcc PMDA reads module-specific configuration for
                 each module listed in the comma-separated list of modules
                 (mandatory).

          prefix (bcc.) *
                 By default, all metrics from the modules will appear under
                 the bcc Performance Metrics Name Space (PMNS) tree, prefix
                 (optional) can be used to change this generic prefix.

          process_refresh (0)
                 See below.

          module_failure_fatal (True)
                 A boolean value for module_failure_fatal (optional)
                 controls whether a module failing to compile should cause
                 the whole PMDA to abort (this is the default) or to start
                 up with possibly remaining functional modules.  Module
                 configuration errors and internal errors (such as failing
                 to register the provided PMNS metrics, see PMNS(5)) will
                 always cause the PMDA to fail.

          Of particular note, the process option accepted by some modules
          evalutes the given PIDs and process names at PMDA/module
          initialization time and apply filtering for only those processes
          found at that stage.  This is due to fact that the in-kernel BPF
          program is compiled at module initialization time and, even more
          importantly, they are often running at performance critical areas
          where it is not acceptable to do process name lookups each time a
          request is processed by the BPF program.  To allow modules to
          monitor named processes (say, process = java) even if they
          restart the process_refresh should be set to a non-negative
          integer N to dynamically refresh monitored processes every N
          seconds.  In case new processes matching the process filter have
          appeared, the currently running BPF is detached and a new BPF
          program with updated PID information is installed (and if no PIDs
          matching the filter are anymore present, the BPF program will be
          detach to avoid any needless overhead).

          For each module listed in modules a corresponding [module]
          section must be defined containing at least the following
          options:

          module Defines the actual Python module file name to be loaded
                 during PMDA startup under the modules subdirectory of the
                 PCP BCC PMDA installation.

          cluster
                 Specifies the unique cluster ID (see PMNS(5)) for the
                 metrics provided by the module under the PMNS path.

          All modules accept but not necessarily use the boolean debug
          option.

          Modules may also support additional module-specific configuration
          options, refer to the default configuration file for their
          supported options.


-----------------------------------------------------------------

::

          To install, the following must be done as root:

              # cd $PCP_PMDAS_DIR/bcc
              # ./Install

          To uninstall, the following must be done as root:

              # cd $PCP_PMDAS_DIR/bcc
              # ./Remove

          pmdabcc is launched by pmcd(1) and should never be executed
          directly.  The Install and Remove scripts notify pmcd(1) when the
          agent is installed or removed.

          In case module_failure_fatal is set to False, the PMDA
          installation will be considered successful even if some or even
          all configured modules fail to load, in such cases metric values
          provided by the failing modules will not be available.  The
          pmdabcc agent log file (see below) will contain detailed
          information about activation of each module.

          Some modules will start providing values only after having
          collected data from related system activity.  For instance, the
          tcpperpid module will not provide any values unless there are
          processes generating TCP traffic on the system.


---------------------------------------------------

::

          $PCP_PMDAS_DIR/bcc/bcc.conf
               configuration file for the pmdabcc agent

          $PCP_PMDAS_DIR/bcc/modules/*.{py,python}
               PCP BCC PMDA Python modules available for the pmdabcc agent

          $PCP_PMDAS_DIR/bcc/Install
               installation script for the pmdabcc agent

          $PCP_PMDAS_DIR/bcc/Remove
               undo installation script for the pmdabcc agent

          $PCP_LOG_DIR/pmcd/bcc.log
               default log file for messages from the pmdabcc agent

          Note that the usual/default value for $PCP_PMDAS_DIR is
          /var/lib/pcp/pmdas and the default for $PCP_LOG_DIR is
          /var/log/pcp but these settings are platform dependent.


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

          PCPIntro(1), bcc(1), bpf(1) and pmcd(1).

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

   Performance Co-Pilot               PCP                        PMDABCC(1)

--------------

Pages that refer to this page: `pcp-atop(1) <../man1/pcp-atop.1.html>`__

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
