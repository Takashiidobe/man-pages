.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mkinitrd-suse(8) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MKINITRD(8)                      dracut                      MKINITRD(8)

NAME
-------------------------------------------------

::

          mkinitrd-suse - is a compat wrapper, which calls dracut to
          generate an initramfs


---------------------------------------------------------

::

          mkinitrd [OPTION...]


---------------------------------------------------------------

::

          mkinitrd creates an initramfs image <initrd-image> for the kernel
          with version <kernel-version> by calling dracut.

              Important
              This version of mkinitrd is provided for compatibility with
              older versions of mkinitrd. If a more fine grained control
              over the resulting image is needed, dracut should be called
              directly.


-------------------------------------------------------

::

          -R, --version
              print info about the version

          -k <kernel_list>
              List of kernel images for which initrd files are created
              (relative to boot_dir), Image name should begin with the
              following string, defaults to vmlinux on ppc/ppc64, image on
              s390/s390x and vmlinuz for everything else.

          -i <initrd_list>
              List of file names (relative to boot_dir) for the initrd;
              positions have to match the kernel_list. Defaults to initrd.

          -m <module_list>
              Modules to include in initrd, defaults to INITRD_MODULES
              variable in /etc/sysconfig/kernel.

          -f <feature_list>
              Features to be enabled for the initrd. In general mkinitrd
              configures the initrd for the root device it is started from.
              With this option additional feature can be enabled.

          -b <bootdir>
              Boot directory, defaults to /boot, where the initrd is
              created.

          -d <root_device>
              Root device, defaults to the device from which the root_dir
              is mounted; overwrites the rootdev environment variable if
              set

          -s <size>
              Add splash animation and bootscreen to initrd.

          -D _<interface>
              Run dhcp on the specified interface (for example "eth0").

          -I _<interface>
              Configure the specified interface statically.

          -a _<acpi_dsdt>
              Attach compiled ACPI DSDT (Differentiated System Description
              Table) to initrd. This replaces the DSDT of the BIOS.
              Defaults to the ACPI_DSDT variable in /etc/sysconfig/kernel.

          -M _<map>
              System.map file to use.

          -B
              Don’t run the update-bootloader(8) script after the initrd(s)
              have been created. This is useful if you call mkinitrd(8) for
              anything else than the running system.

          -A
              Create a so called "monster initrd" which includes all
              available features and modules. This calls dracut with
              --no-hostonly and --no-hostonly-cmdline parameters
              internally, instead of the default --hostonly and
              --hostonly-cmdline.

          -v, --verbose
              increase verbosity level

          -L
              Disable logging to /var/log/YaST2/mkinitrd.log. This is
              useful for testing if you don’t want to clutter the system
              log.

          --help
              print a help message and exit.


-----------------------------------------------------------------

::

          The mkinitrd command is part of the dracut package and is
          available from https://dracut.wiki.kernel.org 


-------------------------------------------------------

::

          Harald Hoyer, Hannes Reinecke


---------------------------------------------------------

::

          dracut(8) update-bootloader(8)

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

   dracut                         05/16/2020                    MKINITRD(8)

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
