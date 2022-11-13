.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

blkdiscard(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
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

   BLKDISCARD(8)             System Administration            BLKDISCARD(8)

NAME
-------------------------------------------------

::

          blkdiscard - discard sectors on a device


---------------------------------------------------------

::

          blkdiscard [options] [-o offset] [-l length] device


---------------------------------------------------------------

::

          blkdiscard is used to discard device sectors. This is useful for
          solid-state drivers (SSDs) and thinly-provisioned storage. Unlike
          fstrim(8), this command is used directly on the block device.

          By default, blkdiscard will discard all blocks on the device.
          Options may be used to modify this behavior based on range or
          size, as explained below.

          The device argument is the pathname of the block device.

          WARNING: All data in the discarded region on the device will be
          lost!


-------------------------------------------------------

::

          The offset and length arguments may be followed by the
          multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so on
          for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional, e.g.,
          "K" has the same meaning as "KiB") or the suffixes KB (=1000), MB
          (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.

          -f, --force
              Disable all checking. Since v2.36 the block device is open in
              exclusive mode (O_EXCL) by default to avoid collision with
              mounted filesystem or another kernel subsystem. The --force
              option disables the exclusive access mode.

          -o, --offset offset
              Byte offset into the device from which to start discarding.
              The provided value must be aligned to the device sector size.
              The default value is zero.

          -l, --length length
              The number of bytes to discard (counting from the starting
              point). The provided value must be aligned to the device
              sector size. If the specified value extends past the end of
              the device, blkdiscard will stop at the device size boundary.
              The default value extends to the end of the device.

          -p, --step length
              The number of bytes to discard within one iteration. The
              default is to discard all by one ioctl call.

          -s, --secure
              Perform a secure discard. A secure discard is the same as a
              regular discard except that all copies of the discarded
              blocks that were possibly created by garbage collection must
              also be erased. This requires support from the device.

          -z, --zeroout
              Zero-fill rather than discard.

          -v, --verbose
              Display the aligned values of offset and length. If the
              --step option is specified, it prints the discard progress
              every second.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------

::

          Lukas Czerner <lczerner@redhat.com>


---------------------------------------------------------

::

          fstrim(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The blkdiscard command is part of the util-linux package which
          can be downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-04-02                  BLKDISCARD(8)

--------------

Pages that refer to this page: `fstrim(8) <../man8/fstrim.8.html>`__

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
