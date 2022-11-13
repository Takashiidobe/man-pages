.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

blkid(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `CONFIGURAT                       |                                   |
| ION FILE <#CONFIGURATION_FILE>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `AUTHORS <#AUTHORS>`__ \|      |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BLKID(8)                  System Administration                 BLKID(8)

NAME
-------------------------------------------------

::

          blkid - locate/print block device attributes


---------------------------------------------------------

::

          blkid --label label | --uuid uuid

          blkid [--no-encoding --garbage-collect --list-one --cache-file
          file] [--output format] [--match-tag tag] [--match-token
          NAME=value] [device...]

          blkid --probe [--offset offset] [--output format] [--size size]
          [--match-tag tag] [--match-types list] [--usages list]
          [--no-part-details] device...

          blkid --info [--output format] [--match-tag tag] device...


---------------------------------------------------------------

::

          The blkid program is the command-line interface to working with
          the libblkid(3) library. It can determine the type of content
          (e.g., filesystem or swap) that a block device holds, and also
          the attributes (tokens, NAME=value pairs) from the content
          metadata (e.g., LABEL or UUID fields).

          It is recommended to use lsblk(8) command to get information
          about block devices, or lsblk --fs to get an overview of
          filesystems, or findmnt(8) to search in already mounted
          filesystems.

             lsblk(8) provides more information, better control on
             output formatting, easy to use in scripts and it does
             not require root permissions to get actual information.
             blkid reads information directly from devices and for
             non-root users it returns cached unverified information.
             blkid is mostly designed for system services and to test
             libblkid(3) functionality.

          When device is specified, tokens from only this device are
          displayed. It is possible to specify multiple device arguments on
          the command line. If none is given, all partitions or
          unpartitioned devices which appear in /proc/partitions are shown,
          if they are recognized.

          blkid has two main forms of operation: either searching for a
          device with a specific NAME=value pair, or displaying NAME=value
          pairs for one or more specified devices.

          For security reasons blkid silently ignores all devices where the
          probing result is ambivalent (multiple colliding filesystems are
          detected). The low-level probing mode (-p) provides more
          information and extra exit status in this case. It’s recommended
          to use wipefs(8) to get a detailed overview and to erase obsolete
          stuff (magic strings) from the device.


-------------------------------------------------------

::

          The size and offset arguments may be followed by the
          multiplicative suffixes like KiB (=1024), MiB (=1024*1024), and
          so on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional,
          e.g., "K" has the same meaning as "KiB"), or the suffixes KB
          (=1000), MB (=1000*1000), and so on for GB, TB, PB, EB, ZB and
          YB.

          -c, --cache-file cachefile
              Read from cachefile instead of reading from the default cache
              file (see the CONFIGURATION FILE section for more details).
              If you want to start with a clean cache (i.e., don’t report
              devices previously scanned but not necessarily available at
              this time), specify /dev/null.

          -d, --no-encoding
              Don’t encode non-printing characters. The non-printing
              characters are encoded by ^ and M- notation by default. Note
              that the --output udev output format uses a different
              encoding which cannot be disabled.

          -D, --no-part-details
              Don’t print information (PART_ENTRY_* tags) from partition
              table in low-level probing mode.

          -g, --garbage-collect
              Perform a garbage collection pass on the blkid cache to
              remove devices which no longer exist.

          -h, --help
              Display a usage message and exit.

          -H, --hint setting
              Set probing hint. The hints are optional way how to force
              probing functions to check for example another location. The
              currently supported is "session_offset=number" to set session
              offset on multi-session UDF.

          -i, --info
              Display information about I/O Limits (aka I/O topology). The
              'export' output format is automatically enabled. This option
              can be used together with the --probe option.

          -k, --list-filesystems
              List all known filesystems and RAIDs and exit.

          -l, --list-one
              Look up only one device that matches the search parameter
              specified with the --match-token option. If there are
              multiple devices that match the specified search parameter,
              then the device with the highest priority is returned, and/or
              the first device found at a given priority (but see below
              note about udev). Device types in order of decreasing
              priority are: Device Mapper, EVMS, LVM, MD, and finally
              regular block devices. If this option is not specified, blkid
              will print all of the devices that match the search
              parameter.

              This option forces blkid to use udev when used for LABEL or
              UUID tokens in --match-token. The goal is to provide output
              consistent with other utils (like mount(8), etc.) on systems
              where the same tag is used for multiple devices.

          -L, --label label
              Look up the device that uses this filesystem label; this is
              equal to --list-one --output device --match-token
              LABEL=label. This lookup method is able to reliably use
              /dev/disk/by-label udev symlinks (dependent on a setting in
              /etc/blkid.conf). Avoid using the symlinks directly; it is
              not reliable to use the symlinks without verification. The
              --label option works on systems with and without udev.

              Unfortunately, the original blkid(8) from e2fsprogs uses the
              -L option as a synonym for -o list. For better portability,
              use -l -o device -t LABEL=label and -o list in your scripts
              rather than the -L option.

          -n, --match-types list
              Restrict the probing functions to the specified
              (comma-separated) list of superblock types (names). The list
              items may be prefixed with "no" to specify the types which
              should be ignored. For example:

              blkid --probe --match-types vfat,ext3,ext4 /dev/sda1

              probes for vfat, ext3 and ext4 filesystems, and

              blkid --probe --match-types nominix /dev/sda1

              probes for all supported formats except minix filesystems.
              This option is only useful together with --probe.

          -o, --output format
              Use the specified output format. Note that the order of
              variables and devices is not fixed. See also option -s. The
              format parameter may be:

              full
                  print all tags (the default)

              value
                  print the value of the tags

              list
                  print the devices in a user-friendly format; this output
                  format is unsupported for low-level probing (--probe or
                  --info).

                  This output format is DEPRECATED in favour of the
                  lsblk(8) command.

              device
                  print the device name only; this output format is always
                  enabled for the --label and --uuid options

              udev
                  print key="value" pairs for easy import into the udev
                  environment; the keys are prefixed by ID_FS_ or ID_PART_
                  prefixes. The value may be modified to be safe for udev
                  environment; allowed is plain ASCII, hex-escaping and
                  valid UTF-8, everything else (including whitespaces) is
                  replaced with '_'. The keys with _ENC postfix use
                  hex-escaping for unsafe chars.

                  The udev output returns the ID_FS_AMBIVALENT tag if more
                  superblocks are detected, and ID_PART_ENTRY_* tags are
                  always returned for all partitions including empty
                  partitions.

                  This output format is DEPRECATED.

              export
                  print key=value pairs for easy import into the
                  environment; this output format is automatically enabled
                  when I/O Limits (--info option) are requested.

                  The non-printing characters are encoded by ^ and M-
                  notation and all potentially unsafe characters are
                  escaped.

          -O, --offset offset
              Probe at the given offset (only useful with --probe). This
              option can be used together with the --info option.

          -p, --probe
              Switch to low-level superblock probing mode (bypassing the
              cache).

              Note that low-level probing also returns information about
              partition table type (PTTYPE tag) and partitions
              (PART_ENTRY_* tags). The tag names produced by low-level
              probing are based on names used internally by libblkid and it
              may be different than when executed without --probe (for
              example PART_ENTRY_UUID= vs PARTUUID=). See also
              --no-part-details.

          -s, --match-tag tag
              For each (specified) device, show only the tags that match
              tag. It is possible to specify multiple --match-tag options.
              If no tag is specified, then all tokens are shown for all
              (specified) devices. In order to just refresh the cache
              without showing any tokens, use --match-tag none with no
              other options.

          -S, --size size
              Override the size of device/file (only useful with --probe).

          -t, --match-token NAME=value
              Search for block devices with tokens named NAME that have the
              value value, and display any devices which are found. Common
              values for NAME include TYPE, LABEL, and UUID. If there are
              no devices specified on the command line, all block devices
              will be searched; otherwise only the specified devices are
              searched.

          -u, --usages list
              Restrict the probing functions to the specified
              (comma-separated) list of "usage" types. Supported usage
              types are: filesystem, raid, crypto and other. The list items
              may be prefixed with "no" to specify the usage types which
              should be ignored. For example:

              blkid --probe --usages filesystem,other /dev/sda1

              probes for all filesystem and other (e.g., swap) formats, and

              blkid --probe --usages noraid /dev/sda1

              probes for all supported formats except RAIDs. This option is
              only useful together with --probe.

          -U, --uuid uuid
              Look up the device that uses this filesystem uuid. For more
              details see the --label option.

          -V, --version
              Display version number and exit.


