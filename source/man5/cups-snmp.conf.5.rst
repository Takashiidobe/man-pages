.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cups-snmp.conf(5) — Linux manual page
=====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DIRECTIVES <#DIRECTIVES>`__ \|   |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   snmp.conf(5)                   Apple Inc.                   snmp.conf(5)

NAME
-------------------------------------------------

::

          snmp.conf - snmp configuration file for cups (deprecated)


---------------------------------------------------------------

::

          The snmp.conf file configures how the standard CUPS network
          backends (http, https, ipp, ipps, lpd, snmp, and socket) access
          printer information using SNMPv1 and is normally located in the
          /etc/cups directory.  Each line in the file can be a
          configuration directive, a blank line, or a comment. Comment
          lines start with the # character.

          The Community and DebugLevel directives are used by all backends.
          The remainder apply only to the SNMP backend - cups-snmp(8).


-------------------------------------------------------------

::

          The following directives are understood by the CUPS network
          backends:

          Address @IF(name)

          Address @LOCAL

          Address address
               Sends SNMP broadcast queries (for discovery) to the
               specified address(es).  There is no default for the
               broadcast address.

          Community name
               Specifies the community name to use.  Only a single
               community name may be specified.  The default community name
               is "public".  If no name is specified, all SNMP functions
               are disabled.

          DebugLevel number
               Specifies the logging level from 0 (none) to 3 (everything).
               Typically only used for debugging (thus the name).  The
               default debug level is 0.

          DeviceURI "regular expression" device-uri [... device-uri]
               Specifies one or more device URIs that should be used for a
               given make and model string.  The regular expression is used
               to match the detected make and model, and the device URI
               strings must be of the form "scheme://%s[:port]/[path]",
               where "%s" represents the detected address or hostname.
               There are no default device URI matching rules.

          HostNameLookups on

          HostNameLookups off
               Specifies whether the addresses of printers should be
               converted to hostnames or left as numeric IP addresses.  The
               default is "off".

          MaxRunTime seconds
               Specifies the maximum number of seconds that the SNMP
               backend will scan the network for printers.  The default is
               120 seconds (2 minutes).


---------------------------------------------------

::

          CUPS backends are deprecated and will no longer be supported in a
          future feature release of CUPS.  Printers that do not support IPP
          can be supported using applications such as ippeveprinter(1).


---------------------------------------------------------

::

          cups-snmp(8), CUPS Online Help (http://localhost:631/help)


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

   26 April 2019                     CUPS                      snmp.conf(5)

--------------

Pages that refer to this page:
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
