.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mkswap(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `WARNING <#WARNING>`__ \|         |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MKSWAP(8)                 System Administration                MKSWAP(8)

NAME
-------------------------------------------------

::

          mkswap - set up a Linux swap area


---------------------------------------------------------

::

          mkswap [options] device [size]


---------------------------------------------------------------

::

          mkswap sets up a Linux swap area on a device or in a file.

          The device argument will usually be a disk partition (something
          like /dev/sdb7) but can also be a file. The Linux kernel does not
          look at partition IDs, but many installation scripts will assume
          that partitions of hex type 82 (LINUX_SWAP) are meant to be swap
          partitions. (Warning: Solaris also uses this type. Be careful not
          to kill your Solaris partitions.)

          The size parameter is superfluous but retained for backwards
          compatibility. (It specifies the desired size of the swap area in
          1024-byte blocks. mkswap will use the entire partition or file if
          it is omitted. Specifying it is unwise - a typo may destroy your
          disk.)

          After creating the swap area, you need the swapon command to
          start using it. Usually swap areas are listed in /etc/fstab so
          that they can be taken into use at boot time by a swapon -a
          command in some boot script.


-------------------------------------------------------

::

          The swap header does not touch the first block. A boot loader or
          disk label can be there, but it is not a recommended setup. The
          recommended setup is to use a separate partition for a Linux swap
          area.

          mkswap, like many others mkfs-like utils, erases the first
          partition block to make any previous filesystem invisible.

          However, mkswap refuses to erase the first block on a device with
          a disk label (SUN, BSD, ...).


-------------------------------------------------------

::

          -c, --check
              Check the device (if it is a block device) for bad blocks
              before creating the swap area. If any bad blocks are found,
              the count is printed.

          -f, --force
              Go ahead even if the command is stupid. This allows the
              creation of a swap area larger than the file or partition it
              resides on.

              Also, without this option, mkswap will refuse to erase the
              first block on a device with a partition table.

          -L, --label label
              Specify a label for the device, to allow swapon by label.

          --lock[=mode]
              Use exclusive BSD lock for device or file it operates. The
              optional argument mode can be yes, no (or 1 and 0) or
              nonblock. If the mode argument is omitted, it defaults to
              "yes". This option overwrites environment variable
              $LOCK_BLOCK_DEVICE. The default is not to use any lock at
              all, but it’s recommended to avoid collisions with udevd or
              other tools.

          -p, --pagesize size
              Specify the page size (in bytes) to use. This option is
              usually unnecessary; mkswap reads the size from the kernel.

          -U, --uuid UUID
              Specify the UUID to use. The default is to generate a UUID.

          -v, --swapversion 1
              Specify the swap-space version. (This option is currently
              pointless, as the old -v 0 option has become obsolete and now
              only -v 1 is supported. The kernel has not supported v0
              swap-space format since 2.5.22 (June 2002). The new version
              v1 is supported since 2.1.117 (August 1998).)

          --verbose
              Verbose execution. With this option mkswap will output more
              details about detected problems during swap area set up.

          -h, --help
              Display help text and exit.

          -V, --version
              Display version information and exit.


---------------------------------------------------------------

::

          LIBBLKID_DEBUG=all
              enables libblkid debug output.

          LOCK_BLOCK_DEVICE=<mode>
              use exclusive BSD lock. The mode is "1" or "0". See --lock
              for more details.


---------------------------------------------------

::

          The maximum useful size of a swap area depends on the
          architecture and the kernel version.

          The maximum number of the pages that is possible to address by
          swap area header is 4294967295 (32-bit unsigned int). The
          remaining space on the swap device is ignored.

          Presently, Linux allows 32 swap areas. The areas in use can be
          seen in the file /proc/swaps.

          mkswap refuses areas smaller than 10 pages.

          If you don’t know the page size that your machine uses, you may
          be able to look it up with cat /proc/cpuinfo (or you may not -
          the contents of this file depend on architecture and kernel
          version).

          To set up a swap file, it is necessary to create that file before
          initializing it with mkswap, e.g. using a command like

              # dd if=/dev/zero of=swapfile bs=1MiB count=$((8*1024))

          to create 8GiB swapfile.

          Please read notes from swapon(8) about the swap file use
          restrictions (holes, preallocation and copy-on-write issues).


---------------------------------------------------------

::

          fdisk(8), swapon(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The mkswap command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                      MKSWAP(8)

--------------

Pages that refer to this page: `swapon(2) <../man2/swapon.2.html>`__, 
`crypttab(5) <../man5/crypttab.5.html>`__, 
`swaplabel(8) <../man8/swaplabel.8.html>`__, 
`swapon(8) <../man8/swapon.8.html>`__

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
