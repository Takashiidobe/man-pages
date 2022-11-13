.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cupsd(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
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

   cupsd(8)                       Apple Inc.                       cupsd(8)

NAME
-------------------------------------------------

::

          cupsd - cups scheduler


---------------------------------------------------------

::

          cupsd [ -c cupsd.conf ] [ -f ] [ -F ] [ -h ] [ -l ] [ -s cups-
          files.conf ] [ -t ]


---------------------------------------------------------------

::

          cupsd is the scheduler for CUPS. It implements a printing system
          based upon the Internet Printing Protocol, version 2.1, and
          supports most of the requirements for IPP Everywhere. If no
          options are specified on the command-line then the default
          configuration file /etc/cups/cupsd.conf will be used.


-------------------------------------------------------

::

          -c cupsd.conf
               Uses the named cupsd.conf configuration file.

          -f   Run cupsd in the foreground; the default is to run in the
               background as a "daemon".

          -F   Run cupsd in the foreground but detach the process from the
               controlling terminal and current directory. This is useful
               for running cupsd from init(8).

          -h   Shows the program usage.

          -l   This option is passed to cupsd when it is run from
               launchd(8) or systemd(8).

          -s cups-files.conf
               Uses the named cups-files.conf configuration file.

          -t   Test the configuration file for syntax errors.


---------------------------------------------------

::

          /etc/cups/classes.conf
          /etc/cups/cups-files.conf
          /etc/cups/cupsd.conf
          /usr/share/cups/mime/mime.convs
          /usr/share/cups/mime/mime.types
          /etc/cups/printers.conf
          /etc/cups/subscriptions.conf


-------------------------------------------------------------------

::

          cupsd implements all of the required IPP/2.1 attributes and
          operations. It also implements several CUPS-specific
          administrative operations.


---------------------------------------------------------

::

          Run cupsd in the background with the default configuration file:

              cupsd

          Test a configuration file called test.conf:

              cupsd -t -c test.conf

          Run cupsd in the foreground with a test configuration file called
          test.conf:

              cupsd -f -c test.conf


---------------------------------------------------------

::

          backend(7), classes.conf(5), cups(1), cups-files.conf(5),
          cups-lpd(8), cupsd.conf(5), cupsd-helper(8), cupsd-logs(8),
          filter(7), launchd(8), mime.convs(5), mime.types(5),
          printers.conf(5), systemd(8), CUPS Online Help
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

   26 April 2019                     CUPS                          cupsd(8)

--------------

Pages that refer to this page: `cups(1) <../man1/cups.1.html>`__, 
`classes.conf(5) <../man5/classes.conf.5.html>`__, 
`cupsd.conf(5) <../man5/cupsd.conf.5.html>`__, 
`cupsd-logs(5) <../man5/cupsd-logs.5.html>`__, 
`cups-files.conf(5) <../man5/cups-files.conf.5.html>`__, 
`mailto.conf(5) <../man5/mailto.conf.5.html>`__, 
`mime.convs(5) <../man5/mime.convs.5.html>`__, 
`mime.types(5) <../man5/mime.types.5.html>`__, 
`printers.conf(5) <../man5/printers.conf.5.html>`__, 
`subscriptions.conf(5) <../man5/subscriptions.conf.5.html>`__, 
`backend(7) <../man7/backend.7.html>`__, 
`filter(7) <../man7/filter.7.html>`__, 
`notifier(7) <../man7/notifier.7.html>`__, 
`cupsctl(8) <../man8/cupsctl.8.html>`__, 
`cupsd-helper(8) <../man8/cupsd-helper.8.html>`__, 
`cups-lpd(8) <../man8/cups-lpd.8.html>`__, 
`cups-snmp(8) <../man8/cups-snmp.8.html>`__

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
