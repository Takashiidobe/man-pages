.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

blkdeactivate(8) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BLKDEACTIVATE(8)                                        BLKDEACTIVATE(8)

NAME
-------------------------------------------------

::

          blkdeactivate — utility to deactivate block devices


---------------------------------------------------------

::

          blkdeactivate [-d dm_options] [-e] [-h] [-l lvm_options] [-m
          mpath_options] [-r mdraid_options] [-o vdo_options] [-u] [-v]
          [device]


---------------------------------------------------------------

::

          The blkdeactivate utility deactivates block devices. For mounted
          block devices, it attempts to unmount it automatically before
          trying to deactivate. The utility currently supports device-
          mapper devices (DM), including LVM volumes and software RAID MD
          devices. LVM volumes are handled directly using the lvm(8)
          command, the rest of device-mapper based devices are handled
          using the dmsetup(8) command.  MD devices are handled using the
          mdadm(8) command.


-------------------------------------------------------

::

          -d|--dmoptions dm_options
                 Comma separated list of device-mapper specific options.
                 Accepted dmsetup(8) options are:

                 retry  Retry removal several times in case of failure.

                 force  Force device removal.

          -e|--errors
                 Show errors reported from tools called by blkdeactivate.
                 Without this option, any error messages from these
                 external tools are suppressed and the blkdeactivate itself
                 provides only a summary message to indicate the device was
                 skipped.

          -h|--help
                 Display the help text.

          -l|--lvmoptions lvm_options
                 Comma-separated list of LVM specific options:

                 retry  Retry removal several times in case of failure.

                 wholevg
                        Deactivate the whole LVM Volume Group when
                        processing a Logical Volume.  Deactivating the
                        Volume Group as a whole is quicker than
                        deactivating each Logical Volume separately.

          -r|--mdraidoptions mdraid_options
                 Comma-separated list of MD RAID specific options:

                 wait   Wait MD device's resync, recovery or reshape action
                        to complete before deactivation.

          -m|--mpathoptions mpath_options
                 Comma-separated list of device-mapper multipath specific
                 options:

                 disablequeueing
                        Disable queueing on all multipath devices before
                        deactivation.  This avoids a situation where
                        blkdeactivate may end up waiting if all the paths
                        are unavailable for any underlying device-mapper
                        multipath device.

          -o|--vdooptions vdo_options
                 Comma-separated list of VDO specific options:

                 configfile=file
                        Use specified VDO configuration file.

          -u|--umount
                 Unmount a mounted device before trying to deactivate it.
                 Without this option used, a device that is mounted is not
                 deactivated.

          -v, --verbose
                 Run in verbose mode. Use -vv for even more verbose mode.


---------------------------------------------------------

::

          Deactivate all supported block devices found in the system,
          skipping mounted devices.
          # blkdeactivate

          Deactivate all supported block devices found in the system,
          unmounting any mounted devices first, if possible.
          # blkdeactivate -u

          Deactivate the device /dev/vg/lvol0 together with all its
          holders, unmounting any mounted devices first, if possible.
          # blkdeactivate -u /dev/vg/lvol0

          Deactivate all supported block devices found in the system. If
          the deactivation of a device-mapper device fails, retry it.
          Deactivate the whole Volume Group at once when processing an LVM
          Logical Volume.
          # blkdeactivate -u -d retry -l wholevg

          Deactivate all supported block devices found in the system. If
          the deactivation of a device-mapper device fails, retry it and
          force removal.
          # blkdeactivate -d force,retry


---------------------------------------------------------

::

          dmsetup(8), lsblk(8), lvm(8), mdadm(8), multipathd(8), vdo(8),
          umount(8)

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

   Red Hat, Inc        LVM TOOLS 2.03.13(2) (2021-08-11)   BLKDEACTIVATE(8)

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
