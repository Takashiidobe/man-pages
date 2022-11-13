.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lpr(1) — Linux manual page
==========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   lpr(1)                         Apple Inc.                         lpr(1)

NAME
-------------------------------------------------

::

          lpr - print files


---------------------------------------------------------

::

          lpr [ -E ] [ -H server[:port] ] [ -U username ] [ -P
          destination[/instance] ] [ -# num-copies [ -h ] [ -l ] [ -m ] [
          -o option[=value] ] [ -p ] [ -q ] [ -r ] [ -C title ] [ -J title
          ] [ -T title ] [ file(s) ]


---------------------------------------------------------------

::

          lpr submits files for printing.  Files named on the command line
          are sent to the named printer or the default destination if no
          destination is specified.  If no files are listed on the command-
          line, lpr reads the print file from the standard input.

      THE DEFAULT DESTINATION
          CUPS provides many ways to set the default destination. The
          LPDEST and PRINTER environment variables are consulted first.  If
          neither are set, the current default set using the lpoptions(1)
          command is used, followed by the default set using the lpadmin(8)
          command.


-------------------------------------------------------

::

          The following options are recognized by lpr:

          -E   Forces encryption when connecting to the server.

          -H server[:port]
               Specifies an alternate server.

          -C "name"

          -J "name"

          -T "name"
               Sets the job name/title.

          -P destination[/instance]
               Prints files to the named printer.

          -U username
               Specifies an alternate username.

          -# copies
               Sets the number of copies to print.

          -h   Disables banner printing. This option is equivalent to -o
               job-sheets=none.

          -l   Specifies that the print file is already formatted for the
               destination and should be sent without filtering.  This
               option is equivalent to -o raw.

          -m   Send an email on job completion.

          -o option[=value]
               Sets a job option.  See "COMMON JOB OPTIONS" below.

          -p   Specifies that the print file should be formatted with a
               shaded header with the date, time, job name, and page
               number.  This option is equivalent to -o prettyprint and is
               only useful when printing text files.

          -q   Hold job for printing.

          -r   Specifies that the named print files should be deleted after
               submitting them.

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


---------------------------------------------------

::

          The -c, -d, -f, -g, -i, -n, -t, -v, and -w options are not
          supported by CUPS and produce a warning message if used.


---------------------------------------------------------

::

          Print two copies of a document to the default printer:

              lpr -# 2 filename

          Print a double-sided legal document to a printer called "foo":

              lpr -P foo -o media=legal -o sides=two-sided-long-edge filename

          Print a presentation document 2-up to a printer called "foo":

              lpr -P foo -o number-up=2 filename


---------------------------------------------------------

::

          cancel(1), lp(1), lpadmin(8), lpoptions(1), lpq(1), lprm(1),
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

   26 April 2019                     CUPS                            lpr(1)

--------------

Pages that refer to this page: `cups(1) <../man1/cups.1.html>`__, 
`groff(1) <../man1/groff.1.html>`__,  `lp(1) <../man1/lp.1.html>`__, 
`lpoptions(1) <../man1/lpoptions.1.html>`__, 
`lpq(1) <../man1/lpq.1.html>`__,  `lprm(1) <../man1/lprm.1.html>`__, 
`lpstat(1) <../man1/lpstat.1.html>`__, 
`backend(7) <../man7/backend.7.html>`__, 
`environ(7) <../man7/environ.7.html>`__, 
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
