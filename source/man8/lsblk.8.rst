.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lsblk(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
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

   LSBLK(8)                  System Administration                 LSBLK(8)

NAME
-------------------------------------------------

::

          lsblk - list block devices


---------------------------------------------------------

::

          lsblk [options] [device...]


---------------------------------------------------------------

::

          lsblk lists information about all available or the specified
          block devices. The lsblk command reads the sysfs filesystem and
          udev db to gather information. If the udev db is not available or
          lsblk is compiled without udev support, then it tries to read
          LABELs, UUIDs and filesystem types from the block device. In this
          case root permissions are necessary.

          The command prints all block devices (except RAM disks) in a
          tree-like format by default. Use lsblk --help to get a list of
          all available columns.

          The default output, as well as the default output from options
          like --fs and --topology, is subject to change. So whenever
          possible, you should avoid using default outputs in your scripts.
          Always explicitly define expected columns by using --output
          columns-list and --list in environments where a stable output is
          required.

          Note that lsblk might be executed in time when udev does not have
          all information about recently added or modified devices yet. In
          this case it is recommended to use udevadm settle before lsblk to
          synchronize with udev.

          The relationship between block devices and filesystems is not
          always one-to-one. The filesystem may use more block devices, or
          the same filesystem may be accessible by more paths. This is the
          reason why lsblk provides MOUNTPOINT and MOUNTPOINTS (pl.)
          columns. The column MOUNTPOINT displays only one mount point
          (usually the last mounted instance of the filesystem), and the
          column MOUNTPOINTS displays by multi-line cell all mount points
          associated with the device.


-------------------------------------------------------

::

          -a, --all
              Also list empty devices and RAM disk devices.

          -b, --bytes
              Print the SIZE column in bytes rather than in a
              human-readable format.

          -D, --discard
              Print information about the discarding capabilities (TRIM,
              UNMAP) for each device.

          -d, --nodeps
              Do not print holder devices or slaves. For example, lsblk
              --nodeps /dev/sda prints information about the sda device
              only.

          -E, --dedup column
              Use column as a de-duplication key to de-duplicate output
              tree. If the key is not available for the device, or the
              device is a partition and parental whole-disk device provides
              the same key than the device is always printed.

              The usual use case is to de-duplicate output on system
              multi-path devices, for example by -E WWN.

          -e, --exclude list
              Exclude the devices specified by the comma-separated list of
              major device numbers. Note that RAM disks (major=1) are
              excluded by default if --all is not specified. The filter is
              applied to the top-level devices only. This may be confusing
              for --list output format where hierarchy of the devices is
              not obvious.

          -f, --fs
              Output info about filesystems. This option is equivalent to
              -o NAME,FSTYPE,FSVER,LABEL,UUID,FSAVAIL,FSUSE%,MOUNTPOINTS.
              The authoritative information about filesystems and raids is
              provided by the blkid(8) command.

          -h, --help
              Display help text and exit.

          -I, --include list
              Include devices specified by the comma-separated list of
              major device numbers. The filter is applied to the top-level
              devices only. This may be confusing for --list output format
              where hierarchy of the devices is not obvious.

          -i, --ascii
              Use ASCII characters for tree formatting.

          -J, --json
              Use JSON output format. It’s strongly recommended to use
              --output and also --tree if necessary.

          -l, --list
              Produce output in the form of a list. The output does not
              provide information about relationships between devices and
              since version 2.34 every device is printed only once if
              --pairs or --raw not specified (the parsable outputs are
              maintained in backwardly compatible way).

          -M, --merge
              Group parents of sub-trees to provide more readable output
              for RAIDs and Multi-path devices. The tree-like output is
              required.

          -m, --perms
              Output info about device owner, group and mode. This option
              is equivalent to -o NAME,SIZE,OWNER,GROUP,MODE.

          -n, --noheadings
              Do not print a header line.

          -o, --output list
              Specify which output columns to print. Use --help to get a
              list of all supported columns. The columns may affect
              tree-like output. The default is to use tree for the column
              'NAME' (see also --tree).

              The default list of columns may be extended if list is
              specified in the format +list (e.g., lsblk -o +UUID).

          -O, --output-all
              Output all available columns.

          -P, --pairs
              Produce output in the form of key="value" pairs. The output
              lines are still ordered by dependencies. All potentially
              unsafe value characters are hex-escaped (\x<code>). The key
              (variable name) will be modified to contain only characters
              allowed for a shell variable identifiers, for example, MIN_IO
              and FSUSE_PCT instead of MIN-IO and FSUSE%.

          -p, --paths
              Print full device paths.

          -r, --raw
              Produce output in raw format. The output lines are still
              ordered by dependencies. All potentially unsafe characters
              are hex-escaped (\x<code>) in the NAME, KNAME, LABEL,
              PARTLABEL and MOUNTPOINT columns.

          -S, --scsi
              Output info about SCSI devices only. All partitions, slaves
              and holder devices are ignored.

          -s, --inverse
              Print dependencies in inverse order. If the --list output is
              requested then the lines are still ordered by dependencies.

          -T, --tree[=column]
              Force tree-like output format. If column is specified, then a
              tree is printed in the column. The default is NAME column.

          -t, --topology
              Output info about block-device topology. This option is
              equivalent to

              -o
              NAME,ALIGNMENT,MIN-IO,OPT-IO,PHY-SEC,LOG-SEC,ROTA,SCHED,RQ-SIZE,RA,WSAME.

          -V, --version
              Display version information and exit.

          -w, --width number
              Specifies output width as a number of characters. The default
              is the number of the terminal columns, and if not executed on
              a terminal, then output width is not restricted at all by
              default. This option also forces lsblk to assume that
              terminal control characters and unsafe characters are not
              allowed. The expected use-case is for example when lsblk is
              used by the watch(1) command.

          -x, --sort column
              Sort output lines by column. This option enables --list
              output format by default. It is possible to use the option
              --tree to force tree-like output and than the tree branches
              are sorted by the column.

          -z, --zoned
              Print the zone model for each device.

          --sysroot directory
              Gather data for a Linux instance other than the instance from
              which the lsblk command is issued. The specified directory is
              the system root of the Linux instance to be inspected. The
              real device nodes in the target directory can be replaced by
              text files with udev attributes.


---------------------------------------------------------------

::

          0
              success

          1
              failure

          32
              none of specified devices found

          64
              some specified devices found, some not found


---------------------------------------------------------------

::

          LSBLK_DEBUG=all
              enables lsblk debug output.

          LIBBLKID_DEBUG=all
              enables libblkid debug output.

          LIBMOUNT_DEBUG=all
              enables libmount debug output.

          LIBSMARTCOLS_DEBUG=all
              enables libsmartcols debug output.

          LIBSMARTCOLS_DEBUG_PADDING=on
              use visible padding characters.


---------------------------------------------------

::

          For partitions, some information (e.g., queue attributes) is
          inherited from the parent device.

          The lsblk command needs to be able to look up each block device
          by major:minor numbers, which is done by using /sys/dev/block.
          This sysfs block directory appeared in kernel 2.6.27 (October
          2008). In case of problems with a new enough kernel, check that
          CONFIG_SYSFS was enabled at the time of the kernel build.


-------------------------------------------------------

::

          Milan Broz <mbroz@redhat.com>, Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          ls(1), blkid(8), findmnt(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The lsblk command is part of the util-linux package which can be
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

   util-linux 2.37.294-0c7e       2021-08-19                       LSBLK(8)

--------------

Pages that refer to this page: `eject(1) <../man1/eject.1.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`fstab(5) <../man5/fstab.5.html>`__, 
`blkdeactivate(8) <../man8/blkdeactivate.8.html>`__, 
`blkid(8) <../man8/blkid.8.html>`__, 
`cfdisk(8) <../man8/cfdisk.8.html>`__, 
`findfs(8) <../man8/findfs.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__

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
