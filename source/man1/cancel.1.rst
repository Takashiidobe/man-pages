.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cancel(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cancel(1)                      Apple Inc.                      cancel(1)

NAME
-------------------------------------------------

::

          cancel - cancel jobs


---------------------------------------------------------

::

          cancel [ -E ] [ -U username ] [ -a ] [ -h hostname[:port] ] [ -u
          username ] [ -x ] [ id ] [ destination ] [ destination-id ]


---------------------------------------------------------------

::

          The cancel command cancels print jobs.  If no destination or id
          is specified, the currently printing job on the default
          destination is canceled.


-------------------------------------------------------

::

          The following options are recognized by cancel:

          -a   Cancel all jobs on the named destination, or all jobs on all
               destinations if none is provided.

          -E   Forces encryption when connecting to the server.

          -h hostname[:port]
               Specifies an alternate server.

          -U username
               Specifies the username to use when connecting to the server.

          -u username
               Cancels jobs owned by username.

          -x   Deletes job data files in addition to canceling.


-------------------------------------------------------------------

::

          Unlike the System V printing system, CUPS allows printer names to
          contain any printable character except SPACE, TAB, "/", or "#".
          Also, printer and class names are not case-sensitive.


---------------------------------------------------------

::

          Cancel the current print job:

              cancel

          Cancel job "myprinter-42":

              cancel myprinter-42

          Cancel all jobs:

              cancel -a


---------------------------------------------------

::

          Administrators wishing to prevent unauthorized cancellation of
          jobs via the -u option should require authentication for Cancel-
          Jobs operations in cupsd.conf(5).


---------------------------------------------------------

::

          cupsd.conf(5), lp(1), lpmove(8), lpstat(1), CUPS Online Help
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

   26 April 2019                     CUPS                         cancel(1)

--------------

Pages that refer to this page: `cups(1) <../man1/cups.1.html>`__, 
`lp(1) <../man1/lp.1.html>`__, 
`lpoptions(1) <../man1/lpoptions.1.html>`__, 
`lpq(1) <../man1/lpq.1.html>`__,  `lpr(1) <../man1/lpr.1.html>`__, 
`lprm(1) <../man1/lprm.1.html>`__, 
`lpstat(1) <../man1/lpstat.1.html>`__, 
`cupsaccept(8) <../man8/cupsaccept.8.html>`__, 
`cupsenable(8) <../man8/cupsenable.8.html>`__, 
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
