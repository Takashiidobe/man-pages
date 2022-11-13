.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lxc-create(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CO                               |                                   |
| MMON OPTIONS <#COMMON_OPTIONS>`__ |                                   |
| \| `DIAGNOSTIC <#DIAGNOSTIC>`__   |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LXC-CREATE(1)                                              LXC-CREATE(1)

NAME
-------------------------------------------------

::

          lxc-create - creates a container


---------------------------------------------------------

::

          lxc-create -n name [ -f config_file ]  -t template [ -B
          backingstore ]  [ -- template-options ]


---------------------------------------------------------------

::

          lxc-create creates a system object where is stored the
          configuration information and where can be stored user
          information. The identifier name is used to specify the container
          to be used with the different lxc commands.

          The object is a directory created in /usr/local/var/lib/lxc and
          identified by its name.

          The object is the definition of the different resources an
          application can use or can see. The more the configuration file
          contains information, the more the container is isolated and the
          more the application is jailed.

          If the configuration file config_file is not specified, the
          container will be created with the default isolation: processes,
          sysv ipc and mount points.


-------------------------------------------------------

::

          -f, --config config_file
                 Specify the configuration file to configure the
                 virtualization and isolation functionalities for the
                 container.

          -t, --template template
                 'template' is the short name of an existing 'lxc-template'
                 script that is called by lxc-create, eg. busybox, debian,
                 fedora, ubuntu or sshd.  Refer to the examples in
                 /usr/local/share/lxc/templates for details of the expected
                 script structure.  Alternatively, the full path to an
                 executable template script can also be passed as a
                 parameter.  "none" can be used to force lxc-create to skip
                 rootfs creation.

          -B, --bdev backingstore
                 'backingstore' is one of 'dir', 'lvm', 'loop', 'btrfs',
                 'zfs', 'rbd', or 'best'. The default is 'dir', meaning
                 that the container root filesystem will be a directory
                 under /usr/local/var/lib/lxc/container/rootfs.  This
                 backing store type allows the optional --dir ROOTFS to be
                 specified, meaning that the container rootfs should be
                 placed under the specified path, rather than the default.
                 (The 'none' backingstore type is an alias for 'dir'.) If
                 'btrfs' is specified, then the target filesystem must be
                 btrfs, and the container rootfs will be created as a new
                 subvolume. This allows snapshotted clones to be created,
                 but also causes rsync --one-filesystem to treat it as a
                 separate filesystem.  If backingstore is 'lvm', then an
                 lvm block device will be used and the following further
                 options are available: --lvname lvname1 will create an LV
                 named lvname1 rather than the default, which is the
                 container name. --vgname vgname1 will create the LV in
                 volume group vgname1 rather than the default, lxc.
                 --thinpool thinpool1 will create the LV as a thin-
                 provisioned volume in the pool named thinpool1 rather than
                 the default, lxc.  --fstype FSTYPE will create an FSTYPE
                 filesystem on the LV, rather than the default, which is
                 ext4.  --fssize SIZE will create a LV (and filesystem) of
                 size SIZE rather than the default, which is 1G.

                 If backingstore is 'loop', you can use --fstype FSTYPE and
                 --fssize SIZE as 'lvm'. The default values for these
                 options are the same as 'lvm'.

                 If backingstore is 'rbd', then you will need to have a
                 valid configuration in ceph.conf and a
                 ceph.client.admin.keyring defined.  You can specify the
                 following options : --rbdname RBDNAME will create a
                 blockdevice named RBDNAME rather than the default, which
                 is the container name.  --rbdpool POOL will create the
                 blockdevice in the pool named POOL, rather than the
                 default, which is 'lxc'.

                 If backingstore is 'best', then lxc will try, in order,
                 btrfs, zfs, lvm, and finally a directory backing store.

          -- template-options
                 This will pass template-options to the template as
                 arguments. To see the list of options supported by the
                 template, you can run lxc-create -t TEMPLATE -h.


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


-------------------------------------------------------------

::

          The container already exists
                 As the message mention it, you try to create a container
                 but there is a container with the same name. You can use
                 the lxc-ls command to list the available containers on the
                 system.


---------------------------------------------------------

::

          lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1),
          lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1),
          lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),
          lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)


-----------------------------------------------------

::

          Daniel Lezcano <daniel.lezcano@free.fr>

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

                                  2021-08-26                  LXC-CREATE(1)

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
