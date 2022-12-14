.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

vgchange(8) — Linux manual page
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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   VGCHANGE(8)              System Manager's Manual             VGCHANGE(8)

NAME
-------------------------------------------------

::

          vgchange — Change volume group attributes


---------------------------------------------------------

::

          vgchange option_args position_args
              [ option_args ]
              [ position_args ]

           -a|--activate y|n|ay
              --activationmode partial|degraded|complete
              --addtag Tag
              --alloc contiguous|cling|cling_by_tags|normal|anywhere|
          inherit
           -A|--autobackup y|n
              --commandprofile String
              --config String
           -d|--debug
              --deltag Tag
              --detachprofile
              --devices PV
              --devicesfile String
              --driverloaded y|n
           -f|--force
           -h|--help
           -K|--ignoreactivationskip
              --ignorelockingfailure
              --ignoremonitoring
              --lockopt String
              --lockstart
              --lockstop
              --locktype sanlock|dlm|none
           -l|--logicalvolume Number
              --longhelp
           -p|--maxphysicalvolumes Number
              --metadataprofile String
              --monitor y|n
              --nolocking
              --noudevsync
           -P|--partial
           -s|--physicalextentsize Size[m|UNIT]
              --poll y|n
              --profile String
              --pvmetadatacopies 0|1|2
           -q|--quiet
              --readonly
              --refresh
              --reportformat basic|json
           -x|--resizeable y|n
           -S|--select String
              --setautoactivation y|n
              --sysinit
              --systemid String
           -t|--test
           -u|--uuid
           -v|--verbose
              --version
              --[vg]metadatacopies all|unmanaged|Number
           -y|--yes


---------------------------------------------------------------

::

          vgchange changes VG attributes, changes LV activation in the
          kernel, and includes other utilities for VG maintenance.


---------------------------------------------------

