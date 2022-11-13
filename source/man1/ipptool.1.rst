.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

ipptool(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
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

   ipptool(1)                     Apple Inc.                     ipptool(1)

NAME
-------------------------------------------------

::

          ipptool - perform internet printing protocol requests


---------------------------------------------------------

::

          ipptool [ --help ] [ --ippserver filename ] [
          --stop-after-include-error ] [ --version ] [ -4 ] [ -6 ] [ -C ] [
          -E ] [ -I ] [ -L ] [ -P filename.plist ] [ -R ] [ -S ] [ -T
          seconds ] [ -V version ] [ -X ] [ -c ] [ -d name=value ] [ -f
          filename ] [ -h ] [ -i seconds ] [ -n repeat-count ] [ -q ] [ -t
          ] [ -v ] printer-uri testfile [ ...  testfile ]


---------------------------------------------------------------

::

          ipptool sends IPP requests to the specified printer-uri and tests
          and/or displays the results.  Each named testfile defines one or
          more requests, including the expected response status,
          attributes, and values.  Output is either a plain text, formatted
          text, CSV, or XML report on the standard output, with a non-zero
          exit status indicating that one or more tests have failed.  The
          testfile format is described in ipptoolfile(5).


-------------------------------------------------------

::

          The following options are recognized by ipptool:

          --help
               Shows program help.

          --ippserver filename
               Specifies that the test results should be written to the
               named ippserver attributes file.

          --stop-after-include-error
               Tells ipptool to stop if an error occurs in an included
               file. Normally ipptool will continue with subsequent tests
               after the INCLUDE directive.

          --version
               Shows the version of ipptool being used.

          -4   Specifies that ipptool must connect to the printer or server
               using IPv4.

          -6   Specifies that ipptool must connect to the printer or server
               using IPv6.

          -C   Specifies that requests should be sent using the HTTP/1.1
               "Transfer-Encoding: chunked" header, which is required for
               conformance by all versions of IPP.  The default is to use
               "Transfer-Encoding: chunked" for requests with attached
               files and "Content-Length:" for requests without attached
               files.

          -E   Forces TLS encryption when connecting to the server using
               the HTTP "Upgrade" header.

          -I   Specifies that ipptool will continue past errors.

          -L   Specifies that requests should be sent using the HTTP/1.0
               "Content-Length:" header, which is required for conformance
               by all versions of IPP.  The default is to use
               "Transfer-Encoding: chunked" for requests with attached
               files and "Content-Length:" for requests without attached
               files.

          -P filename.plist
               Specifies that the test results should be written to the
               named XML (Apple plist) file in addition to the regular test
               report (-t).  This option is incompatible with the -i
               (interval) and -n (repeat-count) options.

          -R   Retries tests when the "server-error-busy" status code is
               returned.

          -S   Forces (dedicated) TLS encryption when connecting to the
               server.

          -T seconds
               Specifies a timeout for IPP requests in seconds.

          -V version
               Specifies the default IPP version to use: 1.0, 1.1, 2.0,
               2.1, or 2.2. If not specified, version 1.1 is used.

          -X   Specifies that XML (Apple plist) output is desired instead
               of the plain text report.  This option is incompatible with
               the -i (interval) and -n (repeat-count) options.

          -c   Specifies that CSV (comma-separated values) output is
               desired instead of the plain text output.

          -d name=value
               Defines the named variable.

          -f filename
               Defines the default request filename for tests.

          -h   Validate HTTP response headers.

          -i seconds
               Specifies that the (last) testfile should be repeated at the
               specified interval.  This option is incompatible with the -X
               (XML plist output) option.

          -l   Specifies that plain text output is desired.

          -n repeat-count
               Specifies that the (last) testfile should be repeated the
               specified number of times.  This option is incompatible with
               the -X (XML plist output) option.

          -q   Be quiet and produce no output.

          -t   Specifies that CUPS test report output is desired instead of
               the plain text output.

          -v   Specifies that all request and response attributes should be
               output in CUPS test mode (-t).  This is the default for XML
               output.


---------------------------------------------------------------

::

          The ipptool program returns 0 if all tests were successful and 1
          otherwise.


---------------------------------------------------

::

          The following standard files are available:
          color.jpg
          create-printer-subscription.test
          document-a4.pdf
          document-a4.ps
          document-letter.pdf
          document-letter.ps
          get-completed-jobs.test
          get-jobs.test
          get-notifications.test
          get-printer-attributes.test
          get-subscriptions.test
          gray.jpg
          ipp-1.1.test
          ipp-2.0.test
          ipp-2.1.test
          ipp-2.2.test
          ipp-everywhere.test
          onepage-a4.pdf
          onepage-a4.ps
          onepage-letter.pdf
          onepage-letter.ps
          print-job.test
          print-job-deflate.test
          print-job-gzip.test
          testfile.jpg
          testfile.pcl
          testfile.pdf
          testfile.ps
          testfile.txt
          validate-job.test


-------------------------------------------------------------------

::

          The ipptool program is unique to CUPS and conforms to the
          Internet Printing Protocol up to version 2.2.


---------------------------------------------------------

::

          Get a list of completed jobs for "myprinter":

              ipptool ipp://localhost/printers/myprinter get-completed-jobs.test

          Send email notifications to "user@example.com" when "myprinter"
          changes:

              ipptool -d recipient=mailto:user@example.com \
                  ipp://localhost/printers/myprinter create-printer-subscription.test


---------------------------------------------------------

::

          ipptoolfile(5), IANA IPP Registry
          (http://www.iana.org/assignments/ipp-registrations), PWG Internet
          Printing Protocol Workgroup (http://www.pwg.org/ipp) RFC 8011
          (http://tools.ietf.org/html/rfc8011),


-----------------------------------------------------------

::

          Copyright © 2007-2021 by Apple Inc.

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

   5 April 2021                      CUPS                        ipptool(1)

--------------

Pages that refer to this page: `ippfind(1) <../man1/ippfind.1.html>`__, 
`ipptoolfile(5) <../man5/ipptoolfile.5.html>`__

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
