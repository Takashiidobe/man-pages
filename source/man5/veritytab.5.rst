.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

veritytab(5) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VERITYTAB(5)                    veritytab                   VERITYTAB(5)

NAME
-------------------------------------------------

::

          veritytab - Configuration for verity block devices


---------------------------------------------------------

::

          /etc/veritytab


---------------------------------------------------------------

::

          The /etc/veritytab file describes verity integrity protected
          block devices that are set up during system boot.

          Empty lines and lines starting with the "#" character are
          ignored. Each of the remaining lines describes one verity
          integrity protected block device. Fields are delimited by white
          space.

          Each line is in the form

              volume-name data-device hash-device roothash options

          The first four fields are mandatory, the remaining one is
          optional.

          The first field contains the name of the resulting verity volume;
          its block device is set up below /dev/mapper/.

          The second field contains a path to the underlying block data
          device, or a specification of a block device via "UUID=" followed
          by the UUID.

          The third field contains a path to the underlying block hash
          device, or a specification of a block device via "UUID=" followed
          by the UUID.

          The fourth field is the "roothash" in hexadecimal.

          The fifth field, if present, is a comma-delimited list of
          options. The following options are recognized:

          ignore-corruption, restart-on-corruption, panic-on-corruption
              Defines what to do if data integrity problem is detected
              (data corruption). Without these options kernel fails the IO
              operation with I/O error. With "--ignore-corruption" option
              the corruption is only logged. With "--restart-on-corruption"
              or "--panic-on-corruption" the kernel is restarted (panicked)
              immediately. (You have to provide way how to avoid restart
              loops.)

          ignore-zero-blocks
              Instruct kernel to not verify blocks that are expected to
              contain zeroes and always directly return zeroes instead.
              WARNING: Use this option only in very specific cases. This
              option is available since Linux kernel version 4.5.

          check-at-most-once
              Instruct kernel to verify blocks only the first time they are
              read from the data device, rather than every time. WARNING:
              It provides a reduced level of security because only offline
              tampering of the data device's content will be detected, not
              online tampering. This option is available since Linux kernel
              version 4.17.

          root-hash-signature=
              A base64 string encoding the root hash signature prefixed by
              "base64:" or a path to roothash signature file used to verify
              the root hash (in kernel). This feature requires Linux kernel
              version 5.4 or more recent.

          _netdev
              Marks this veritysetup device as requiring network. It will
              be started after the network is available, similarly to
              systemd.mount(5) units marked with _netdev. The service unit
              to set up this device will be ordered between
              remote-fs-pre.target and remote-veritysetup.target, instead
              of veritysetup-pre.target and veritysetup.target.

              Hint: if this device is used for a mount point that is
              specified in fstab(5), the _netdev option should also be used
              for the mount point. Otherwise, a dependency loop might be
              created where the mount point will be pulled in by
              local-fs.target, while the service to configure the network
              is usually only started after the local file system has been
              mounted.

          noauto
              This device will not be added to veritysetup.target. This
              means that it will not be automatically enabled on boot,
              unless something else pulls it in. In particular, if the
              device is used for a mount point, it'll be enabled
              automatically during boot, unless the mount point itself is
              also disabled with noauto.

          nofail
              This device will not be a hard dependency of
              veritysetup.target. It'll still be pulled in and started, but
              the system will not wait for the device to show up and be
              enabled, and boot will not fail if this is unsuccessful. Note
              that other units that depend on the enabled device may still
              fail. In particular, if the device is used for a mount point,
              the mount point itself also needs to have the nofail option,
              or the boot will fail if the device is not enabled
              successfully.

          x-initrd.attach
              Setup this verity integrity protected block device in the
              initramfs, similarly to systemd.mount(5) units marked with
              x-initrd.mount.

              Although it's not necessary to mark the mount entry for the
              root file system with x-initrd.mount, x-initrd.attach is
              still recommended with the verity integrity protected block
              device containing the root file system as otherwise systemd
              will attempt to detach the device during the regular system
              shutdown while it's still in use. With this option the device
              will still be detached but later after the root file system
              is unmounted.

              All other verity integrity protected block devices that
              contain file systems mounted in the initramfs should use this
              option.

          At early boot and when the system manager configuration is
          reloaded, this file is translated into native systemd units by
          systemd-veritysetup-generator(8).


---------------------------------------------------------

::

          Example 1. /etc/veritytab example

          Set up two verity integrity protected block devices. One using
          device blocks, another using files.

              usr  PARTUUID=783e45ae-7aa3-484a-beef-a80ff9c19cbb PARTUUID=21dc1dfe-4c33-8b48-98a9-918a22eb3e37 36e3f740ad502e2c25e2a23d9c7c17bf0fdad2300b7580842d4b7ec1fb0fa263 auto
              data /etc/data /etc/hash a5ee4b42f70ae1f46a08a7c92c2e0a20672ad2f514792730f5d49d7606ab8fdf auto


---------------------------------------------------------

::

          systemd(1), systemd-veritysetup@.service(8),
          systemd-veritysetup-generator(8), fstab(5), veritysetup(8),

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

   systemd 249                                                 VERITYTAB(5)

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
