.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cups-snmp(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cups-snmp(8)                   Apple Inc.                   cups-snmp(8)

NAME
-------------------------------------------------

::

          snmp - cups snmp backend (deprecated)


---------------------------------------------------------

::

          /usr/lib/cups/backend/snmp ip-address-or-hostname
          /usr/libexec/cups/backend/snmp ip-address-or-hostname
          lpinfo -v --include-schemes snmp


---------------------------------------------------------------

::

          The DEPRECATED CUPS SNMP backend provides legacy discovery and
          identification of network printers using SNMPv1.  When used for
          discovery through the scheduler, the backend will list all
          printers that respond to a broadcast SNMPv1 query with the
          "public" community name.  Additional queries are then sent to
          printers that respond in order to determine the correct device
          URI, make and model, and other information needed for printing.

          In the first form, the SNMP backend is run directly by the user
          to look up the device URI and other information when you have an
          IP address or hostname.  This can be used for programs that need
          to configure print queues where the user has supplied an address
          but nothing else.

          In the second form, the SNMP backend is run indirectly using the
          lpinfo(8) command.  The output provides all printers detected via
          SNMP on the configured broadcast addresses.  Note: no broadcast
          addresses are configured by default.


---------------------------------------------------------------

::

          The DebugLevel value can be overridden using the CUPS_DEBUG_LEVEL
          environment variable.  The MaxRunTime value can be overridden
          using the CUPS_MAX_RUN_TIME environment variable.


---------------------------------------------------

::

          The SNMP backend reads the /etc/cups/snmp.conf configuration
          file, if present, to set the default broadcast address, community
          name, and logging level.


---------------------------------------------------

::

          The CUPS SNMP backend is deprecated and will no longer be
          supported in a future version of CUPS.


-------------------------------------------------------------------

::

          The CUPS SNMP backend uses the information from the Host,
          Printer, and Port Monitor MIBs along with some vendor private
          MIBs and intelligent port probes to determine the correct device
          URI and make and model for each printer.


---------------------------------------------------------

::

          backend(7), cups-snmp.conf(5), cupsd(8), lpinfo(8), CUPS Online
          Help (http://localhost:631/help)


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

   26 April 2019                     CUPS                      cups-snmp(8)

--------------

Pages that refer to this page:
`cups-snmp.conf(5) <../man5/cups-snmp.conf.5.html>`__, 
`backend(7) <../man7/backend.7.html>`__

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
