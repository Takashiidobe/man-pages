.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lpadmin(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DEPRECATED                       |                                   |
|  OPTIONS <#DEPRECATED_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   lpadmin(8)                     Apple Inc.                     lpadmin(8)

NAME
-------------------------------------------------

::

          lpadmin - configure cups printers and classes


---------------------------------------------------------

::

          lpadmin [ -E ] [ -U username ] [ -h server[:port] ] -d
          destination
          lpadmin [ -E ] [ -U username ] [ -h server[:port] ] -p
          destination [ -R name-default ] option(s)
          lpadmin [ -E ] [ -U username ] [ -h server[:port] ] -x
          destination


---------------------------------------------------------------

::

          lpadmin configures printer and class queues provided by CUPS.  It
          can also be used to set the server default printer or class.

          When specified before the -d, -p, or -x options, the -E option
          forces encryption when connecting to the server.

          The first form of the command (-d) sets the default printer or
          class to destination.  Subsequent print jobs submitted via the
          lp(1) or lpr(1) commands will use this destination unless the
          user specifies otherwise with the lpoptions(1) command.

          The second form of the command (-p) configures the named printer
          or class.  The additional options are described below.

          The third form of the command (-x) deletes the printer or class
          destination.  Any jobs that are pending for the destination will
          be removed and any job that is currently printed will be aborted.


-------------------------------------------------------

::

          The following options are recognized when configuring a printer
          queue:

          -c class
               Adds the named printer to class.  If class does not exist it
               is created automatically.

          -m model
               Sets a standard PPD file for the printer from the model
               directory or using one of the driver interfaces.  Use the -m
               option with the lpinfo(8) command to get a list of supported
               models.  The model "raw" clears any existing PPD file and
               the model "everywhere" queries the printer referred to by
               the specified IPP device-uri.  Note: Models other than
               "everywhere" are deprecated and will not be supported in a
               future version of CUPS.

          -o cupsIPPSupplies=true

          -o cupsIPPSupplies=false
               Specifies whether IPP supply level values should be
               reported.

          -o cupsSNMPSupplies=true

          -o cupsSNMPSupplies=false
               Specifies whether SNMP supply level (RFC 3805) values should
               be reported.

          -o job-k-limit=value
               Sets the kilobyte limit for per-user quotas.  The value is
               an integer number of kilobytes; one kilobyte is 1024 bytes.

          -o job-page-limit=value
               Sets the page limit for per-user quotas.  The value is the
               integer number of pages that can be printed; double-sided
               pages are counted as two pages.

          -o job-quota-period=value
               Sets the accounting period for per-user quotas.  The value
               is an integer number of seconds; 86,400 seconds are in one
               day.

          -o job-sheets-default=banner

          -o job-sheets-default=banner,banner
               Sets the default banner page(s) to use for print jobs.

          -o name=value
               Sets a PPD option for the printer.  PPD options can be
               listed using the -l option with the lpoptions(1) command.

          -o name-default=value
               Sets a default server-side option for the destination.  Any
               print-time option can be defaulted, e.g., "-o number-up-
               default=2" to set the default "number-up" option value to 2.

          -o port-monitor=name
               Sets the binary communications program to use when printing,
               "none", "bcp", or "tbcp".  The default program is "none".
               The specified port monitor must be listed in the printer's
               PPD file.

          -o printer-error-policy=name
               Sets the policy for errors such as printers that cannot be
               found or accessed, don't support the format being printed,
               fail during submission of the print data, or cause one or
               more filters to crash.  The name must be one of "abort-job"
               (abort the job on error), "retry-job" (retry the job at a
               future time), "retry-current-job" (retry the current job
               immediately), or "stop-printer" (stop the printer on error).
               The default error policy is "stop-printer" for printers and
               "retry-current-job" for classes.

          -o printer-is-shared=true

          -o printer-is-shared=false
               Sets the destination to shared/published or
               unshared/unpublished.  Shared/published destinations are
               publicly announced by the server on the LAN based on the
               browsing configuration in cupsd.conf, while
               unshared/unpublished destinations are not announced.  The
               default value is "true".

          -o printer-op-policy=name
               Sets the IPP operation policy associated with the
               destination.  The name must be defined in the cupsd.conf in
               a Policy section.  The default operation policy is
               "default".

          -R name-default
               Deletes the named option from printer.

          -r class
               Removes the named printer from class.  If the resulting
               class becomes empty it is removed.

          -u allow:{user|@group}{,user|,@group}*

          -u deny:{user|@group}{,user|,@group}*

          -u allow:all

          -u deny:none
               Sets user-level access control on a destination.  Names
               starting with "@" are interpreted as UNIX groups.  The
               latter two forms turn user-level access control off.  Note:
               The user 'root' is not granted special access - using "-u
               allow:foo,bar" will allow users 'foo' and 'bar' to access
               the printer but NOT 'root'.

          -v "device-uri"
               Sets the device-uri attribute of the printer queue.  Use the
               -v option with the lpinfo(8) command to get a list of
               supported device URIs and schemes.

          -D "info"
               Provides a textual description of the destination.

          -E   When specified before the -d, -p, or -x options, forces the
               use of TLS encryption on the connection to the scheduler.
               Otherwise, enables the destination and accepts jobs; this is
               the same as running the cupsaccept(8) and cupsenable(8)
               programs on the destination.

          -L "location"
               Provides a textual location of the destination.


-----------------------------------------------------------------------------

::

          The following lpadmin options are deprecated:

          -i filename
               This option historically has been used to provide either a
               System V interface script or (as an implementation side-
               effect) a PPD file.  Note: Interface scripts are not
               supported by CUPS.  PPD files and printer drivers are
               deprecated and will not be supported in a future version of
               CUPS.

          -P ppd-file
               Specifies a PostScript Printer Description (PPD) file to use
               with the printer.  Note: PPD files and printer drivers are
               deprecated and will not be supported in a future version of
               CUPS.


-------------------------------------------------------------------

::

          Unlike the System V printing system, CUPS allows printer names to
          contain any printable character except SPACE, TAB, "/", or "#".
          Also, printer and class names are not case-sensitive.

          Finally, the CUPS version of lpadmin may ask the user for an
          access password depending on the printing system configuration.
          This differs from the System V version which requires the root
          user to execute this command.


---------------------------------------------------

::

          CUPS printer drivers and backends are deprecated and will no
          longer be supported in a future feature release of CUPS.
          Printers that do not support IPP can be supported using
          applications such as ippeveprinter(1).

          The CUPS version of lpadmin does not support all of the System V
          or Solaris printing system configuration options.

          Interface scripts are not supported for security reasons.

          The double meaning of the -E option is an unfortunate historical
          oddity.

          The lpadmin command communicates with the scheduler (cupsd) to
          make changes to the printing system configuration.  This
          configuration information is stored in several files including
          printers.conf and classes.conf.  These files should not be edited
          directly and are an implementation detail of CUPS that is subject
          to change at any time.


-------------------------------------------------------

::

          Create an IPP Everywhere print queue:

              lpadmin -p myprinter -E -v ipp://myprinter.local/ipp/print -m everywhere


---------------------------------------------------------

::

          cupsaccept(8), cupsenable(8), lpinfo(8), lpoptions(1), CUPS
          Online Help (http://localhost:631/help)


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

   26 April 2019                     CUPS                        lpadmin(8)

--------------

Pages that refer to this page: `cups(1) <../man1/cups.1.html>`__, 
`cupstestppd(1) <../man1/cupstestppd.1.html>`__, 
`lp(1) <../man1/lp.1.html>`__, 
`lpoptions(1) <../man1/lpoptions.1.html>`__, 
`lpr(1) <../man1/lpr.1.html>`__, 
`cupsaccept(8) <../man8/cupsaccept.8.html>`__, 
`cupsenable(8) <../man8/cupsenable.8.html>`__, 
`lpc(8) <../man8/lpc.8.html>`__,  `lpinfo(8) <../man8/lpinfo.8.html>`__

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
