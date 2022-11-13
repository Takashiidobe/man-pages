.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lpinfo(8) — Linux manual page
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

   lpinfo(8)                      Apple Inc.                      lpinfo(8)

NAME
-------------------------------------------------

::

          lpinfo - show available devices or drivers (deprecated)


---------------------------------------------------------

::

          lpinfo [ -E ] [ -h server[:port] ] [ -l ] [ --device-id device-
          id-string ] [ --exclude-schemes scheme-list ] [ --include-schemes
          scheme-list ] [ --language locale ] [ --make-and-model name ] [
          --product name ] -m
          lpinfo [ -E ] [ -h server[:port] ] [ -l ] [ --exclude-schemes
          scheme-list ] [ --include-schemes scheme-list ] [ --timeout
          seconds ] -v


---------------------------------------------------------------

::

          lpinfo lists the available devices or drivers known to the CUPS
          server.  The first form (-m) lists the available drivers, while
          the second form (-v) lists the available devices.


-------------------------------------------------------

::

          lpinfo accepts the following options:

          -E   Forces encryption when connecting to the server.

          -h server[:port]
               Selects an alternate server.

          -l   Shows a "long" listing of devices or drivers.

          --device-id device-id-string
               Specifies the IEEE-1284 device ID to match when listing
               drivers with the -m option.

          --exclude-schemes scheme-list
               Specifies a comma-delimited list of device or PPD schemes
               that should be excluded from the results.  Static PPD files
               use the "file" scheme.

          --include-schemes scheme-list
               Specifies a comma-delimited list of device or PPD schemes
               that should be included in the results.  Static PPD files
               use the "file" scheme.

          --language locale
               Specifies the language to match when listing drivers with
               the -m option.

          --make-and-model name
               Specifies the make and model to match when listing drivers
               with the -m option.

          --product name
               Specifies the product to match when listing drivers with the
               -m option.

          --timeout seconds
               Specifies the timeout when listing devices with the -v
               option.


-------------------------------------------------------------------

::

          The lpinfo command is unique to CUPS.


---------------------------------------------------------

::

          List all devices:

              lpinfo -v

          List all drivers:

              lpinfo -m

          List drivers matching "HP LaserJet":

              lpinfo --make-and-model "HP LaserJet" -m


---------------------------------------------------

::

          CUPS printer drivers and backends are deprecated and will no
          longer be supported in a future feature release of CUPS.
          Printers that do not support IPP can be supported using
          applications such as ippeveprinter(1).


---------------------------------------------------------

::

          lpadmin(8), CUPS Online Help (http://localhost:631/help)


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

   26 April 2019                     CUPS                         lpinfo(8)

--------------

Pages that refer to this page: `cups(1) <../man1/cups.1.html>`__, 
`backend(7) <../man7/backend.7.html>`__, 
`cups-snmp(8) <../man8/cups-snmp.8.html>`__, 
`lpadmin(8) <../man8/lpadmin.8.html>`__

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
