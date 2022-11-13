.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fstrim(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
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

   FSTRIM(8)                 System Administration                FSTRIM(8)

NAME
-------------------------------------------------

::

          fstrim - discard unused blocks on a mounted filesystem


---------------------------------------------------------

::

          fstrim [-Aa] [-o offset] [-l length] [-m minimum-size] [-v
          mountpoint]


---------------------------------------------------------------

::

          fstrim is used on a mounted filesystem to discard (or "trim")
          blocks which are not in use by the filesystem. This is useful for
          solid-state drives (SSDs) and thinly-provisioned storage.

          By default, fstrim will discard all unused blocks in the
          filesystem. Options may be used to modify this behavior based on
          range or size, as explained below.

          The mountpoint argument is the pathname of the directory where
          the filesystem is mounted.

          Running fstrim frequently, or even using mount -o discard, might
          negatively affect the lifetime of poor-quality SSD devices. For
          most desktop and server systems a sufficient trimming frequency
          is once a week. Note that not all devices support a queued trim,
          so each trim command incurs a performance penalty on whatever
          else might be trying to use the disk at the time.


-------------------------------------------------------

::

          The offset, length, and minimum-size arguments may be followed by
          the multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so
          on for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional,
          e.g., "K" has the same meaning as "KiB") or the suffixes KB
          (=1000), MB (=1000*1000), and so on for GB, TB, PB, EB, ZB and
          YB.

          -A, --fstab
              Trim all mounted filesystems mentioned in /etc/fstab on
              devices that support the discard operation. The root
              filesystem is determined from kernel command line if missing
              in the file. The other supplied options, like --offset,
              --length and --minimum, are applied to all these devices.
              Errors from filesystems that do not support the discard
              operation, read-only devices and read-only filesystems are
              silently ignored.

          -a, --all
              Trim all mounted filesystems on devices that support the
              discard operation. The other supplied options, like --offset,
              --length and --minimum, are applied to all these devices.
              Errors from filesystems that do not support the discard
              operation, read-only devices and read-only filesystems are
              silently ignored.

          -n, --dry-run
              This option does everything apart from actually call FITRIM
              ioctl.

          -o, --offset offset
              Byte offset in the filesystem from which to begin searching
              for free blocks to discard. The default value is zero,
              starting at the beginning of the filesystem.

          -l, --length length
              The number of bytes (after the starting point) to search for
              free blocks to discard. If the specified value extends past
              the end of the filesystem, fstrim will stop at the filesystem
              size boundary. The default value extends to the end of the
              filesystem.

          -I, --listed-in list
              Specifies a colon-separated list of files in fstab or kernel
              mountinfo format. All missing or empty files are silently
              ignored. The evaluation of the list stops after first
              non-empty file. For example:

              --listed-in /etc/fstab:/proc/self/mountinfo.

          -m, --minimum minimum-size
              Minimum contiguous free range to discard, in bytes. (This
              value is internally rounded up to a multiple of the
              filesystem block size.) Free ranges smaller than this will be
              ignored and fstrim will adjust the minimum if it’s smaller
              than the device’s minimum, and report that
              (fstrim_range.minlen) back to userspace. By increasing this
              value, the fstrim operation will complete more quickly for
              filesystems with badly fragmented freespace, although not all
              blocks will be discarded. The default value is zero,
              discarding every free block.

          -v, --verbose
              Verbose execution. With this option fstrim will output the
              number of bytes passed from the filesystem down the block
              stack to the device for potential discard. This number is a
              maximum discard amount from the storage device’s perspective,
              because FITRIM ioctl called repeated will keep sending the
              same sectors for discard repeatedly.

              fstrim will report the same potential discard bytes each
              time, but only sectors which had been written to between the
              discards would actually be discarded by the storage device.
              Further, the kernel block layer reserves the right to adjust
              the discard ranges to fit raid stripe geometry, non-trim
              capable devices in a LVM setup, etc. These reductions would
              not be reflected in fstrim_range.len (the --length option).

          --quiet-unsupported
              Suppress error messages if trim operation (ioctl) is
              unsupported. This option is meant to be used in systemd
              service file or in cron scripts to hide warnings that are
              result of known problems, such as NTFS driver reporting Bad
              file descriptor when device is mounted read-only, or lack of
              file system support for ioctl FITRIM call. This option also
              cleans exit status when unsupported filesystem specified on
              fstrim command line.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------------------

::

          0
              success

          1
              failure

          32
              all failed

          64
              some filesystem discards have succeeded, some failed

          The command fstrim --all returns 0 (all succeeded), 32 (all
          failed) or 64 (some failed, some succeeded).


-------------------------------------------------------

::

          Lukas Czerner <lczerner@redhat.com>, Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          blkdiscard(8), mount(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The fstrim command is part of the util-linux package which can be
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

   util-linux 2.37.294-0c7e       2021-08-19                      FSTRIM(8)

--------------

Pages that refer to this page:
`blkdiscard(8) <../man8/blkdiscard.8.html>`__, 
`dmeventd(8) <../man8/dmeventd.8.html>`__

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
