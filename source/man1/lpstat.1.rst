.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lpstat(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   lpstat(1)                      Apple Inc.                      lpstat(1)

NAME
-------------------------------------------------

::

          lpstat - print cups status information


---------------------------------------------------------

::

          lpstat [ -E ] [ -H ] [ -U username ] [ -h hostname[:port] ] [ -l
          ] [ -W which-jobs ] [ -a [ destination(s) ] ] [ -c [ class(es) ]
          ] [ -d ] [ -e ] [ -o [ destination(s) ] ] [ -p [ printer(s) ] ] [
          -r ] [ -R ] [ -s ] [ -t ] [ -u [ user(s) ] ] [ -v [ printer(s) ]
          ]


---------------------------------------------------------------

::

          lpstat displays status information about the current classes,
          jobs, and printers.  When run with no arguments, lpstat will list
          active jobs queued by the current user.


-------------------------------------------------------

::

          The lpstat command supports the following options:

          -E   Forces encryption when connecting to the server.

          -H   Shows the server hostname and port.

          -R   Shows the ranking of print jobs.

          -U username
               Specifies an alternate username.

          -W which-jobs
               Specifies which jobs to show, "completed" or "not-completed"
               (the default).  This option must appear before the -o option
               and/or any printer names, otherwise the default ("not-
               completed") value will be used in the request to the
               scheduler.

          -a [printer(s)]
               Shows the accepting state of printer queues.  If no printers
               are specified then all printers are listed.

          -c [class(es)]
               Shows the printer classes and the printers that belong to
               them.  If no classes are specified then all classes are
               listed.

          -d   Shows the current default destination.

          -e   Shows all available destinations on the local network.

          -h server[:port]
               Specifies an alternate server.

          -l   Shows a long listing of printers, classes, or jobs.

          -o [destination(s)]
               Shows the jobs queued on the specified destinations.  If no
               destinations are specified all jobs are shown.

          -p [printer(s)]
               Shows the printers and whether they are enabled for
               printing.  If no printers are specified then all printers
               are listed.

          -r   Shows whether the CUPS server is running.

          -s   Shows a status summary, including the default destination, a
               list of classes and their member printers, and a list of
               printers and their associated devices.  This is equivalent
               to using the -d, -c, and -v options.

          -t   Shows all status information.  This is equivalent to using
               the -r, -d, -c, -v, -a, -p, and -o options.

          -u [user(s)]
               Shows a list of print jobs queued by the specified users.
               If no users are specified, lists the jobs queued by the
               current user.

          -v [printer(s)]
               Shows the printers and what device they are attached to.  If
               no printers are specified then all printers are listed.


-------------------------------------------------------------------

::

          Unlike the System V printing system, CUPS allows printer names to
          contain any printable character except SPACE, TAB, "/", and "#".
          Also, printer and class names are not case-sensitive.

          The -h, -e, -E, -U, and -W options are unique to CUPS.

          The Solaris -f, -P, and -S options are silently ignored.


---------------------------------------------------------

::

          cancel(1), lp(1), lpq(1), lpr(1), lprm(1), CUPS Online Help
          (http://localhost:631/help)


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

   26 April 2019                     CUPS                         lpstat(1)

--------------

Pages that refer to this page: `cancel(1) <../man1/cancel.1.html>`__, 
`cups(1) <../man1/cups.1.html>`__,  `lp(1) <../man1/lp.1.html>`__, 
`lpq(1) <../man1/lpq.1.html>`__,  `lpr(1) <../man1/lpr.1.html>`__, 
`lprm(1) <../man1/lprm.1.html>`__, 
`cupsaccept(8) <../man8/cupsaccept.8.html>`__, 
`cupsenable(8) <../man8/cupsenable.8.html>`__, 
`lpc(8) <../man8/lpc.8.html>`__

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
