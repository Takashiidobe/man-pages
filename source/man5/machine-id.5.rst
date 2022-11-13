.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

machine-id(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `IN                               |                                   |
| ITIALIZATION <#INITIALIZATION>`__ |                                   |
| \|                                |                                   |
| `FIRST BOOT SEM                   |                                   |
| ANTICS <#FIRST_BOOT_SEMANTICS>`__ |                                   |
| \|                                |                                   |
| `RELATION TO OSF                  |                                   |
| UUIDS <#RELATION_TO_OSF_UUIDS>`__ |                                   |
| \| `HISTORY <#HISTORY>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MACHINE-ID(5)                  machine-id                  MACHINE-ID(5)

NAME
-------------------------------------------------

::

          machine-id - Local machine ID configuration file


---------------------------------------------------------

::

          /etc/machine-id


---------------------------------------------------------------

::

          The /etc/machine-id file contains the unique machine ID of the
          local system that is set during installation or boot. The machine
          ID is a single newline-terminated, hexadecimal, 32-character,
          lowercase ID. When decoded from hexadecimal, this corresponds to
          a 16-byte/128-bit value. This ID may not be all zeros.

          The machine ID is usually generated from a random source during
          system installation or first boot and stays constant for all
          subsequent boots. Optionally, for stateless systems, it is
          generated during runtime during early boot if necessary.

          The machine ID may be set, for example when network booting, with
          the systemd.machine_id= kernel command line parameter or by
          passing the option --machine-id= to systemd. An ID specified in
          this manner has higher priority and will be used instead of the
          ID stored in /etc/machine-id.

          The machine ID does not change based on local or network
          configuration or when hardware is replaced. Due to this and its
          greater length, it is a more useful replacement for the
          gethostid(3) call that POSIX specifies.

          This machine ID adheres to the same format and logic as the D-Bus
          machine ID.

          This ID uniquely identifies the host. It should be considered
          "confidential", and must not be exposed in untrusted
          environments, in particular on the network. If a stable unique
          identifier that is tied to the machine is needed for some
          application, the machine ID or any part of it must not be used
          directly. Instead the machine ID should be hashed with a
          cryptographic, keyed hash function, using a fixed,
          application-specific key. That way the ID will be properly
          unique, and derived in a constant way from the machine ID but
          there will be no way to retrieve the original machine ID from the
          application-specific one. The
          sd_id128_get_machine_app_specific(3) API provides an
          implementation of such an algorithm.


---------------------------------------------------------------------

::

          Each machine should have a non-empty ID in normal operation. The
          ID of each machine should be unique. To achieve those objectives,
          /etc/machine-id can be initialized in a few different ways.

          For normal operating system installations, where a custom image
          is created for a specific machine, /etc/machine-id should be
          populated during installation.

          systemd-machine-id-setup(1) may be used by installer tools to
          initialize the machine ID at install time, but /etc/machine-id
          may also be written using any other means.

          For operating system images which are created once and used on
          multiple machines, for example for containers or in the cloud,
          /etc/machine-id should be either missing or an empty file in the
          generic file system image (the difference between the two options
          is described under "First Boot Semantics" below). An ID will be
          generated during boot and saved to this file if possible. Having
          an empty file in place is useful because it allows a temporary
          file to be bind-mounted over the real file, in case the image is
          used read-only.

          systemd-firstboot(1) may be used to initialize /etc/machine-id on
          mounted (but not booted) system images.

          When a machine is booted with systemd(1) the ID of the machine
          will be established. If systemd.machine_id= or --machine-id=
          options (see first section) are specified, this value will be
          used. Otherwise, the value in /etc/machine-id will be used. If
          this file is empty or missing, systemd will attempt to use the
          D-Bus machine ID from /var/lib/dbus/machine-id, the value of the
          kernel command line option container_uuid, the KVM DMI
          product_uuid or the devicetree vm,uuid (on KVM systems), and
          finally a randomly generated UUID.

          After the machine ID is established, systemd(1) will attempt to
          save it to /etc/machine-id. If this fails, it will attempt to
          bind-mount a temporary file over /etc/machine-id. It is an error
          if the file system is read-only and does not contain a (possibly
          empty) /etc/machine-id file.

          systemd-machine-id-commit.service(8) will attempt to write the
          machine ID to the file system if /etc/machine-id or /etc/ are
          read-only during early boot but become writable later on.


---------------------------------------------------------------------------------

::

          /etc/machine-id is used to decide whether a boot is the first
          one. The rules are as follows:

           1. If /etc/machine-id does not exist, this is a first boot.
              During early boot, systemd will write "uninitialized\n" to
              this file and overmount a temporary file which contains the
              actual machine ID. Later (after first-boot-complete.target
              has been reached), the real machine ID will be written to
              disk.

           2. If /etc/machine-id contains the string "uninitialized", a
              boot is also considered the first boot. The same mechanism as
              above applies.

           3. If /etc/machine-id exists and is empty, a boot is not
              considered the first boot.  systemd will still bind-mount a
              file containing the actual machine-id over it and later try
              to commit it to disk (if /etc/ is writable).

           4. If /etc/machine-id already contains a valid machine-id, this
              is not a first boot.

          If by any of the above rules, a first boot is detected, units
          with ConditionFirstBoot=yes will be run.


-----------------------------------------------------------------------------------

::

          Note that the machine ID historically is not an OSF UUID as
          defined by RFC 4122[1], nor a Microsoft GUID; however, starting
          with systemd v30, newly generated machine IDs do qualify as
          Variant 1 Version 4 UUIDs, as per RFC 4122.

          In order to maintain compatibility with existing installations,
          an application requiring a strictly RFC 4122 compliant UUID
          should decode the machine ID, and then (non-reversibly) apply the
          following operations to turn it into a valid RFC 4122 Variant 1
          Version 4 UUID. With "id" being an unsigned character array:

              /* Set UUID version to 4 --- truly random generation */
              id[6] = (id[6] & 0x0F) | 0x40;
              /* Set the UUID variant to DCE */
              id[8] = (id[8] & 0x3F) | 0x80;

          (This code is inspired by "generate_random_uuid()" of
          drivers/char/random.c from the Linux kernel sources.)


-------------------------------------------------------

::

          The simple configuration file format of /etc/machine-id
          originates in the /var/lib/dbus/machine-id file introduced by
          D-Bus. In fact, this latter file might be a symlink to
          /etc/machine-id.


---------------------------------------------------------

::

          systemd(1), systemd-machine-id-setup(1), gethostid(3),
          hostname(5), machine-info(5), os-release(5), sd-id128(3),
          sd_id128_get_machine(3), systemd-firstboot(1)


---------------------------------------------------

::

           1. RFC 4122
              https://tools.ietf.org/html/rfc4122

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

   systemd 249                                                MACHINE-ID(5)

--------------

Pages that refer to this page: `bootctl(1) <../man1/bootctl.1.html>`__, 
`systemd-firstboot(1) <../man1/systemd-firstboot.1.html>`__, 
`systemd-id128(1) <../man1/systemd-id128.1.html>`__, 
`systemd-machine-id-setup(1) <../man1/systemd-machine-id-setup.1.html>`__, 
`sd-id128(3) <../man3/sd-id128.3.html>`__, 
`sd_id128_get_machine(3) <../man3/sd_id128_get_machine.3.html>`__, 
`sd_id128_randomize(3) <../man3/sd_id128_randomize.3.html>`__, 
`hostname(5) <../man5/hostname.5.html>`__, 
`labels.conf(5) <../man5/labels.conf.5.html>`__, 
`machine-info(5) <../man5/machine-info.5.html>`__, 
`networkd.conf(5) <../man5/networkd.conf.5.html>`__, 
`os-release(5) <../man5/os-release.5.html>`__, 
`repart.d(5) <../man5/repart.d.5.html>`__, 
`systemd.dnssd(5) <../man5/systemd.dnssd.5.html>`__, 
`systemd.netdev(5) <../man5/systemd.netdev.5.html>`__, 
`systemd.network(5) <../man5/systemd.network.5.html>`__, 
`systemd-system.conf(5) <../man5/systemd-system.conf.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`sysusers.d(5) <../man5/sysusers.d.5.html>`__, 
`tmpfiles.d(5) <../man5/tmpfiles.d.5.html>`__, 
`lvmsystemid(7) <../man7/lvmsystemid.7.html>`__, 
`systemd.journal-fields(7) <../man7/systemd.journal-fields.7.html>`__, 
`systemd.special(7) <../man7/systemd.special.7.html>`__, 
`kernel-install(8) <../man8/kernel-install.8.html>`__, 
`systemd-gpt-auto-generator(8) <../man8/systemd-gpt-auto-generator.8.html>`__, 
`systemd-machine-id-commit.service(8) <../man8/systemd-machine-id-commit.service.8.html>`__, 
`systemd-repart(8) <../man8/systemd-repart.8.html>`__

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
