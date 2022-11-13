.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

blkzone(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
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

   BLKZONE(8)                System Administration               BLKZONE(8)

NAME
-------------------------------------------------

::

          blkzone - run zone command on a device


---------------------------------------------------------

::

          blkzone command [options] device


---------------------------------------------------------------

::

          blkzone is used to run zone command on device that support the
          Zoned Block Commands (ZBC) or Zoned-device ATA Commands (ZAC).
          The zones to operate on can be specified using the offset, count
          and length options.

          The device argument is the pathname of the block device.


---------------------------------------------------------

::

      report
          The command blkzone report is used to report device zone
          information.

          By default, the command will report all zones from the start of
          the block device. Options may be used to modify this behavior,
          changing the starting zone or the size of the report, as
          explained below.

          Report output:

          ┌────────┬──────────────────────────┐
          │        │                          │
          │start   │ Zone start sector        │
          ├────────┼──────────────────────────┤
          │        │                          │
          │len     │ Zone length in number of │
          │        │ sectors                  │
          ├────────┼──────────────────────────┤
          │        │                          │
          │cap     │ Zone capacity in number  │
          │        │ of sectors               │
          ├────────┼──────────────────────────┤
          │        │                          │
          │wptr    │ Zone write pointer       │
          │        │ position                 │
          ├────────┼──────────────────────────┤
          │        │                          │
          │reset   │ Reset write pointer      │
          │        │ recommended              │
          ├────────┼──────────────────────────┤
          │        │                          │
          │non-seq │ Non-sequential write     │
          │        │ resources active         │
          ├────────┼──────────────────────────┤
          │        │                          │
          │cond    │ Zone condition           │
          ├────────┼──────────────────────────┤
          │        │                          │
          │type    │ Zone type                │
          └────────┴──────────────────────────┘

          Zone conditions:

          ┌───┬──────────────────────────┐
          │   │                          │
          │cl │ Closed                   │
          ├───┼──────────────────────────┤
          │   │                          │
          │nw │ Not write pointer        │
          ├───┼──────────────────────────┤
          │   │                          │
          │em │ Empty                    │
          ├───┼──────────────────────────┤
          │   │                          │
          │fu │ Full                     │
          ├───┼──────────────────────────┤
          │   │                          │
          │oe │ Explicitly opened        │
          ├───┼──────────────────────────┤
          │   │                          │
          │oi │ Implicitly opened        │
          ├───┼──────────────────────────┤
          │   │                          │
          │ol │ Offline                  │
          ├───┼──────────────────────────┤
          │   │                          │
          │ro │ Read only                │
          ├───┼──────────────────────────┤
          │   │                          │
          │x? │ Reserved conditions      │
          │   │ (should not be reported) │
          └───┴──────────────────────────┘

      capacity
          The command blkzone capacity is used to report device capacity
          information.

          By default, the command will report the sum, in number of
          sectors, of all zone capacities on the device. Options may be
          used to modify this behavior, changing the starting zone or the
          size of the report, as explained below.

      reset
          The command blkzone reset is used to reset one or more zones.
          Unlike sg_reset_wp(8), this command operates from the block layer
          and can reset a range of zones.

      open
          The command blkzone open is used to explicitly open one or more
          zones. Unlike sg_zone(8), open action, this command operates from
          the block layer and can open a range of zones.

      close
          The command blkzone close is used to close one or more zones.
          Unlike sg_zone(8), close action, this command operates from the
          block layer and can close a range of zones.

      finish
          The command blkzone finish is used to finish (transition to full
          condition) one or more zones. Unlike sg_zone(8), finish action,
          this command operates from the block layer and can finish a range
          of zones.

          By default, the reset, open, close and finish commands will
          operate from the zone at device sector 0 and operate on all
          zones. Options may be used to modify this behavior as explained
          below.


-------------------------------------------------------

::

          The offset and length option arguments may be followed by the
          multiplicative suffixes KiB (=1024), MiB (=1024*1024), and so on
          for GiB, TiB, PiB, EiB, ZiB and YiB (the "iB" is optional, e.g.,
          "K" has the same meaning as "KiB") or the suffixes KB (=1000), MB
          (=1000*1000), and so on for GB, TB, PB, EB, ZB and YB.
          Additionally, the 0x prefix can be used to specify offset and
          length in hex.

          -o, --offset sector
              The starting zone specified as a sector offset. The provided
              offset in sector units (512 bytes) should match the start of
              a zone. The default value is zero.

          -l, --length sectors
              The maximum number of sectors the command should operate on.
              The default value is the number of sectors remaining after
              offset. This option cannot be used together with the option
              --count.

          -c, --count count
              The maximum number of zones the command should operate on.
              The default value is the number of zones starting from
              offset. This option cannot be used together with the option
              --length.

          -f, --force
              Enforce commands to change zone status on block devices used
              by the system.

          -v, --verbose
              Display the number of zones returned in the report or the
              range of sectors reset.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------

::

          Shaun Tancheff <shaun@tancheff.com>, Karel Zak <kzak@redhat.com>


---------------------------------------------------------

::

          sg_rep_zones(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The blkzone command is part of the util-linux package which can
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

   util-linux 2.37.85-637cc       2021-04-02                     BLKZONE(8)

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
