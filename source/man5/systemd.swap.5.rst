.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd.swap(5) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `AUTOMATIC DEPENDEN               |                                   |
| CIES <#AUTOMATIC_DEPENDENCIES>`__ |                                   |
| \| `FSTAB <#FSTAB>`__ \|          |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD.SWAP(5)               systemd.swap               SYSTEMD.SWAP(5)

NAME
-------------------------------------------------

::

          systemd.swap - Swap unit configuration


---------------------------------------------------------

::

          swap.swap


---------------------------------------------------------------

::

          A unit configuration file whose name ends in ".swap" encodes
          information about a swap device or file for memory paging
          controlled and supervised by systemd.

          This man page lists the configuration options specific to this
          unit type. See systemd.unit(5) for the common options of all unit
          configuration files. The common configuration items are
          configured in the generic [Unit] and [Install] sections. The swap
          specific configuration options are configured in the [Swap]
          section.

          Additional options are listed in systemd.exec(5), which define
          the execution environment the swapon(8) program is executed in,
          in systemd.kill(5), which define the way these processes are
          terminated, and in systemd.resource-control(5), which configure
          resource control settings for these processes of the unit.

          Swap units must be named after the devices or files they control.
          Example: the swap device /dev/sda5 must be configured in a unit
          file dev-sda5.swap. For details about the escaping logic used to
          convert a file system path to a unit name, see systemd.unit(5).
          Note that swap units cannot be templated, nor is possible to add
          multiple names to a swap unit by creating additional symlinks to
          it.

          Note that swap support on Linux is privileged, swap units are
          hence only available in the system service manager (and root's
          user service manager), but not in unprivileged user's service
          manager.


-------------------------------------------------------------------------------------

::

      Implicit Dependencies
          The following dependencies are implicitly added:

          •   All swap units automatically get the BindsTo= and After=
              dependencies on the device units or the mount units of the
              files they are activated from.

          Additional implicit dependencies may be added as result of
          execution and resource control parameters as documented in
          systemd.exec(5) and systemd.resource-control(5).

      Default Dependencies
          The following dependencies are added unless
          DefaultDependencies=no is set:

          •   Swap units automatically acquire a Conflicts= and a Before=
              dependency on umount.target so that they are deactivated at
              shutdown as well as a Before=swap.target dependency.


---------------------------------------------------

::

          Swap units may either be configured via unit files, or via
          /etc/fstab (see fstab(5) for details). Swaps listed in /etc/fstab
          will be converted into native units dynamically at boot and when
          the configuration of the system manager is reloaded. See
          systemd-fstab-generator(8) for details about the conversion.

          If a swap device or file is configured in both /etc/fstab and a
          unit file, the configuration in the latter takes precedence.

          When reading /etc/fstab, a few special options are understood by
          systemd which influence how dependencies are created for swap
          units.

          noauto, auto
              With noauto, the swap unit will not be added as a dependency
              for swap.target. This means that it will not be activated
              automatically during boot, unless it is pulled in by some
              other unit. The auto option has the opposite meaning and is
              the default.

          nofail
              With nofail, the swap unit will be only wanted, not required
              by swap.target. This means that the boot will continue even
              if this swap device is not activated successfully.

          x-systemd.device-timeout=
              Configure how long systemd should wait for a device to show
              up before giving up on an entry from /etc/fstab. Specify a
              time in seconds or explicitly append a unit such as "s",
              "min", "h", "ms".

              Note that this option can only be used in /etc/fstab, and
              will be ignored when part of the Options= setting in a unit
              file.

          x-systemd.makefs
              The swap structure will be initialized on the device. If the
              device is not "empty", i.e. it contains any signature, the
              operation will be skipped. It is hence expected that this
              option remains set even after the device has been
              initialized.

              Note that this option can only be used in /etc/fstab, and
              will be ignored when part of the Options= setting in a unit
              file.

              See systemd-mkswap@.service(8) and the discussion of
              wipefs(8) in systemd.mount(5).


-------------------------------------------------------

::

          Swap unit files must include a [Swap] section, which carries
          information about the swap device it supervises. A number of
          options that may be used in this section are shared with other
          unit types. These options are documented in systemd.exec(5) and
          systemd.kill(5). The options specific to the [Swap] section of
          swap units are the following:

          What=
              Takes an absolute path of a device node or file to use for
              paging. See swapon(8) for details. If this refers to a device
              node, a dependency on the respective device unit is
              automatically created. (See systemd.device(5) for more
              information.) If this refers to a file, a dependency on the
              respective mount unit is automatically created. (See
              systemd.mount(5) for more information.) This option is
              mandatory. Note that the usual specifier expansion is applied
              to this setting, literal percent characters should hence be
              written as "%%".

          Priority=
              Swap priority to use when activating the swap device or file.
              This takes an integer. This setting is optional and ignored
              when the priority is set by pri= in the Options= key.

          Options=
              May contain an option string for the swap device. This may be
              used for controlling discard options among other
              functionality, if the swap backing device supports the
              discard or trim operation. (See swapon(8) for more
              information.) Note that the usual specifier expansion is
              applied to this setting, literal percent characters should
              hence be written as "%%".

          TimeoutSec=
              Configures the time to wait for the swapon command to finish.
              If a command does not exit within the configured time, the
              swap will be considered failed and be shut down again. All
              commands still running will be terminated forcibly via
              SIGTERM, and after another delay of this time with SIGKILL.
              (See KillMode= in systemd.kill(5).) Takes a unit-less value
              in seconds, or a time span value such as "5min 20s". Pass "0"
              to disable the timeout logic. Defaults to
              DefaultTimeoutStartSec= from the manager configuration file
              (see systemd-system.conf(5)).

          Check systemd.exec(5) and systemd.kill(5) for more settings.


---------------------------------------------------------

::

          systemd(1), systemctl(1), systemd-system.conf(5),
          systemd.unit(5), systemd.exec(5), systemd.kill(5),
          systemd.resource-control(5), systemd.device(5), systemd.mount(5),
          swapon(8), systemd-fstab-generator(8), systemd.directives(7)

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

   systemd 249                                              SYSTEMD.SWAP(5)

--------------

Pages that refer to this page: `systemd(1) <../man1/systemd.1.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`systemd.kill(5) <../man5/systemd.kill.5.html>`__, 
`systemd.resource-control(5) <../man5/systemd.resource-control.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`systemd.syntax(7) <../man7/systemd.syntax.7.html>`__, 
`systemd-fstab-generator(8) <../man8/systemd-fstab-generator.8.html>`__, 
`systemd-gpt-auto-generator(8) <../man8/systemd-gpt-auto-generator.8.html>`__

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
