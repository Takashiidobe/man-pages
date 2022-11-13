.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ippeveprinter(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \|                                |                                   |
| `CO                               |                                   |
| MMAND OUTPUT <#COMMAND_OUTPUT>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ippeveprinter(1)               Apple Inc.               ippeveprinter(1)

NAME
-------------------------------------------------

::

          ippeveprinter - an ipp everywhere printer application for cups


---------------------------------------------------------

::

          ippeveprinter [ --help ] [ --no-web-forms ] [ --pam-service
          service ] [ --version ] [ -2 ] [ -A ] [ -D device-uri ] [ -F
          output-type/subtype ] [ -K keypath ] [ -M manufacturer ] [ -P
          filename.ppd ] [ -V ipp-version ] [ -a filename.conf ] [ -c
          command ] [ -d spool-directory ] [ -f type/subtype[,...]  ] [ -i
          iconfile.png ] [ -k ] [ -l location ] [ -m model ] [ -n hostname
          ] [ -p port ] [ -r subtype[,subtype] ] [ -s speed[,color-speed] ]
          [ -v[vvv] ] service-name


---------------------------------------------------------------

::

          ippeveprinter is a simple Internet Printing Protocol (IPP) server
          conforming to the IPP Everywhere (PWG 5100.14) specification. It
          can be used to test client software or act as a very basic print
          server that runs a command for every job that is printed.


-------------------------------------------------------

::

          The following options are recognized by ippeveprinter:

          --help
               Show program usage.

          --no-web-forms
               Disable the web interface forms used to update the media and
               supply levels.

          --pam-service service
               Set the PAM service name.  The default service is "cups".

          --version
               Show the CUPS version.

          -2   Report support for two-sided (duplex) printing.

          -A   Enable authentication for the created printer.
               ippeveprinter uses PAM to authenticate HTTP Basic
               credentials.

          -D device-uri
               Set the device URI for print output.  The URI can be a
               filename, directory, or a network socket URI of the form
               "socket://ADDRESS[:PORT]" (where the default port number is
               9100).  When specifying a directory, ippeveprinter will
               create an output file using the job ID and name.

          -F output-type/subtype[,...]
               Specifies the output MIME media type.  The default is
               "application/postscript" when the -P option is specified.

          -M manufacturer
               Set the manufacturer of the printer.  The default is
               "Example".

          -P filename.ppd
               Load printer attributes from the specified PPD file.  This
               option is typically used in conjunction with the ippeveps(7)
               printer command ("-c ippeveps").

          -V 1.1

          -V 2.0
               Specifies the maximum IPP version to report.  2.0 is the
               default.

          -c command
               Run the specified command for each document that is printed.
               If "command" is not an absolute path ("/path/to/command"),
               ippeveprinter looks for the command in the "command"
               subdirectory of the CUPS binary directory, typically
               /usr/lib/cups/command or /usr/libexec/cups/command.  The
               cups-config(1) command can be used to discover the correct
               binary directory ("cups-config --serverbin").  In addition,
               the CUPS_SERVERBIN environment variable can be used to
               override the default location of this directory - see the
               cups(1) man page for more details.

          -d spool-directory
               Specifies the directory that will hold the print files.  The
               default is a directory under the user's current temporary
               directory.

          -f type/subtype[,...]
               Specifies a list of MIME media types that the server will
               accept.  The default depends on the type of printer created.

          -i iconfile.png
               Specifies the printer icon file for the server.  The file
               must be a PNG format image.  The default is an internally-
               provided PNG image.

          -k   Keeps the print documents in the spool directory rather than
               deleting them.

          -l location
               Specifies the human-readable location string that is
               reported by the server.  The default is the empty string.

          -m model
               Specifies the model name of the printer.  The default is
               "Printer".

          -n hostname
               Specifies the hostname that is reported by the server.  The
               default is the name returned by the hostname(1) command.

          -p port
               Specifies the port number to listen on.  The default is a
               user-specific number from 8000 to 8999.

          -r off
               Turns off DNS-SD service advertisements entirely.

          -r subtype[,subtype]
               Specifies the DNS-SD subtype(s) to advertise.  Separate
               multiple subtypes with a comma.  The default is "_print".

          -s speed[,color-speed]
               Specifies the printer speed in pages per minute.  If two
               numbers are specified and the second number is greater than
               zero, the server will report support for color printing.
               The default is "10,0".

          -v[vvv]
               Be (very) verbose when logging activity to standard error.


---------------------------------------------------------------

::

          The ippeveprinter program returns 1 if it is unable to process
          the command-line arguments or register the IPP service.
          Otherwise ippeveprinter will run continuously until terminated.


-------------------------------------------------------------------

::

          The ippeveprinter program is unique to CUPS and conforms to the
          IPP Everywhere (PWG 5100.14) specification.


---------------------------------------------------------------

::

          ippeveprinter adds environment variables starting with "IPP_" for
          all IPP Job attributes in the print request.  For example, when
          executing a command for an IPP Job containing the "media" Job
          Template attribute, the "IPP_MEDIA" environment variable will be
          set to the value of that attribute.

          In addition, all IPP "xxx-default" and "pwg-xxx" Printer
          Description attributes are added to the environment.  For
          example, the "IPP_MEDIA_DEFAULT" environment variable will be set
          to the default value for the "media" Job Template attribute.

          Enumerated values are converted to their keyword equivalents.
          For example, a "print-quality" Job Template attribute with a enum
          value of 3 will become the "IPP_PRINT_QUALITY" environment
          variable with a value of "draft".  This string conversion only
          happens for standard Job Template attributes, currently
          "finishings", "orientation-requested", and "print-quality".

          Finally, the "CONTENT_TYPE" environment variable contains the
          MIME media type of the document being printed, the "DEVICE_URI"
          environment variable contains the device URI as specified with
          the "-D" option, the "OUTPUT_FORMAT" environment variable
          contains the output MIME media type, and the "PPD" environment
          variable contains the PPD filename as specified with the "-P"
          option.


---------------------------------------------------------------------

::

          Unless they communicate directly with a printer, print commands
          send printer-ready data to the standard output.

          Print commands can send messages back to ippeveprinter on the
          standard error with one of the following prefixes:

          ATTR: attribute=value[ attribute=value]
               Sets the named attribute(s) to the given values.  Currently
               only the "job-impressions" and "job-impressions-completed"
               Job Status attributes and the "marker-xxx", "printer-alert",
               "printer-alert-description", "printer-supply", and "printer-
               supply-description" Printer Status attributes can be set.

          DEBUG: Debugging message
               Logs a debugging message if at least two -v's have been
               specified.

          ERROR: Error message
               Logs an error message and copies the message to the "job-
               state-message" attribute.

          INFO: Informational message
               Logs an informational/progress message if -v has been
               specified and copies the message to the "job-state-message"
               attribute unless an error has been reported.

          STATE: keyword[,keyword,...]
               Sets the printer's "printer-state-reasons" attribute to the
               listed keywords.

          STATE: -keyword[,keyword,...]
               Removes the listed keywords from the printer's "printer-
               state-reasons" attribute.

          STATE: +keyword[,keyword,...]
               Adds the listed keywords to the printer's "printer-state-
               reasons" attribute.


---------------------------------------------------------

::

          Run ippeveprinter with a service name of My Cool Printer:

              ippeveprinter "My Cool Printer"

          Run the file(1) command whenever a job is sent to the server:

              ippeveprinter -c /usr/bin/file "My Cool Printer"


---------------------------------------------------------

::

          ippevepcl(7), ippeveps(7), PWG Internet Printing Protocol
          Workgroup (http://www.pwg.org/ipp)


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

   2 December 2019                   CUPS                  ippeveprinter(1)

--------------

Pages that refer to this page: `cups(1) <../man1/cups.1.html>`__, 
`cupstestppd(1) <../man1/cupstestppd.1.html>`__, 
`ppdc(1) <../man1/ppdc.1.html>`__, 
`ppdhtml(1) <../man1/ppdhtml.1.html>`__, 
`ppdi(1) <../man1/ppdi.1.html>`__, 
`ppdmerge(1) <../man1/ppdmerge.1.html>`__, 
`ppdpo(1) <../man1/ppdpo.1.html>`__, 
`cups-snmp.conf(5) <../man5/cups-snmp.conf.5.html>`__, 
`mime.convs(5) <../man5/mime.convs.5.html>`__, 
`ppdcfile(5) <../man5/ppdcfile.5.html>`__, 
`backend(7) <../man7/backend.7.html>`__, 
`filter(7) <../man7/filter.7.html>`__, 
`ippevepcl(7) <../man7/ippevepcl.7.html>`__, 
`cupsd-helper(8) <../man8/cupsd-helper.8.html>`__, 
`cupsfilter(8) <../man8/cupsfilter.8.html>`__, 
`lpadmin(8) <../man8/lpadmin.8.html>`__, 
`lpinfo(8) <../man8/lpinfo.8.html>`__

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
