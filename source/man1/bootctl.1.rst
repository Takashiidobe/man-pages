.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

bootctl(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `GENERIC EFI FIRMWARE/BO          |                                   |
| OT LOADER COMMANDS <#GENERIC_EFI_ |                                   |
| FIRMWARE/BOOT_LOADER_COMMANDS>`__ |                                   |
| \|                                |                                   |
| `BOOT LOAD                        |                                   |
| ER SPECIFICATION COMMANDS <#BOOT_ |                                   |
| LOADER_SPECIFICATION_COMMANDS>`__ |                                   |
| \|                                |                                   |
| `SYSTEMD-BOOT COM                 |                                   |
| MANDS <#SYSTEMD-BOOT_COMMANDS>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BOOTCTL(1)                       bootctl                      BOOTCTL(1)

NAME
-------------------------------------------------

::

          bootctl - Control EFI firmware boot settings and manage boot
          loader


---------------------------------------------------------

::

          bootctl [OPTIONS...] {COMMAND}


---------------------------------------------------------------

::

          bootctl can check the EFI firmware and boot loader status, list
          and manage available boot loaders and boot loader entries, and
          install, update, or remove the systemd-boot(7) boot loader on the
          current system.


---------------------------------------------------------------------------------------------------------------------------

::

          These commands are available on any EFI system, regardless of the
          boot loader used.

          status
              Shows brief information about the system firmware, the boot
              loader that was used to boot the system, the boot loaders
              currently available in the ESP, the boot loaders listed in
              the firmware's list of boot loaders and the current default
              boot loader entry. If no command is specified, this is the
              implied default.

          reboot-to-firmware [BOOL]
              Query or set the "Reboot-Into-Firmware-Setup" flag of the EFI
              firmware. Takes a boolean argument which controls whether to
              show the firmware setup on next system reboot. If the
              argument is omitted shows the current status of the flag, or
              whether the flag is supported. This controls the same flag as
              systemctl reboot --firmware-setup, but is more low-level and
              allows setting the flag independently from actually
              requesting a reboot.

          systemd-efi-options [STRING]
              When called without the optional argument, prints the current
              value of the "SystemdOptions" EFI variable. When called with
              an argument, sets the variable to that value. See systemd(1)
              for the meaning of that variable.


-------------------------------------------------------------------------------------------------------------

::

          These commands are available for all boot loaders that implement
          the Boot Loader Specification[1] and/or the Boot Loader
          Interface[2], such as systemd-boot.

          list
              Shows all available boot loader entries implementing the Boot
              Loader Specification[1], as well as any other entries
              discovered or automatically generated by a boot loader
              implementing the Boot Loader Interface[2].

          set-default ID, set-oneshot ID
              Sets the default boot loader entry. Takes a single boot
              loader entry ID string as argument. The set-oneshot command
              will set the default entry only for the next boot, the
              set-default will set it persistently for all future boots.
              Optionally, the boot loader entry ID may be specified as one
              of: @default, @oneshot or @current, which correspond to the
              current default boot loader entry for all future boots, the
              current default boot loader entry for the next boot, and the
              currently booted boot loader entry. These special IDs are
              resolved to the current values of the EFI variables
              LoaderEntryDefault, LoaderEntryOneShot and
              LoaderEntrySelected, see Boot Loader Specification[1] for
              details. These special IDs are primarily useful as a quick
              way to persistently make the currently booted boot loader
              entry the default choice, or to upgrade the default boot
              loader entry for the next boot to the default boot loader
              entry for all future boots, but may be used for other
              operations too. When an empty string ("") is specified as an
              ID, then the corresponding EFI variable will be unset.


-----------------------------------------------------------------------------------

::

          These commands manage the systemd-boot EFI boot loader, and do
          not work in conjunction with other boot loaders.

          install
              Installs systemd-boot into the EFI system partition. A copy
              of systemd-boot will be stored as the EFI default/fallback
              loader at ESP/EFI/BOOT/BOOT*.EFI. The boot loader is then
              added to the top of the firmware's boot loader list.

          update
              Updates all installed versions of systemd-boot(7), if the
              available version is newer than the version installed in the
              EFI system partition. This also includes the EFI
              default/fallback loader at ESP/EFI/BOOT/BOOT*.EFI. The boot
              loader is then added to end of the firmware's boot loader
              list if missing.

          remove
              Removes all installed versions of systemd-boot from the EFI
              system partition and the firmware's boot loader list.

          is-installed
              Checks whether systemd-boot is installed in the ESP. Note
              that a single ESP might host multiple boot loaders; this
              hence checks whether systemd-boot is one (of possibly many)
              installed boot loaders — and neither whether it is the
              default nor whether it is registered in any EFI variables.

          random-seed
              Generates a random seed and stores it in the EFI System
              Partition, for use by the systemd-boot boot loader. Also,
              generates a random 'system token' and stores it persistently
              as an EFI variable, if one has not been set before. If the
              boot loader finds the random seed in the ESP and the system
              token in the EFI variable it will derive a random seed to
              pass to the OS and a new seed to store in the ESP from the
              combination of both. The random seed passed to the OS is
              credited to the kernel's entropy pool by the system manager
              during early boot, and permits userspace to boot up with an
              entropy pool fully initialized very early on. Also see
              systemd-boot-system-token.service(8).

              See Random Seeds[3] for further information.


-------------------------------------------------------

::

          The following options are understood:

          --esp-path=
              Path to the EFI System Partition (ESP). If not specified,
              /efi/, /boot/, and /boot/efi/ are checked in turn. It is
              recommended to mount the ESP to /efi/, if possible.

          --boot-path=
              Path to the Extended Boot Loader partition, as defined in the
              Boot Loader Specification[1]. If not specified, /boot/ is
              checked. It is recommended to mount the Extended Boot Loader
              partition to /boot/, if possible.

          -p, --print-esp-path
              This option modifies the behaviour of status. Only prints the
              path to the EFI System Partition (ESP) to standard output and
              exits.

          -x, --print-boot-path
              This option modifies the behaviour of status. Only prints the
              path to the Extended Boot Loader partition if it exists, and
              the path to the ESP otherwise to standard output and exit.
              This command is useful to determine where to place boot
              loader entries, as they are preferably placed in the Extended
              Boot Loader partition if it exists and in the ESP otherwise.

              Boot Loader Specification Type #1 entries should generally be
              placed in the directory "$(bootctl -x)/loader/entries/".
              Existence of that directory may also be used as indication
              that boot loader entry support is available on the system.
              Similarly, Boot Loader Specification Type #2 entries should
              be placed in the directory "$(bootctl -x)/EFI/Linux/".

              Note that this option (similar to the --print-booth-path
              option mentioned above), is available independently from the
              boot loader used, i.e. also without systemd-boot being
              installed.

          --no-variables
              Do not touch the firmware's boot loader list stored in EFI
              variables.

          --graceful
              Ignore failure when the EFI System Partition cannot be found,
              when EFI variables cannot be written, or a different or newer
              boot loader is already installed. Currently only applies to
              random seed and update operations.

          --make-machine-id-directory=yes|no|auto
              Control creation and deletion of the top-level machine ID
              directory on the file system containing boot loader entries
              (i.e. beneath the file system returned by the
              --print-boot-path option, see above) during install and
              remove, respectively.  "auto" is equivalent to "yes" if
              /etc/machine-id resides on a filesystem other than tmpfs and
              "no" otherwise (in the latter case the machine ID is likely
              transient and hence should not be used persistently in the
              ESP). Defaults to "auto". See machine-id(5) for details about
              the machine ID concept and file.

              Overriding this may be desirable to hide the machine ID from
              the (unencrypted) ESP, configure a kernel-install(8) script,
              or, conversely, commit a transient machine ID.

              The top-level machine ID directory is useful to allow smooth
              multi-boot installations: each installed OS instance will
              have a different machine ID and thus a separate directory to
              place its boot-time resources in. If this feature is turned
              off with this option, care needs to be taken that multiple OS
              instances do not place conflicting files on the shared ESP
              and Extended Boot Loader Partitions, or that multiple OS
              instances are not possible.

          --no-pager
              Do not pipe output into a pager.

          -h, --help
              Print a short help text and exit.

          --version
              Print a short version string and exit.


---------------------------------------------------------------

::

          On success, 0 is returned, a non-zero failure code otherwise.


---------------------------------------------------------------

::

          If $SYSTEMD_RELAX_ESP_CHECKS=1 is set the validation checks for
          the ESP are relaxed, and the path specified with --esp-path= may
          refer to any kind of file system on any kind of partition.

          Similarly, $SYSTEMD_RELAX_XBOOTLDR_CHECKS=1 turns off some
          validation checks for the Extended Boot Loader partition.


---------------------------------------------------------

::

          systemd-boot(7), Boot Loader Specification[1], Boot Loader
          Interface[2], systemd-boot-system-token.service(8)


---------------------------------------------------

::

           1. Boot Loader Specification
              https://systemd.io/BOOT_LOADER_SPECIFICATION

           2. Boot Loader Interface
              https://systemd.io/BOOT_LOADER_INTERFACE

           3. Random Seeds
              https://systemd.io/RANDOM_SEEDS

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

   systemd 249                                                   BOOTCTL(1)

--------------

Pages that refer to this page:
`loader.conf(5) <../man5/loader.conf.5.html>`__, 
`kernel-command-line(7) <../man7/kernel-command-line.7.html>`__, 
`systemd-boot(7) <../man7/systemd-boot.7.html>`__, 
`systemd-boot-system-token.service(8) <../man8/systemd-boot-system-token.service.8.html>`__

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
