.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

parted(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PARTED(8)                   GNU Parted Manual                  PARTED(8)

NAME
-------------------------------------------------

::

          parted - a partition manipulation program


---------------------------------------------------------

::

          parted [options] [device [command [options...]...]]


---------------------------------------------------------------

::

          parted is a program to manipulate disk partitions.  It supports
          multiple partition table formats, including MS-DOS and GPT.  It
          is useful for creating space for new operating systems,
          reorganising disk usage, and copying data to new hard disks.

          This manual page documents parted briefly.  Complete
          documentation is distributed with the package in GNU Info format.


-------------------------------------------------------

::

          -h, --help
                 displays a help message

          -l, --list
                 lists partition layout on all block devices

          -m, --machine
                 displays machine parseable output

          -m, --json
                 displays JSON output

          -s, --script
                 never prompts for user intervention

          -f, --fix
                 automatically answer "fix" to exceptions in script mode

          -v, --version
                 displays the version

          -a alignment-type, --align alignment-type
                 Set alignment for newly created partitions, valid
                 alignment types are:

                 none   Use the minimum alignment allowed by the disk type.

                 cylinder
                        Align partitions to cylinders.

                 minimal
                        Use minimum alignment as given by the disk topology
                        information. This and the opt value will use layout
                        information provided by the disk to align the
                        logical partition table addresses to actual
                        physical blocks on the disks.  The min value is the
                        minimum alignment needed to align the partition
                        properly to physical blocks, which avoids
                        performance degradation.

                 optimal
                        Use optimum alignment as given by the disk topology
                        information. This aligns to a multiple of the
                        physical block size in a way that guarantees
                        optimal performance.


---------------------------------------------------------

::

          [device]
                 The block device to be used.  When none is given, parted
                 will use the first block device it finds.

          [command [options]]
                 Specifies the command to be executed.  If no command is
                 given, parted will present a command prompt.  Possible
                 commands are:

                 help [command]
                        Print general help, or help on command if
                        specified.

                 align-check type partition
                        Check if partition satisfies the alignment
                        constraint of type.  type must be "minimal" or
                        "optimal".

                 mklabel label-type
                        Create a new disklabel (partition table) of label-
                        type.  label-type should be one of "aix", "amiga",
                        "bsd", "dvh", "gpt", "loop", "mac", "msdos",
                        "pc98", or "sun".

                 mkpart [part-type name fs-type] start end
                        Create a new partition. part-type may be specified
                        only with msdos and dvh partition tables, it should
                        be one of "primary", "logical", or "extended".
                        name is required for GPT partition tables and fs-
                        type is optional.  fs-type can be one of "btrfs",
                        "ext2", "ext3", "ext4", "fat16", "fat32", "hfs",
                        "hfs+", "linux-swap", "ntfs", "reiserfs", "udf", or
                        "xfs".

                 name partition name
                        Set the name of partition to name. This option
                        works only on Mac, PC98, and GPT disklabels. The
                        name can be placed in double quotes, if necessary.
                        And depending on the shell may need to also be
                        wrapped in single quotes so that the shell doesn't
                        strip off the double quotes.

                 print  Display the partition table.

                 quit   Exit from parted.

                 rescue start end
                        Rescue a lost partition that was located somewhere
                        between start and end.  If a partition is found,
                        parted will ask if you want to create an entry for
                        it in the partition table.

                 resizepart partition end
                        Change the end position of partition.  Note that
                        this does not modify any filesystem present in the
                        partition.

                 rm partition
                        Delete partition.

                 select device
                        Choose device as the current device to edit. device
                        should usually be a Linux hard disk device, but it
                        can be a partition, software raid device, or an LVM
                        logical volume if necessary.

                 set partition flag state
                        Change the state of the flag on partition to state.
                        Supported flags are: "boot", "root", "swap",
                        "hidden", "raid", "lvm", "lba", "legacy_boot",
                        "irst", "msftres", "esp", "chromeos_kernel",
                        "bls_boot" and "palo".  state should be either "on"
                        or "off".

                 unit unit
                        Set unit as the unit to use when displaying
                        locations and sizes, and for interpreting those
                        given by the user when not suffixed with an
                        explicit unit.  unit can be one of "s" (sectors),
                        "B" (bytes), "kB", "MB", "MiB", "GB", "GiB", "TB",
                        "TiB", "%" (percentage of device size), "cyl"
                        (cylinders), "chs" (cylinders, heads, sectors), or
                        "compact" (megabytes for input, and a human-
                        friendly form for output).

                 toggle partition flag
                        Toggle the state of flag on partition.

                 version
                        Display version information and a copyright
                        message.


---------------------------------------------------------------------

::

          Report bugs to <bug-parted@gnu.org>


---------------------------------------------------------

::

          fdisk(8), mkfs(8), The parted program is fully documented in the
          info(1) format GNU partitioning software manual.


-----------------------------------------------------

::

          This manual page was written by Timshel Knoll
          <timshel@debian.org>, for the Debian GNU/Linux system (but may be
          used by others).

COLOPHON
---------------------------------------------------------

::

          This page is part of the GNU parted (partition table
          manipulation) project.  Information about the project can be
          found at ⟨http://www.gnu.org/software/parted/⟩.  If you have a
          bug report for this manual page, send it to bug-parted@gnu.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.savannah.gnu.org/parted.git⟩ on 2021-08-27.  (At that
          time, the date of the most recent commit that was found in the
          repository was 2021-08-25.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   parted                        2007 March 29                    PARTED(8)

--------------

Pages that refer to this page: `addpart(8) <../man8/addpart.8.html>`__, 
`btrfs-filesystem(8) <../man8/btrfs-filesystem.8.html>`__, 
`cfdisk(8) <../man8/cfdisk.8.html>`__, 
`delpart(8) <../man8/delpart.8.html>`__, 
`partprobe(8) <../man8/partprobe.8.html>`__, 
`partx(8) <../man8/partx.8.html>`__, 
`resizepart(8) <../man8/resizepart.8.html>`__, 
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
