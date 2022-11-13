.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cal(1) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `PARAMETERS <#PARAMETERS>`__ \|   |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLORS <#COLORS>`__ \|           |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CAL(1)                        User Commands                       CAL(1)

NAME
-------------------------------------------------

::

          cal - display a calendar


---------------------------------------------------------

::

          cal [options] [[[day] month] year]

          cal [options] [timestamp|monthname]


---------------------------------------------------------------

::

          cal displays a simple calendar. If no arguments are specified,
          the current month is displayed.

          The month may be specified as a number (1-12), as a month name or
          as an abbreviated month name according to the current locales.

          Two different calendar systems are used, Gregorian and Julian.
          These are nearly identical systems with Gregorian making a small
          adjustment to the frequency of leap years; this facilitates
          improved synchronization with solar events like the equinoxes.
          The Gregorian calendar reform was introduced in 1582, but its
          adoption continued up to 1923. By default cal uses the adoption
          date of 3 Sept 1752. From that date forward the Gregorian
          calendar is displayed; previous dates use the Julian calendar
          system. 11 days were removed at the time of adoption to bring the
          calendar in sync with solar events. So Sept 1752 has a mix of
          Julian and Gregorian dates by which the 2nd is followed by the
          14th (the 3rd through the 13th are absent).

          Optionally, either the proleptic Gregorian calendar or the Julian
          calendar may be used exclusively. See --reform below.


-------------------------------------------------------

::

          -1, --one
              Display single month output. (This is the default.)

          -3, --three
              Display three months spanning the date.

          -n , --months number
              Display number of months, starting from the month containing
              the date.

          -S, --span
              Display months spanning the date.

          -s, --sunday
              Display Sunday as the first day of the week.

          -m, --monday
              Display Monday as the first day of the week.

          -v, --vertical
              Display using a vertical layout (aka ncal(1) mode).

          --iso
              Display the proleptic Gregorian calendar exclusively. This
              option does not affect week numbers and the first day of the
              week. See --reform below.

          -j, --julian
              Use day-of-year numbering for all calendars. These are also
              called ordinal days. Ordinal days range from 1 to 366. This
              option does not switch from the Gregorian to the Julian
              calendar system, that is controlled by the --reform option.

              Sometimes Gregorian calendars using ordinal dates are
              referred to as Julian calendars. This can be confusing due to
              the many date related conventions that use Julian in their
              name: (ordinal) julian date, julian (calendar) date,
              (astronomical) julian date, (modified) julian date, and more.
              This option is named julian, because ordinal days are
              identified as julian by the POSIX standard. However, be aware
              that cal also uses the Julian calendar system. See
              DESCRIPTION above.

          --reform val
              This option sets the adoption date of the Gregorian calendar
              reform. Calendar dates previous to reform use the Julian
              calendar system. Calendar dates after reform use the
              Gregorian calendar system. The argument val can be:

              •   1752 - sets 3 September 1752 as the reform date
                  (default). This is when the Gregorian calendar reform was
                  adopted by the British Empire.

              •   gregorian - display Gregorian calendars exclusively. This
                  special placeholder sets the reform date below the
                  smallest year that cal can use; meaning all calendar
                  output uses the Gregorian calendar system. This is called
                  the proleptic Gregorian calendar, because dates prior to
                  the calendar system’s creation use extrapolated values.

              •   iso - alias of gregorian. The ISO 8601 standard for the
                  representation of dates and times in information
                  interchange requires using the proleptic Gregorian
                  calendar.

              •   julian - display Julian calendars exclusively. This
                  special placeholder sets the reform date above the
                  largest year that cal can use; meaning all calendar
                  output uses the Julian calendar system.

          See DESCRIPTION above.

          -y, --year
              Display a calendar for the whole year.

          -Y, --twelve
              Display a calendar for the next twelve months.

          -w, --week[=number]
              Display week numbers in the calendar (US or ISO-8601). See
              NOTES section for more details.

          --color[=when]
              Colorize the output. The optional argument when can be auto,
              never or always. If the when argument is omitted, it defaults
              to auto. The colors can be disabled; for the current built-in
              default see the --help output. See also the COLORS section.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


-------------------------------------------------------------

::

          Single digits-only parameter (e.g., 'cal 2020')
              Specifies the year to be displayed; note the year must be
              fully specified: cal 89 will not display a calendar for 1989.

          Single string parameter (e.g., 'cal tomorrow' or 'cal August')
              Specifies timestamp or a month name (or abbreviated name)
              according to the current locales.

              The special placeholders are accepted when parsing timestamp,
              "now" may be used to refer to the current time, "today",
              "yesterday", "tomorrow" refer to of the current day, the day
              before or the next day, respectively.

              The relative date specifications are also accepted, in this
              case "+" is evaluated to the current time plus the specified
              time span. Correspondingly, a time span that is prefixed with
              "-" is evaluated to the current time minus the specified time
              span, for example '+2days'. Instead of prefixing the time
              span with "+" or "-", it may also be suffixed with a space
              and the word "left" or "ago" (for example '1 week ago').

          Two parameters (e.g., 'cal 11 2020')
              Denote the month (1 - 12) and year.

          Three parameters (e.g., 'cal 25 11 2020')
              Denote the day (1-31), month and year, and the day will be
              highlighted if the calendar is displayed on a terminal. If no
              parameters are specified, the current month’s calendar is
              displayed.


---------------------------------------------------

::

          A year starts on January 1. The first day of the week is
          determined by the locale or the --sunday and --monday options.

          The week numbering depends on the choice of the first day of the
          week. If it is Sunday then the customary North American numbering
          is used, where 1 January is in week number 1. If it is Monday
          (-m) then the ISO 8601 standard week numbering is used, where the
          first Thursday is in week number 1.


-----------------------------------------------------

::

          Implicit coloring can be disabled as follows:

             touch /etc/terminal-colors.d/cal.disable

          See terminal-colors.d(5) for more details about colorization
          configuration.


-------------------------------------------------------

::

          A cal command appeared in Version 6 AT&T UNIX.


-------------------------------------------------

::

          The default cal output uses 3 September 1752 as the Gregorian
          calendar reform date. The historical reform dates for the other
          locales, including its introduction in October 1582, are not
          implemented.

          Alternative calendars, such as the Umm al-Qura, the Solar Hijri,
          the Ge’ez, or the lunisolar Hindu, are not supported.


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The cal command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                         CAL(1)

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
