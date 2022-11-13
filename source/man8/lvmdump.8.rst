.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lvmdump(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LVMDUMP(8)               System Manager's Manual              LVMDUMP(8)

NAME
-------------------------------------------------

::

          lvmdump — create lvm2 information dumps for diagnostic purposes


---------------------------------------------------------

::

          lvmdump [-a] [-c] [-d directory] [-h] [-l] [-m] [-p] [-s] [-u]


---------------------------------------------------------------

::

          lvmdump is a tool to dump various information concerning LVM2.
          By default, it creates a tarball suitable for submission along
          with a problem report.

          The content of the tarball is as follows:
          • dmsetup info
          • table of currently running processes
          • recent entries from /var/log/messages (containing system
            messages)
          • complete lvm configuration and cache (content of /etc/lvm)
          • list of device nodes present under /dev
          • list of files present /sys/block
          • list of files present /sys/devices/virtual/block
          • if enabled with -m, metadata dump will be also included
          • if enabled with -a, debug output of vgscan, pvscan and list of
            all available volume groups, physical volumes and logical
            volumes will be included
          • if enabled with -l, lvmetad state if running
          • if enabled with -p, lvmpolld state if running
          • if enabled with -s, system info and context
          • if enabled with -u, udev info and context


-------------------------------------------------------

::

          -a     Advanced collection.  WARNING: if lvm is already hung,
                 then this script may hang as well if -a is used.

          -d directory
                 Dump into a directory instead of tarball By default,
                 lvmdump will produce a single compressed tarball
                 containing all the information. Using this option, it can
                 be instructed to only produce the raw dump tree, rooted in
                 directory.

          -h     Print help message

          -l     Include lvmetad(8) daemon dump if it is running. The dump
                 contains cached information that is currently stored in
                 lvmetad: VG metadata, PV metadata and various mappings in
                 between these metadata for quick access.

          -m     Gather LVM metadata from the PVs This option generates a
                 1:1 dump of the metadata area from all PVs visible to the
                 system, which can cause the dump to increase in size
                 considerably.  However, the metadata dump may represent a
                 valuable diagnostic resource.

          -p     Include lvmpolld(8) daemon dump if it is running. The dump
                 contains all in-progress operation currently monitored by
                 the daemon and partial history for all yet uncollected
                 results of polling operations already finished including
                 reason.

          -s     Gather system info and context. Currently, this
                 encompasses info gathered by calling lsblk command and
                 various systemd info and context: overall state of systemd
                 units present in the system, more detailed status of units
                 controlling LVM functionality and the content of systemd
                 journal for current boot.

          -u     Gather udev info and context: /etc/udev/udev.conf file,
                 udev daemon version (output of 'udevadm info --version'
                 command), udev rules currently used in the system (content
                 of /lib/udev/rules.d and /etc/udev/rules.d directory),
                 list of files in /lib/udev directory and dump of current
                 udev database content (the output of 'udevadm info
                 --export-db' command).


-----------------------------------------------------------------------------------

::

          LVM_BINARY
                 The LVM2 binary to use.  Defaults to "lvm".  Sometimes you
                 might need to set this to "/bin/lvm.static", for example.

          DMSETUP_BINARY
                 The dmsetup binary to use.  Defaults to "dmsetup".


---------------------------------------------------------

::

          lvm(8), lvmpolld(8),

          udev(8), udevadm(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the lvm2 (Logical Volume Manager 2) project.
          Information about the project can be found at 
          ⟨http://www.sourceware.org/lvm2/⟩.  If you have a bug report for
          this manual page, see ⟨https://github.com/lvmteam/lvm2/issues⟩.
          This page was obtained from the tarball
          https://github.com/lvmteam/lvm2/archive/refs/tags/v2_03_13.tar.gz
          fetched from ⟨https://github.com/lvmteam/lvm2/releases⟩ on
          2021-08-27.  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   Red Hat, Inc.       LVM TOOLS 2.03.13(2) (2021-08-11)         LVMDUMP(8)

--------------

Pages that refer to this page:
`lvchange(8) <../man8/lvchange.8.html>`__, 
`lvconvert(8) <../man8/lvconvert.8.html>`__, 
`lvcreate(8) <../man8/lvcreate.8.html>`__, 
`lvdisplay(8) <../man8/lvdisplay.8.html>`__, 
`lvextend(8) <../man8/lvextend.8.html>`__, 
`lvm(8) <../man8/lvm.8.html>`__, 
`lvmconfig(8) <../man8/lvmconfig.8.html>`__, 
`lvmdevices(8) <../man8/lvmdevices.8.html>`__, 
`lvmdiskscan(8) <../man8/lvmdiskscan.8.html>`__, 
`lvm-fullreport(8) <../man8/lvm-fullreport.8.html>`__, 
`lvm-lvpoll(8) <../man8/lvm-lvpoll.8.html>`__, 
`lvreduce(8) <../man8/lvreduce.8.html>`__, 
`lvremove(8) <../man8/lvremove.8.html>`__, 
`lvrename(8) <../man8/lvrename.8.html>`__, 
`lvresize(8) <../man8/lvresize.8.html>`__, 
`lvs(8) <../man8/lvs.8.html>`__, 
`lvscan(8) <../man8/lvscan.8.html>`__, 
`pvchange(8) <../man8/pvchange.8.html>`__, 
`pvck(8) <../man8/pvck.8.html>`__, 
`pvcreate(8) <../man8/pvcreate.8.html>`__, 
`pvdisplay(8) <../man8/pvdisplay.8.html>`__, 
`pvmove(8) <../man8/pvmove.8.html>`__, 
`pvremove(8) <../man8/pvremove.8.html>`__, 
`pvresize(8) <../man8/pvresize.8.html>`__, 
`pvs(8) <../man8/pvs.8.html>`__, 
`pvscan(8) <../man8/pvscan.8.html>`__, 
`vgcfgbackup(8) <../man8/vgcfgbackup.8.html>`__, 
`vgcfgrestore(8) <../man8/vgcfgrestore.8.html>`__, 
`vgchange(8) <../man8/vgchange.8.html>`__, 
`vgck(8) <../man8/vgck.8.html>`__, 
`vgconvert(8) <../man8/vgconvert.8.html>`__, 
`vgcreate(8) <../man8/vgcreate.8.html>`__, 
`vgdisplay(8) <../man8/vgdisplay.8.html>`__, 
`vgexport(8) <../man8/vgexport.8.html>`__, 
`vgextend(8) <../man8/vgextend.8.html>`__, 
`vgimport(8) <../man8/vgimport.8.html>`__, 
`vgimportclone(8) <../man8/vgimportclone.8.html>`__, 
`vgimportdevices(8) <../man8/vgimportdevices.8.html>`__, 
`vgmerge(8) <../man8/vgmerge.8.html>`__, 
`vgmknodes(8) <../man8/vgmknodes.8.html>`__, 
`vgreduce(8) <../man8/vgreduce.8.html>`__, 
`vgremove(8) <../man8/vgremove.8.html>`__, 
`vgrename(8) <../man8/vgrename.8.html>`__, 
`vgs(8) <../man8/vgs.8.html>`__, 
`vgscan(8) <../man8/vgscan.8.html>`__, 
`vgsplit(8) <../man8/vgsplit.8.html>`__

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
