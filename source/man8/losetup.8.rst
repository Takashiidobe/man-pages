.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

losetup(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENCRYPTION <#ENCRYPTION>`__ \|   |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOSETUP(8)                System Administration               LOSETUP(8)

NAME
-------------------------------------------------

::

          losetup - set up and control loop devices


---------------------------------------------------------

::

          Get info:

          losetup [loopdev]

          losetup -l [-a]

          losetup -j file [-o offset]

          Detach a loop device:

          losetup -d loopdev ...

          Detach all associated loop devices:

          losetup -D

          Set up a loop device:

          losetup [-o offset] [--sizelimit size] [--sector-size size] [-Pr]
          [--show] -f loopdev file

          Resize a loop device:

          losetup -c loopdev


---------------------------------------------------------------

::

          losetup is used to associate loop devices with regular files or
          block devices, to detach loop devices, and to query the status of
          a loop device. If only the loopdev argument is given, the status
          of the corresponding loop device is shown. If no option is given,
          all loop devices are shown.

          Note that the old output format (i.e., losetup -a) with
          comma-delimited strings is deprecated in favour of the --list
          output format.

          It’s possible to create more independent loop devices for the
          same backing file. This setup may be dangerous, can cause data
          loss, corruption and overwrites. Use --nooverlap with --find
          during setup to avoid this problem.

          The loop device setup is not an atomic operation when used with
          --find, and losetup does not protect this operation by any lock.
          The number of attempts is internally restricted to a maximum of
          16. It is recommended to use for example flock1 to avoid a
          collision in heavily parallel use cases.


-------------------------------------------------------

::

          The size and offset arguments may be followed by the
          multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so on
          for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional, e.g.,
          "K" has the same meaning as "KiB") or the suffixes KB (=1000), MB
          (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.

          -a, --all
              Show the status of all loop devices. Note that not all
              information is accessible for non-root users. See also
              --list. The old output format (as printed without --list) is
              deprecated.

          -d, --detach loopdev...
              Detach the file or device associated with the specified loop
              device(s). Note that since Linux v3.7 kernel uses "lazy
              device destruction". The detach operation does not return
              EBUSY error anymore if device is actively used by system, but
              it is marked by autoclear flag and destroyed later.

          -D, --detach-all
              Detach all associated loop devices.

          -f, --find [file]
              Find the first unused loop device. If a file argument is
              present, use the found device as loop device. Otherwise, just
              print its name.

          --show
              Display the name of the assigned loop device if the -f option
              and a file argument are present.

          -L, --nooverlap
              Check for conflicts between loop devices to avoid situation
              when the same backing file is shared between more loop
              devices. If the file is already used by another device then
              re-use the device rather than a new one. The option makes
              sense only with --find.

          -j, --associated file [-o offset]
              Show the status of all loop devices associated with the given
              file.

          -o, --offset offset
              The data start is moved offset bytes into the specified file
              or device. The offset may be followed by the multiplicative
              suffixes; see above.

          --sizelimit size
              The data end is set to no more than size bytes after the data
              start. The size may be followed by the multiplicative
              suffixes; see above.

          -b, --sector-size size
              Set the logical sector size of the loop device in bytes
              (since Linux 4.14). The option may be used when create a new
              loop device as well as stand-alone command to modify sector
              size of the already existing loop device.

          -c, --set-capacity loopdev
              Force the loop driver to reread the size of the file
              associated with the specified loop device.

          -P, --partscan
              Force the kernel to scan the partition table on a newly
              created loop device. Note that the partition table parsing
              depends on sector sizes. The default is sector size is 512
              bytes, otherwise you need to use the option --sector-size
              together with --partscan.

          -r, --read-only
              Set up a read-only loop device.

          --direct-io[=on|off]
              Enable or disable direct I/O for the backing file. The
              optional argument can be either on or off. If the argument is
              omitted, it defaults to off.

          -v, --verbose
              Verbose mode.

          -l, --list
              If a loop device or the -a option is specified, print the
              default columns for either the specified loop device or all
              loop devices; the default is to print info about all devices.
              See also --output, --noheadings, --raw, and --json.

          -O, --output column[,column]...
              Specify the columns that are to be printed for the --list
              output. Use --help to get a list of all supported columns.

          --output-all
              Output all available columns.

          -n, --noheadings
              Don’t print headings for --list output format.

          --raw
              Use the raw --list output format.

          -J, --json
              Use JSON format for --list output.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------------

::

          Cryptoloop is no longer supported in favor of dm-crypt. For more
          details see cryptsetup(8).


---------------------------------------------------------------

::

          losetup returns 0 on success, nonzero on failure. When losetup
          displays the status of a loop device, it returns 1 if the device
          is not configured and 2 if an error occurred which prevented
          determining the status of the device.


---------------------------------------------------

::

          Since version 2.37 losetup uses LOOP_CONFIGURE ioctl to setup a
          new loop device by one ioctl call. The old versions use
          LOOP_SET_FD and LOOP_SET_STATUS64 ioctls to do the same.


---------------------------------------------------------------

::

          LOOPDEV_DEBUG=all
              enables debug output.


---------------------------------------------------

::

          /dev/loop[0..N]
              loop block devices

          /dev/loop-control
              loop control device


-------------------------------------------------------

::

          The following commands can be used as an example of using the
          loop device.

              # dd if=/dev/zero of=~/file.img bs=1024k count=10
              # losetup --find --show ~/file.img
              /dev/loop0
              # mkfs -t ext2 /dev/loop0
              # mount /dev/loop0 /mnt
              ...
              # umount /dev/loop0
              # losetup --detach /dev/loop0


-------------------------------------------------------

::

          Karel Zak <kzak@redhat.com>, based on the original version from
          Theodore Ts’o <tytso@athena.mit.edu>.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The losetup command is part of the util-linux package which can
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

   util-linux 2.37.85-637cc       2021-04-02                     LOSETUP(8)

--------------

Pages that refer to this page: `loop(4) <../man4/loop.4.html>`__, 
`e2image(8) <../man8/e2image.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`umount(8) <../man8/umount.8.html>`__

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
