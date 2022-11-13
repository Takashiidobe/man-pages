.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

adjtime_config(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ADJTIME_CONFIG(5)             File formats             ADJTIME_CONFIG(5)

NAME
-------------------------------------------------

::

          adjtime_config - information about hardware clock setting and
          drift factor


---------------------------------------------------------

::

          /etc/adjtime


---------------------------------------------------------------

::

          The file /etc/adjtime contains descriptive information about the
          hardware mode clock setting and clock drift factor. The file is
          read and write by hwclock(8); and read by programs like rtcwake
          to get RTC time mode.

          The file is usually located in /etc, but tools like hwclock(8) or
          rtcwake(8) can use alternative location by command line options
          if write access to /etc is unwanted. The default clock mode is
          "UTC" if the file is missing.

          The Hardware Clock is usually not very accurate. However, much of
          its inaccuracy is completely predictable - it gains or loses the
          same amount of time every day. This is called systematic drift.
          The util hwclock(8) keeps the file /etc/adjtime, that keeps some
          historical information. For more details see "The Adjust
          Function" and "The Adjtime File" sections from hwclock(8) man
          page.

          The format of the adjtime file is, in ASCII.

      First line
          Three numbers, separated by blanks:

          drift factor
              the systematic drift rate in seconds per day (floating point
              decimal)

          last adjust time
              the resulting number of seconds since 1969 UTC of most recent
              adjustment or calibration (decimal integer)

          adjustment status
              zero (for compatibility with clock(8)) as a floating point
              decimal

      Second line
          last calibration time
              The resulting number of seconds since 1969 UTC of most recent
              calibration. Zero if there has been no calibration yet or it
              is known that any previous calibration is moot (for example,
              because the Hardware Clock has been found, since that
              calibration, not to contain a valid time). This is a decimal
              integer.

      Third line
          clock mode
              Supported values are UTC or LOCAL. Tells whether the Hardware
              Clock is set to Coordinated Universal Time or local time. You
              can always override this value with options on the hwclock(8)
              command line.


---------------------------------------------------

::

          /etc/adjtime


---------------------------------------------------------

::

          hwclock(8), rtcwake(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          adjtime_config is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02              ADJTIME_CONFIG(5)

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
