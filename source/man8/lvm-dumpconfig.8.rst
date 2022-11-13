.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lvmconfig(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `USAGE <#USAGE>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `VARIABLES <#VARIABLES>`__ \|     |                                   |
| `ENVIRONMENT VARI                 |                                   |
| ABLES <#ENVIRONMENT_VARIABLES>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LVMCONFIG(8)             System Manager's Manual            LVMCONFIG(8)

NAME
-------------------------------------------------

::

          lvmconfig — Display and manipulate configuration information


---------------------------------------------------------

::

          lvmconfig
              [ option_args ]
              [ position_args ]


---------------------------------------------------------------

::

          lvmconfig, lvm config, lvm dumpconfig (for compatibility reasons,
          to be phased out) produce formatted output from the LVM
          configuration tree. The sources of the configuration data include
          lvm.conf(5) and command line settings from --config.


---------------------------------------------------

::

          lvmconfig
              [ -f|--file String ]
              [ -l|--list ]
              [    --atversion String ]
              [    --typeconfig current|default|diff|full|list|missing|new|
              profilable|profilable-command|profilable-metadata ]
              [    --ignoreadvanced ]
              [    --ignoreunsupported ]
              [    --ignorelocal ]
              [    --mergedconfig ]
              [    --metadataprofile String ]
              [    --sinceversion String ]
              [    --showdeprecated ]
              [    --showunsupported ]
              [    --validate ]
              [    --withsummary ]
              [    --withcomments ]
              [    --withgeneralpreamble ]
              [    --withlocalpreamble ]
              [    --withspaces ]
              [    --unconfigured ]
              [    --withversions ]
              [ COMMON_OPTIONS ]
              [ String ... ]

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

          --atversion String
                 Specify an LVM version in x.y.z format where x is the
                 major version, the y is the minor version and z is the
                 patchlevel (e.g. 2.2.106).  When configuration is
                 displayed, the configuration settings recognized at this
                 LVM version will be considered only. This can be used to
                 display a configuration that a certain LVM version
                 understands and which does not contain any newer settings
                 for which LVM would issue a warning message when checking
                 the configuration.

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

          -f|--file String
                 Write output to the named file.

          -h|--help
                 Display help text.

          --ignoreadvanced
                 Exclude advanced configuration settings from the output.

          --ignorelocal
                 Ignore the local section. The local section should be
                 defined in the lvmlocal.conf file, and should contain
                 config settings specific to the local host which should
                 not be copied to other hosts.

          --ignoreunsupported
                 Exclude unsupported configuration settings from the
                 output. These settings are either used for debugging and
                 development purposes only or their support is not yet
                 complete and they are not meant to be used in production.
                 The current and diff types include unsupported settings in
                 their output by default, all the other types ignore
                 unsupported settings.

          -l|--list
                 List config settings with summarizing comment. This is the
                 same as using options --typeconfig list --withsummary.

          --lockopt String
                 Used to pass options for special cases to lvmlockd.  See
                 lvmlockd(8) for more information.

          --longhelp
                 Display long help text.

          --mergedconfig
                 When the command is run with --config and/or
                 --commandprofile (or using LVM_COMMAND_PROFILE environment
                 variable), --profile, or --metadataprofile, merge all the
                 contents of the "config cascade" before displaying it.
                 Without merging, only the configuration at the front of
                 the cascade is displayed.  See lvm.conf(5) for more
                 information about config.

          --metadataprofile String
                 The metadata profile to use for command configuration.
                 See lvm.conf(5) for more information about profiles.

          --nolocking
                 Disable locking.

          --profile String
                 An alias for --commandprofile or --metadataprofile,
                 depending on the command.

          -q|--quiet ...
                 Suppress output and log messages. Overrides --debug and
                 --verbose.  Repeat once to also suppress any prompts with
                 answer 'no'.

          --showdeprecated
                 Include deprecated configuration settings in the output.
                 These settings are deprecated after a certain version. If
                 a concrete version is specified with --atversion,
                 deprecated settings are automatically included if the
                 specified version is lower than the version in which the
                 settings were deprecated. The current and diff types
                 include deprecated settings in their output by default,
                 all the other types ignore deprecated settings.

          --showunsupported
                 Include unsupported configuration settings in the output.
                 These settings are either used for debugging or
                 development purposes only, or their support is not yet
                 complete and they are not meant to be used in production.
                 The current and diff types include unsupported settings in
                 their output by default, all the other types ignore
                 unsupported settings.

          --sinceversion String
                 Specify an LVM version in x.y.z format where x is the
                 major version, the y is the minor version and z is the
                 patchlevel (e.g. 2.2.106).  This option is currently
                 applicable only with --typeconfig new to display all
                 configuration settings introduced since given version.

          -t|--test
                 Run in test mode. Commands will not update metadata.  This
                 is implemented by disabling all metadata writing but
                 nevertheless returning success to the calling function.
                 This may lead to unusual error messages in multi-stage
                 operations if a tool relies on reading back metadata it
                 believes has changed but hasn't.

          --typeconfig current|default|diff|full|list|missing|new|
                 profilable|profilable-command|profilable-metadata
                 current prints the config settings that would be applied
                 to an lvm command (assuming the command does not override
                 them on the command line.) This includes: settings that
                 have been modified in lvm config files, settings that get
                 their default values from config files, and default
                 settings that have been uncommented in config files.
                 default prints all settings with their default values.
                 Changes made in lvm config files are not reflected in the
                 output.  Some settings get their default values
                 internally, and these settings are printed as comments.
                 Other settings get their default values from config files,
                 and these settings are not printed as comments.  diff
                 prints only config settings that have been modified from
                 their default values in config files (the difference
                 between current and default.)  full prints every setting
                 uncommented and set to the current value, i.e. how it
                 would be used by an lvm command.  This includes settings
                 modified in config files, settings that usually get
                 defaults internally, and settings that get defaults from
                 config files.  list prints all config names without
                 values.  missing prints settings that are missing from the
                 lvm config files. A missing setting that usually gets its
                 default from config files is printed uncommented and set
                 to the internal default.  Settings that get their default
                 internally and are not set in config files are printed
                 commented with the internal default.  new prints config
                 settings that have been added since the lvm version
                 specified by --sinceversion. They are printed with their
                 default values.  profilable prints settings with their
                 default values that can be set from a profile.
                 profilable-command prints settings with their default
                 values that can be set from a command profile.
                 profilable-metadata prints settings with their default
                 values that can be set from a metadata profile.  Also see
                 lvm.conf(5).

          --unconfigured
                 Internal option used for generating config file during
                 build.

          --validate
                 Validate current configuration used and exit with
                 appropriate return code. The validation is done only for
                 the configuration at the front of the "config cascade". To
                 validate the whole merged configuration tree, also use
                 --mergedconfig.  The validation is done even if
                 lvm.conf(5) config/checks is disabled.

          -v|--verbose ...
                 Set verbose level. Repeat from 1 to 4 times to increase
                 the detail of messages sent to stdout and stderr.

          --version
                 Display version information.

          --withcomments
                 Display a full comment for each configuration node. For
                 deprecated settings, also display comments about
                 deprecation.

          --withgeneralpreamble
                 Include general config file preamble.

          --withlocalpreamble
                 Include local config file preamble.

          --withspaces
                 Where appropriate, add more spaces in output for better
                 readability.

          --withsummary
                 Display a one line comment for each configuration node.

          --withversions
                 Also display a comment containing the version of
                 introduction for each configuration node. If the setting
                 is deprecated, also display the version since which it is
                 deprecated.

          -y|--yes
                 Do not prompt for confirmation interactively but always
                 assume the answer yes. Use with extreme caution.  (For
                 automatic no, see -qq.)


-----------------------------------------------------------

::

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

   Red Hat, Inc.       LVM TOOLS 2.03.13(2) (2021-08-11)       LVMCONFIG(8)

--------------

Pages that refer to this page:
`lvm.conf(5) <../man5/lvm.conf.5.html>`__, 
`lvmreport(7) <../man7/lvmreport.7.html>`__, 
`lvmthin(7) <../man7/lvmthin.7.html>`__, 
`lvmvdo(7) <../man7/lvmvdo.7.html>`__, 
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