::

          Change a general VG attribute.
          For options listed in parentheses, any one is
          required, after which the others are optional.

          vgchange
              ( -l|--logicalvolume Number
                -p|--maxphysicalvolumes Number
                -u|--uuid
                -s|--physicalextentsize Size[m|UNIT]
                -x|--resizeable y|n
                   --addtag Tag
                   --deltag Tag
                   --alloc contiguous|cling|cling_by_tags|normal|anywhere|
              inherit
                   --pvmetadatacopies 0|1|2
                   --[vg]metadatacopies all|unmanaged|Number
                   --profile String
                   --detachprofile
                   --metadataprofile String
                   --setautoactivation y|n )
              [ -A|--autobackup y|n ]
              [ -S|--select String ]
              [ -f|--force ]
              [    --poll y|n ]
              [    --ignoremonitoring ]
              [    --noudevsync ]
              [    --reportformat basic|json ]
              [ COMMON_OPTIONS ]
              [ VG|Tag|Select ... ]

          —

          Start or stop monitoring LVs from dmeventd.

          vgchange --monitor y|n
              [ -A|--autobackup y|n ]
              [ -S|--select String ]
              [ -f|--force ]
              [    --sysinit ]
              [    --ignorelockingfailure ]
              [    --poll y|n ]
              [    --ignoremonitoring ]
              [    --noudevsync ]
              [    --reportformat basic|json ]
              [ COMMON_OPTIONS ]
              [ VG|Tag|Select ... ]

          —

          Start or stop processing LV conversions.

          vgchange --poll y|n
              [ -A|--autobackup y|n ]
              [ -S|--select String ]
              [ -f|--force ]
              [    --ignorelockingfailure ]
              [    --ignoremonitoring ]
              [    --noudevsync ]
              [    --reportformat basic|json ]
              [ COMMON_OPTIONS ]
              [ VG|Tag|Select ... ]

          —

          Activate or deactivate LVs.

          vgchange -a|--activate y|n|ay
              [ -K|--ignoreactivationskip ]
              [ -P|--partial ]
              [ -A|--autobackup y|n ]
              [ -S|--select String ]
              [ -f|--force ]
              [    --activationmode partial|degraded|complete ]
              [    --sysinit ]
              [    --readonly ]
              [    --ignorelockingfailure ]
              [    --monitor y|n ]
              [    --poll y|n ]
              [    --ignoremonitoring ]
              [    --noudevsync ]
              [    --reportformat basic|json ]
              [ COMMON_OPTIONS ]
              [ VG|Tag|Select ... ]

          —

          Reactivate LVs using the latest metadata.

          vgchange --refresh
              [ -A|--autobackup y|n ]
              [ -S|--select String ]
              [ -f|--force ]
              [    --sysinit ]
              [    --ignorelockingfailure ]
              [    --poll y|n ]
              [    --ignoremonitoring ]
              [    --noudevsync ]
              [    --reportformat basic|json ]
              [ COMMON_OPTIONS ]
              [ VG|Tag|Select ... ]

          —

          Change the system ID of a VG.

          vgchange --systemid String VG
              [ COMMON_OPTIONS ]

          —

          Start the lockspace of a shared VG in lvmlockd.

          vgchange --lockstart
              [ -S|--select String ]
              [ COMMON_OPTIONS ]
              [ VG|Tag|Select ... ]

          —

          Stop the lockspace of a shared VG in lvmlockd.

          vgchange --lockstop
              [ -S|--select String ]
              [ COMMON_OPTIONS ]
              [ VG|Tag|Select ... ]

          —

          Change the lock type for a shared VG.

          vgchange --locktype sanlock|dlm|none VG
              [ COMMON_OPTIONS ]

          —

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

          -a|--activate y|n|ay
                 Change the active state of LVs.  An active LV can be used
                 through a block device, allowing data on the LV to be
                 accessed.  y makes LVs active, or available.  n makes LVs
                 inactive, or unavailable.  The block device for the LV is
                 added or removed from the system using device-mapper in
                 the kernel.  A symbolic link /dev/VGName/LVName pointing
                 to the device node is also added/removed.  All software
                 and scripts should access the device through the symbolic
                 link and present this as the name of the device.  The
                 location and name of the underlying device node may depend
                 on the distribution, configuration (e.g. udev), or release
                 version.  ay specifies autoactivation, which is used by
                 system-generated activation commands.  By default, LVs are
                 autoactivated.  An autoactivation property can be set on a
                 VG or LV to disable autoactivation, see
                 --setautoactivation y|n in vgchange, lvchange, vgcreate,
                 and lvcreate.  Display the property with vgs or lvs "-o
                 autoactivation".  The lvm.conf(5)
                 auto_activation_volume_list includes names of VGs or LVs
                 that should be autoactivated, and anything not listed is
                 not autoactivated.  When auto_activation_volume_list is
                 undefined (the default), it has no effect.  If
                 auto_activation_volume_list is defined and empty, no LVs
                 are autoactivated.  Items included by
                 auto_activation_volume_list will not be autoactivated if
                 the autoactivation property has been disabled.  See
                 lvmlockd(8) for more information about activation options
                 ey and sy for shared VGs.

          --activationmode partial|degraded|complete
                 Determines if LV activation is allowed when PVs are
                 missing, e.g. because of a device failure.  complete only
                 allows LVs with no missing PVs to be activated, and is the
                 most restrictive mode.  degraded allows RAID LVs with
                 missing PVs to be activated.  (This does not include the
                 "mirror" type, see "raid1" instead.)  partial allows any
                 LV with missing PVs to be activated, and should only be
                 used for recovery or repair.  For default, see lvm.conf(5)
                 activation_mode.  See lvmraid(7) for more information.

          --addtag Tag
                 Adds a tag to a PV, VG or LV. This option can be repeated
                 to add multiple tags at once. See lvm(8) for information
                 about tags.

          --alloc contiguous|cling|cling_by_tags|normal|anywhere|inherit
                 Determines the allocation policy when a command needs to
                 allocate Physical Extents (PEs) from the VG. Each VG and
                 LV has an allocation policy which can be changed with
                 vgchange/lvchange, or overridden on the command line.
                 normal applies common sense rules such as not placing
                 parallel stripes on the same PV.  inherit applies the VG
                 policy to an LV.  contiguous requires new PEs be placed
                 adjacent to existing PEs.  cling places new PEs on the
                 same PV as existing PEs in the same stripe of the LV.  If
                 there are sufficient PEs for an allocation, but normal
                 does not use them, anywhere will use them even if it
                 reduces performance, e.g. by placing two stripes on the
                 same PV.  Optional positional PV args on the command line
                 can also be used to limit which PVs the command will use
                 for allocation.  See lvm(8) for more information about
                 allocation.

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

          -d|--debug ...
                 Set debug level. Repeat from 1 to 6 times to increase the
                 detail of messages sent to the log file and/or syslog (if
                 configured).

          --deltag Tag
                 Deletes a tag from a PV, VG or LV. This option can be
                 repeated to delete multiple tags at once. See lvm(8) for
                 information about tags.

          --detachprofile
                 Detaches a metadata profile from a VG or LV.  See
                 lvm.conf(5) for more information about profiles.

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

          -K|--ignoreactivationskip
                 Ignore the "activation skip" LV flag during activation to
                 allow LVs with the flag set to be activated.

          --ignorelockingfailure
                 Allows a command to continue with read-only metadata
                 operations after locking failures.

          --ignoremonitoring
                 Do not interact with dmeventd unless --monitor is
                 specified.  Do not use this if dmeventd is already
                 monitoring a device.

          --lockopt String
                 Used to pass options for special cases to lvmlockd.  See
                 lvmlockd(8) for more information.

          --lockstart
                 Start the lockspace of a shared VG in lvmlockd.  lvmlockd
                 locks becomes available for the VG, allowing LVM to use
                 the VG.  See lvmlockd(8) for more information.

          --lockstop
                 Stop the lockspace of a shared VG in lvmlockd.  lvmlockd
                 locks become unavailable for the VG, preventing LVM from
                 using the VG.  See lvmlockd(8) for more information.

          --locktype sanlock|dlm|none
                 Change the VG lock type to or from a shared lock type used
                 with lvmlockd.  See lvmlockd(8) for more information.

          -l|--logicalvolume Number
                 Sets the maximum number of LVs allowed in a VG.

          --longhelp
                 Display long help text.

          -p|--maxphysicalvolumes Number
                 Sets the maximum number of PVs that can belong to the VG.
                 The value 0 removes any limitation.  For large numbers of
                 PVs, also see options --pvmetadatacopies, and
                 --vgmetadatacopies for improving performance.

          --metadataprofile String
                 The metadata profile to use for command configuration.
                 See lvm.conf(5) for more information about profiles.

          --monitor y|n
                 Start (yes) or stop (no) monitoring an LV with dmeventd.
                 dmeventd monitors kernel events for an LV, and performs
                 automated maintenance for the LV in reponse to specific
                 events.  See dmeventd(8) for more information.

          --nolocking
                 Disable locking.

          --noudevsync
                 Disables udev synchronisation. The process will not wait
                 for notification from udev. It will continue irrespective
                 of any possible udev processing in the background. Only
                 use this if udev is not running or has rules that ignore
                 the devices LVM creates.

          -P|--partial
                 Commands will do their best to activate LVs with missing
                 PV extents.  Missing extents may be replaced with error or
                 zero segments according to the  missing_stripe_filler
                 setting.  Metadata may not be changed with this option.

          -s|--physicalextentsize Size[m|UNIT]
                 Sets the physical extent size of PVs in the VG.  The value
                 must be either a power of 2 of at least 1 sector (where
                 the sector size is the largest sector size of the PVs
                 currently used in the VG), or at least 128KiB.  Once this
                 value has been set, it is difficult to change without
                 recreating the VG, unless no extents need moving.  Before
                 increasing the physical extent size, you might need to use
                 lvresize, pvresize and/or pvmove so that everything fits.
                 For example, every contiguous range of extents used in a
                 LV must start and end on an extent boundary.

          --poll y|n
                 When yes, start the background transformation of an LV.
                 An incomplete transformation, e.g. pvmove or lvconvert
                 interrupted by reboot or crash, can be restarted from the
                 last checkpoint with --poll y.  When no, background
                 transformation of an LV will not occur, and the
                 transformation will not complete. It may not be
                 appropriate to immediately poll an LV after activation, in
                 which case --poll n can be used to defer polling until a
                 later --poll y command.

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

          --readonly
                 Run the command in a special read-only mode which will
                 read on-disk metadata without needing to take any locks.
                 This can be used to peek inside metadata used by a virtual
                 machine image while the virtual machine is running. No
                 attempt will be made to communicate with the device-mapper
                 kernel driver, so this option is unable to report whether
                 or not LVs are actually in use.

          --refresh
                 If the LV is active, reload its metadata.  This is not
                 necessary in normal operation, but may be useful if
                 something has gone wrong, or if some form of manual LV
                 sharing is being used.

          --reportformat basic|json
                 Overrides current output format for reports which is
                 defined globally by the report/output_format setting in
                 lvm.conf(5).  basic is the original format with columns
                 and rows.  If there is more than one report per command,
                 each report is prefixed with the report name for
                 identification. json produces report output in JSON
                 format. See lvmreport(7) for more information.

          -x|--resizeable y|n
                 Enables or disables the addition or removal of PVs to/from
                 a VG (by vgextend/vgreduce).

          -S|--select String
                 Select objects for processing and reporting based on
                 specified criteria.  The criteria syntax is described by
                 --select help and lvmreport(7).  For reporting commands,
                 one row is displayed for each object matching the
                 criteria.  See --options help for selectable object
                 fields.  Rows can be displayed with an additional
                 "selected" field (-o selected) showing 1 if the row
                 matches the selection and 0 otherwise.  For non-reporting
                 commands which process LVM entities, the selection is used
                 to choose items to process.

          --setautoactivation y|n
                 Set the autoactivation property on a VG or LV.  Display
                 the property with vgs or lvs "-o autoactivation".  When
                 the autoactivation property is disabled, the VG or LV will
                 not be activated by a command doing autoactivation
                 (vgchange, lvchange, or pvscan using -aay.)  If
                 autoactivation is disabled on a VG, no LVs will be
                 autoactivated in that VG, and the LV autoactivation
                 property has no effect.  If autoactivation is enabled on a
                 VG, autoactivation can be disabled for individual LVs.

          --sysinit
                 Indicates that vgchange/lvchange is being invoked from
                 early system initialisation scripts (e.g. rc.sysinit or an
                 initrd), before writable filesystems are available. As
                 such, some functionality needs to be disabled and this
                 option acts as a shortcut which selects an appropriate set
                 of options. Currently, this is equivalent to using
                 --ignorelockingfailure, --ignoremonitoring, --poll n, and
                 setting env var LVM_SUPPRESS_LOCKING_FAILURE_MESSAGES.
                 vgchange/lvchange skip autoactivation, and defer to pvscan
                 autoactivation.

          --systemid String
                 Changes the system ID of the VG.  Using this option
                 requires caution because the VG may become foreign to the
                 host running the command, leaving the host unable to
                 access it.  See lvmsystemid(7) for more information.

          -t|--test
                 Run in test mode. Commands will not update metadata.  This
                 is implemented by disabling all metadata writing but
                 nevertheless returning success to the calling function.
                 This may lead to unusual error messages in multi-stage
                 operations if a tool relies on reading back metadata it
                 believes has changed but hasn't.

          -u|--uuid
                 Generate new random UUID for specified VGs.

          -v|--verbose ...
                 Set verbose level. Repeat from 1 to 4 times to increase
                 the detail of messages sent to stdout and stderr.

          --version
                 Display version information.

          --[vg]metadatacopies all|unmanaged|Number
                 Number of copies of the VG metadata that are kept.  VG
                 metadata is kept in VG metadata areas on PVs in the VG,
                 i.e. reserved space at the start and/or end of the PVs.
                 Keeping a copy of the VG metadata on every PV can reduce
                 performance in VGs containing a large number of PVs.  When
                 this number is set to a non-zero value, LVM will
                 automatically choose PVs on which to store metadata, using
                 the metadataignore flags on PVs to achieve the specified
                 number.  The number can also be replaced with special
                 string values: unmanaged causes LVM to not automatically
                 manage the PV metadataignore flags.  all causes LVM to
                 first clear the metadataignore flags on all PVs, and then
                 to become unmanaged.

          -y|--yes
                 Do not prompt for confirmation interactively but always
                 assume the answer yes. Use with extreme caution.  (For
                 automatic no, see -qq.)


