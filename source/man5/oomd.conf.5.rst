.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

oomd.conf(5) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATION DIRECTO            |                                   |
| RIES AND PRECEDENCE <#CONFIGURATI |                                   |
| ON_DIRECTORIES_AND_PRECEDENCE>`__ |                                   |
| \|                                |                                   |
| `[OOM] SECTION OPTION             |                                   |
| S <#%5BOOM%5D_SECTION_OPTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   OOMD.CONF(5)                    oomd.conf                   OOMD.CONF(5)

NAME
-------------------------------------------------

::

          oomd.conf, oomd.conf.d - Global systemd-oomd configuration files


---------------------------------------------------------

::

          /etc/systemd/oomd.conf

          /etc/systemd/oomd.conf.d/*.conf

          /usr/lib/systemd/oomd.conf.d/*.conf


---------------------------------------------------------------

::

          These files configure the various parameters of the systemd(1)
          userspace out-of-memory (OOM) killer, systemd-oomd.service(8).
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


---------------------------------------------------------------------------------------

::

          The following options are available in the [OOM] section:

          SwapUsedLimit=
              Sets the limit for memory and swap usage on the system before
              systemd-oomd will take action. If the fraction of memory used
              and the fraction of swap used on the system are both more
              than what is defined here, systemd-oomd will act on eligible
              descendant control groups with swap usage greater than 5% of
              total swap, starting from the ones with the highest swap
              usage. Which control groups are monitored and what action
              gets taken depends on what the unit has configured for
              ManagedOOMSwap=. Takes a value specified in percent (when
              suffixed with "%"), permille ("‰") or permyriad ("‱"),
              between 0% and 100%, inclusive. Defaults to 90%.

          DefaultMemoryPressureLimit=
              Sets the limit for memory pressure on the unit's control
              group before systemd-oomd will take action. A unit can
              override this value with ManagedOOMMemoryPressureLimit=. The
              memory pressure for this property represents the fraction of
              time in a 10 second window in which all tasks in the control
              group were delayed. For each monitored control group, if the
              memory pressure on that control group exceeds the limit set
              for longer than the duration set by
              DefaultMemoryPressureDurationSec=, systemd-oomd will act on
              eligible descendant control groups, starting from the ones
              with the most reclaim activity to the least reclaim activity.
              Which control groups are monitored and what action gets taken
              depends on what the unit has configured for
              ManagedOOMMemoryPressure=. Takes a fraction specified in the
              same way as SwapUsedLimit= above. Defaults to 60%.

          DefaultMemoryPressureDurationSec=
              Sets the amount of time a unit's control group needs to have
              exceeded memory pressure limits before systemd-oomd will take
              action. Memory pressure limits are defined by
              DefaultMemoryPressureLimit= and
              ManagedOOMMemoryPressureLimit=. Must be set to 0, or at least
              1 second. Defaults to 30 seconds when unset or 0.


---------------------------------------------------------

::

          systemd(1), systemd.resource-control(5), systemd-oomd.service(8),
          oomctl(1)

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

   systemd 249                                                 OOMD.CONF(5)

--------------

Pages that refer to this page: `oomctl(1) <../man1/oomctl.1.html>`__, 
`systemd.resource-control(5) <../man5/systemd.resource-control.5.html>`__, 
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
