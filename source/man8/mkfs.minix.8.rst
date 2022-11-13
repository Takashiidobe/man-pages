.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mkfs.minix(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MKFS.MINIX(8)             System Administration            MKFS.MINIX(8)

NAME
-------------------------------------------------

::

          mkfs.minix - make a Minix filesystem


---------------------------------------------------------

::

          mkfs.minix [options] device [size-in-blocks]


---------------------------------------------------------------

::

          mkfs.minix creates a Linux MINIX filesystem on a device (usually
          a disk partition).

          The device is usually of the following form:

              /dev/hda[1-8] (IDE disk 1)
              /dev/hdb[1-8] (IDE disk 2)
              /dev/sda[1-8] (SCSI disk 1)
              /dev/sdb[1-8] (SCSI disk 2)

          The device may be a block device or an image file of one, but
          this is not enforced. Expect not much fun on a character device
          :-).

          The size-in-blocks parameter is the desired size of the file
          system, in blocks. It is present only for backwards
          compatibility. If omitted the size will be determined
          automatically. Only block counts strictly greater than 10 and
          strictly less than 65536 are allowed.


-------------------------------------------------------

::

          -c, --check
              Check the device for bad blocks before creating the
              filesystem. If any are found, the count is printed.

          -n, --namelength length
              Specify the maximum length of filenames. Currently, the only
              allowable values are 14 and 30 for file system versions 1 and
              2. Version 3 allows only value 60. The default is 30.

          --lock[=mode]
              Use exclusive BSD lock for device or file it operates. The
              optional argument mode can be yes, no (or 1 and 0) or
              nonblock. If the mode argument is omitted, it defaults to
              "yes". This option overwrites environment variable
              $LOCK_BLOCK_DEVICE. The default is not to use any lock at
              all, but it’s recommended to avoid collisions with udevd or
              other tools.

          -i, --inodes number
              Specify the number of inodes for the filesystem.

          -l, --badblocks filename
              Read the list of bad blocks from filename. The file has one
              bad-block number per line. The count of bad blocks read is
              printed.

          -1
              Make a Minix version 1 filesystem. This is the default.

          -2, -v
              Make a Minix version 2 filesystem.

          -3
              Make a Minix version 3 filesystem.

          -V, --version
              Display version information and exit. The long option cannot
              be combined with other options.

          -h, --help
              Display help text and exit.


---------------------------------------------------------------

::

          LOCK_BLOCK_DEVICE=<mode>
              use exclusive BSD lock. The mode is "1" or "0". See --lock
              for more details.


---------------------------------------------------------------

::

          The exit status returned by mkfs.minix is one of the following:

          0
              No errors

          8
              Operational error

          16
              Usage or syntax error


---------------------------------------------------------

::

          fsck(8), mkfs(8), reboot(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The mkfs.minix command is part of the util-linux package which
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

   util-linux 2.37.85-637cc       2021-04-02                  MKFS.MINIX(8)

--------------

Pages that refer to this page:
`fsck.minix(8) <../man8/fsck.minix.8.html>`__, 
`mkfs(8) <../man8/mkfs.8.html>`__, 
`systemd-makefs@.service(8) <../man8/systemd-makefs@.service.8.html>`__

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
