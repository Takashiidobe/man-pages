.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cfdisk(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `COLORS <#COLORS>`__ \|           |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
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

   CFDISK(8)                 System Administration                CFDISK(8)

NAME
-------------------------------------------------

::

          cfdisk - display or manipulate a disk partition table


---------------------------------------------------------

::

          cfdisk [options] [device]


---------------------------------------------------------------

::

          cfdisk is a curses-based program for partitioning any block
          device. The default device is /dev/sda.

          Note that cfdisk provides basic partitioning functionality with a
          user-friendly interface. If you need advanced features, use
          fdisk(8) instead.

          All disk label changes will remain in memory only, and the disk
          will be unmodified until you decide to write your changes. Be
          careful before using the write command.

          Since version 2.25 cfdisk supports MBR (DOS), GPT, SUN and SGI
          disk labels, but no longer provides any functionality for CHS
          (Cylinder-Head-Sector) addressing. CHS has never been important
          for Linux, and this addressing concept does not make any sense
          for new devices.

          Since version 2.25 cfdisk also does not provide a 'print' command
          any more. This functionality is provided by the utilities
          partx(8) and lsblk(8) in a very comfortable and rich way.

          If you want to remove an old partition table from a device, use
          wipefs(8).


-------------------------------------------------------

::

          -h, --help
              Display help text and exit.

          -L, --color[=when]
              Colorize the output. The optional argument when can be auto,
              never or always. If the when argument is omitted, it defaults
              to auto. The colors can be disabled, for the current built-in
              default see --help output. See also the COLORS section.

          --lock[=mode]
              Use exclusive BSD lock for device or file it operates. The
              optional argument mode can be yes, no (or 1 and 0) or
              nonblock. If the mode argument is omitted, it defaults to
              "yes". This option overwrites environment variable
              $LOCK_BLOCK_DEVICE. The default is not to use any lock at
              all, but it’s recommended to avoid collisions with udevd or
              other tools.

          -r, --read-only
              Forced open in read-only mode.

          -V, --version
              Display version information and exit.

          -z, --zero
              Start with an in-memory zeroed partition table. This option
              does not zero the partition table on the disk; rather, it
              simply starts the program without reading the existing
              partition table. This option allows you to create a new
              partition table from scratch or from an sfdisk(8)-compatible
              script.


---------------------------------------------------------

::

          The commands for cfdisk can be entered by pressing the
          corresponding key (pressing Enter after the command is not
          necessary). Here is a list of the available commands:

          b
              Toggle the bootable flag of the current partition. This
              allows you to select which primary partition is bootable on
              the drive. This command may not be available for all
              partition label types.

          d
              Delete the current partition. This will convert the current
              partition into free space and merge it with any free space
              immediately surrounding the current partition. A partition
              already marked as free space or marked as unusable cannot be
              deleted.

          h
              Show the help screen.

          n
              Create a new partition from free space. cfdisk then prompts
              you for the size of the partition you want to create. The
              default size is equal to the entire available free space at
              the current position.

              The size may be followed by a multiplicative suffix: KiB
              (=1024), MiB (=1024*1024), and so on for GiB, TiB, PiB, EiB,
              ZiB and YiB (the "iB" is optional, e.g., "K" has the same
              meaning as "KiB").

          q
              Quit the program. This will exit the program without writing
              any data to the disk.

          r
              Reduce or enlarge the current partition. cfdisk then prompts
              you for the new size of the partition. The default size is
              the current size. A partition marked as free space or marked
              as unusable cannot be resized.

              Note that reducing the size of a partition might destroy data
              on that partition.

          s
              Sort the partitions in ascending start-sector order. When
              deleting and adding partitions, it is likely that the
              numbering of the partitions will no longer match their order
              on the disk. This command restores that match.

          t
              Change the partition type. By default, new partitions are
              created as Linux partitions.

          u
              Dump the current in-memory partition table to an
              sfdisk-compatible script file.

              The script files are compatible between cfdisk, fdisk(8)
              sfdisk(8) and other libfdisk applications. For more details
              see sfdisk(8).

              It is also possible to load an sfdisk-script into cfdisk if
              there is no partition table on the device or when you start
              cfdisk with the --zero command-line option.

          W
              Write the partition table to disk (you must enter an
              uppercase W). Since this might destroy data on the disk, you
              must either confirm or deny the write by entering `yes' or
              `no'. If you enter `yes', cfdisk will write the partition
              table to disk and then tell the kernel to re-read the
              partition table from the disk.

              The re-reading of the partition table does not always work.
              In such a case you need to inform the kernel about any new
              partitions by using partprobe(8) or partx(8), or by rebooting
              the system.

          x
              Toggle extra information about a partition.

          Up Arrow, Down Arrow
              Move the cursor to the previous or next partition. If there
              are more partitions than can be displayed on a screen, you
              can display the next (previous) set of partitions by moving
              down (up) at the last (first) partition displayed on the
              screen.

          Left Arrow, Right Arrow
              Select the preceding or the next menu item. Hitting Enter
              will execute the currently selected item.

          All commands can be entered with either uppercase or lowercase
          letters (except for Write). When in a submenu or at a prompt, you
          can hit the Esc key to return to the main menu.


-----------------------------------------------------

::

          Implicit coloring can be disabled by creating the empty file
          /etc/terminal-colors.d/cfdisk.disable.

          See terminal-colors.d(5) for more details about colorization
          configuration.

          cfdisk does not support color customization with a color-scheme
          file.


---------------------------------------------------------------

::

          CFDISK_DEBUG=all
              enables cfdisk debug output.

          LIBFDISK_DEBUG=all
              enables libfdisk debug output.

          LIBBLKID_DEBUG=all
              enables libblkid debug output.

          LIBSMARTCOLS_DEBUG=all
              enables libsmartcols debug output.

          LIBSMARTCOLS_DEBUG_PADDING=on
              use visible padding characters. Requires enabled
              LIBSMARTCOLS_DEBUG.

          LOCK_BLOCK_DEVICE=<mode>
              use exclusive BSD lock. The mode is "1" or "0". See --lock
              for more details.


-------------------------------------------------------

::

          Karel Zak <kzak@redhat.com>

          The current cfdisk implementation is based on the original cfdisk
          from Kevin E. Martin <martin@cs.unc.edu>.


---------------------------------------------------------

::

          fdisk(8), parted(8), partprobe(8), partx(8), sfdisk(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The cfdisk command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                      CFDISK(8)

--------------

Pages that refer to this page: `fdisk(8) <../man8/fdisk.8.html>`__, 
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
