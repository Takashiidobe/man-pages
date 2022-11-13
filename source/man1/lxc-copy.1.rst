.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lxc-copy(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COPY HOOK <#COPY_HOOK>`__ \|     |                                   |
| `CO                               |                                   |
| MMON OPTIONS <#COMMON_OPTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LXC-COPY(1)                                                  LXC-COPY(1)

NAME
-------------------------------------------------

::

          lxc-copy - copy an existing container.


---------------------------------------------------------

::

          lxc-copy -n, --name name [ -P, --lxcpath path ]  -N, --newname
          newname [ -p, --newpath newpath ]  [ -B, --backingstorage
          backingstorage ]  [ -s, --snapshot ]  [ -a, --allowrunning ]  [
          -K, --keepname ]  [ -D, --keepdata ]  [ -M, --keepmac ]  [ -L,
          --fssize size [unit] ]  [ -- hook arguments ]

          lxc-copy -n, --name name [ -P, --lxcpath path ]  [ -N, --newname
          newname ]  [ -p, --newpath newpath ]  -e, --ephemeral [ -B,
          --backingstorage backingstorage ]  [ -s, --snapshot ]  [ -a,
          --allowrunning ]  [ -K, --keepname ]  [ -D, --keepdata ]  [ -M,
          --keepmac ]  [ -L, --fssize size [unit] ]  [ -- hook arguments ]

          lxc-copy -n, --name name [ -P, --lxcpath path ]  [ -N, --newname
          newname ]  [ -p, --newpath newpath ]  -e, --ephemeral [ -B,
          --backingstorage backingstorage ]  [ -s, --snapshot ]  [ -t,
          --tmpfs ]  [ -K, --keepname ]  [ -M, --keepmac ]  [ -- hook
          arguments ]

          lxc-copy -n, --name name [ -P, --lxcpath path ]  -N, --newname
          newname [ -p, --newpath newpath ]  -R, --rename


---------------------------------------------------------------

::

          lxc-copy creates and optionally starts (ephemeral or non-
          ephemeral) copies of existing containers.

          lxc-copy creates copies of existing containers. Copies can be
          complete clones of the original container. In this case the whole
          root filesystem of the container is simply copied to the new
          container. Or they can be snapshots, i.e. small copy-on-write
          copies of the original container. In this case the specified
          backing storage for the copy must support snapshots. This
          currently includes btrfs, lvm (lvm devices do not support
          snapshots of snapshots.), overlay, and zfs.

          The copy's backing storage will be of the same type as the
          original container. overlay snapshots of directory backed
          containers are exempted from this rule.

          When the -e flag is specified an ephemeral snapshot of the
          original container is created and started. Ephemeral containers
          will have lxc.ephemeral = 1 set in their config file and will be
          destroyed on shutdown. When -e is used in combination with -D a
          non-ephemeral snapshot of the original container is created and
          started.  Ephemeral containers can also be placed on a tmpfs with
          -t flag. NOTE: If an ephemeral container that is placed on a
          tmpfs is rebooted all changes made to it will currently be lost!

          When -e is specified and no newname is given via -N a random name
          for the snapshot will be chosen.

          Containers created and started with -e can have custom mounts.
          These are specified with the -m flag. Currently two types of
          mounts are supported: bind, and overlay. Mount types are
          specified as suboptions to the -m flag and can be specified
          multiple times separated by commas. overlay mounts are currently
          specified in the format -m overlay=/src:/dest. When no
          destination dest is specified dest will be identical to src.
          Read-only bind mounts are specified -m bind=/src:/dest:ro and
          read-write bind mounts -m bind=/src:/dest:rw. Read-write bind
          mounts are the default and rw can be missing when a read-write
          mount is wanted. When dest is missing dest will be identical to
          src. An example for multiple mounts would be -m
          bind=/src1:/dest1:ro,bind=/src2:ro,overlay=/src3:/dest3.

          The mounts, their options, and formats supported via the -m flag
          are subject to change.


-------------------------------------------------------

::

          -N,--newname newname
                 The name for the copy.

          -p,--newpath newpath
                 The path for the copy.

          -R,--rename
                 Rename the original container.

          -s,--snapshot
                 Create a snapshot of the original container. The backing
                 storage for the copy must support snapshots. This
                 currently includes btrfs, lvm, overlay, and zfs.

          -a,--allowrunning
                 Allow the creation of a Snapshot of an already running
                 container.  This may cause data corruption or data loss
                 depending on the used filesystem and applications. Use
                 with care.

          -F,--foreground
                 Run the snapshot in the foreground. The snapshots console
                 will be attached to the current tty. (This option can only
                 be specified in conjunction with -e.)

          -d, --daemon
                 Run the snapshot as a daemon (This is the default mode for
                 ephemeral containers.). As the container has no more tty,
                 if an error occurs nothing will be displayed, the log file
                 can be used to check the error. (This option can only be
                 specified in conjunction with -e.)

          -m, --mount mounttype
                 Specify a mount for a snapshot The opts argument for the
                 mount type can by of type {bind, overlay}. For example -m
                 bind=/src:/dest:ro,overlay=/src:/dest (This option can
                 currently only be specified in conjunction with -e.).

          -t, --tmpfs
                 When this option is specified the ephemeral container will
                 be placed on a tmpfs. NOTE: Rebooting an ephemeral
                 container that is located on a tmpfs will currently cause
                 all changes made to it to be lost. This flag will only
                 work for ephemeral containers created with the -e flag.
                 The original container, from which the ephemeral snapshot
                 is created, must be stored as a simple directory.

          -B, --backingstorage backingstorage
                 Specify the backing storage type to be used for the copy
                 where 'backingstorage' is of type 'btrfs', 'dir', 'lvm',
                 'loop', 'overlay', or 'zfs'.

          -L, --fssize size [unit]
                 Specify the size for an 'lvm' filesystem.

          -K, --keepname
                 When this option is specified the hostname of the original
                 container will be kept for the copy.

          -D, --keepdata
                 When this option is specified with -e a non-ephemeral
                 container is created and started.

          -M, --keepmac
                 When this option is specified the MAC address of the
                 original container will be kept for the copy.


-----------------------------------------------------------

::

          If the container being copied has one or more lxc.hook.clone
          specified, then the specified hooks will be called for the new
          container. The first 3 arguments passed to the clone hook will be
          the container name, a section ('lxc'), and the hook type
          ('clone'). Extra arguments passed to lxc-copy will be passed to
          the hook program starting at argument 4. The LXC_ROOTFS_MOUNT
          environment variable gives the path under which the container's
          root filesystem is mounted. The configuration file pathname is
          stored in LXC_CONFIG_FILE, the new container name in LXC_NAME,
          the old container name in LXC_SRC_NAME, and the path or device on
          which the rootfs is located is in LXC_ROOTFS_PATH.


---------------------------------------------------------------------

::

          These options are common to most of lxc commands.

          -?, -h, --help
                 Print a longer usage message than normal.

          --usage
                 Give the usage message

          -q, --quiet
                 mute on

          -P, --lxcpath=PATH
                 Use an alternate container path. The default is
                 /usr/local/var/lib/lxc.

          -o, --logfile=FILE
                 Output to an alternate log FILE. The default is no log.

          -l, --logpriority=LEVEL
                 Set log priority to LEVEL. The default log priority is
                 ERROR. Possible values are : FATAL, ALERT, CRIT, WARN,
                 ERROR, NOTICE, INFO, DEBUG, TRACE.

                 Note that this option is setting the priority of the
                 events log in the alternate log file. It do not have
                 effect on the ERROR events log on stderr.

          -n, --name=NAME
                 Use container identifier NAME.  The container identifier
                 format is an alphanumeric string.

          --rcfile=FILE
                 Specify the configuration file to configure the
                 virtualization and isolation functionalities for the
                 container.

                 This configuration file if present will be used even if
                 there is already a configuration file present in the
                 previously created container (via lxc-create).

          --version
                 Show the version number.


---------------------------------------------------------

::

          lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1),
          lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1),
          lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),
          lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)


-----------------------------------------------------

::

          Christian Brauner <christian.brauner@mailbox.org>

COLOPHON
---------------------------------------------------------

::

          This page is part of the lxc (Linux containers) project.
          Information about the project can be found at 
          ⟨http://linuxcontainers.org/⟩.  If you have a bug report for this
          manual page, send it to lxc-devel@lists.linuxcontainers.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://github.com/lxc/lxc⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-08-26.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                                  2021-08-26                    LXC-COPY(1)

--------------

Pages that refer to this page:
`lxc-attach(1) <../man1/lxc-attach.1.html>`__, 
`lxc-autostart(1) <../man1/lxc-autostart.1.html>`__, 
`lxc-cgroup(1) <../man1/lxc-cgroup.1.html>`__, 
`lxc-checkconfig(1) <../man1/lxc-checkconfig.1.html>`__, 
`lxc-checkpoint(1) <../man1/lxc-checkpoint.1.html>`__, 
`lxc-config(1) <../man1/lxc-config.1.html>`__, 
`lxc-console(1) <../man1/lxc-console.1.html>`__, 
`lxc-copy(1) <../man1/lxc-copy.1.html>`__, 
`lxc-create(1) <../man1/lxc-create.1.html>`__, 
`lxc-destroy(1) <../man1/lxc-destroy.1.html>`__, 
`lxc-device(1) <../man1/lxc-device.1.html>`__, 
`lxc-execute(1) <../man1/lxc-execute.1.html>`__, 
`lxc-freeze(1) <../man1/lxc-freeze.1.html>`__, 
`lxc-info(1) <../man1/lxc-info.1.html>`__, 
`lxc-ls(1) <../man1/lxc-ls.1.html>`__, 
`lxc-monitor(1) <../man1/lxc-monitor.1.html>`__, 
`lxc-snapshot(1) <../man1/lxc-snapshot.1.html>`__, 
`lxc-start(1) <../man1/lxc-start.1.html>`__, 
`lxc-stop(1) <../man1/lxc-stop.1.html>`__, 
`lxc-top(1) <../man1/lxc-top.1.html>`__, 
`lxc-unfreeze(1) <../man1/lxc-unfreeze.1.html>`__, 
`lxc-unshare(1) <../man1/lxc-unshare.1.html>`__, 
`lxc-update-config(1) <../man1/lxc-update-config.1.html>`__, 
`lxc-usernsexec(1) <../man1/lxc-usernsexec.1.html>`__, 
`lxc-wait(1) <../man1/lxc-wait.1.html>`__, 
`lxc.container.conf(5) <../man5/lxc.container.conf.5.html>`__, 
`lxc.system.conf(5) <../man5/lxc.system.conf.5.html>`__, 
`lxc(7) <../man7/lxc.7.html>`__

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