---------------------------------------------------------------

::

          If the specified device or device addressed by specified token
          (option --match-token) was found and it’s possible to gather any
          information about the device, an exit status 0 is returned. Note
          the option --match-tag filters output tags, but it does not
          affect exit status.

          If the specified token was not found, or no (specified) devices
          could be identified, or it is impossible to gather any
          information about the device identifiers or device content an
          exit status of 2 is returned.

          For usage or other errors, an exit status of 4 is returned.

          If an ambivalent probing result was detected by low-level probing
          mode (-p), an exit status of 8 is returned.


-----------------------------------------------------------------------------

::

          The standard location of the /etc/blkid.conf config file can be
          overridden by the environment variable BLKID_CONF. The following
          options control the libblkid library:

          SEND_UEVENT=<yes|not>
              Sends uevent when
              /dev/disk/by-{label,uuid,partuuid,partlabel}/ symlink does
              not match with LABEL, UUID, PARTUUID or PARTLABEL on the
              device. Default is "yes".

          CACHE_FILE=<path>
              Overrides the standard location of the cache file. This
              setting can be overridden by the environment variable
              BLKID_FILE. Default is /run/blkid/blkid.tab, or
              /etc/blkid.tab on systems without a /run directory.

          EVALUATE=<methods>
              Defines LABEL and UUID evaluation method(s). Currently, the
              libblkid library supports the "udev" and "scan" methods. More
              than one method may be specified in a comma-separated list.
              Default is "udev,scan". The "udev" method uses udev
              /dev/disk/by-* symlinks and the "scan" method scans all block
              devices from the /proc/partitions file.


---------------------------------------------------------------

::

          Setting LIBBLKID_DEBUG=all enables debug output.


-------------------------------------------------------

::

          blkid was written by Andreas Dilger for libblkid and improved by
          Theodore Ts’o and Karel Zak.


---------------------------------------------------------

::

          libblkid(3), findfs(8), lsblk(8), wipefs(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The blkid command is part of the util-linux package which can be
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

   util-linux 2.37.109-b366e69    2021-06-20                       BLKID(8)

--------------

Pages that refer to this page:
`ioctl_fslabel(2) <../man2/ioctl_fslabel.2.html>`__, 
`open_by_handle_at(2) <../man2/open_by_handle_at.2.html>`__, 
`libblkid(3) <../man3/libblkid.3.html>`__, 
`fstab(5) <../man5/fstab.5.html>`__, 
`blkid(8) <../man8/blkid.8.html>`__, 
`btrfs-device(8) <../man8/btrfs-device.8.html>`__, 
`findfs(8) <../man8/findfs.8.html>`__, 
`lsblk(8) <../man8/lsblk.8.html>`__, 
`wipefs(8) <../man8/wipefs.8.html>`__

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
