.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cups-lpd(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   cups-lpd(8)                    Apple Inc.                    cups-lpd(8)

NAME
-------------------------------------------------

::

          cups-lpd - receive print jobs and report printer status to lpd
          clients (deprecated)


---------------------------------------------------------

::

          cups-lpd [ -h hostname[:port] ] [ -n ] [ -o option=value ]


---------------------------------------------------------------

::

          cups-lpd is the CUPS Line Printer Daemon ("LPD") mini-server that
          supports legacy client systems that use the LPD protocol.  cups-
          lpd does not act as a standalone network daemon but instead
          operates using any of the Internet "super-servers" such as
          inetd(8), launchd(8), and systemd(8).


-------------------------------------------------------

::

          -h hostname[:port]
               Sets the CUPS server (and port) to use.

          -n   Disables reverse address lookups; normally cups-lpd will try
               to discover the hostname of the client via a reverse DNS
               lookup.

          -o name=value
               Inserts options for all print queues. Most often this is
               used to disable the "l" filter so that remote print jobs are
               filtered as needed for printing; the inetd(8) example below
               sets the "document-format" option to "application/octet-
               stream" which forces autodetection of the print file format.


-------------------------------------------------------------------

::

          cups-lpd does not enforce the restricted source port number
          specified in RFC 1179, as using restricted ports does not prevent
          users from submitting print jobs.  While this behavior is
          different than standard Berkeley LPD implementations, it should
          not affect normal client operations.

          The output of the status requests follows RFC 2569, Mapping
          between LPD and IPP Protocols. Since many LPD implementations
          stray from this definition, remote status reporting to LPD
          clients may be unreliable.


-----------------------------------------------------

::

          Errors are sent to the system log.


---------------------------------------------------

::

          /etc/inetd.conf
          /etc/xinetd.d/cups-lpd
          /System/Library/LaunchDaemons/org.cups.cups-lpd.plist


---------------------------------------------------

::

          The cups-lpd program is deprecated and will no longer be
          supported in a future feature release of CUPS.

      PERFORMANCE
          cups-lpd performs well with small numbers of clients and
          printers.  However, since a new process is created for each
          connection and since each process must query the printing system
          before each job submission, it does not scale to larger
          configurations.  We highly recommend that large configurations
          use the native IPP support provided by CUPS instead.

      SECURITY
          cups-lpd currently does not perform any access control based on
          the settings in cupsd.conf(5) or in the hosts.allow(5) or
          hosts.deny(5) files used by TCP wrappers.  Therefore, running
          cups-lpd on your server will allow any computer on your network
          (and perhaps the entire Internet) to print to your server.

          While xinetd(8) has built-in access control support, you should
          use the TCP wrappers package with inetd(8) to limit access to
          only those computers that should be able to print through your
          server.

          cups-lpd is not enabled by the standard CUPS distribution.
          Please consult with your operating system vendor to determine
          whether it is enabled by default on your system.


-------------------------------------------------------

::

          If you are using inetd(8), add the following line to the
          inetd.conf file to enable the cups-lpd mini-server:

              printer stream tcp nowait lp /usr/lib/cups/daemon/cups-lpd cups-lpd \
                  -o document-format=application/octet-stream

          Note: If you are using Solaris 10 or higher, you must run the
          inetdconv(1m) program to register the changes to the inetd.conf
          file.

          CUPS includes configuration files for launchd(8), systemd(8), and
          xinetd(8).  Simply enable the cups-lpd service using the
          corresponding control program.


---------------------------------------------------------

::

          cups(1), cupsd(8), inetconv(1m), inetd(8), launchd(8), xinetd(8),
          CUPS Online Help (http://localhost:631/help), RFC 2569


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

   26 April 2019                     CUPS                       cups-lpd(8)

--------------

Pages that refer to this page: `cupsd(8) <../man8/cupsd.8.html>`__

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
