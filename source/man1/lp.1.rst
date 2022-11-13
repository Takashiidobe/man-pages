.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lp(1) — Linux manual page
=========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   lp(1)                          Apple Inc.                          lp(1)

NAME
-------------------------------------------------

::

          lp - print files


---------------------------------------------------------

::

          lp [ -E ] [ -U username ] [ -c ] [ -d destination[/instance] ] [
          -h hostname[:port] ] [ -m ] [ -n num-copies ] [ -o option[=value]
          ] [ -q priority ] [ -s ] [ -t title ] [ -H handling ] [ -P page-
          list ] [ -- ] [ file(s) ]
          lp [ -E ] [ -U username ] [ -c ] [ -h hostname[:port] ] [ -i job-
          id ] [ -n num-copies ] [ -o option[=value] ] [ -q priority ] [ -t
          title ] [ -H handling ] [ -P page-list ]


---------------------------------------------------------------

::

          lp submits files for printing or alters a pending job.  Use a
          filename of "-" to force printing from the standard input.

      THE DEFAULT DESTINATION
          CUPS provides many ways to set the default destination. The
          LPDEST and PRINTER environment variables are consulted first.  If
          neither are set, the current default set using the lpoptions(1)
          command is used, followed by the default set using the lpadmin(8)
          command.


-------------------------------------------------------

::

          The following options are recognized by lp:

          --   Marks the end of options; use this to print a file whose
               name begins with a dash (-).

          -E   Forces encryption when connecting to the server.

          -U username
               Specifies the username to use when connecting to the server.

          -c   This option is provided for backwards-compatibility only. On
               systems that support it, this option forces the print file
               to be copied to the spool directory before printing.  In
               CUPS, print files are always sent to the scheduler via IPP
               which has the same effect.

          -d destination
               Prints files to the named printer.

          -h hostname[:port]
               Chooses an alternate server.

          -i job-id
               Specifies an existing job to modify.

          -m   Sends an email when the job is completed.

          -n copies
               Sets the number of copies to print.

          -o "name=value [ ... name=value ]"
               Sets one or more job options.  See "COMMON JOB OPTIONS"
               below.

          -q priority
               Sets the job priority from 1 (lowest) to 100 (highest).  The
               default priority is 50.

          -s   Do not report the resulting job IDs (silent mode.)

          -t "name"
               Sets the job name.

          -H hh:mm

          -H hold

          -H immediate

          -H restart

          -H resume
               Specifies when the job should be printed.  A value of
               immediate will print the file immediately, a value of hold
               will hold the job indefinitely, and a UTC time value (HH:MM)
               will hold the job until the specified UTC (not local) time.
               Use a value of resume with the -i option to resume a held
               job.  Use a value of restart with the -i option to restart a
               completed job.

          -P page-list
               Specifies which pages to print in the document.  The list
               can contain a list of numbers and ranges (#-#) separated by
               commas, e.g., "1,3-5,16".  The page numbers refer to the
               output pages and not the document's original pages - options
               like "number-up" can affect the numbering of the pages.

      COMMON JOB OPTIONS
          Aside from the printer-specific options reported by the
          lpoptions(1) command, the following generic options are
          available:

          -o job-sheets=name
               Prints a cover page (banner) with the document.  The "name"
               can be "classified", "confidential", "secret", "standard",
               "topsecret", or "unclassified".

          -o media=size
               Sets the page size to size. Most printers support at least
               the size names "a4", "letter", and "legal".

          -o number-up={2|4|6|9|16}
               Prints 2, 4, 6, 9, or 16 document (input) pages on each
               output page.

          -o orientation-requested=4
               Prints the job in landscape (rotated 90 degrees counter-
               clockwise).

          -o orientation-requested=5
               Prints the job in landscape (rotated 90 degrees clockwise).

          -o orientation-requested=6
               Prints the job in reverse portrait (rotated 180 degrees).

          -o print-quality=3

          -o print-quality=4

          -o print-quality=5
               Specifies the output quality - draft (3), normal (4), or
               best (5).

          -o sides=one-sided
               Prints on one side of the paper.

          -o sides=two-sided-long-edge
               Prints on both sides of the paper for portrait output.

          -o sides=two-sided-short-edge
               Prints on both sides of the paper for landscape output.


-------------------------------------------------------------------

::

          Unlike the System V printing system, CUPS allows printer names to
          contain any printable character except SPACE, TAB, "/", or "#".
          Also, printer and class names are not case-sensitive.

          The -q option accepts a different range of values than the
          Solaris lp command, matching the IPP job priority values (1-100,
          100 is highest priority) instead of the Solaris values (0-39, 0
          is highest priority).


---------------------------------------------------------

::

          Print two copies of a document to the default printer:

              lp -n 2 filename

          Print a double-sided legal document to a printer called "foo":

              lp -d foo -o media=legal -o sides=two-sided-long-edge filename

          Print a presentation document 2-up to a printer called "bar":

              lp -d bar -o number-up=2 filename


---------------------------------------------------------

::

          cancel(1), lpadmin(8), lpoptions(1), lpq(1), lpr(1), lprm(1),
          lpstat(1), CUPS Online Help (http://localhost:631/help)


-----------------------------------------------------------

::

          Copyright © 2007-2019 by Apple Inc.

COLOPHON
---------------------------------------------------------

::

          This page is part of the CUPS (a standards-based, open source
          printing system) project.  Information about the project can be
          found at ⟨http://www.cups.org/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.cups.org/⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨https://github.com/apple/cups⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   26 April 2019                     CUPS                             lp(1)

--------------

Pages that refer to this page: `cancel(1) <../man1/cancel.1.html>`__, 
`cups(1) <../man1/cups.1.html>`__, 
`lpoptions(1) <../man1/lpoptions.1.html>`__, 
`lpq(1) <../man1/lpq.1.html>`__,  `lpr(1) <../man1/lpr.1.html>`__, 
`lprm(1) <../man1/lprm.1.html>`__, 
`lpstat(1) <../man1/lpstat.1.html>`__, 
`backend(7) <../man7/backend.7.html>`__, 
`cupsaccept(8) <../man8/cupsaccept.8.html>`__, 
`cupsenable(8) <../man8/cupsenable.8.html>`__, 
`lpadmin(8) <../man8/lpadmin.8.html>`__, 
`lpc(8) <../man8/lpc.8.html>`__,  `lpmove(8) <../man8/lpmove.8.html>`__

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
