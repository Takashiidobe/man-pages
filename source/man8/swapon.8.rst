.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

swapon(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SWAPON(8)                 System Administration                SWAPON(8)

NAME
-------------------------------------------------

::

          swapon, swapoff - enable/disable devices and files for paging and
          swapping


---------------------------------------------------------

::

          swapon [options] [specialfile...]

          swapoff [-va] [specialfile...]


---------------------------------------------------------------

::

          swapon is used to specify devices on which paging and swapping
          are to take place.

          The device or file used is given by the specialfile parameter. It
          may be of the form -L label or -U uuid to indicate a device by
          label or uuid.

          Calls to swapon normally occur in the system boot scripts making
          all swap devices available, so that the paging and swapping
          activity is interleaved across several devices and files.

          swapoff disables swapping on the specified devices and files.
          When the -a flag is given, swapping is disabled on all known swap
          devices and files (as found in /proc/swaps or /etc/fstab).


-------------------------------------------------------

::

          -a, --all
              All devices marked as "swap" in /etc/fstab are made
              available, except for those with the "noauto" option. Devices
              that are already being used as swap are silently skipped.

          -d, --discard[=policy]
              Enable swap discards, if the swap backing device supports the
              discard or trim operation. This may improve performance on
              some Solid State Devices, but often it does not. The option
              allows one to select between two available swap discard
              policies:

              --discard=once
                  to perform a single-time discard operation for the whole
                  swap area at swapon; or

              --discard=pages
                  to asynchronously discard freed swap pages before they
                  are available for reuse.

              If no policy is selected, the default behavior is to enable
              both discard types. The /etc/fstab mount options discard,
              discard=once, or discard=pages may also be used to enable
              discard flags.

          -e, --ifexists
              Silently skip devices that do not exist. The /etc/fstab mount
              option nofail may also be used to skip non-existing device.

          -f, --fixpgsz
              Reinitialize (exec mkswap) the swap space if its page size
              does not match that of the current running kernel. mkswap(8)
              initializes the whole device and does not check for bad
              blocks.

          -h, --help
              Display help text and exit.

          -L label
              Use the partition that has the specified label. (For this,
              access to /proc/partitions is needed.)

          -o, --options opts
              Specify swap options by an fstab-compatible comma-separated
              string. For example:

              swapon -o pri=1,discard=pages,nofail /dev/sda2

              The opts string is evaluated last and overrides all other
              command line options.

          -p, --priority priority
              Specify the priority of the swap device. priority is a value
              between -1 and 32767. Higher numbers indicate higher
              priority. See swapon(2) for a full description of swap
              priorities. Add pri=value to the option field of /etc/fstab
              for use with swapon -a. When no priority is defined, it
              defaults to -1.

          -s, --summary
              Display swap usage summary by device. Equivalent to cat
              /proc/swaps. This output format is DEPRECATED in favour of
              --show that provides better control on output data.

          --show[=column...]
              Display a definable table of swap areas. See the --help
              output for a list of available columns.

          --output-all
              Output all available columns.

          --noheadings
              Do not print headings when displaying --show output.

          --raw
              Display --show output without aligning table columns.

          --bytes
              Display swap size in bytes in --show output instead of in
              user-friendly units.

          -U uuid
              Use the partition that has the specified uuid.

          -v, --verbose
              Be verbose.

          -V, --version
              Display version information and exit.


---------------------------------------------------------------

::

          swapoff has the following exit status values since v2.36:

          0
              success

          2
              system has insufficient memory to stop swapping (OOM)

          4
              swapoff syscall failed for another reason

          8
              non-swapoff syscall system error (out of memory, ...)

          16
              usage or syntax error

          32
              all swapoff failed on --all

          64
              some swapoff succeeded on --all

          The command swapoff --all returns 0 (all succeeded), 32 (all
          failed), or 64 (some failed, some succeeded).

          + The old versions before v2.36 has no documented exit status, 0
          means success in all versions.


---------------------------------------------------------------

::

          LIBMOUNT_DEBUG=all
              enables libmount debug output.

          LIBBLKID_DEBUG=all
              enables libblkid debug output.


---------------------------------------------------

::

          /dev/sd??
              standard paging devices

          /etc/fstab
              ascii filesystem description table


---------------------------------------------------

::

      Files with holes
          The swap file implementation in the kernel expects to be able to
          write to the file directly, without the assistance of the
          filesystem. This is a problem on files with holes or on
          copy-on-write files on filesystems like Btrfs.

          Commands like cp(1) or truncate(1) create files with holes. These
          files will be rejected by swapon.

          Preallocated files created by fallocate(1) may be interpreted as
          files with holes too depending of the filesystem. Preallocated
          swap files are supported on XFS since Linux 4.18.

          The most portable solution to create a swap file is to use dd(1)
          and /dev/zero.

      Btrfs
          Swap files on Btrfs are supported since Linux 5.0 on files with
          nocow attribute. See the btrfs(5) manual page for more details.

      NFS
          Swap over NFS may not work.

      Suspend
          swapon automatically detects and rewrites a swap space signature
          with old software suspend data (e.g., S1SUSPEND, S2SUSPEND, ...).
          The problem is that if we don’t do it, then we get data
          corruption the next time an attempt at unsuspending is made.


-------------------------------------------------------

::

          The swapon command appeared in 4.0BSD.


---------------------------------------------------------

::

          swapoff(2), swapon(2), fstab(5), init(8), fallocate(1),
          mkswap(8), mount(8), rc(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The swapon command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                      SWAPON(8)

--------------

Pages that refer to this page: `swapon(2) <../man2/swapon.2.html>`__, 
`fstab(5) <../man5/fstab.5.html>`__, 
`org.freedesktop.systemd1(5) <../man5/org.freedesktop.systemd1.5.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.swap(5) <../man5/systemd.swap.5.html>`__, 
`mkswap(8) <../man8/mkswap.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`swaplabel(8) <../man8/swaplabel.8.html>`__

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
