.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ippfind(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ippfind(1)                     Apple Inc.                     ippfind(1)

NAME
-------------------------------------------------

::

          ippfind - find internet printing protocol printers


---------------------------------------------------------

::

          ippfind [ options ] regtype[,subtype][.domain.] ... [ expression
           ... ]
          ippfind [ options ] name[.regtype[.domain.]] ... [ expression
           ... ]
          ippfind --help
          ippfind --version


---------------------------------------------------------------

::

          ippfind finds services registered with a DNS server or available
          through local devices.  Its primary purpose is to find IPP
          printers and show their URIs, show their current status, or run
          commands.

      REGISTRATION TYPES
          ippfind supports the following registration types:

          _http._tcp
               HyperText Transport Protocol (HTTP, RFC 2616)

          _https._tcp
               Secure HyperText Transport Protocol (HTTPS, RFC 2818)

          _ipp._tcp
               Internet Printing Protocol (IPP, RFC 2911)

          _ipps._tcp
               Secure Internet Printing Protocol (IPPS, draft)

          _printer._tcp
               Line Printer Daemon (LPD, RFC 1179)

      EXPRESSIONS
          ippfind supports expressions much like the find(1) utility.
          However, unlike find(1), ippfind uses POSIX regular expressions
          instead of shell filename matching patterns.  If --exec, -l,
          --ls, -p, --print, --print-name, -q, --quiet, -s, or -x is not
          specified, ippfind adds --print to print the service URI of
          anything it finds.  The following expressions are supported:

          -d regex

          --domain regex
               True if the domain matches the given regular expression.

          --false
               Always false.

          -h regex

          --host regex
               True is the hostname matches the given regular expression.

          -l

          --ls Lists attributes returned by Get-Printer-Attributes for IPP
               printers and traditional find "-ls" output for HTTP URLs.
               The result is true if the URI is accessible, false
               otherwise.

          --local
               True if the service is local to this computer.

          -N name

          --literal-name name
               True if the service instance name matches the given name.

          -n regex

          --name regex
               True if the service instance name matches the given regular
               expression.

          --path regex
               True if the URI resource path matches the given regular
               expression.

          -P number[-number]

          --port number[-number]
               True if the port matches the given number or range.

          -p

          --print
               Prints the URI if the result of previous expressions is
               true.  The result is always true.

          -q

          --quiet
               Quiet mode - just returns the exit codes below.

          -r

          --remote
               True if the service is not local to this computer.

          -s

          --print-name
               Prints the service instance name if the result of previous
               expressions is true.  The result is always true.

          --true
               Always true.

          -t key

          --txt key
               True if the TXT record contains the named key.

          --txt-key regex
               True if the TXT record contains the named key and matches
               the given regular expression.

          -u regex

          --uri regex
               True if the URI matches the given regular expression.

          -x utility [ argument ... ] ;

          --exec utility [ argument ... ] ;
               Executes the specified program if the current result is
               true.  "{foo}" arguments are replaced with the corresponding
               value - see SUBSTITUTIONS below.

          Expressions may also contain modifiers:

          ( expression )
               Group the result of expressions.

          ! expression

          --not expression
               Unary NOT of the expression.

          expression expression

          expression --and expression
               Logical AND of expressions.

          expression --or expression
               Logical OR of expressions.

      SUBSTITUTIONS
          The substitutions for "{foo}" in -e and --exec are:

          {service_domain}
               Domain name, e.g., "example.com.", "local.", etc.

          {service_hostname}
               Fully-qualified domain name, e.g., "printer.example.com.",
               "printer.local.", etc.

          {service_name}
               Service instance name, e.g., "My Fine Printer".

          {service_port}
               Port number for server, typically 631 for IPP and 80 for
               HTTP.

          {service_regtype}
               DNS-SD registration type, e.g., "_ipp._tcp", "_http._tcp",
               etc.

          {service_scheme}
               URI scheme for DNS-SD registration type, e.g., "ipp",
               "http", etc.

          {}

          {service_uri}
               URI for service, e.g., "ipp://printer.local./ipp/print",
               "http://printer.local./", etc.

          {txt_key}
               Value of TXT record key (lowercase).


-------------------------------------------------------

::

          ippfind supports the following options:

          --help
               Show program help.

          --version
               Show program version.

          -4   Use IPv4 when listing.

          -6   Use IPv6 when listing.

          -T seconds
               Specify find timeout in seconds.  If 1 or less, ippfind
               stops as soon as it thinks it has found everything.  The
               default timeout is 1 second.

          -V version
               Specifies the IPP version when listing.  Supported values
               are "1.1", "2.0", "2.1", and "2.2".


---------------------------------------------------------------

::

          ippfind returns 0 if the result for all processed expressions is
          true, 1 if the result of any processed expression is false, 2 if
          browsing or any query or resolution failed, 3 if an undefined
          option or invalid expression was specified, and 4 if it ran out
          of memory.


---------------------------------------------------------------

::

          When executing a program, ippfind sets the following environment
          variables for the matching service registration:

          IPPFIND_SERVICE_DOMAIN
               Domain name, e.g., "example.com.", "local.", etc.

          IPPFIND_SERVICE_HOSTNAME
               Fully-qualified domain name, e.g., "printer.example.com.",
               "printer.local.", etc.

          IPPFIND_SERVICE_NAME
               Service instance name, e.g., "My Fine Printer".

          IPPFIND_SERVICE_PORT
               Port number for server, typically 631 for IPP and 80 for
               HTTP.

          IPPFIND_SERVICE_REGTYPE
               DNS-SD registration type, e.g., "_ipp._tcp", "_http._tcp",
               etc.

          IPPFIND_SERVICE_SCHEME
               URI scheme for DNS-SD registration type, e.g., "ipp",
               "http", etc.

          IPPFIND_SERVICE_URI
               URI for service, e.g., "ipp://printer.local./ipp/print",
               "http://printer.local./", etc.

          IPPFIND_TXT_KEY
               Values of TXT record KEY (uppercase).


---------------------------------------------------------

::

          To show the status of all registered IPP printers on your
          network, run:

              ippfind --ls

          Similarly, to send a PostScript test page to every PostScript
          printer, run:

              ippfind --txt-pdl application/postscript --exec ipptool
                -f onepage-letter.ps '{}' print-job.test \;


---------------------------------------------------------

::

          ipptool(1)


-----------------------------------------------------------

::

          Copyright © 2013-2019 by Apple Inc.

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

   26 April 2019                   ippsample                     ippfind(1)

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
