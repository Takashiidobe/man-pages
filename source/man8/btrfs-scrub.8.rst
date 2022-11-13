.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs-scrub(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SUBCOMMAND <#SUBCOMMAND>`__ \|   |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS-SCRUB(8)                Btrfs Manual                BTRFS-SCRUB(8)

NAME
-------------------------------------------------

::

          btrfs-scrub - scrub btrfs filesystem, verify block checksums


---------------------------------------------------------

::

          btrfs scrub <subcommand> <args>


---------------------------------------------------------------

::

          btrfs scrub is used to scrub a mounted btrfs filesystem, which
          will read all data and metadata blocks from all devices and
          verify checksums. Automatically repair corrupted blocks if
          there’s a correct copy available.

              Note
              Scrub is not a filesystem checker (fsck) and does not verify
              nor repair structural damage in the filesystem. It really
              only checks checksums of data and tree blocks, it doesn’t
              ensure the content of tree blocks is valid and consistent.
              There’s some validation performed when metadata blocks are
              read from disk but it’s not extensive and cannot substitute
              full btrfs check run.

          The user is supposed to run it manually or via a periodic system
          service. The recommended period is a month but could be less. The
          estimated device bandwidth utilization is about 80% on an idle
          filesystem. The IO priority class is by default idle so
          background scrub should not significantly interfere with normal
          filesystem operation. The IO scheduler set for the device(s)
          might not support the priority classes though.

          The scrubbing status is recorded in /var/lib/btrfs/ in textual
          files named scrub.status.UUID for a filesystem identified by the
          given UUID. (Progress state is communicated through a named pipe
          in file scrub.progress.UUID in the same directory.) The status
          file is updated every 5 seconds. A resumed scrub will continue
          from the last saved position.

          Scrub can be started only on a mounted filesystem, though it’s
          possible to scrub only a selected device. See scrub start for
          more.


-------------------------------------------------------------

::

          cancel <path>|<device>
              If a scrub is running on the filesystem identified by path or
              device, cancel it.

              If a device is specified, the corresponding filesystem is
              found and btrfs scrub cancel behaves as if it was called on
              that filesystem. The progress is saved in the status file so
              btrfs scrub resume can continue from the last position.

          resume [-BdqrR] [-c <ioprio_class> -n <ioprio_classdata>]
          <path>|<device>
              Resume a cancelled or interrupted scrub on the filesystem
              identified by path or on a given device. The starting point
              is read from the status file if it exists.

              This does not start a new scrub if the last scrub finished
              successfully.

              Options

              see scrub start.

          start [-BdqrRf] [-c <ioprio_class> -n <ioprio_classdata>]
          <path>|<device>
              Start a scrub on all devices of the mounted filesystem
              identified by path or on a single device. If a scrub is
              already running, the new one will not start. A device of an
              unmounted filesystem cannot be scrubbed this way.

              Without options, scrub is started as a background process.
              The automatic repairs of damaged copies is performed by
              default for block group profiles with redundancy.

              The default IO priority of scrub is the idle class. The
              priority can be configured similar to the ionice(1) syntax
              using -c and -n options. Note that not all IO schedulers
              honor the ionice settings.

              Options

              -B
                  do not background and print scrub statistics when
                  finished

              -d
                  print separate statistics for each device of the
                  filesystem (-B only) at the end

              -r
                  run in read-only mode, do not attempt to correct
                  anything, can be run on a read-only filesystem

              -R
                  raw print mode, print full data instead of summary

              -c <ioprio_class>
                  set IO priority class (see ionice(1) manpage)

              -n <ioprio_classdata>
                  set IO priority classdata (see ionice(1) manpage)

              -f
                  force starting new scrub even if a scrub is already
                  running, this can useful when scrub status file is
                  damaged and reports a running scrub although it is not,
                  but should not normally be necessary

              -q
                  (deprecated) alias for global -q option

          status [options] <path>|<device>
              Show status of a running scrub for the filesystem identified
              by path or for the specified device.

              If no scrub is running, show statistics of the last finished
              or cancelled scrub for that filesystem or device.

              Options

              -d
                  print separate statistics for each device of the
                  filesystem

              -R
                  print all raw statistics without postprocessing as
                  returned by the status ioctl

              --raw
                  print all numbers raw values in bytes without the B
                  suffix

              --human-readable
                  print human friendly numbers, base 1024, this is the
                  default

              --iec
                  select the 1024 base for the following options, according
                  to the IEC standard

              --si
                  select the 1000 base for the following options, according
                  to the SI standard

              --kbytes
                  show sizes in KiB, or kB with --si

              --mbytes
                  show sizes in MiB, or MB with --si

              --gbytes
                  show sizes in GiB, or GB with --si

              --tbytes
                  show sizes in TiB, or TB with --si


---------------------------------------------------------------

::

          btrfs scrub returns a zero exit status if it succeeds. Non zero
          is returned in case of failure:

          1
              scrub couldn’t be performed

          2
              there is nothing to resume

          3
              scrub found uncorrectable errors


-----------------------------------------------------------------

::

          btrfs is part of btrfs-progs. Please refer to the btrfs wiki
          http://btrfs.wiki.kernel.org for further details.


---------------------------------------------------------

::

          mkfs.btrfs(8), ionice(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the btrfs-progs (btrfs filesystem tools)
          project.  Information about the project can be found at 
          ⟨https://btrfs.wiki.kernel.org/index.php/Btrfs_source_repositories⟩.
          If you have a bug report for this manual page, see
          ⟨https://btrfs.wiki.kernel.org/index.php/Problem_FAQ#How_do_I_report_bugs_and_issues.3F⟩.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-07-30.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Btrfs v4.6.1                   03/13/2021                 BTRFS-SCRUB(8)

--------------

Pages that refer to this page: `btrfs(8) <../man8/btrfs.8.html>`__, 
`btrfs-check(8) <../man8/btrfs-check.8.html>`__, 
`btrfs-rescue(8) <../man8/btrfs-rescue.8.html>`__

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
