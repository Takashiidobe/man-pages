.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

loader.conf(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOADER.CONF(5)                 loader.conf                LOADER.CONF(5)

NAME
-------------------------------------------------

::

          loader.conf - Configuration file for systemd-boot


---------------------------------------------------------

::

          ESP/loader/loader.conf, ESP/loader/entries/*.conf


---------------------------------------------------------------

::

          systemd-boot(7) will read ESP/loader/loader.conf and any files
          with the ".conf" extension under ESP/loader/entries/ on the EFI
          system partition (ESP).

          Each configuration file must consist of an option name, followed
          by whitespace, and the option value.  "#" may be used to start a
          comment line. Empty and comment lines are ignored.

          Boolean arguments may be written as "yes"/"y"/"true"/"t"/"on"/"1"
          or "no"/"n"/"false"/"f"/"off"/"0".


-------------------------------------------------------

::

          The following configuration options in loader.conf are
          understood:

          default
              A glob pattern to select the default entry. The default entry
              may be changed in the boot menu itself, in which case the
              name of the selected entry will be stored as an EFI variable,
              overriding this option.

              Table 1. Automatically detected entries will use the
              following names:
              ┌──────────────────────────────┬──────────────────────┐
              │Name                          │ Description          │
              ├──────────────────────────────┼──────────────────────┤
              │auto-efi-default              │ EFI Default Loader   │
              ├──────────────────────────────┼──────────────────────┤
              │auto-efi-shell                │ EFI Shell            │
              ├──────────────────────────────┼──────────────────────┤
              │auto-osx                      │ macOS                │
              ├──────────────────────────────┼──────────────────────┤
              │auto-reboot-to-firmware-setup │ Reboot Into Firmware │
              │                              │ Interface            │
              ├──────────────────────────────┼──────────────────────┤
              │auto-windows                  │ Windows Boot Manager │
              └──────────────────────────────┴──────────────────────┘

          timeout
              How long the boot menu should be shown before the default
              entry is booted, in seconds. This may be changed in the boot
              menu itself and will be stored as an EFI variable in that
              case, overriding this option.

              If the timeout is disabled, the default entry will be booted
              immediately. The menu can be shown by pressing and holding a
              key before systemd-boot is launched.

          console-mode
              This option configures the resolution of the console. Takes a
              number or one of the special values listed below. The
              following values may be used:

              0
                  Standard UEFI 80x25 mode

              1
                  80x50 mode, not supported by all devices

              2
                  the first non-standard mode provided by the device
                  firmware, if any

              auto
                  Pick a suitable mode automatically using heuristics

              max
                  Pick the highest-numbered available mode

              keep
                  Keep the mode selected by firmware (the default)

          editor
              Takes a boolean argument. Enable (the default) or disable the
              editor. The editor should be disabled if the machine can be
              accessed by unauthorized persons.

          auto-entries
              Takes a boolean argument. Enable (the default) or disable
              entries for other boot entries found on the boot partition.
              In particular, this may be useful when loader entries are
              created to show replacement descriptions for those entries.

          auto-firmware
              Takes a boolean argument. Enable (the default) or disable the
              "Reboot into firmware" entry.

          random-seed-mode
              Takes one of "off", "with-system-token" and "always". If
              "off" no random seed data is read off the ESP, nor passed to
              the OS. If "with-system-token" (the default) systemd-boot
              will read a random seed from the ESP (from the file
              /loader/random-seed) only if the LoaderSystemToken EFI
              variable is set, and then derive the random seed to pass to
              the OS from the combination. If "always" the boot loader will
              do so even if LoaderSystemToken is not set. This mode is
              useful in environments where protection against OS image
              reuse is not a concern, and the random seed shall be used
              even with no further setup in place. Use bootctl random-seed
              to initialize both the random seed file in the ESP and the
              system token EFI variable.

              See Random Seeds[1] for further information.


-------------------------------------------------------

::

              # /boot/efi/loader/loader.conf
              timeout 0
              default 01234567890abcdef1234567890abdf0-*
              editor no

          The menu will not be shown by default (the menu can still be
          shown by pressing and holding a key during boot). One of the
          entries with files with a name starting with
          "01234567890abcdef1234567890abdf0-" will be selected by default.
          If more than one entry matches, the one with the highest priority
          will be selected (generally the one with the highest version
          number). The editor will be disabled, so it is not possible to
          alter the kernel command line.


---------------------------------------------------------

::

          systemd-boot(7), bootctl(1)


---------------------------------------------------

::

           1. Random Seeds
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

   systemd 249                                               LOADER.CONF(5)

--------------

Pages that refer to this page:
`systemd-boot(7) <../man7/systemd-boot.7.html>`__

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
