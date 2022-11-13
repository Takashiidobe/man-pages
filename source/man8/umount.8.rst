.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

umount(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NON-SUPERUSER UM                 |                                   |
| OUNTS <#NON-SUPERUSER_UMOUNTS>`__ |                                   |
| \| `LOOP DEVICE <#LOOP_DEVICE>`__ |                                   |
| \|                                |                                   |
| `EXTERN                           |                                   |
| AL HELPERS <#EXTERNAL_HELPERS>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UMOUNT(8)                 System Administration                UMOUNT(8)

NAME
-------------------------------------------------

::

          umount - unmount filesystems


---------------------------------------------------------

::

          umount -a [-dflnrv] [-t fstype] [-O option...]

          umount [-dflnrv] {directory|device}

          umount -h|-V


---------------------------------------------------------------

::

          The umount command detaches the mentioned filesystem(s) from the
          file hierarchy. A filesystem is specified by giving the directory
          where it has been mounted. Giving the special device on which the
          filesystem lives may also work, but is obsolete, mainly because
          it will fail in case this device was mounted on more than one
          directory.

          Note that a filesystem cannot be unmounted when it is 'busy' -
          for example, when there are open files on it, or when some
          process has its working directory there, or when a swap file on
          it is in use. The offending process could even be umount itself -
          it opens libc, and libc in its turn may open for example locale
          files. A lazy unmount avoids this problem, but it may introduce
          other issues. See --lazy description below.


-------------------------------------------------------

::

          -a, --all
              All of the filesystems described in /proc/self/mountinfo (or
              in deprecated /etc/mtab) are unmounted, except the proc,
              devfs, devpts, sysfs, rpc_pipefs and nfsd filesystems. This
              list of the filesystems may be replaced by --types umount
              option.

          -A, --all-targets
              Unmount all mountpoints in the current mount namespace for
              the specified filesystem. The filesystem can be specified by
              one of the mountpoints or the device name (or UUID, etc.).
              When this option is used together with --recursive, then all
              nested mounts within the filesystem are recursively
              unmounted. This option is only supported on systems where
              /etc/mtab is a symlink to /proc/mounts.

          -c, --no-canonicalize
              Do not canonicalize paths. The paths canonicalization is
              based on stat(2) and readlink(2) system calls. These system
              calls may hang in some cases (for example on NFS if server is
              not available). The option has to be used with canonical path
              to the mount point.

              This option is silently ignored by umount for non-root users.

              For more details about this option see the mount(8) man page.
              Note that umount does not pass this option to the
              /sbin/umount.type helpers.

          -d, --detach-loop
              When the unmounted device was a loop device, also free this
              loop device. This option is unnecessary for devices
              initialized by mount(8), in this case "autoclear"
              functionality is enabled by default.

          --fake
              Causes everything to be done except for the actual system
              call or umount helper execution; this 'fakes' unmounting the
              filesystem. It can be used to remove entries from the
              deprecated /etc/mtab that were unmounted earlier with the -n
              option.

          -f, --force
              Force an unmount (in case of an unreachable NFS system).

              Note that this option does not guarantee that umount command
              does not hang. It’s strongly recommended to use absolute
              paths without symlinks to avoid unwanted readlink and stat
              system calls on unreachable NFS in umount.

          -i, --internal-only
              Do not call the /sbin/umount.filesystem helper even if it
              exists. By default such a helper program is called if it
              exists.

          -l, --lazy
              Lazy unmount. Detach the filesystem from the file hierarchy
              now, and clean up all references to this filesystem as soon
              as it is not busy anymore.

              A system reboot would be expected in near future if you’re
              going to use this option for network filesystem or local
              filesystem with submounts. The recommended use-case for
              umount -l is to prevent hangs on shutdown due to an
              unreachable network share where a normal umount will hang due
              to a downed server or a network partition. Remounts of the
              share will not be possible.

          -N, --namespace ns
              Perform umount in the mount namespace specified by ns. ns is
              either PID of process running in that namespace or special
              file representing that namespace.

              umount switches to the namespace when it reads /etc/fstab,
              writes /etc/mtab (or writes to /run/mount) and calls
              umount(2) system call, otherwise it runs in the original
              namespace. It means that the target mount namespace does not
              have to contain any libraries or other requirements necessary
              to execute umount(2) command.

              See mount_namespaces(7) for more information.

          -n, --no-mtab
              Unmount without writing in /etc/mtab.

          -O, --test-opts option...
              Unmount only the filesystems that have the specified option
              set in /etc/fstab. More than one option may be specified in a
              comma-separated list. Each option can be prefixed with no to
              indicate that no action should be taken for this option.

          -q, --quiet
              Suppress "not mounted" error messages.

          -R, --recursive
              Recursively unmount each specified directory. Recursion for
              each directory will stop if any unmount operation in the
              chain fails for any reason. The relationship between
              mountpoints is determined by /proc/self/mountinfo entries.
              The filesystem must be specified by mountpoint path; a
              recursive unmount by device name (or UUID) is unsupported.
              Since version 2.37 it umounts also all over-mounted
              filesystems (more filesystems on the same mountpoint).

          -r, --read-only
              When an unmount fails, try to remount the filesystem
              read-only.

          -t, --types type...
              Indicate that the actions should only be taken on filesystems
              of the specified type. More than one type may be specified in
              a comma-separated list. The list of filesystem types can be
              prefixed with no to indicate that no action should be taken
              for all of the mentioned types. Note that umount reads
              information about mounted filesystems from kernel
              (/proc/mounts) and filesystem names may be different than
              filesystem names used in the /etc/fstab (e.g., "nfs4" vs.
              "nfs").

          -v, --verbose
              Verbose mode.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-----------------------------------------------------------------------------------

::

          Normally, only the superuser can umount filesystems. However,
          when fstab contains the user option on a line, anybody can umount
          the corresponding filesystem. For more details see mount(8) man
          page.

          Since version 2.34 the umount command can be used to perform
          umount operation also for fuse filesystems if kernel mount table
          contains user’s ID. In this case fstab user= mount option is not
          required.

          Since version 2.35 umount command does not exit when user
          permissions are inadequate by internal libmount security rules.
          It drops suid permissions and continue as regular non-root user.
          This can be used to support use-cases where root permissions are
          not necessary (e.g., fuse filesystems, user namespaces, etc).


---------------------------------------------------------------

::

          The umount command will automatically detach loop device
          previously initialized by mount(8) command independently of
          /etc/mtab.

          In this case the device is initialized with "autoclear" flag (see
          losetup(8) output for more details), otherwise it’s necessary to
          use the option --detach-loop or call losetup -d <device>. The
          autoclear feature is supported since Linux 2.6.25.


-------------------------------------------------------------------------

::

          The syntax of external unmount helpers is:

             umount.suffix {directory|device} [-flnrv] [-N namespace]
             [-t type.subtype]

          where suffix is the filesystem type (or the value from a uhelper=
          or helper= marker in the mtab file). The -t option can be used
          for filesystems that have subtype support. For example:

             umount.fuse -t fuse.sshfs

          A uhelper=something marker (unprivileged helper) can appear in
          the /etc/mtab file when ordinary users need to be able to unmount
          a mountpoint that is not defined in /etc/fstab (for example for a
          device that was mounted by udisks(1)).

          A helper=type marker in the mtab file will redirect all unmount
          requests to the /sbin/umount.type helper independently of UID.

          Note that /etc/mtab is currently deprecated and helper= and other
          userspace mount options are maintained by libmount.


---------------------------------------------------------------

::

          LIBMOUNT_FSTAB=<path>
              overrides the default location of the fstab file (ignored for
              suid)

          LIBMOUNT_MTAB=<path>
              overrides the default location of the mtab file (ignored for
              suid)

          LIBMOUNT_DEBUG=all
              enables libmount debug output


---------------------------------------------------

::

          /etc/mtab
              table of mounted filesystems (deprecated and usually replaced
              by symlink to /proc/mounts)

          /etc/fstab
              table of known filesystems

          /proc/self/mountinfo
              table of mounted filesystems generated by kernel.


-------------------------------------------------------

::

          A umount command appeared in Version 6 AT&T UNIX.


---------------------------------------------------------

::

          umount(2), losetup(8), mount_namespaces(7), mount(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The umount command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-04-02                      UMOUNT(8)

--------------

Pages that refer to this page: `eject(1) <../man1/eject.1.html>`__, 
`systemd-dissect(1) <../man1/systemd-dissect.1.html>`__, 
`unshare(1) <../man1/unshare.1.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`umount(2) <../man2/umount.2.html>`__, 
`fstab(5) <../man5/fstab.5.html>`__,  `nfs(5) <../man5/nfs.5.html>`__, 
`systemd.mount(5) <../man5/systemd.mount.5.html>`__, 
`cgroups(7) <../man7/cgroups.7.html>`__, 
`mount_namespaces(7) <../man7/mount_namespaces.7.html>`__, 
`blkdeactivate(8) <../man8/blkdeactivate.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`pivot_root(8) <../man8/pivot_root.8.html>`__, 
`umount.nfs(8) <../man8/umount.nfs.8.html>`__, 
`xfs_repair(8) <../man8/xfs_repair.8.html>`__

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
