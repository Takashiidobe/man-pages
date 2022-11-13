.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-oomd.service(8) — Linux manual page
===========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SETUP IN                         |                                   |
| FORMATION <#SETUP_INFORMATION>`__ |                                   |
| \|                                |                                   |
| `USAGE RECOMMENDA                 |                                   |
| TIONS <#USAGE_RECOMMENDATIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-OOMD.SERVICE(8)   systemd-oomd.service   SYSTEMD-OOMD.SERVICE(8)

NAME
-------------------------------------------------

::

          systemd-oomd.service, systemd-oomd - A userspace out-of-memory
          (OOM) killer


---------------------------------------------------------

::

          systemd-oomd.service

          /usr/lib/systemd/systemd-oomd


---------------------------------------------------------------

::

          systemd-oomd is a system service that uses cgroups-v2 and
          pressure stall information (PSI) to monitor and take action on
          processes before an OOM occurs in kernel space.

          You can enable monitoring and actions on units by setting
          ManagedOOMSwap= and/or ManagedOOMMemoryPressure= to the
          appropriate value.  systemd-oomd will periodically poll enabled
          units' cgroup data to detect when corrective action needs to
          occur. When an action needs to happen, it will only be performed
          on the descendant cgroups of the enabled units. More precisely,
          only cgroups with memory.oom.group set to 1 and leaf cgroup nodes
          are eligible candidates. Action will be taken recursively on all
          of the processes under the chosen candidate.

          See oomd.conf(5) for more information about the configuration of
          this service.


---------------------------------------------------------------------------

::

          The system must be running systemd with a full unified cgroup
          hierarchy for the expected cgroups-v2 features. Furthermore,
          memory accounting must be turned on for all units monitored by
          systemd-oomd. The easiest way to turn on memory accounting is by
          ensuring the value for DefaultMemoryAccounting= is set to true in
          systemd-system.conf(5).

          You will need a kernel compiled with PSI support. This is
          available in Linux 4.20 and above.

          It is highly recommended for the system to have swap enabled for
          systemd-oomd to function optimally. With swap enabled, the system
          spends enough time swapping pages to let systemd-oomd react.
          Without swap, the system enters a livelocked state much more
          quickly and may prevent systemd-oomd from responding in a
          reasonable amount of time. See "In defence of swap: common
          misconceptions"[1] for more details on swap. Any swap-based
          actions on systems without swap will be ignored. While
          systemd-oomd can perform pressure-based actions on a system
          without swap, the pressure increases will be more abrupt and may
          require more tuning to get the desired thresholds and behavior.

          Be aware that if you intend to enable monitoring and actions on
          user.slice, user-$UID.slice, or their ancestor cgroups, it is
          highly recommended that your programs be managed by the systemd
          user manager to prevent running too many processes under the same
          session scope (and thus avoid a situation where memory intensive
          tasks trigger systemd-oomd to kill everything under the cgroup).
          If you're using a desktop environment like GNOME, it already
          spawns many session components with the systemd user manager.


-----------------------------------------------------------------------------------

::

          ManagedOOMSwap= works with the system-wide swap values, so
          setting it on the root slice -.slice, and allowing all descendant
          cgroups to be eligible candidates may make the most sense.

          ManagedOOMMemoryPressure= tends to work better on the cgroups
          below the root slice -.slice. For units which tend to have
          processes that are less latency sensitive (e.g.  system.slice), a
          higher limit like the default of 60% may be acceptable, as those
          processes can usually ride out slowdowns caused by lack of memory
          without serious consequences. However, something like
          user@$UID.service may prefer a much lower value like 40%.


---------------------------------------------------------

::

          systemd(1), systemd-system.conf(5), systemd.resource-control(5),
          oomd.conf(5), oomctl(1)


---------------------------------------------------

::

           1. "In defence of swap: common misconceptions"
              https://chrisdown.name/2018/01/02/in-defence-of-swap.html

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

   systemd 249                                      SYSTEMD-OOMD.SERVICE(8)

--------------

Pages that refer to this page: `oomctl(1) <../man1/oomctl.1.html>`__, 
`oomd.conf(5) <../man5/oomd.conf.5.html>`__, 
`org.freedesktop.oom1(5) <../man5/org.freedesktop.oom1.5.html>`__, 
`systemd.resource-control(5) <../man5/systemd.resource-control.5.html>`__

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
