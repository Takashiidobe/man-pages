.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-gpt-auto-generator(8) — Linux manual page
=================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `KERNEL COMMA                     |                                   |
| ND LINE <#KERNEL_COMMAND_LINE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-GPT-AUTO-GENERATOR(8)d-gpt-auto-generatorD-GPT-AUTO-GENERATOR(8)

NAME
-------------------------------------------------

::

          systemd-gpt-auto-generator - Generator for automatically
          discovering and mounting root, /home/, /srv/, /var/ and /var/tmp/
          partitions, as well as discovering and enabling swap partitions,
          based on GPT partition type GUIDs


---------------------------------------------------------

::

          /usr/lib/systemd/system-generators/systemd-gpt-auto-generator


---------------------------------------------------------------

::

          systemd-gpt-auto-generator is a unit generator that automatically
          discovers root, /home/, /srv/, /var/, /var/tmp/, the EFI System
          Partition, the Extended Boot Loader Partition and swap partitions
          and creates mount and swap units for them, based on the partition
          type GUIDs of GUID partition tables (GPT), see UEFI
          Specification[1], chapter 5. It implements the Discoverable
          Partitions Specification[2]. Note that this generator has no
          effect on non-GPT systems, and on specific mount points that are
          directories already containing files. Also, on systems where the
          units are explicitly configured (for example, listed in
          fstab(5)), the units this generator creates are overridden, but
          additional implicit dependencies might be created.

          This generator will only look for the root partition on the same
          physical disk the EFI System Partition (ESP) is located on. Note
          that support from the boot loader is required: the EFI variable
          LoaderDevicePartUUID of the 4a67b082-0a4c-41cf-b6c7-440b29bb8c4f
          vendor UUID is used to determine from which partition, and hence
          the disk from which the system was booted. If the boot loader
          does not set this variable, this generator will not be able to
          autodetect the root partition. See the Boot Loader Interface[3]
          for details.

          Similarly, this generator will only look for the other partitions
          on the same physical disk as the root partition. In this case,
          boot loader support is not required. These partitions will not be
          searched for on systems where the root file system is distributed
          on multiple disks, for example via btrfs RAID.

          systemd-gpt-auto-generator is useful for centralizing file system
          configuration in the partition table and making configuration in
          /etc/fstab or on the kernel command line unnecessary.

          This generator looks for the partitions based on their partition
          type GUID. The following partition type GUIDs are identified:

          Table 1. Partition Type GUIDs
          ┌─────────────────────────────────────┬─────────────────┬─────────────┬────────────────┐
          │Partition Type                       │ Name            │ Mount Point │ Explanation    │
          │GUID                                 │                 │             │                │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │44479540-f297-41b2-9af7-d131d5f0458a │ Root Partition  │ /           │ On 32-bit x86  │
          │                                     │ (x86)           │             │ systems, the   │
          │                                     │                 │             │ first x86 root │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ EFI ESP is     │
          │                                     │                 │             │ located on is  │
          │                                     │                 │             │ mounted to the │
          │                                     │                 │             │ root directory │
          │                                     │                 │             │ /.             │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │4f68bce3-e8cd-4db1-96e7-fbcaf984b709 │ Root Partition  │ /           │ On 64-bit x86  │
          │                                     │ (x86-64)        │             │ systems, the   │
          │                                     │                 │             │ first x86-64   │
          │                                     │                 │             │ root partition │
          │                                     │                 │             │ on the disk    │
          │                                     │                 │             │ the EFI ESP is │
          │                                     │                 │             │ located on is  │
          │                                     │                 │             │ mounted to the │
          │                                     │                 │             │ root directory │
          │                                     │                 │             │ /.             │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │69dad710-2ce4-4e3c-b16c-21a1d49abed3 │ Root Partition  │ /           │ On 32-bit ARM  │
          │                                     │ (32-bit ARM)    │             │ systems, the   │
          │                                     │                 │             │ first ARM root │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ EFI ESP is     │
          │                                     │                 │             │ located on is  │
          │                                     │                 │             │ mounted to the │
          │                                     │                 │             │ root directory │
          │                                     │                 │             │ /.             │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │b921b045-1df0-41c3-af44-4c6f280d3fae │ Root Partition  │ /           │ On 64-bit ARM  │
          │                                     │ (64-bit ARM)    │             │ systems, the   │
          │                                     │                 │             │ first ARM root │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ EFI ESP is     │
          │                                     │                 │             │ located on is  │
          │                                     │                 │             │ mounted to the │
          │                                     │                 │             │ root directory │
          │                                     │                 │             │ /.             │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │993d8d3d-f80e-4225-855a-9daf8ed7ea97 │ Root Partition  │ /           │ On Itanium     │
          │                                     │ (Itanium/IA-64) │             │ systems, the   │
          │                                     │                 │             │ first Itanium  │
          │                                     │                 │             │ root partition │
          │                                     │                 │             │ on the disk    │
          │                                     │                 │             │ the EFI ESP is │
          │                                     │                 │             │ located on is  │
          │                                     │                 │             │ mounted to the │
          │                                     │                 │             │ root directory │
          │                                     │                 │             │ /.             │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │77055800-792c-4f94-b39a-98c91b762bb6 │ Root Partition  │ /           │ On LoongArch   │
          │                                     │ (LoongArch 64)  │             │ 64-bit         │
          │                                     │                 │             │ systems, the   │
          │                                     │                 │             │ first          │
          │                                     │                 │             │ LoongArch      │
          │                                     │                 │             │ 64-bit root    │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ EFI ESP is     │
          │                                     │                 │             │ located on is  │
          │                                     │                 │             │ mounted to the │
          │                                     │                 │             │ root directory │
          │                                     │                 │             │ /.             │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │60d5a7fe-8e7d-435c-b714-3dd8162144e1 │ Root Partition  │ /           │ On RISC-V      │
          │                                     │ (RISCV-V 32)    │             │ 32-bit         │
          │                                     │                 │             │ systems, the   │
          │                                     │                 │             │ first RISCV-V  │
          │                                     │                 │             │ 32-bit root    │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ EFI ESP is     │
          │                                     │                 │             │ located on is  │
          │                                     │                 │             │ mounted to the │
          │                                     │                 │             │ root directory │
          │                                     │                 │             │ /.             │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │72ec70a6-cf74-40e6-bd49-4bda08e8f224 │ Root Partition  │ /           │ On RISC-V      │
          │                                     │ (RISCV-V 64)    │             │ 64-bit         │
          │                                     │                 │             │ systems, the   │
          │                                     │                 │             │ first RISCV-V  │
          │                                     │                 │             │ 64-bit root    │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ EFI ESP is     │
          │                                     │                 │             │ located on is  │
          │                                     │                 │             │ mounted to the │
          │                                     │                 │             │ root directory │
          │                                     │                 │             │ /.             │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │933ac7e1-2eb4-4f13-b844-0e14e2aef915 │ Home Partition  │ /home/      │ The first home │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ root partition │
          │                                     │                 │             │ is located on  │
          │                                     │                 │             │ is mounted to  │
          │                                     │                 │             │ /home/.        │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │3b8f8425-20e0-4f3b-907f-1a25a76f98e8 │ Server Data     │ /srv/       │ The first      │
          │                                     │ Partition       │             │ server data    │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ root partition │
          │                                     │                 │             │ is located on  │
          │                                     │                 │             │ is mounted to  │
          │                                     │                 │             │ /srv/.         │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │4d21b016-b534-45c2-a9fb-5c16e091fd2d │ Variable Data   │ /var/       │ The first      │
          │                                     │ Partition       │             │ variable data  │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ root partition │
          │                                     │                 │             │ is located on  │
          │                                     │                 │             │ is mounted to  │
          │                                     │                 │             │ /var/ — under  │
          │                                     │                 │             │ the condition  │
          │                                     │                 │             │ its partition  │
          │                                     │                 │             │ UUID matches   │
          │                                     │                 │             │ the first 128  │
          │                                     │                 │             │ bit of the     │
          │                                     │                 │             │ HMAC-SHA256 of │
          │                                     │                 │             │ the GPT type   │
          │                                     │                 │             │ uuid of this   │
          │                                     │                 │             │ partition      │
          │                                     │                 │             │ keyed by the   │
          │                                     │                 │             │ machine ID of  │
          │                                     │                 │             │ the            │
          │                                     │                 │             │ installation   │
          │                                     │                 │             │ stored in      │
          │                                     │                 │             │ machine-id(5). │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │7ec6f557-3bc5-4aca-b293-16ef5df639d1 │ Temporary Data  │ /var/tmp/   │ The first      │
          │                                     │ Partition       │             │ temporary data │
          │                                     │                 │             │ partition on   │
          │                                     │                 │             │ the disk the   │
          │                                     │                 │             │ root partition │
          │                                     │                 │             │ is located on  │
          │                                     │                 │             │ is mounted to  │
          │                                     │                 │             │ /var/tmp/.     │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │0657fd6d-a4ab-43c4-84e5-0933c84b4f4f │ Swap            │ n/a         │ All swap       │
          │                                     │                 │             │ partitions     │
          │                                     │                 │             │ located on the │
          │                                     │                 │             │ disk the root  │
          │                                     │                 │             │ partition is   │
          │                                     │                 │             │ located on are │
          │                                     │                 │             │ enabled.       │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │c12a7328-f81f-11d2-ba4b-00a0c93ec93b │ EFI System      │ /efi/ or    │ The first ESP  │
          │                                     │ Partition (ESP) │ /boot/      │ located on the │
          │                                     │                 │             │ disk the root  │
          │                                     │                 │             │ partition is   │
          │                                     │                 │             │ located on is  │
          │                                     │                 │             │ mounted to     │
          │                                     │                 │             │ /boot/ or      │
          │                                     │                 │             │ /efi/, see     │
          │                                     │                 │             │ below.         │
          ├─────────────────────────────────────┼─────────────────┼─────────────┼────────────────┤
          │bc13c2ff-59e6-4262-a352-b275fd6f7172 │ Extended Boot   │ /boot/      │ The first      │
          │                                     │ Loader          │             │ Extended Boot  │
          │                                     │ Partition       │             │ Loader         │
          │                                     │                 │             │ Partition is   │
          │                                     │                 │             │ mounted to     │
          │                                     │                 │             │ /boot/, see    │
          │                                     │                 │             │ below.         │
          └─────────────────────────────────────┴─────────────────┴─────────────┴────────────────┘

          This generator understands the following attribute flags for
          partitions:

          Table 2. Partition Attributes
          ┌──────────────────────────────┬────────────────────┬───────────────┬───────────────┐
          │Name                          │ Value              │ Applicable to │ Explanation   │
          ├──────────────────────────────┼────────────────────┼───────────────┼───────────────┤
          │GPT_FLAG_READ_ONLY            │ 0x1000000000000000 │ /, /home/,    │ Partition is  │
          │                              │                    │ /srv/, /var/, │ mounted       │
          │                              │                    │ /var/tmp/,    │ read-only     │
          │                              │                    │ Extended Boot │               │
          │                              │                    │ Loader        │               │
          │                              │                    │ Partition     │               │
          ├──────────────────────────────┼────────────────────┼───────────────┼───────────────┤
          │GPT_FLAG_NO_AUTO              │ 0x8000000000000000 │ /, /home/,    │ Partition is  │
          │                              │                    │ /srv/, /var/, │ not mounted   │
          │                              │                    │ /var/tmp/,    │ automatically │
          │                              │                    │ Extended Boot │               │
          │                              │                    │ Loader        │               │
          │                              │                    │ Partition     │               │
          ├──────────────────────────────┼────────────────────┼───────────────┼───────────────┤
          │GPT_FLAG_NO_BLOCK_IO_PROTOCOL │ 0x0000000000000002 │ EFI System    │ Partition is  │
          │                              │                    │ Partition     │ not mounted   │
          │                              │                    │ (ESP)         │ automatically │
          └──────────────────────────────┴────────────────────┴───────────────┴───────────────┘

          The /home/, /srv/, /var/ and /var/tmp/ partitions may be
          encrypted in LUKS format. In this case, a device mapper device is
          set up under the names /dev/mapper/home, /dev/mapper/srv,
          /dev/mapper/var and /dev/mapper/tmp. Note that this might create
          conflicts if the same partition is listed in /etc/crypttab with a
          different device mapper device name.

          When systemd is running in the initrd the / partition may be
          encrypted in LUKS format as well. In this case, a device mapper
          device is set up under the name /dev/mapper/root, and a
          sysroot.mount is set up that mounts the device under /sysroot.
          For more information, see bootup(7).

          Mount and automount units for the EFI System Partition (ESP) are
          generated on EFI systems. The ESP is mounted to /boot/ (except if
          an Extended Boot Loader partition exists, see below), unless a
          mount point directory /efi/ exists, in which case it is mounted
          there. Since this generator creates an automount unit, the mount
          will only be activated on-demand, when accessed. On systems where
          /boot/ (or /efi/ if it exists) is an explicitly configured mount
          (for example, listed in fstab(5)) or where the /boot/ (or /efi/)
          mount point is non-empty, no mount units are generated.

          If the disk contains an Extended Boot Loader partition, as
          defined in the Boot Loader Specification[4], it is made available
          at /boot/ (by means of an automount point, similar to the ESP,
          see above). If both an EFI System Partition and an Extended Boot
          Loader partition exist the latter is preferably mounted to
          /boot/. Make sure to create both /efi/ and /boot/ to ensure both
          partitions are mounted.

          When using this generator in conjunction with btrfs file systems,
          make sure to set the correct default subvolumes on them, using
          btrfs subvolume set-default.

          systemd-gpt-auto-generator implements systemd.generator(7).


-------------------------------------------------------------------------------

::

          systemd-gpt-auto-generator understands the following kernel
          command line parameters:

          systemd.gpt_auto, rd.systemd.gpt_auto
              Those options take an optional boolean argument, and default
              to yes. The generator is enabled by default, and a negative
              value may be used to disable it.

          root=
              When used with the special value "gpt-auto", automatic
              discovery of the root partition based on the GPT partition
              type is enabled. Any other value disables this generator.

          rw, ro
              Mount the root partition read-write or read-only initially.

              Note that unlike most kernel command line options these
              settings do not override configuration in the file system,
              and the file system may be remounted later. See
              systemd-remount-fs.service(8).


---------------------------------------------------------

::

          systemd(1), systemd.mount(5), systemd.swap(5),
          systemd-fstab-generator(8), systemd-cryptsetup@.service(8),
          machine-id(5), cryptsetup(8), fstab(5), btrfs(8)


---------------------------------------------------

::

           1. UEFI Specification
              https://uefi.org/specifications

           2. Discoverable Partitions Specification
              https://systemd.io/DISCOVERABLE_PARTITIONS

           3. Boot Loader Interface
              https://systemd.io/BOOT_LOADER_INTERFACE

           4. Boot Loader Specification
              https://systemd.io/BOOT_LOADER_SPECIFICATION

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

   systemd 249                                SYSTEMD-GPT-AUTO-GENERATOR(8)

--------------

Pages that refer to this page:
`repart.d(5) <../man5/repart.d.5.html>`__, 
`file-hierarchy(7) <../man7/file-hierarchy.7.html>`__, 
`kernel-command-line(7) <../man7/kernel-command-line.7.html>`__, 
`systemd-boot(7) <../man7/systemd-boot.7.html>`__, 
`systemd.generator(7) <../man7/systemd.generator.7.html>`__, 
`systemd-fstab-generator(8) <../man8/systemd-fstab-generator.8.html>`__, 
`systemd-remount-fs.service(8) <../man8/systemd-remount-fs.service.8.html>`__

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
