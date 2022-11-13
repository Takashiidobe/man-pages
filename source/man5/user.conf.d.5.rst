.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-system.conf(5) — Linux manual page
==========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATION DIRECTO            |                                   |
| RIES AND PRECEDENCE <#CONFIGURATI |                                   |
| ON_DIRECTORIES_AND_PRECEDENCE>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `SPECIFIERS <#SPECIFIERS>`__ \|   |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-SYSTEM.CONF(5)     systemd-system.conf    SYSTEMD-SYSTEM.CONF(5)

NAME
-------------------------------------------------

::

          systemd-system.conf, system.conf.d, systemd-user.conf,
          user.conf.d - System and session service manager configuration
          files


---------------------------------------------------------

::

          /etc/systemd/system.conf, /etc/systemd/system.conf.d/*.conf,
          /run/systemd/system.conf.d/*.conf,
          /usr/lib/systemd/system.conf.d/*.conf

          ~/.config/systemd/user.conf, /etc/systemd/user.conf,
          /etc/systemd/user.conf.d/*.conf, /run/systemd/user.conf.d/*.conf,
          /usr/lib/systemd/user.conf.d/*.conf


---------------------------------------------------------------

::

          When run as a system instance, systemd interprets the
          configuration file system.conf and the files in system.conf.d
          directories; when run as a user instance, it interprets the
          configuration file user.conf (either in the home directory of the
          user, or if not found, under /etc/systemd/) and the files in
          user.conf.d directories. These configuration files contain a few
          settings controlling basic manager operations.

          See systemd.syntax(7) for a general description of the syntax.


-------------------------------------------------------------------------------------------------------------------------

::

          The default configuration is set during compilation, so
          configuration is only needed when it is necessary to deviate from
          those defaults. Initially, the main configuration file in
          /etc/systemd/ contains commented out entries showing the defaults
          as a guide to the administrator. Local overrides can be created
          by editing this file or by creating drop-ins, as described below.
          Using drop-ins for local configuration is recommended over
          modifications to the main configuration file.

          In addition to the "main" configuration file, drop-in
          configuration snippets are read from /usr/lib/systemd/*.conf.d/,
          /usr/local/lib/systemd/*.conf.d/, and /etc/systemd/*.conf.d/.
          Those drop-ins have higher precedence and override the main
          configuration file. Files in the *.conf.d/ configuration
          subdirectories are sorted by their filename in lexicographic
          order, regardless of in which of the subdirectories they reside.
          When multiple files specify the same option, for options which
          accept just a single value, the entry in the file sorted last
          takes precedence, and for options which accept a list of values,
          entries are collected as they occur in the sorted files.

          When packages need to customize the configuration, they can
          install drop-ins under /usr/. Files in /etc/ are reserved for the
          local administrator, who may use this logic to override the
          configuration files installed by vendor packages. Drop-ins have
          to be used to override package drop-ins, since the main
          configuration file has lower precedence. It is recommended to
          prefix all filenames in those subdirectories with a two-digit
          number and a dash, to simplify the ordering of the files.

          To disable a configuration file supplied by the vendor, the
          recommended way is to place a symlink to /dev/null in the
          configuration directory in /etc/, with the same filename as the
          vendor configuration file.


-------------------------------------------------------

::

          All options are configured in the [Manager] section:

          LogColor=, LogLevel=, LogLocation=, LogTarget=, LogTime=,
          DumpCore=yes, CrashChangeVT=no, CrashShell=no, CrashReboot=no,
          ShowStatus=yes, DefaultStandardOutput=journal,
          DefaultStandardError=inherit
              Configures various parameters of basic manager operation.
              These options may be overridden by the respective process and
              kernel command line arguments. See systemd(1) for details.

          CtrlAltDelBurstAction=
              Defines what action will be performed if user presses
              Ctrl-Alt-Delete more than 7 times in 2s. Can be set to
              "reboot-force", "poweroff-force", "reboot-immediate",
              "poweroff-immediate" or disabled with "none". Defaults to
              "reboot-force".

          CPUAffinity=
              Configures the CPU affinity for the service manager as well
              as the default CPU affinity for all forked off processes.
              Takes a list of CPU indices or ranges separated by either
              whitespace or commas. CPU ranges are specified by the lower
              and upper CPU indices separated by a dash. This option may be
              specified more than once, in which case the specified CPU
              affinity masks are merged. If the empty string is assigned,
              the mask is reset, all assignments prior to this will have no
              effect. Individual services may override the CPU affinity for
              their processes with the CPUAffinity= setting in unit files,
              see systemd.exec(5).

          NUMAPolicy=
              Configures the NUMA memory policy for the service manager and
              the default NUMA memory policy for all forked off processes.
              Individual services may override the default policy with the
              NUMAPolicy= setting in unit files, see systemd.exec(5).

          NUMAMask=
              Configures the NUMA node mask that will be associated with
              the selected NUMA policy. Note that default and local NUMA
              policies don't require explicit NUMA node mask and value of
              the option can be empty. Similarly to NUMAPolicy=, value can
              be overridden by individual services in unit files, see
              systemd.exec(5).

          RuntimeWatchdogSec=, RebootWatchdogSec=, KExecWatchdogSec=
              Configure the hardware watchdog at runtime and at reboot.
              Takes a timeout value in seconds (or in other time units if
              suffixed with "ms", "min", "h", "d", "w"). If
              RuntimeWatchdogSec= is set to a non-zero value, the watchdog
              hardware (/dev/watchdog or the path specified with
              WatchdogDevice= or the kernel option
              systemd.watchdog-device=) will be programmed to automatically
              reboot the system if it is not contacted within the specified
              timeout interval. The system manager will ensure to contact
              it at least once in half the specified timeout interval. This
              feature requires a hardware watchdog device to be present, as
              it is commonly the case in embedded and server systems. Not
              all hardware watchdogs allow configuration of all possible
              reboot timeout values, in which case the closest available
              timeout is picked.  RebootWatchdogSec= may be used to
              configure the hardware watchdog when the system is asked to
              reboot. It works as a safety net to ensure that the reboot
              takes place even if a clean reboot attempt times out. Note
              that the RebootWatchdogSec= timeout applies only to the
              second phase of the reboot, i.e. after all regular services
              are already terminated, and after the system and service
              manager process (PID 1) got replaced by the systemd-shutdown
              binary, see system bootup(7) for details. During the first
              phase of the shutdown operation the system and service
              manager remains running and hence RuntimeWatchdogSec= is
              still honoured. In order to define a timeout on this first
              phase of system shutdown, configure JobTimeoutSec= and
              JobTimeoutAction= in the [Unit] section of the
              shutdown.target unit. By default RuntimeWatchdogSec= defaults
              to 0 (off), and RebootWatchdogSec= to 10min.
              KExecWatchdogSec= may be used to additionally enable the
              watchdog when kexec is being executed rather than when
              rebooting. Note that if the kernel does not reset the
              watchdog on kexec (depending on the specific hardware and/or
              driver), in this case the watchdog might not get disabled
              after kexec succeeds and thus the system might get rebooted,
              unless RuntimeWatchdogSec= is also enabled at the same time.
              For this reason it is recommended to enable KExecWatchdogSec=
              only if RuntimeWatchdogSec= is also enabled. These settings
              have no effect if a hardware watchdog is not available.

          WatchdogDevice=
              Configure the hardware watchdog device that the runtime and
              shutdown watchdog timers will open and use. Defaults to
              /dev/watchdog. This setting has no effect if a hardware
              watchdog is not available.

          CapabilityBoundingSet=
              Controls which capabilities to include in the capability
              bounding set for PID 1 and its children. See capabilities(7)
              for details. Takes a whitespace-separated list of capability
              names as read by cap_from_name(3). Capabilities listed will
              be included in the bounding set, all others are removed. If
              the list of capabilities is prefixed with ~, all but the
              listed capabilities will be included, the effect of the
              assignment inverted. Note that this option also affects the
              respective capabilities in the effective, permitted and
              inheritable capability sets. The capability bounding set may
              also be individually configured for units using the
              CapabilityBoundingSet= directive for units, but note that
              capabilities dropped for PID 1 cannot be regained in
              individual units, they are lost for good.

          NoNewPrivileges=
              Takes a boolean argument. If true, ensures that PID 1 and all
              its children can never gain new privileges through execve(2)
              (e.g. via setuid or setgid bits, or filesystem capabilities).
              Defaults to false. General purpose distributions commonly
              rely on executables with setuid or setgid bits and will thus
              not function properly with this option enabled. Individual
              units cannot disable this option. Also see No New Privileges
              Flag[1].

          SystemCallArchitectures=
              Takes a space-separated list of architecture identifiers.
              Selects from which architectures system calls may be invoked
              on this system. This may be used as an effective way to
              disable invocation of non-native binaries system-wide, for
              example to prohibit execution of 32-bit x86 binaries on
              64-bit x86-64 systems. This option operates system-wide, and
              acts similar to the SystemCallArchitectures= setting of unit
              files, see systemd.exec(5) for details. This setting defaults
              to the empty list, in which case no filtering of system calls
              based on architecture is applied. Known architecture
              identifiers are "x86", "x86-64", "x32", "arm" and the special
              identifier "native". The latter implicitly maps to the native
              architecture of the system (or more specifically, the
              architecture the system manager was compiled for). Set this
              setting to "native" to prohibit execution of any non-native
              binaries. When a binary executes a system call of an
              architecture that is not listed in this setting, it will be
              immediately terminated with the SIGSYS signal.

          TimerSlackNSec=
              Sets the timer slack in nanoseconds for PID 1, which is
              inherited by all executed processes, unless overridden
              individually, for example with the TimerSlackNSec= setting in
              service units (for details see systemd.exec(5)). The timer
              slack controls the accuracy of wake-ups triggered by system
              timers. See prctl(2) for more information. Note that in
              contrast to most other time span definitions this parameter
              takes an integer value in nano-seconds if no unit is
              specified. The usual time units are understood too.

          StatusUnitFormat=
              Takes name, description or combined as the value. If name,
              the system manager will use unit names in status messages
              (e.g.  "systemd-journald.service"), instead of the longer and
              more informative descriptions set with Description= (e.g.
              "Journal Logging Service"). If combined, the system manager
              will use both unit names and descriptions in status messages
              (e.g.  "systemd-journald.service - Journal Logging Service").

              See systemd.unit(5) for details about unit names and
              Description=.

          DefaultTimerAccuracySec=
              Sets the default accuracy of timer units. This controls the
              global default for the AccuracySec= setting of timer units,
              see systemd.timer(5) for details.  AccuracySec= set in
              individual units override the global default for the specific
              unit. Defaults to 1min. Note that the accuracy of timer units
              is also affected by the configured timer slack for PID 1, see
              TimerSlackNSec= above.

          DefaultTimeoutStartSec=, DefaultTimeoutStopSec=,
          DefaultTimeoutAbortSec=, DefaultRestartSec=
              Configures the default timeouts for starting, stopping and
              aborting of units, as well as the default time to sleep
              between automatic restarts of units, as configured per-unit
              in TimeoutStartSec=, TimeoutStopSec=, TimeoutAbortSec= and
              RestartSec= (for services, see systemd.service(5) for details
              on the per-unit settings). Disabled by default, when service
              with Type=oneshot is used. For non-service units,
              DefaultTimeoutStartSec= sets the default TimeoutSec= value.
              DefaultTimeoutStartSec= and DefaultTimeoutStopSec= default to
              90s.  DefaultTimeoutAbortSec= is not set by default so that
              all units fall back to TimeoutStopSec=.  DefaultRestartSec=
              defaults to 100ms.

          DefaultStartLimitIntervalSec=, DefaultStartLimitBurst=
              Configure the default unit start rate limiting, as configured
              per-service by StartLimitIntervalSec= and StartLimitBurst=.
              See systemd.service(5) for details on the per-service
              settings.  DefaultStartLimitIntervalSec= defaults to 10s.
              DefaultStartLimitBurst= defaults to 5.

          DefaultEnvironment=
              Configures environment variables passed to all executed
              processes. Takes a space-separated list of variable
              assignments. See environ(7) for details about environment
              variables.

              Simple "%"-specifier expansion is supported, see below for a
              list of supported specifiers.

              Example:

                  DefaultEnvironment="VAR1=word1 word2" VAR2=word3 "VAR3=word 5 6"

              Sets three variables "VAR1", "VAR2", "VAR3".

          ManagerEnvironment=
              Takes the same arguments as DefaultEnvironment=, see above.
              Sets environment variables just for the manager process
              itself. In contrast to user managers, these variables are not
              inherited by processes spawned by the system manager, use
              DefaultEnvironment= for that. Note that these variables are
              merged into the existing environment block. In particular, in
              case of the system manager, this includes variables set by
              the kernel based on the kernel command line.

              Setting environment variables for the manager process may be
              useful to modify its behaviour. See ENVIRONMENT[2] for a
              descriptions of some variables understood by systemd.

              Simple "%"-specifier expansion is supported, see below for a
              list of supported specifiers.

          DefaultCPUAccounting=, DefaultBlockIOAccounting=,
          DefaultMemoryAccounting=, DefaultTasksAccounting=,
          DefaultIOAccounting=, DefaultIPAccounting=
              Configure the default resource accounting settings, as
              configured per-unit by CPUAccounting=, BlockIOAccounting=,
              MemoryAccounting=, TasksAccounting=, IOAccounting= and
              IPAccounting=. See systemd.resource-control(5) for details on
              the per-unit settings.  DefaultTasksAccounting= defaults to
              yes, DefaultMemoryAccounting= to yes.  DefaultCPUAccounting=
              defaults to yes if enabling CPU accounting doesn't require
              the CPU controller to be enabled (Linux 4.15+ using the
              unified hierarchy for resource control), otherwise it
              defaults to no. The other three settings default to no.

          DefaultTasksMax=
              Configure the default value for the per-unit TasksMax=
              setting. See systemd.resource-control(5) for details. This
              setting applies to all unit types that support resource
              control settings, with the exception of slice units. Defaults
              to 15% of the minimum of kernel.pid_max=, kernel.threads-max=
              and root cgroup pids.max. Kernel has a default value for
              kernel.pid_max= and an algorithm of counting in case of more
              than 32 cores. For example with the default kernel.pid_max=,
              DefaultTasksMax= defaults to 4915, but might be greater in
              other systems or smaller in OS containers.

          DefaultLimitCPU=, DefaultLimitFSIZE=, DefaultLimitDATA=,
          DefaultLimitSTACK=, DefaultLimitCORE=, DefaultLimitRSS=,
          DefaultLimitNOFILE=, DefaultLimitAS=, DefaultLimitNPROC=,
          DefaultLimitMEMLOCK=, DefaultLimitLOCKS=,
          DefaultLimitSIGPENDING=, DefaultLimitMSGQUEUE=,
          DefaultLimitNICE=, DefaultLimitRTPRIO=, DefaultLimitRTTIME=
              These settings control various default resource limits for
              processes executed by units. See setrlimit(2) for details.
              These settings may be overridden in individual units using
              the corresponding LimitXXX= directives and they accept the
              same parameter syntax, see systemd.exec(5) for details. Note
              that these resource limits are only defaults for units, they
              are not applied to the service manager process (i.e. PID 1)
              itself.

              Most of these settings are unset, which means the resource
              limits are inherited from the kernel or, if invoked in a
              container, from the container manager. However, the following
              have defaults:

              •   DefaultLimitNOFILE= defaults to "1024:524288".

              •   DefaultLimitCORE= does not have a default but it is worth
                  mentioning that RLIMIT_CORE is set to "infinity" by PID 1
                  which is inherited by its children.

              •   Note that the service manager internally increases
                  RLIMIT_MEMLOCK for itself, however the limit is reverted
                  to the original value for child processes forked off.

          DefaultOOMPolicy=
              Configure the default policy for reacting to processes being
              killed by the Linux Out-Of-Memory (OOM) killer. This may be
              used to pick a global default for the per-unit OOMPolicy=
              setting. See systemd.service(5) for details. Note that this
              default is not used for services that have Delegate= turned
              on.


-------------------------------------------------------------

::

          Specifiers may be used in the DefaultEnvironment= and
          ManagerEnvironment= settings. The following expansions are
          understood:

          Table 1. Specifiers available
          ┌──────────┬──────────────────┬────────────────────────┐
          │Specifier │ Meaning          │ Details                │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%a"      │ Architecture     │ A short string         │
          │          │                  │ identifying the        │
          │          │                  │ architecture of        │
          │          │                  │ the local system.      │
          │          │                  │ A string such as       │
          │          │                  │ x86, x86-64 or         │
          │          │                  │ arm64. See the         │
          │          │                  │ architectures          │
          │          │                  │ defined for            │
          │          │                  │ ConditionArchitecture= │
          │          │                  │ in systemd.unit(5)     │
          │          │                  │ for a full list.       │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%A"      │ Operating system │ The operating system   │
          │          │ image version    │ image version          │
          │          │                  │ identifier of the      │
          │          │                  │ running system, as     │
          │          │                  │ read from the          │
          │          │                  │ IMAGE_VERSION= field   │
          │          │                  │ of /etc/os-release. If │
          │          │                  │ not set, resolves to   │
          │          │                  │ an empty string. See   │
          │          │                  │ os-release(5) for more │
          │          │                  │ information.           │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%b"      │ Boot ID          │ The boot ID of the     │
          │          │                  │ running system,        │
          │          │                  │ formatted as string.   │
          │          │                  │ See random(4) for more │
          │          │                  │ information.           │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%B"      │ Operating system │ The operating system   │
          │          │ build ID         │ build identifier of    │
          │          │                  │ the running system, as │
          │          │                  │ read from the          │
          │          │                  │ BUILD_ID= field of     │
          │          │                  │ /etc/os-release. If    │
          │          │                  │ not set, resolves to   │
          │          │                  │ an empty string. See   │
          │          │                  │ os-release(5) for more │
          │          │                  │ information.           │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%H"      │ Host name        │ The hostname of the    │
          │          │                  │ running system.        │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%l"      │ Short host name  │ The hostname of the    │
          │          │                  │ running system,        │
          │          │                  │ truncated at the first │
          │          │                  │ dot to remove any      │
          │          │                  │ domain component.      │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%m"      │ Machine ID       │ The machine ID of the  │
          │          │                  │ running system,        │
          │          │                  │ formatted as string.   │
          │          │                  │ See machine-id(5) for  │
          │          │                  │ more information.      │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%M"      │ Operating system │ The operating system   │
          │          │ image identifier │ image identifier of    │
          │          │                  │ the running system, as │
          │          │                  │ read from the          │
          │          │                  │ IMAGE_ID= field of     │
          │          │                  │ /etc/os-release. If    │
          │          │                  │ not set, resolves to   │
          │          │                  │ an empty string. See   │
          │          │                  │ os-release(5) for more │
          │          │                  │ information.           │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%o"      │ Operating system │ The operating system   │
          │          │ ID               │ identifier of the      │
          │          │                  │ running system, as     │
          │          │                  │ read from the ID=      │
          │          │                  │ field of               │
          │          │                  │ /etc/os-release. See   │
          │          │                  │ os-release(5) for more │
          │          │                  │ information.           │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%v"      │ Kernel release   │ Identical to uname -r  │
          │          │                  │ output.                │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%w"      │ Operating system │ The operating system   │
          │          │ version ID       │ version identifier of  │
          │          │                  │ the running system, as │
          │          │                  │ read from the          │
          │          │                  │ VERSION_ID= field of   │
          │          │                  │ /etc/os-release. If    │
          │          │                  │ not set, resolves to   │
          │          │                  │ an empty string. See   │
          │          │                  │ os-release(5) for more │
          │          │                  │ information.           │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%W"      │ Operating system │ The operating system   │
          │          │ variant ID       │ variant identifier of  │
          │          │                  │ the running system, as │
          │          │                  │ read from the          │
          │          │                  │ VARIANT_ID= field of   │
          │          │                  │ /etc/os-release. If    │
          │          │                  │ not set, resolves to   │
          │          │                  │ an empty string. See   │
          │          │                  │ os-release(5) for more │
          │          │                  │ information.           │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%T"      │ Directory for    │ This is either /tmp or │
          │          │ temporary files  │ the path "$TMPDIR",    │
          │          │                  │ "$TEMP" or "$TMP" are  │
          │          │                  │ set to. (Note that the │
          │          │                  │ directory may be       │
          │          │                  │ specified without a    │
          │          │                  │ trailing slash.)       │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%V"      │ Directory for    │ This is either         │
          │          │ larger and       │ /var/tmp or the path   │
          │          │ persistent       │ "$TMPDIR", "$TEMP" or  │
          │          │ temporary files  │ "$TMP" are set to.     │
          │          │                  │ (Note that the         │
          │          │                  │ directory may be       │
          │          │                  │ specified without a    │
          │          │                  │ trailing slash.)       │
          ├──────────┼──────────────────┼────────────────────────┤
          │"%%"      │ Single percent   │ Use "%%" in place of   │
          │          │ sign             │ "%" to specify a       │
          │          │                  │ single percent sign.   │
          └──────────┴──────────────────┴────────────────────────┘


---------------------------------------------------------

::

          systemd(1), systemd.directives(7), systemd.exec(5),
          systemd.service(5), environ(7), capabilities(7)


---------------------------------------------------

::

           1. No New Privileges Flag
              https://www.kernel.org/doc/html/latest/userspace-api/no_new_privs.html

           2. ENVIRONMENT
              https://systemd.io/ENVIRONMENT

COLOPHON
---------------------------------------------------------

::

          This page is part of the systemd (systemd system and service
          manager) project.  Information about the project can be found at
          ⟨http://www.freedesktop.org/wiki/Software/systemd⟩.  If you have
          a bug report for this manual page, see
          ⟨http://www.freedesktop.org/wiki/Software/systemd/#bugreports⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://github.com/systemd/systemd.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-27.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   systemd 249                                       SYSTEMD-SYSTEM.CONF(5)

--------------

Pages that refer to this page:
`systemctl(1) <../man1/systemctl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`journald.conf(5) <../man5/journald.conf.5.html>`__, 
`logind.conf(5) <../man5/logind.conf.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd.mount(5) <../man5/systemd.mount.5.html>`__, 
`systemd.resource-control(5) <../man5/systemd.resource-control.5.html>`__, 
`systemd.service(5) <../man5/systemd.service.5.html>`__, 
`systemd.socket(5) <../man5/systemd.socket.5.html>`__, 
`systemd.swap(5) <../man5/systemd.swap.5.html>`__, 
`systemd.timer(5) <../man5/systemd.timer.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`kernel-command-line(7) <../man7/kernel-command-line.7.html>`__, 
`systemd.syntax(7) <../man7/systemd.syntax.7.html>`__, 
`systemd-oomd.service(8) <../man8/systemd-oomd.service.8.html>`__

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
