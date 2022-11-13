.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

blockdev(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BLOCKDEV(8)               System Administration              BLOCKDEV(8)

NAME
-------------------------------------------------

::

          blockdev - call block device ioctls from the command line


---------------------------------------------------------

::

          blockdev [-q] [-v] command [command...] device [device...]

          blockdev --report [device...]

          blockdev -h|-V


---------------------------------------------------------------

::

          The utility blockdev allows one to call block device ioctls from
          the command line.


-------------------------------------------------------

::

          -q
              Be quiet.

          -v
              Be verbose.

          --report
              Print a report for the specified device. It is possible to
              give multiple devices. If none is given, all devices which
              appear in /proc/partitions are shown. Note that the partition
              StartSec is in 512-byte sectors.

          -h, --help
              Display help text and exit.

          -V, --version
              Print version and exit.


---------------------------------------------------------

::

          It is possible to give multiple devices and multiple commands.

          --flushbufs
              Flush buffers.

          --getalignoff
              Get alignment offset.

          --getbsz
              Print the blocksize in bytes. This size does not describe
              device topology. It’s the size used internally by the kernel
              and it may be modified (for example) by filesystem driver on
              mount.

          --getdiscardzeroes
              Get discard zeroes support status.

          --getfra
              Get filesystem readahead in 512-byte sectors.

          --getiomin
              Get minimum I/O size.

          --getioopt
              Get optimal I/O size.

          --getmaxsect
              Get max sectors per request.

          --getpbsz
              Get physical block (sector) size.

          --getra
              Print readahead (in 512-byte sectors).

          --getro
              Get read-only. Print 1 if the device is read-only, 0
              otherwise.

          --getsize64
              Print device size in bytes.

          --getsize
              Print device size (32-bit!) in sectors. Deprecated in favor
              of the --getsz option.

          --getss
              Print logical sector size in bytes - usually 512.

          --getsz
              Get size in 512-byte sectors.

          --rereadpt
              Reread partition table

          --setbsz bytes
              Set blocksize. Note that the block size is specific to the
              current file descriptor opening the block device, so the
              change of block size only persists for as long as blockdev
              has the device open, and is lost once blockdev exits.

          --setfra sectors
              Set filesystem readahead (same as --setra on 2.6 kernels).

          --setra sectors
              Set readahead (in 512-byte sectors).

          --setro
              Set read-only. The currently active access to the device may
              not be affected by the change. For example, a filesystem
              already mounted in read-write mode will not be affected. The
              change applies after remount.

          --setrw
              Set read-write.


-------------------------------------------------------

::

          blockdev was written by Andries E. Brouwer and rewritten by Karel
          Zak.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The blockdev command is part of the util-linux package which can
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

   util-linux 2.37.85-637cc       2021-04-02                    BLOCKDEV(8)

--------------

Pages that refer to this page: `fdisk(8) <../man8/fdisk.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`sfdisk(8) <../man8/sfdisk.8.html>`__, 
`systemd-udevd.service(8) <../man8/systemd-udevd.service.8.html>`__

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
