.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

cupsfilter(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
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

   cupsfilter(8)                  Apple Inc.                  cupsfilter(8)

NAME
-------------------------------------------------

::

          cupsfilter - convert a file to another format using cups filters
          (deprecated)


---------------------------------------------------------

::

          cupsfilter [ --list-filters ] [ -D ] [ -U user ] [ -c config-file
          ] [ -d printer ] [ -e ] [ -i mime/type ] [ -j job-id[,N] ] [ -m
          mime/type ] [ -n copies ] [ -o name=value ] [ -p filename.ppd ] [
          -t title ] [ -u ] filename


---------------------------------------------------------------

::

          cupsfilter is a front-end to the CUPS filter subsystem which
          allows you to convert a file to a specific format, just as if you
          had printed the file through CUPS. By default, cupsfilter
          generates a PDF file. The converted file is sent to the standard
          output.


-------------------------------------------------------

::

          --list-filters
               Do not actually run the filters, just print the filters used
               to stdout.

          -D   Delete the input file after conversion.

          -U user
               Specifies the username passed to the filters. The default is
               the name of the current user.

          -c config-file
               Uses the named cups-files.conf configuration file.

          -d printer
               Uses information from the named printer.

          -e   Use every filter from the PPD file.

          -i mime/type
               Specifies the source file type. The default file type is
               guessed using the filename and contents of the file.

          -j job-id[,N]
               Converts document N from the specified job. If N is omitted,
               document 1 is converted.

          -m mime/type
               Specifies the destination file type. The default file type
               is application/pdf. Use printer/foo to convert to the
               printer format defined by the filters in the PPD file.

          -n copies
               Specifies the number of copies to generate.

          -o name=value
               Specifies options to pass to the CUPS filters.

          -p filename.ppd
               Specifies the PPD file to use.

          -t title
               Specifies the document title.

          -u   Delete the PPD file after conversion.


---------------------------------------------------------------

::

          cupsfilter returns a non-zero exit status on any error.


---------------------------------------------------------------

::

          All of the standard cups(1) environment variables affect the
          operation of cupsfilter.


---------------------------------------------------

::

          /etc/cups/cups-files.conf
          /etc/cups/*.convs
          /etc/cups/*.types
          /usr/share/cups/mime/*.convs
          /usr/share/cups/mime/*.types


---------------------------------------------------

::

          CUPS printer drivers, filters, and backends are deprecated and
          will no longer be supported in a future feature release of CUPS.
          Printers that do not support IPP can be supported using
          applications such as ippeveprinter(1).

          Unlike when printing, filters run using the cupsfilter command
          use the current user and security session. This may result in
          different output or unexpected behavior.


-------------------------------------------------------

::

          The following command will generate a PDF preview of job 42 for a
          printer named "myprinter" and save it to a file named
          "preview.pdf":

              cupsfilter -m application/pdf -d myprinter -j 42 >preview.pdf


---------------------------------------------------------

::

          cups(1), cupsd.conf(5), filter(7), mime.convs(7), mime.types(7),
          CUPS Online Help (http://localhost:631/help)


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

   26 April 2019                     CUPS                     cupsfilter(8)

--------------

Pages that refer to this page:
`mime.convs(5) <../man5/mime.convs.5.html>`__, 
`mime.types(5) <../man5/mime.types.5.html>`__, 
`filter(7) <../man7/filter.7.html>`__

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