-----------------------------------------------------------

::

          VG     Volume Group name.  See lvm(8) for valid names.

          Tag    Tag name.  See lvm(8) for information about tag names and
                 using tags in place of a VG, LV or PV.

          Select Select indicates that a required positional parameter can
                 be omitted if the --select option is used.  No arg appears
                 in this position.

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


---------------------------------------------------

::

          If vgchange recognizes COW snapshot LVs that were dropped because
          they ran out of space, it displays a message informing the
          administrator that the snapshots should be removed.


---------------------------------------------------------

::

          Activate all LVs in all VGs on all existing devices.
          vgchange -a y

          Change the maximum number of LVs for an inactive VG.
          vgchange -l 128 vg00


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

   Red Hat, Inc.       LVM TOOLS 2.03.13(2) (2021-08-11)        VGCHANGE(8)

--------------

Pages that refer to this page:
`lvmcache(7) <../man7/lvmcache.7.html>`__, 
`lvmsystemid(7) <../man7/lvmsystemid.7.html>`__, 
`lvchange(8) <../man8/lvchange.8.html>`__, 
`lvconvert(8) <../man8/lvconvert.8.html>`__, 
`lvcreate(8) <../man8/lvcreate.8.html>`__, 
`lvdisplay(8) <../man8/lvdisplay.8.html>`__, 
`lvextend(8) <../man8/lvextend.8.html>`__, 
`lvm2-activation-generator(8) <../man8/lvm2-activation-generator.8.html>`__, 
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
