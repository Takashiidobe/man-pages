.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mime.convs(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   mime.convs(5)                  Apple Inc.                  mime.convs(5)

NAME
-------------------------------------------------

::

          mime.convs - mime type conversion file for cups (deprecated)


---------------------------------------------------------------

::

          The mime.convs file defines the filters that are available for
          converting files from one format to another.  The standard
          filters support text, PDF, PostScript, and many types of image
          files.

          Additional filters are specified in files with the extension
          .convs in the CUPS configuration directory.

          Each line in the mime.convs file is a comment, blank, or filter
          line.  Comment lines start with the # character.  Filter lines
          specify the source and destination MIME types along with a
          relative cost associated with the filter and the filter to run:

              source/type destination/type cost filter

          The source/type field specifies the source MIME media type that
          is consumed by the filter.

          The destination/type field specifies the destination MIME media
          type that is produced by the filter.

          The cost field specifies the relative cost for running the
          filter.  A value of 100 means that the filter uses a large amount
          of resources while a value of 0 means that the filter uses very
          few resources.

          The filter field specifies the filter program filename.
          Filenames are relative to the CUPS filter directory.


---------------------------------------------------

::

          /etc/cups - Typical CUPS configuration directory.
          /usr/lib/cups/filter - Typical CUPS filter directory.
          /usr/libexec/cups/filter - CUPS filter directory on macOS.


---------------------------------------------------------

::

          Define a filter that converts PostScript documents to CUPS Raster
          format:

              application/vnd.cups-postscript application/vnd.cups-raster 50 pstoraster


---------------------------------------------------

::

          CUPS filters are deprecated and will no longer be supported in a
          future feature release of CUPS.  Printers that do not support IPP
          can be supported using applications such as ippeveprinter(1).


---------------------------------------------------------

::

          cups-files.conf(5), cupsd.conf(5), cupsd(8), cupsfilter(8),
          mime.types(5), CUPS Online Help (http://localhost:631/help)


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

   26 April 2019                     CUPS                     mime.convs(5)

--------------

Pages that refer to this page:
`classes.conf(5) <../man5/classes.conf.5.html>`__, 
`cupsd.conf(5) <../man5/cupsd.conf.5.html>`__, 
`cups-files.conf(5) <../man5/cups-files.conf.5.html>`__, 
`mime.types(5) <../man5/mime.types.5.html>`__, 
`printers.conf(5) <../man5/printers.conf.5.html>`__, 
`subscriptions.conf(5) <../man5/subscriptions.conf.5.html>`__, 
`cupsd(8) <../man8/cupsd.8.html>`__

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
