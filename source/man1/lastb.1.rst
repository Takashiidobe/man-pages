.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

Another version of this page is provided by the
`util-linux <last.1@@util-linux.html>`__ project

--------------

last(1) — Linux manual page
===========================

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

   LAST(1)                  General Commands Manual                 LAST(1)

NAME
-------------------------------------------------

::

          last - list logins on the system


---------------------------------------------------------

::

          last   [ -num | -n num | --lines num ]
                 [ -f filename | --file filename ]
                 [ people ...  ] [ ttys ...  ]
                 [ --complain ] [ --no-truncate-ftp-entries ]
                 [ -x | --more-records ] [ -a | --all-records ]
                 [ --tw-leniency num ] [ --tw-suspicious num ]
                 [ -i | --ip-address ] [ --debug ] [ -w | --wide ]
                 [ -s | --print-seconds ] [ -y | --print-year ]
                 [ -V | --version ] [ -h | --help ]


---------------------------------------------------------------

::

          last looks through the file wtmp (which records all
          logins/logouts) and prints information about connect times of
          users. Records are printed from most recent to least recent.
          Records can be specified by tty and username.  tty names can be
          abbreviated:
                                       last 0
          is equivalent to
                                     last tty0.

          Multiple arguments can be specified:
                                  last root console
          will print all of the entries for the user root and all entries
          logged in on the console tty.

          The special users reboot and shutdown log in when the system
          reboots or (surprise) shuts down.
                                     last reboot
          will produce a record of reboot times.

          If last is interrupted by a quit signal, it prints out how far
          its search in the wtmp file had reached and then quits.


-------------------------------------------------------

::

          -n num, --lines num
                 Limit the number of lines that last outputs.  This is
                 different from u*x last, which lets you specify the number
                 right after a dash.
          -f filename, --file filename
                 Read from the file filename instead of the system's wtmp
                 file.
          --complain
                 When the wtmp file has a problem (a time-warp, missing
                 record, or whatever), print out an appropriate error.
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
          --no-truncate-ftp-entries
                 When printing out the information, don't chop the number
                 part off of `ftp'XXXX entries.
          -x, --more-records
                 Print out run level changes, shutdowns, and time changes
                 in addition to the normal records.
          -a, --all-records
                 Print out all records in the wtmp file.
          -i, --ip-address
                 Some machines store the IP address of a connection in a
                 utmp record.  Enabling this option makes last print the IP
                 address instead of the hostname.
          -w, --wide
                 By default, last tries to print each entry within in 80
                 columns.  Use this option to instruct last to print out
                 the fields in the wtmp file with full field widths.
          --debug
                 Print verbose internal information.
          -s, --print-seconds
                 Print seconds when displaying dates.
          -y, --print-year
                 Print year when displaying dates.
          -V, --version
                 Print last's version number.
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
          <noel@gnu.ai.mit.edu>. The man page was added by Dirk
          Eddelbuettel <edd@qed.econ.queensu.ca>.


---------------------------------------------------------

::

          who(1), wtmp(5)

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

                                1997 August 19                      LAST(1)

--------------

Pages that refer to this page:
`lastcomm(1) <../man1/lastcomm.1.html>`__, 
`utmpdump(1) <../man1/utmpdump.1.html>`__, 
`utmp(5) <../man5/utmp.5.html>`__

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
