.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

kernel-install(8) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `THE $BOOT PA                     |                                   |
| RTITION <#THE_$BOOT_PARTITION>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `EXIT STATUS <#EXIT_STATUS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   KERNEL-INSTALL(8)            kernel-install            KERNEL-INSTALL(8)

NAME
-------------------------------------------------

::

          kernel-install - Add and remove kernel and initramfs images to
          and from /boot


---------------------------------------------------------

::

          kernel-install COMMAND [OPTIONS...] KERNEL-VERSION KERNEL-IMAGE
                         [INITRD-FILE...]


---------------------------------------------------------------

::

          kernel-install is used to install and remove kernel and initramfs
          images to and from the boot loader partition, referred to as
          $BOOT here. It will usually be one of /boot/, /efi/, or
          /boot/efi/, see below.

          kernel-install will execute the files located in the directory
          /usr/lib/kernel/install.d/ and the local administration directory
          /etc/kernel/install.d/. All files are collectively sorted and
          executed in lexical order, regardless of the directory in which
          they live. However, files with identical filenames replace each
          other. Files in /etc/kernel/install.d/ take precedence over files
          with the same name in /usr/lib/kernel/install.d/. This can be
          used to override a system-supplied executables with a local file
          if needed; a symbolic link in /etc/kernel/install.d/ with the
          same name as an executable in /usr/lib/kernel/install.d/,
          pointing to /dev/null, disables the executable entirely.
          Executables must have the extension ".install"; other extensions
          are ignored.

          An executable should return 0 on success. It may also return 77
          to cause the whole operation to terminate (executables later in
          lexical order will be skipped).


---------------------------------------------------------

::

          The following commands are understood:

          add KERNEL-VERSION KERNEL-IMAGE [INITRD-FILE ...]
              This command expects a kernel version string and a path to a
              kernel image file as arguments.  kernel-install calls the
              executables from /usr/lib/kernel/install.d/*.install and
              /etc/kernel/install.d/*.install with the following arguments:

                  add KERNEL-VERSION $BOOT/MACHINE-ID/KERNEL-VERSION/ KERNEL-IMAGE [INITRD-FILE ...]

              Three default plugins execute the following operations in
              this case:

              •   00-entry-directory.install creates the directory
                  $BOOT/MACHINE-ID/KERNEL-VERSION/ if $BOOT/MACHINE-ID/
                  already exists.

              •   50-depmod.install runs depmod(8) for the KERNEL-VERSION.

              •   90-loaderentry.install copies KERNEL-IMAGE to
                  $BOOT/MACHINE-ID/KERNEL-VERSION/linux. If an INITRD-FILE
                  is provided, it also copies INITRD-FILE to
                  $BOOT/MACHINE-ID/KERNEL_VERSION/INITRD-FILE. It also
                  creates a boot loader entry according to the Boot Loader
                  Specification[1] in
                  $BOOT/loader/entries/MACHINE-ID-KERNEL-VERSION.conf. The
                  title of the entry is the PRETTY_NAME parameter specified
                  in /etc/os-release or /usr/lib/os-release (if the former
                  is missing), or "Linux KERNEL-VERSION", if unset.

                  If the entry directory $BOOT/MACHINE-ID/KERNEL-VERSION/
                  does not exist, this plugin does nothing.

          remove KERNEL-VERSION
              This command expects a kernel version string as single
              argument. This calls executables from
              /usr/lib/kernel/install.d/*.install and
              /etc/kernel/install.d/*.install with the following arguments:

                  remove KERNEL-VERSION $BOOT/MACHINE-ID/KERNEL-VERSION/

              Afterwards, kernel-install removes the directory
              $BOOT/MACHINE-ID/KERNEL-VERSION/ and its contents.

              Two default plugins execute the following operations in this
              case:

              •   50-depmod.install removes the files generated by depmod
                  for this kernel again.

              •   90-loaderentry.install removes the file
                  $BOOT/loader/entries/MACHINE-ID-KERNEL-VERSION.conf.


-------------------------------------------------------------------------------

::

          The partition where the kernels and Boot Loader Specification[1]
          snippets are located is called $BOOT.  kernel-install determines
          the location of this partition by checking /efi/, /boot/, and
          /boot/efi/ in turn. The first location where
          $BOOT/loader/entries/ or $BOOT/$MACHINE_ID/ exists is used.


-------------------------------------------------------

::

          The following options are understood:

          -v, --verbose
              Output additional information about operations being
              performed.

          -h, --help
              Print a short help text and exit.


-----------------------------------------------------------------------------------

::

          If --verbose is used, $KERNEL_INSTALL_VERBOSE=1 will be set for
          the plugins. They may output additional logs in this case.


---------------------------------------------------------------

::

          If every executable returns 0 or 77, 0 is returned, and a
          non-zero failure code otherwise.


---------------------------------------------------

::

          /usr/lib/kernel/install.d/*.install
          /etc/kernel/install.d/*.install
              Drop-in files which are executed by kernel-install.

          /etc/kernel/cmdline /proc/cmdline
              Read by 90-loaderentry.install. The content of the file
              /etc/kernel/cmdline specifies the kernel command line to use.
              If that file does not exist, /proc/cmdline is used.

          /etc/kernel/tries
              Read by 90-loaderentry.install. If this file exists a numeric
              value is read from it and the naming of the generated entry
              file is slightly altered to include it as
              $BOOT/loader/entries/MACHINE-ID-KERNEL-VERSION+TRIES.conf.
              This is useful for boot loaders such as systemd-boot(7) which
              implement boot attempt counting with a counter embedded in
              the entry file name.

          /etc/machine-id
              The content of this file specifies the machine identification
              MACHINE-ID. If it cannot read /etc/machine-id, kernel-install
              will use "Linux" as the machine ID instead.

          /etc/os-release /usr/lib/os-release
              The content of the file specifies the operating system title
              PRETTY_NAME.


---------------------------------------------------------

::

          machine-id(5), os-release(5), depmod(8), systemd-boot(7), Boot
          Loader Specification[1]


---------------------------------------------------

::

           1. Boot Loader Specification
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

   systemd 249                                            KERNEL-INSTALL(8)

--------------

Pages that refer to this page: `bootctl(1) <../man1/bootctl.1.html>`__, 
`systemd-firstboot(1) <../man1/systemd-firstboot.1.html>`__, 
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
