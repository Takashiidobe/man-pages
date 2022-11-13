.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ac(1) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   AC(1)                    General Commands Manual                   AC(1)

NAME
-------------------------------------------------

::

          ac -  print statistics about users' connect time


---------------------------------------------------------

::

          ac     [ -d | --daily-totals ] [ -y | --print-year ]
                 [ -p | --individual-totals ] [ people ]
                 [ -f | --file filename ] [ -a | --all-days ]
                 [ --complain ] [ --reboots ] [ --supplants ]
                 [ --timewarps ] [ --compatibility ]
                 [ --tw-leniency num ] [ --tw-suspicious num ]
                 [ -z | --print-zeros ] [ --debug ]
                 [ -V | --version ] [ -h | --help ]


---------------------------------------------------------------

::

          ac prints out a report of connect time (in hours) based on the
          logins/logouts in the current wtmp file.  A total is also printed
          out.

          The accounting file wtmp is maintained by init(8) and login(1).
          Neither ac nor login creates the wtmp if it doesn't exist, no
          accounting is done.  To begin accounting, create the file with a
          length of zero.

          NOTE:  The wtmp file can get really big, really fast.  You might
          want to trim it every once and a while.

          GNU ac works nearly the same UNIX ac, though it's a little
          smarter in several ways.  You should therefore expect differences
          in the output of GNU ac and the output of ac's on other systems.
          Use the command info accounting to get additional information.


-------------------------------------------------------

::

          -d, --daily-totals
                 Print totals for each day rather than just one big total
                 at the end.  The output looks like this:
                         Jul  3  total     1.17
                         Jul  4  total     2.10
                         Jul  5  total     8.23
                         Jul  6  total     2.10
                         Jul  7  total     0.30
          -p, --individual-totals
                 Print time totals for each user in addition to the usual
                 everything-lumped-into-one value.  It looks like:
                         bob       8.06
                         goff      0.60
                         maley     7.37
                         root      0.12
                         total    16.15
          people Print out the sum total of the connect time used by all of
                 the users included in people.  Note that people is a space
                 separated list of valid user names; wildcards are not
                 allowed.
          -f, --file filename
                 Read from the file filename instead of the system's wtmp
                 file.
          --complain
                 When the wtmp file has a problem (a time-warp, missing
                 record, or whatever), print out an appropriate error.
          --reboots
                 Reboot records are NOT written at the time of a reboot,
                 but when the system restarts; therefore, it is impossible
                 to know exactly when the reboot occurred.  Users may have
                 been logged into the system at the time of the reboot, and
                 many ac's automatically count the time between the login
                 and the reboot record against the user (even though all of
                 that time shouldn't be, perhaps, if the system is down for
                 a long time, for instance).  If you want to count this
                 time, include the flag.  *For vanilla ac compatibility,
                 include this flag.*
          --supplants
                 Sometimes, a logout record is not written for a specific
                 terminal, so the time that the last user accrued cannot be
                 calculated.  If you want to include the time from the
                 user's login to the next login on the terminal (though
                 probably incorrect), include this you want to include the
                 time from the user's login to the next login on the
                 terminal (though probably incorrect), include this flag.
                 *For vanilla ac compatibility, include this flag.*
          --timewarps
                 Sometimes, entries in a wtmp file will suddenly jump back
                 into the past without a clock change record occurring.  It
                 is impossible to know how long a user was logged in when
                 this occurs.  If you want to count the time between the
                 login and the time warp against the user, include this
                 flag.  *For vanilla ac compatibility, include this flag.*
          --compatibility
                 This is shorthand for typing out the three above options.
          -a, --all-days
                 If we're printing daily totals, print a record for every
                 day instead of skipping intervening days where there is no
                 login activity.  Without this flag, time accrued during
                 those intervening days gets listed under the next day
                 where there is login activity.
          --tw-leniency num
                 Set the time warp leniency to num seconds.  Records in
                 wtmp files might be slightly out of order (most notably
                 when two logins occur within a one-second period - the
                 second one gets written first).  By default, this value is
                 set to 60.  If the program notices this problem, time is
                 not assigned to users unless the --timewarps flag is used.
          --tw-suspicious num
                 Set the time warp suspicious value to num seconds.  If two
                 records in the wtmp file are farther than this number of
                 seconds apart, there is a problem with the wtmp file (or
                 your machine hasn't been used in a year).  If the program
                 notices this problem, time is not assigned to users unless
                 the --timewarps flag is used.
          -y, --print-year
                 Print year when displaying dates.
          -z, --print-zeros
                 If a total for any category (save the grand total) is
                 zero, print it.  The default is to suppress printing.
          --debug
                 Print verbose internal information.
          -V, --version
                 Print the version number of ac to standard output and
                 quit.
          -h, --help
                 Prints the usage string and default locations of system
                 files to standard output and exits.


---------------------------------------------------

::

          wtmp
                 The system wide login record file. See wtmp(5) for further
                 details.


-----------------------------------------------------

::

          The GNU accounting utilities were written by Noel Cragg
          <noel@gnu.ai.mit.edu>. The man page was adapted from the
          accounting texinfo page by Susan Kleinmann <sgk@sgk.tiac.net>.


---------------------------------------------------------

::

          login(1), wtmp(5), init(8), sa(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the psacct (process accounting utilities)
          project.  Information about the project can be found at 
          ⟨http://www.gnu.org/software/acct/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.gnu.org/software/acct/⟩.  This
          page was obtained from the tarball acct-6.6.4.tar.gz fetched from
          ⟨http://ftp.gnu.org/gnu/acct/⟩ on 2021-08-27.  If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

                                2010 August 16                        AC(1)

--------------

Pages that refer to this page: `utmp(5) <../man5/utmp.5.html>`__, 
`accton(8) <../man8/accton.8.html>`__,  `sa(8) <../man8/sa.8.html>`__

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
