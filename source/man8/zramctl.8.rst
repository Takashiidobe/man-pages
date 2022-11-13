.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

zramctl(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
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

   ZRAMCTL(8)                System Administration               ZRAMCTL(8)

NAME
-------------------------------------------------

::

          zramctl - set up and control zram devices


---------------------------------------------------------

::

          Get info:
              zramctl [options]

          Reset zram:
              zramctl -r zramdev...

          Print name of first unused zram device:
              zramctl -f

          Set up a zram device:
              zramctl [-f | zramdev] [-s size] [-t number] [-a algorithm]


---------------------------------------------------------------

::

          zramctl is used to quickly set up zram device parameters, to
          reset zram devices, and to query the status of used zram devices.

          If no option is given, all non-zero size zram devices are shown.

          Note that zramdev node specified on command line has to already
          exist. The command zramctl creates a new /dev/zram<N> nodes only
          when --find option specified. It’s possible (and common) that
          after system boot /dev/zram<N> nodes are not created yet.


-------------------------------------------------------

::

          -a, --algorithm lzo|lz4|lz4hc|deflate|842|zstd
              Set the compression algorithm to be used for compressing data
              in the zram device.

          -f, --find
              Find the first unused zram device. If a --size argument is
              present, then initialize the device.

          -n, --noheadings
              Do not print a header line in status output.

          -o, --output list
              Define the status output columns to be used. If no output
              arrangement is specified, then a default set is used. Use
              --help to get a list of all supported columns.

          --output-all
              Output all available columns.

          --raw
              Use the raw format for status output.

          -r, --reset
              Reset the options of the specified zram device(s). Zram
              device settings can be changed only after a reset.

          -s, --size size
              Create a zram device of the specified size. Zram devices are
              aligned to memory pages; when the requested size is not a
              multiple of the page size, it will be rounded up to the next
              multiple. When not otherwise specified, the unit of the size
              parameter is bytes.

              The size argument may be followed by the multiplicative
              suffixes KiB (=1024), MiB (=1024*1024), and so on for GiB,
              TiB, PiB, EiB, ZiB and YiB (the "iB" is optional, e.g., "K"
              has the same meaning as "KiB") or the suffixes KB (=1000), MB
              (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.

          -t, --streams number
              Set the maximum number of compression streams that can be
              used for the device. The default is use all CPUs and one
              stream for kernels older than 4.6.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------------------

::

          zramctl returns 0 on success, nonzero on failure.


---------------------------------------------------

::

          /dev/zram[0..N]
              zram block devices


-------------------------------------------------------

::

          The following commands set up a zram device with a size of one
          gigabyte and use it as swap device.

               # zramctl --find --size 1024M
               /dev/zram0
               # mkswap /dev/zram0
               # swapon /dev/zram0
               ...
               # swapoff /dev/zram0
               # zramctl --reset /dev/zram0


-------------------------------------------------------

::

          Timofey Titovets <nefelim4ag@gmail.com>, Karel Zak
          <kzak@redhat.com>


---------------------------------------------------------

::

          Linux kernel documentation
          <http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/blockdev/zram.rst>


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The zramctl command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
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

   util-linux 2.37.294-0c7e       2021-08-19                     ZRAMCTL(8)

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
