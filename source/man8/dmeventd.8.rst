.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dmeventd(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `LVM PLUGINS <#LVM_PLUGINS>`__ \| |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DMEVENTD(8)              System Manager's Manual             DMEVENTD(8)

NAME
-------------------------------------------------

::

          dmeventd — Device-mapper event daemon


---------------------------------------------------------

::

          dmeventd [-d [-d [-d]]] [-f] [-h] [-l] [-R] [-V] [-?]


---------------------------------------------------------------

::

          dmeventd is the event monitoring daemon for device-mapper
          devices.  Library plugins can register and carry out actions
          triggered when particular events occur.


-------------------------------------------------------

::

          -d     Repeat from 1 to 3 times (-d, -dd, -ddd) to increase the
                 detail of debug messages sent to syslog.  Each extra d
                 adds more debugging information.

          -f     Don't fork, run in the foreground.

          -h     Show help information.

          -l     Log through stdout and stderr instead of syslog.  This
                 option works only with option -f, otherwise it is ignored.

          -?     Show help information on stderr.

          -R     Replace a running dmeventd instance. The running dmeventd
                 must be version 2.02.77 or newer. The new dmeventd
                 instance will obtain a list of devices and events to
                 monitor from the currently running daemon.

          -V     Show version of dmeventd.


---------------------------------------------------------------

::

          Mirror Attempts to handle device failure automatically.
                 See lvm.conf(5).

          Raid   Attempts to handle device failure automatically.
                 See lvm.conf(5).

          Snapshot
                 Monitors how full a snapshot is becoming and emits a
                 warning to syslog when it exceeds 80% full.  The warning
                 is repeated when 85%, 90% and 95% of the snapshot is
                 filled.  See lvm.conf(5).  Snapshot which runs out of
                 space gets invalid and when it is mounted, it gets
                 umounted if possible.

          Thin   Monitors how full a thin pool data and metadata is
                 becoming and emits a warning to syslog when it exceeds 80%
                 full.  The warning is repeated when more then 85%, 90% and
                 95% of the thin pool is filled. See lvm.conf(5).  When a
                 thin pool fills over 50% (data or metadata) thin plugin
                 calls configured dmeventd/thin_command with every 5%
                 increase.  With default setting it calls internal lvm
                 lvextend --use-policies to resize thin pool when it's been
                 filled above configured threshold
                 activation/thin_pool_autoextend_threshold.  If the command
                 fails, dmeventd thin plugin will keep retrying execution
                 with increasing time delay between retries upto 42
                 minutes.  User may also configure external command to
                 support more advanced maintenance operations of a thin
                 pool.  Such external command can e.g. remove some unneeded
                 snapshots, use fstrim(8) to free recover space in a thin
                 pool, but also can use lvextend --use-policies if other
                 actions have not released enough space.  Command is
                 executed with environmental variable LVM_RUN_BY_DMEVENTD=1
                 so any lvm2 command executed in this environment will not
                 try to interact with dmeventd.  To see the fullness of a
                 thin pool command may check these two environmental
                 variables DMEVENTD_THIN_POOL_DATA and DMEVENTD_THIN_POOL_
                 METADATA.  Command can also read status with tools like
                 lvs(8).

          Vdo    Monitors how full a VDO pool data is becoming and emits a
                 warning to syslog when it exceeds 80% full.  The warning
                 is repeated when more then 85%, 90% and 95% of the VDO
                 pool is filled. See lvm.conf(5).  When a VDO pool fills
                 over 50% vdo plugin calls configured dmeventd/vdo_command
                 with every 5% increase.  With default setting it calls
                 internal lvm lvextend --use-policies to resize VDO pool
                 when it's been filled above the configured threshold
                 activation/vdo_pool_autoextend_threshold.  If the command
                 fails, dmeventd vdo plugin will keep retrying execution
                 with increasing time delay between retries upto 42
                 minutes.  User may also configure external command to
                 support more advanced maintenance operations of a VDO
                 pool.  Such external command can e.g. remove some unneeded
                 space with fstrim(8), but also can use lvextend
                 --use-policies if other actions have not released enough
                 space.  Command is executed with environmental variable
                 LVM_RUN_BY_DMEVENTD=1 so any lvm2 command executed in this
                 environment will not try to interact with dmeventd.  To
                 see the fullness of a VDO pool command may check this
                 environmental variable DMEVENTD_VDO_POOL.  Command can
                 also read status with tools like lvs(8).


-----------------------------------------------------------------------------------

::

          DMEVENTD_THIN_POOL_DATA
                 Variable is set by thin plugin and is available to
                 executed program. Value present actual usage of thin pool
                 data volume. Variable is not set when error event is
                 processed.

          DMEVENTD_THIN_POOL_METADATA
                 Variable is set by thin plugin and is available to
                 executed program. Value present actual usage of thin pool
                 metadata volume. Variable is not set when error event is
                 processed.

          DMEVENTD_VDO_POOL
                 Variable is set by vdo plugin and is available to executed
                 program. Value present actual usage of VDO pool data
                 volume. Variable is not set when error event is processed.

          LVM_RUN_BY_DMEVENTD
                 Variable is set by thin and vdo plugin to prohibit
                 recursive interation with dmeventd by any executed lvm2
                 command from a thin_command, vdo_command environment.


---------------------------------------------------------

::

          lvm(8), lvm.conf(5), lvextend(8),
          fstrim(8)

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

   Red Hat Inc         DM TOOLS 2.03.13(2) (2021-08-11)         DMEVENTD(8)

--------------

Pages that refer to this page: `lvmraid(7) <../man7/lvmraid.7.html>`__, 
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
