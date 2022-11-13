.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cupsenable(8) — Linux manual page
=================================

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

   cupsenable(8)                  Apple Inc.                  cupsenable(8)

NAME
-------------------------------------------------

::

          cupsdisable, cupsenable - stop/start printers and classes


---------------------------------------------------------

::

          cupsdisable [ -E ] [ -U username ] [ -c ] [ -h server[:port] ] [
          -r reason ] [ --hold ] destination(s)
          cupsenable [ -E ] [ -U username ] [ -c ] [ -h server[:port] ] [
          --release ] destination(s)


---------------------------------------------------------------

::

          cupsenable starts the named printers or classes while cupsdisable
          stops the named printers or classes.


-------------------------------------------------------

::

          The following options may be used:

          -E   Forces encryption of the connection to the server.

          -U username
               Uses the specified username when connecting to the server.

          -c   Cancels all jobs on the named destination.

          -h server[:port]
               Uses the specified server and port.

          --hold
               Holds remaining jobs on the named printer.  Useful for
               allowing the current job to complete before performing
               maintenance.

          -r "reason"
               Sets the message associated with the stopped state.  If no
               reason is specified then the message is set to "Reason
               Unknown".

          --release
               Releases pending jobs for printing.  Use after running
               cupsdisable with the --hold option to resume printing.


-------------------------------------------------------------------

::

          Unlike the System V printing system, CUPS allows printer names to
          contain any printable character except SPACE, TAB, "/", or "#".
          Also, printer and class names are not case-sensitive.

          The System V versions of these commands are disable and enable,
          respectively.  They have been renamed to avoid conflicts with the
          bash(1) build-in commands of the same names.

          The CUPS versions of disable and enable may ask the user for an
          access password depending on the printing system configuration.
          This differs from the System V versions which require the root
          user to execute these commands.


---------------------------------------------------------

::

          cupsaccept(8), cupsreject(8), cancel(1), lp(1), lpadmin(8),
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

   26 April 2019                     CUPS                     cupsenable(8)

--------------

Pages that refer to this page:
`cupsaccept(8) <../man8/cupsaccept.8.html>`__, 
`lpadmin(8) <../man8/lpadmin.8.html>`__, 
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
