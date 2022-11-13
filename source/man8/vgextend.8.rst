.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

vgextend(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `USAGE <#USAGE>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `VARIABLES <#VARIABLES>`__ \|     |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VGEXTEND(8)              System Manager's Manual             VGEXTEND(8)

NAME
-------------------------------------------------

::

          vgextend — Add physical volumes to a volume group


---------------------------------------------------------

::

          vgextend position_args
              [ option_args ]


---------------------------------------------------------------

::

          vgextend adds one or more PVs to a VG. This increases the space
          available for LVs in the VG.

          Also, PVs that have gone missing and then returned, e.g. due to a
          transient device failure, can be added back to the VG without re-
          initializing them (see --restoremissing).

          If the specified PVs have not yet been initialized with pvcreate,
          vgextend will initialize them. In this case pvcreate options can
          be used, e.g.  --labelsector, --metadatasize, --metadataignore,
          --pvmetadatacopies, --dataalignment, --dataalignmentoffset.


---------------------------------------------------

::

          vgextend VG PV ...
              [ -A|--autobackup y|n ]
              [ -f|--force ]
              [ -Z|--zero y|n ]
              [ -M|--metadatatype lvm2 ]
              [    --labelsector Number ]
              [    --metadatasize Size[m|UNIT] ]
              [    --pvmetadatacopies 0|1|2 ]
              [    --metadataignore y|n ]
              [    --dataalignment Size[k|UNIT] ]
              [    --dataalignmentoffset Size[k|UNIT] ]
              [    --reportformat basic|json ]
              [    --restoremissing ]
              [ COMMON_OPTIONS ]

          Common options for lvm:
              [ -d|--debug ]
              [ -h|--help ]
              [ -q|--quiet ]
              [ -t|--test ]
              [ -v|--verbose ]
              [ -y|--yes ]
              [    --commandprofile String ]
              [    --config String ]
              [    --devices PV ]
              [    --devicesfile String ]
              [    --driverloaded y|n ]
              [    --lockopt String ]
              [    --longhelp ]
              [    --nolocking ]
              [    --profile String ]
              [    --version ]


-------------------------------------------------------

::

          -A|--autobackup y|n
                 Specifies if metadata should be backed up automatically
                 after a change.  Enabling this is strongly advised! See
                 vgcfgbackup(8) for more information.

          --commandprofile String
                 The command profile to use for command configuration.  See
                 lvm.conf(5) for more information about profiles.

          --config String
                 Config settings for the command. These override
                 lvm.conf(5) settings.  The String arg uses the same format
                 as lvm.conf(5), or may use section/field syntax.  See
                 lvm.conf(5) for more information about config.

          --dataalignment Size[k|UNIT]
                 Align the start of a PV data area with a multiple of this
                 number.  To see the location of the first Physical Extent
                 (PE) of an existing PV, use pvs -o +pe_start. In addition,
                 it may be shifted by an alignment offset, see
                 --dataalignmentoffset.  Also specify an appropriate PE
                 size when creating a VG.

          --dataalignmentoffset Size[k|UNIT]
                 Shift the start of the PV data area by this additional
                 offset.

          -d|--debug ...
                 Set debug level. Repeat from 1 to 6 times to increase the
                 detail of messages sent to the log file and/or syslog (if
                 configured).

          --devices PV
                 Devices that the command can use. This option can be
                 repeated or accepts a comma separated list of devices.
                 This overrides the devices file.

          --devicesfile String
                 A file listing devices that LVM should use.  The file must
                 exist in /etc/lvm/devices/ and is managed with the
                 lvmdevices(8) command.  This overrides the lvm.conf(5)
                 devices/devicesfile and devices/use_devicesfile settings.

          --driverloaded y|n
                 If set to no, the command will not attempt to use device-
                 mapper.  For testing and debugging.

          -f|--force ...
                 Override various checks, confirmations and protections.
                 Use with extreme caution.

          -h|--help
                 Display help text.

          --labelsector Number
                 By default the PV is labelled with an LVM2 identifier in
                 its second sector (sector 1). This lets you use a
                 different sector near the start of the disk (between 0 and
                 3 inclusive - see LABEL_SCAN_SECTORS in the source). Use
                 with care.

          --lockopt String
                 Used to pass options for special cases to lvmlockd.  See
                 lvmlockd(8) for more information.

          --longhelp
                 Display long help text.

          --metadataignore y|n
                 Specifies the metadataignore property of a PV.  If yes,
                 metadata areas on the PV are ignored, and lvm will not
                 store metadata in the metadata areas of the PV.  If no,
                 lvm will store metadata on the PV.

          --metadatasize Size[m|UNIT]
                 The approximate amount of space used for each VG metadata
                 area.  The size may be rounded.

          -M|--metadatatype lvm2
                 Specifies the type of on-disk metadata to use.  lvm2 (or
                 just 2) is the current, standard format.  lvm1 (or just 1)
                 is no longer used.

          --nolocking
                 Disable locking.

          --profile String
                 An alias for --commandprofile or --metadataprofile,
                 depending on the command.

          --pvmetadatacopies 0|1|2
                 The number of metadata areas to set aside on a PV for
                 storing VG metadata.  When 2, one copy of the VG metadata
                 is stored at the front of the PV and a second copy is
                 stored at the end.  When 1, one copy of the VG metadata is
                 stored at the front of the PV.  When 0, no copies of the
                 VG metadata are stored on the given PV.  This may be
                 useful in VGs containing many PVs (this places limitations
                 on the ability to use vgsplit later.)

          -q|--quiet ...
                 Suppress output and log messages. Overrides --debug and
                 --verbose.  Repeat once to also suppress any prompts with
                 answer 'no'.

          --reportformat basic|json
                 Overrides current output format for reports which is
                 defined globally by the report/output_format setting in
                 lvm.conf(5).  basic is the original format with columns
                 and rows.  If there is more than one report per command,
                 each report is prefixed with the report name for
                 identification. json produces report output in JSON
                 format. See lvmreport(7) for more information.

          --restoremissing
                 Add a PV back into a VG after the PV was missing and then
                 returned, e.g. due to a transient failure. The PV is not
                 reinitialized.

          -t|--test
                 Run in test mode. Commands will not update metadata.  This
                 is implemented by disabling all metadata writing but
                 nevertheless returning success to the calling function.
                 This may lead to unusual error messages in multi-stage
                 operations if a tool relies on reading back metadata it
                 believes has changed but hasn't.

          -v|--verbose ...
                 Set verbose level. Repeat from 1 to 4 times to increase
                 the detail of messages sent to stdout and stderr.

          --version
                 Display version information.

          -y|--yes
                 Do not prompt for confirmation interactively but always
                 assume the answer yes. Use with extreme caution.  (For
                 automatic no, see -qq.)

          -Z|--zero y|n
                 Controls if the first 4 sectors (2048 bytes) of the device
                 are wiped.  The default is to wipe these sectors unless
                 either or both of --restorefile or --uuid are specified.


-----------------------------------------------------------

::

          VG     Volume Group name.  See lvm(8) for valid names.

          PV     Physical Volume name, a device path under /dev.  For
                 commands managing physical extents, a PV positional arg
                 generally accepts a suffix indicating a range (or multiple
                 ranges) of physical extents (PEs). When the first PE is
                 omitted, it defaults to the start of the device, and when
                 the last PE is omitted it defaults to end.  Start and end
                 range (inclusive): PV[:PE-PE]...  Start and length range
                 (counting from 0): PV[:PE+PE]...

          String See the option description for information about the
                 string content.

          Size[UNIT]
                 Size is an input number that accepts an optional unit.
                 Input units are always treated as base two values,
                 regardless of capitalization, e.g. 'k' and 'K' both refer
                 to 1024.  The default input unit is specified by letter,
                 followed by |UNIT.  UNIT represents other possible input
                 units: b|B is bytes, s|S is sectors of 512 bytes, k|K is
                 KiB, m|M is MiB, g|G is GiB, t|T is TiB, p|P is PiB, e|E
                 is EiB.  (This should not be confused with the output
                 control --units, where capital letters mean multiple of
                 1000.)


-----------------------------------------------------------------------------------

::

          See lvm(8) for information about environment variables used by
          lvm.  For example, LVM_VG_NAME can generally be substituted for a
          required VG parameter.


---------------------------------------------------------

::

          Add two PVs to a VG.
          vgextend vg00 /dev/sda4 /dev/sdn1


---------------------------------------------------------

::

          lvm(8), lvm.conf(5), lvmconfig(8), lvmdevices(8),

          pvchange(8), pvck(8), pvcreate(8), pvdisplay(8), pvmove(8),
          pvremove(8), pvresize(8), pvs(8), pvscan(8),

          vgcfgbackup(8), vgcfgrestore(8), vgchange(8), vgck(8),
          vgcreate(8), vgconvert(8), vgdisplay(8), vgexport(8),
          vgextend(8), vgimport(8), vgimportclone(8), vgimportdevices(8),
          vgmerge(8), vgmknodes(8), vgreduce(8), vgremove(8), vgrename(8),
          vgs(8), vgscan(8), vgsplit(8),

          lvcreate(8), lvchange(8), lvconvert(8), lvdisplay(8),
          lvextend(8), lvreduce(8), lvremove(8), lvrename(8), lvresize(8),
          lvs(8), lvscan(8),

          lvm-fullreport(8), lvm-lvpoll(8), lvm2-activation-generator(8),
          blkdeactivate(8), lvmdump(8),

          dmeventd(8), lvmpolld(8), lvmlockd(8), lvmlockctl(8),
          cmirrord(8), lvmdbusd(8), fsadm(8),

          lvmsystemid(7), lvmreport(7), lvmraid(7), lvmthin(7), lvmcache(7)

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

   Red Hat, Inc.       LVM TOOLS 2.03.13(2) (2021-08-11)        VGEXTEND(8)

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
