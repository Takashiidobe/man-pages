.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

partx(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
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

   PARTX(8)                  System Administration                 PARTX(8)

NAME
-------------------------------------------------

::

          partx - tell the kernel about the presence and numbering of
          on-disk partitions


---------------------------------------------------------

::

          partx [-a|-d|-P|-r|-s|-u] [-t type] [-n M:_N_] [-] disk

          partx [-a|-d|-P|-r|-s|-u] [-t type] partition [disk]


---------------------------------------------------------------

::

          Given a device or disk-image, partx tries to parse the partition
          table and list its contents. It can also tell the kernel to add
          or remove partitions from its bookkeeping.

          The disk argument is optional when a partition argument is
          provided. To force scanning a partition as if it were a whole
          disk (for example to list nested subpartitions), use the argument
          "-" (hyphen-minus). For example:

             partx --show - /dev/sda3

          This will see sda3 as a whole-disk rather than as a partition.

          partx is not an fdisk program - adding and removing partitions
          does not change the disk, it just tells the kernel about the
          presence and numbering of on-disk partitions.


-------------------------------------------------------

::

          -a, --add
              Add the specified partitions, or read the disk and add all
              partitions.

          -b, --bytes
              Print the SIZE column in bytes rather than in human-readable
              format.

          -d, --delete
              Delete the specified partitions or all partitions. It is not
              error to remove non-existing partitions, so this option is
              possible to use together with large --nr ranges without care
              about the current partitions set on the device.

          -g, --noheadings
              Do not print a header line with --show or --raw.

          -l, --list
              List the partitions. Note that all numbers are in 512-byte
              sectors. This output format is DEPRECATED in favour of
              --show. Do not use it in newly written scripts.

          -n, --nr M:_N_
              Specify the range of partitions. For backward compatibility
              also the format M-_N_ is supported. The range may contain
              negative numbers, for example --nr -1:-1 means the last
              partition, and --nr -2:-1 means the last two partitions.
              Supported range specifications are:

              M
                  Specifies just one partition (e.g. --nr 3).

              M:
                  Specifies the lower limit only (e.g. --nr 2:).

              :N
                  Specifies the upper limit only (e.g. --nr :4).

              M:_N_
                  Specifies the lower and upper limits (e.g. --nr 2:4).

          -o, --output list
              Define the output columns to use for --show, --pairs and
              --raw output. If no output arrangement is specified, then a
              default set is used. Use --help to get list of all supported
              columns. This option cannot be combined with the --add,
              --delete, --update or --list options.

          --output-all
              Output all available columns.

          -P, --pairs
              List the partitions using the KEY="value" format.

          -r, --raw
              List the partitions using the raw output format.

          -s, --show
              List the partitions. The output columns can be selected and
              rearranged with the --output option. All numbers (except
              SIZE) are in 512-byte sectors.

          -t, --type type
              Specify the partition table type.

          --list-types
              List supported partition types and exit.

          -u, --update
              Update the specified partitions.

          -S, --sector-size size
              Overwrite default sector size.

          -v, --verbose
              Verbose mode.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------------------

::

          LIBBLKID_DEBUG=all
              enables libblkid debug output.


-------------------------------------------------------

::

          partx --show /dev/sdb3, partx --show --nr 3 /dev/sdb, partx
          --show /dev/sdb3 /dev/sdb
              All three commands list partition 3 of /dev/sdb.

          partx --show - /dev/sdb3
              Lists all subpartitions on /dev/sdb3 (the device is used as
              whole-disk).

          partx -o START -g --nr 5 /dev/sdb
              Prints the start sector of partition 5 on /dev/sdb without
              header.

          partx -o SECTORS,SIZE /dev/sda5 /dev/sda
              Lists the length in sectors and human-readable size of
              partition 5 on /dev/sda.

          partx --add --nr 3:5 /dev/sdd
              Adds all available partitions from 3 to 5 (inclusive) on
              /dev/sdd.

          partx -d --nr :-1 /dev/sdd
              Removes the last partition on /dev/sdd.


-------------------------------------------------------

::

          Davidlohr Bueso <dave@gnu.org>, Karel Zak <kzak@redhat.com>

          The original version was written by Andries E. Brouwer
          <aeb@cwi.nl>


---------------------------------------------------------

::

          addpart(8), delpart(8), fdisk(8), parted(8), partprobe(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The partx command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                       PARTX(8)

--------------

Pages that refer to this page: `addpart(8) <../man8/addpart.8.html>`__, 
`cfdisk(8) <../man8/cfdisk.8.html>`__, 
`delpart(8) <../man8/delpart.8.html>`__, 
`fdisk(8) <../man8/fdisk.8.html>`__, 
`findfs(8) <../man8/findfs.8.html>`__, 
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
