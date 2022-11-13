.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

wipefs(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WIPEFS(8)                 System Administration                WIPEFS(8)

NAME
-------------------------------------------------

::

          wipefs - wipe a signature from a device


---------------------------------------------------------

::

          wipefs [options] device...

          wipefs [--backup] -o offset device...

          wipefs [--backup] -a device...


---------------------------------------------------------------

::

          wipefs can erase filesystem, raid or partition-table signatures
          (magic strings) from the specified device to make the signatures
          invisible for libblkid. wipefs does not erase the filesystem
          itself nor any other data from the device.

          When used without any options, wipefs lists all visible
          filesystems and the offsets of their basic signatures. The
          default output is subject to change. So whenever possible, you
          should avoid using default outputs in your scripts. Always
          explicitly define expected columns by using --output columns-list
          in environments where a stable output is required.

          wipefs calls the BLKRRPART ioctl when it has erased a
          partition-table signature to inform the kernel about the change.
          The ioctl is called as the last step and when all specified
          signatures from all specified devices are already erased. This
          feature can be used to wipe content on partitions devices as well
          as partition table on a disk device, for example by wipefs -a
          /dev/sdc1 /dev/sdc2 /dev/sdc.

          Note that some filesystems and some partition tables store more
          magic strings on the device (e.g., FAT, ZFS, GPT). The wipefs
          command (since v2.31) lists all the offset where a magic strings
          have been detected.

          When option -a is used, all magic strings that are visible for
          libblkid(3) are erased. In this case the wipefs scans the device
          again after each modification (erase) until no magic string is
          found.

          Note that by default wipefs does not erase nested partition
          tables on non-whole disk devices. For this the option --force is
          required.


-------------------------------------------------------

::

          -a, --all
              Erase all available signatures. The set of erased signatures
              can be restricted with the -t option.

          -b, --backup
              Create a signature backup to the file
              $HOME/wipefs-<devname>-<offset>.bak. For more details see the
              EXAMPLE section.

          -f, --force
              Force erasure, even if the filesystem is mounted. This is
              required in order to erase a partition-table signature on a
              block device.

          -h, --help
              Display help text and exit.

          -J, --json
              Use JSON output format.

          --lock[=mode]
              Use exclusive BSD lock for device or file it operates. The
              optional argument mode can be yes, no (or 1 and 0) or
              nonblock. If the mode argument is omitted, it defaults to
              "yes". This option overwrites environment variable
              $LOCK_BLOCK_DEVICE. The default is not to use any lock at
              all, but it’s recommended to avoid collisions with udevd or
              other tools.

          -i, --noheadings
              Do not print a header line.

          -O, --output list
              Specify which output columns to print. Use --help to get a
              list of all supported columns.

          -n, --no-act
              Causes everything to be done except for the write(2) call.

          -o, --offset offset
              Specify the location (in bytes) of the signature which should
              be erased from the device. The offset number may include a
              "0x" prefix; then the number will be interpreted as a hex
              value. It is possible to specify multiple -o options.

              The offset argument may be followed by the multiplicative
              suffixes KiB (=1024), MiB (=1024*1024), and so on for GiB,
              TiB, PiB, EiB, ZiB and YiB (the "iB" is optional, e.g., "K"
              has the same meaning as "KiB"), or the suffixes KB (=1000),
              MB (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.

          -p, --parsable
              Print out in parsable instead of printable format. Encode all
              potentially unsafe characters of a string to the
              corresponding hex value prefixed by '\x'.

          -q, --quiet
              Suppress any messages after a successful signature wipe.

          -t, --types list
              Limit the set of printed or erased signatures. More than one
              type may be specified in a comma-separated list. The list or
              individual types can be prefixed with 'no' to specify the
              types on which no action should be taken. For more details
              see mount(8).

          -V, --version
              Display version information and exit.


---------------------------------------------------------------

::

          LIBBLKID_DEBUG=all
              enables libblkid(3) debug output.

          LOCK_BLOCK_DEVICE=<mode>
              use exclusive BSD lock. The mode is "1" or "0". See --lock
              for more details.


---------------------------------------------------------

::

          wipefs /dev/sda*
              Prints information about sda and all partitions on sda.

          wipefs --all --backup /dev/sdb
              Erases all signatures from the device /dev/sdb and creates a
              signature backup file ~/wipefs-sdb-<offset>.bak for each
              signature.

          dd if=~/wipefs-sdb-0x00000438.bak of=/dev/sdb seek=$0x00000438
          bs=1 conv=notrunc
              Restores an ext2 signature from the backup file
              ~/wipefs-sdb-0x00000438.bak.


-------------------------------------------------------

::

          Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          blkid(8), findfs(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The wipefs command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                      WIPEFS(8)

--------------

Pages that refer to this page:
`systemd.mount(5) <../man5/systemd.mount.5.html>`__, 
`systemd.swap(5) <../man5/systemd.swap.5.html>`__, 
`blkid(8) <../man8/blkid.8.html>`__, 
`btrfs-device(8) <../man8/btrfs-device.8.html>`__, 
`cfdisk(8) <../man8/cfdisk.8.html>`__, 
`fdisk(8) <../man8/fdisk.8.html>`__, 
`mkfs.btrfs(8) <../man8/mkfs.btrfs.8.html>`__, 
`sfdisk(8) <../man8/sfdisk.8.html>`__

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
