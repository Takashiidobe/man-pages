.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dracut.conf(5) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DRACUT.CONF(5)                   dracut                   DRACUT.CONF(5)

NAME
-------------------------------------------------

::

          dracut.conf - configuration file(s) for dracut


---------------------------------------------------------

::

          /etc/dracut.conf /etc/dracut.conf.d/*.conf
          /usr/lib/dracut/dracut.conf.d/*.conf


---------------------------------------------------------------

::

          dracut.conf is loaded during the initialisation phase of dracut.
          Command line parameter will override any values set here.

          *.conf files are read from /usr/lib/dracut/dracut.conf.d and
          /etc/dracut.conf.d. Files with the same name in
          /etc/dracut.conf.d will replace files in
          /usr/lib/dracut/dracut.conf.d. The files are then read in
          alphanumerical order and will override parameters set in
          /etc/dracut.conf. Each line specifies an attribute and a value. A
          # indicates the beginning of a comment; following characters, up
          to the end of the line are not interpreted.

          dracut command line options will override any values set here.

          Configuration files must have the extension .conf; other
          extensions are ignored.

          add_dracutmodules+=" <dracut modules> "
              Add a space-separated list of dracut modules to call when
              building the initramfs. Modules are located in
              /usr/lib/dracut/modules.d.

          dracutmodules+=" <dracut modules> "
              Specify a space-separated list of dracut modules to call when
              building the initramfs. Modules are located in
              /usr/lib/dracut/modules.d. This option forces dracut to only
              include the specified dracut modules. In most cases the
              "add_dracutmodules" option is what you want to use.

          omit_dracutmodules+=" <dracut modules> "
              Omit a space-separated list of dracut modules to call when
              building the initramfs. Modules are located in
              /usr/lib/dracut/modules.d.

          drivers+=" <kernel modules> "
              Specify a space-separated list of kernel modules to
              exclusively include in the initramfs. The kernel modules have
              to be specified without the ".ko" suffix.

          add_drivers+=" <kernel modules> "
              Specify a space-separated list of kernel modules to add to
              the initramfs. The kernel modules have to be specified
              without the ".ko" suffix.

          force_drivers+=" <list of kernel modules> "
              See add_drivers above. But in this case it is ensured that
              the drivers are tried to be loaded early via modprobe.

          omit_drivers+=" <kernel modules> "
              Specify a space-separated list of kernel modules not to add
              to the initramfs. The kernel modules have to be specified
              without the ".ko" suffix.

          filesystems+=" <filesystem names> "
              Specify a space-separated list of kernel filesystem modules
              to exclusively include in the generic initramfs.

          drivers_dir="<kernel modules directory>"
              Specify the directory, where to look for kernel modules

          fw_dir+=" :<dir>[:<dir> ...] "
              Specify additional directories, where to look for firmwares,
              separated by :

          install_items+=" <file>[ <file> ...] "
              Specify additional files to include in the initramfs,
              separated by spaces.

          install_optional_items+=" <file>[ <file> ...] "
              Specify additional files to include in the initramfs,
              separated by spaces, if they exist.

          compress="{cat|bzip2|lzma|xz|gzip|lzo|lz4|zstd|<compressor [args
          ...]>}"
              Compress the generated initramfs using the passed compression
              program. If you pass it just the name of a compression
              program, it will call that program with known-working
              arguments. If you pass arguments, it will be called with
              exactly those arguments. Depending on what you pass, this may
              result in an initramfs that the kernel cannot decompress. To
              disable compression, use "cat".

          do_strip="{yes|no}"
              Strip binaries in the initramfs (default=yes)

          hostonly="{yes|no}"
              Host-Only mode: Install only what is needed for booting the
              local host instead of a generic host and generate
              host-specific configuration.

          hostonly_cmdline="{yes|no}"
              If set to "yes", store the kernel command line arguments
              needed in the initramfs

          persistent_policy="<policy>"
              Use <policy> to address disks and partitions.  <policy> can
              be any directory name found in /dev/disk. E.g. "by-uuid",
              "by-label"

          tmpdir="<temporary directory>"
              Specify temporary directory to use.

              Warning
              If chrooted to another root other than the real root device,
              use --fstab and provide a valid /etc/fstab.

          use_fstab="{yes|no}"
              Use /etc/fstab instead of /proc/self/mountinfo.

          add_fstab+=" <filename> "
              Add entries of <filename> to the initramfs /etc/fstab.

          add_device+=" <device> "
              Bring up <device> in initramfs, <device> should be the device
              name. This can be useful in hostonly mode for resume support
              when your swap is on LVM an encrypted partition.

          mdadmconf="{yes|no}"
              Include local /etc/mdadm.conf (default=yes)

          lvmconf="{yes|no}"
              Include local /etc/lvm/lvm.conf (default=yes)

          fscks=" <fsck tools> "
              Add a space-separated list of fsck tools. If nothing is
              specified, the default is: "umount mount /sbin/fsck* xfs_db
              xfs_check xfs_repair e2fsck jfs_fsck reiserfsck btrfsck". The
              installation is opportunistic (non-existing tools are
              ignored).

          nofscks="{yes|no}"
              If specified, inhibit installation of any fsck tools.

          ro_mnt="{yes|no}"
              Mount / and /usr read-only by default.

          kernel_cmdline="parameters"
              Specify default kernel command line parameters

          kernel_only="{yes|no}"
              Only install kernel drivers and firmware files. (default=no)

          no_kernel="{yes|no}"
              Do not install kernel drivers and firmware files (default=no)

          acpi_override="{yes|no}"
              [WARNING] ONLY USE THIS IF YOU KNOW WHAT YOU ARE DOING!

              Override BIOS provided ACPI tables. For further documentation
              read Documentation/acpi/initrd_table_override.txt in the
              kernel sources. Search for ACPI table files (must have .aml
              suffix) in acpi_table_dir= directory (see below) and add them
              to a separate uncompressed cpio archive. This cpio archive
              gets glued (concatenated, uncompressed one must be the first
              one) to the compressed cpio archive. The first, uncompressed
              cpio archive is for data which the kernel must be able to
              access very early (and cannot make use of uncompress
              algorithms yet) like microcode or ACPI tables (default=no).

          acpi_table_dir="<dir>"
              Directory to search for ACPI tables if acpi_override= is set
              to yes.

          early_microcode="{yes|no}"
              Combine early microcode with ramdisk (default=yes)

          stdloglvl="{0-6}"
              Set logging to standard error level.

          sysloglvl="{0-6}"
              Set logging to syslog level.

          fileloglvl="{0-6}"
              Set logging to file level.

          logfile="<file>"
              Path to log file.

          show_modules="{yes|no}"
              Print the name of the included modules to standard output
              during build.

          i18n_vars="<variable mapping>"
              Distribution specific variable mapping. See
              dracut/modules.d/10i18n/README for a detailed description.

          i18n_default_font="<fontname>"
              The font <fontname> to install, if not specified otherwise.
              Default is "eurlatgr".

          i18n_install_all="{yes|no}"
              Install everything regardless of generic or hostonly mode.

          reproducible="{yes|no}"
              Create reproducible images.

          loginstall="<DIR>"
              Log all files installed from the host to <DIR>.

          uefi_stub="<FILE>"
              Specifies the UEFI stub loader, which will load the attached
              kernel, initramfs and kernel command line and boots the
              kernel. The default is
              /lib/systemd/boot/efi/linux<EFI-MACHINE-TYPE-NAME>.efi.stub
              or /usr/lib/gummiboot/linux<EFI-MACHINE-TYPE-NAME>.efi.stub

          uefi_splash_image="<FILE>"
              Specifies the UEFI stub loader’s splash image. Requires
              bitmap (.bmp) image format.

          uefi_secureboot_cert="<FILE>", uefi_secureboot_key="<FILE>"
              Specifies a certificate and corresponding key, which are used
              to sign the created UEFI executable. Requires both
              certificate and key need to be specified and sbsign to be
              installed.

          kernel_image="<FILE>"
              Specifies the kernel image, which to include in the UEFI
              executable. The default is
              /lib/modules/<KERNEL-VERSION>/vmlinuz or
              /boot/vmlinuz-<KERNEL-VERSION>


---------------------------------------------------

::

          /etc/dracut.conf
              Old configuration file. You better use your own file in
              /etc/dracut.conf.d/.

          /etc/dracut.conf.d/
              Any /etc/dracut.conf.d/*.conf file can override the values in
              /etc/dracut.conf. The configuration files are read in
              alphanumerical order.


-----------------------------------------------------

::

          Harald Hoyer


---------------------------------------------------------

::

          dracut(8) dracut.cmdline(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of the dracut (event driven initramfs
          infrastructure) project.  Information about the project can be
          found at ⟨https://dracut.wiki.kernel.org/index.php/Main_Page⟩.
          If you have a bug report for this manual page, send it to
          initramfs@vger.kernel.org.  This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/boot/dracut/dracut.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-05-27.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   dracut 050-166-g811c8146       10/25/2020                 DRACUT.CONF(5)

--------------

Pages that refer to this page:
`dracut.cmdline(7) <../man7/dracut.cmdline.7.html>`__, 
`dracut(8) <../man8/dracut.8.html>`__

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
