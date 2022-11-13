.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

systemd-fstab-generator(8) — Linux manual page
==============================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `KERNEL COMMA                     |                                   |
| ND LINE <#KERNEL_COMMAND_LINE>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SYSTEMD-FSTAB-GENERATOR(8)ystemd-fstab-generatorSTEMD-FSTAB-GENERATOR(8)

NAME
-------------------------------------------------

::

          systemd-fstab-generator - Unit generator for /etc/fstab


---------------------------------------------------------

::

          /usr/lib/systemd/system-generators/systemd-fstab-generator


---------------------------------------------------------------

::

          systemd-fstab-generator is a generator that translates /etc/fstab
          (see fstab(5) for details) into native systemd units early at
          boot and when configuration of the system manager is reloaded.
          This will instantiate mount and swap units as necessary.

          The passno field is treated like a simple boolean, and the
          ordering information is discarded. However, if the root file
          system is checked, it is checked before all the other file
          systems.

          See systemd.mount(5) and systemd.swap(5) for more information
          about special /etc/fstab mount options this generator
          understands.

          One special topic is handling of symbolic links. Historical init
          implementations supported symlinks in /etc/fstab. Because mount
          units will refuse mounts where the target is a symbolic link,
          this generator will resolve any symlinks as far as possible when
          processing /etc/fstab in order to enhance backwards
          compatibility. If a symlink target does not exist at the time
          that this generator runs, it is assumed that the symlink target
          is the final target of the mount.

          systemd-fstab-generator implements systemd.generator(7).


-------------------------------------------------------------------------------

::

          systemd-fstab-generator understands the following kernel command
          line parameters:

          fstab=, rd.fstab=
              Takes a boolean argument. Defaults to "yes". If "no", causes
              the generator to ignore any mounts or swap devices configured
              in /etc/fstab.  rd.fstab= is honored only by the initial RAM
              disk (initrd) while fstab= is honored by both the main system
              and the initrd.

          root=
              Configures the operating system's root filesystem to mount
              when running in the initrd. This accepts a device node path
              (usually /dev/disk/by-uuid/...  or /dev/disk/by-label/...  or
              similar), or the special values "gpt-auto" and "tmpfs".

              Use "gpt-auto" to explicitly request automatic root file
              system discovery via systemd-gpt-auto-generator(8).

              Use "tmpfs" in order to mount a tmpfs(5) file system as root
              file system of the OS. This is useful in combination with
              mount.usr= (see below) in order to combine a volatile root
              file system with a separate, immutable /usr/ file system.
              Also see systemd.volatile= below.

          rootfstype=
              Takes the root filesystem type that will be passed to the
              mount command.  rootfstype= is honored by the initrd.

          rootflags=
              Takes the root filesystem mount options to use.  rootflags=
              is honored by the initrd.

              Note that unlike most kernel command line options this
              setting does not override settings made in configuration
              files (specifically: the mount option string in /etc/fstab).
              See systemd-remount-fs.service(8).

          mount.usr=
              Takes the /usr/ filesystem to be mounted by the initrd. If
              mount.usrfstype= or mount.usrflags= is set, then mount.usr=
              will default to the value set in root=.

              Otherwise, this parameter defaults to the /usr/ entry found
              in /etc/fstab on the root filesystem.

              mount.usr= is honored by the initrd.

          mount.usrfstype=
              Takes the /usr/ filesystem type that will be passed to the
              mount command. If mount.usr= or mount.usrflags= is set, then
              mount.usrfstype= will default to the value set in
              rootfstype=.

              Otherwise, this value will be read from the /usr/ entry in
              /etc/fstab on the root filesystem.

              mount.usrfstype= is honored by the initrd.

          mount.usrflags=
              Takes the /usr/ filesystem mount options to use. If
              mount.usr= or mount.usrfstype= is set, then mount.usrflags=
              will default to the value set in rootflags=.

              Otherwise, this value will be read from the /usr/ entry in
              /etc/fstab on the root filesystem.

              mount.usrflags= is honored by the initrd.

          systemd.volatile=
              Controls whether the system shall boot up in volatile mode.
              Takes a boolean argument or the special value state.

              If false (the default), this generator makes no changes to
              the mount tree and the system is booted up in normal mode.

              If true the generator ensures
              systemd-volatile-root.service(8) is run as part of the
              initial RAM disk ("initrd"). This service changes the mount
              table before transitioning to the host system, so that a
              volatile memory file system ("tmpfs") is used as root
              directory, with only /usr/ mounted into it from the
              configured root file system, in read-only mode. This way the
              system operates in fully stateless mode, with all
              configuration and state reset at boot and lost at shutdown,
              as /etc/ and /var/ will be served from the (initially
              unpopulated) volatile memory file system.

              If set to state the generator will leave the root directory
              mount point unaltered, however will mount a "tmpfs" file
              system to /var/. In this mode the normal system configuration
              (i.e. the contents of "/etc/") is in effect (and may be
              modified during system runtime), however the system state
              (i.e. the contents of "/var/") is reset at boot and lost at
              shutdown.

              If this setting is set to "overlay" the root file system is
              set up as "overlayfs" mount combining the read-only root
              directory with a writable "tmpfs", so that no modifications
              are made to disk, but the file system may be modified
              nonetheless with all changes being lost at reboot.

              Note that in none of these modes the root directory, /etc/,
              /var/ or any other resources stored in the root file system
              are physically removed. It's thus safe to boot a system that
              is normally operated in non-volatile mode temporarily into
              volatile mode, without losing data.

              Note that with the exception of "overlay" mode, enabling this
              setting will only work correctly on operating systems that
              can boot up with only /usr/ mounted, and are able to
              automatically populate /etc/, and also /var/ in case of
              "systemd.volatile=yes".

              Also see root=tmpfs above, for a method to combine a "tmpfs"
              file system with a regular /usr/ file system (as configured
              via mount.usr=). The main distinction between
              systemd.volatile=yes, and root=tmpfs in combination
              mount.usr= is that the former operates on top of a regular
              root file system and temporarily obstructs the files and
              directories above its /usr/ subdirectory, while the latter
              does not hide any files, but simply mounts a unpopulated
              tmpfs as root file system and combines it with a user picked
              /usr/ file system.

          systemd.swap
              Takes a boolean argument or enables the option if specified
              without an argument. If disabled, causes the generator to
              ignore any swap devices configured in /etc/fstab. Defaults to
              enabled.


---------------------------------------------------------

::

          systemd(1), fstab(5), systemd.mount(5), systemd.swap(5),
          systemd-cryptsetup-generator(8), systemd-gpt-auto-generator(8),
          kernel-command-line(7)

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

   systemd 249                                   SYSTEMD-FSTAB-GENERATOR(8)

--------------

Pages that refer to this page:
`systemd.mount(5) <../man5/systemd.mount.5.html>`__, 
`systemd.swap(5) <../man5/systemd.swap.5.html>`__, 
`kernel-command-line(7) <../man7/kernel-command-line.7.html>`__, 
`systemd.generator(7) <../man7/systemd.generator.7.html>`__, 
`systemd.special(7) <../man7/systemd.special.7.html>`__, 
`systemd-cryptsetup-generator(8) <../man8/systemd-cryptsetup-generator.8.html>`__, 
`systemd-gpt-auto-generator(8) <../man8/systemd-gpt-auto-generator.8.html>`__, 
`systemd-makefs@.service(8) <../man8/systemd-makefs@.service.8.html>`__, 
`systemd-remount-fs.service(8) <../man8/systemd-remount-fs.service.8.html>`__, 
`systemd-veritysetup-generator(8) <../man8/systemd-veritysetup-generator.8.html>`__, 
`systemd-volatile-root.service(8) <../man8/systemd-volatile-root.service.8.html>`__

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
