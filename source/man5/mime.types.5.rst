.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mime.types(5) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYRIGHT <#COPYRIGHT>`__ \|     |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   mime.types(5)                  Apple Inc.                  mime.types(5)

NAME
-------------------------------------------------

::

          mime.types - mime type description file for cups


---------------------------------------------------------------

::

          The mime.types file defines the recognized file types.

          Additional file types are specified in files with the extension
          .types in the CUPS configuration directory.

          Each line in the mime.types file is a comment, blank, or rule
          line.  Comment lines start with the # character.  Rule lines
          start with the MIME media type and are optionally followed by a
          series of file recognition rules:

              mime/type [ rule ... rule ]

          Rules can be extended over multiple lines using the backslash
          character (\):

              mime/type [ really-really-really-long-rule ... \
                rule ]

          MIME media types specified by the mime/type field are case-
          insensitive and are sorted in ascending alphanumeric order for
          the purposes of matching.  See the "TYPE MATCHING AND PRIORITY"
          section for more information.

          The rules may be grouped using parenthesis, joined using "+" for
          a logical AND, joined using "," or whitespace for a logical OR,
          and negated using "!".

      RULES
          Rules take two forms - a filename extension by itself and
          functions with test values inside parenthesis.  The following
          functions are available:

          match("pattern")
               True if the filename matches the given shell wildcard
               pattern.

          ascii(offset,length)
               True if the length bytes starting at offset are valid
               printable ASCII (CR, NL, TAB, BS, 32-126).

          printable(offset,length)
               True if the length bytes starting at offset are printable
               8-bit chars (CR, NL, TAB, BS, 32-126, 128-254).

          priority(number)
               Specifies the relative priority of this MIME media type.
               The default priority is 100.  Larger values have higher
               priority while smaller values have lower priority.

          string(offset,"string")
               True if the bytes starting at offset are identical to
               string.

          istring(offset,"string")
               True if the bytes starting at offset match string without
               respect to case.

          char(offset,value)
               True if the byte at offset is identical to value.

          short(offset,value)
               True if the 16-bit big-endian integer at offset is identical
               to value.

          int(offset,value)
               True if the 32-bit big-endian integer at offset is identical
               to value.

          locale("string")
               True if current locale matches string.

          contains(offset,range,"string")
               True if the bytes starting at offset for range bytes
               contains string.

      STRING CONSTANTS
          String constants can be specified inside quotes ("") for strings
          containing whitespace and angle brackets (<>) for hexadecimal
          strings.

      TYPE MATCHING AND PRIORITY
          When CUPS needs to determine the MIME media type of a given file,
          it checks every MIME media type defined in the .types files.
          When two or more types match a given file, the type chosen will
          depend on the type name and priority, with higher-priority types
          being used over lower-priority ones.  If the types have the same
          priority, the type names are sorted alphanumerically in ascending
          order and the first type is chosen.

          For example, if two types "text/bar" and "text/foo" are defined
          as matching the extension "doc", normally the type "text/bar"
          will be chosen since its name is alphanumerically smaller than
          "text/foo".  However, if "text/foo" also defines a higher
          priority than "text/bar", "text/foo" will be chosen instead.


---------------------------------------------------

::

          /etc/cups - Typical CUPS configuration directory.


---------------------------------------------------------

::

          Define two MIME media types for raster data, with one being a
          subset with higher priority:

              application/vnd.cups-raster  string(0,"RaSt") string(0,"tSaR") \
                                            string(0,"RaS2") string(0,"2SaR") \
                                            string(0,"RaS3") string(0,"3SaR")

              image/pwg-raster              string(0,"RaS2") + \
                                            string(4,PwgRaster<00>) priority(150)


---------------------------------------------------------

::

          cups-files.conf(5), cupsd.conf(5), cupsd(8), cupsfilter(8),
          mime.convs(5), CUPS Online Help (http://localhost:631/help)


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

   26 April 2019                     CUPS                     mime.types(5)

--------------

Pages that refer to this page:
`classes.conf(5) <../man5/classes.conf.5.html>`__, 
`cupsd.conf(5) <../man5/cupsd.conf.5.html>`__, 
`cups-files.conf(5) <../man5/cups-files.conf.5.html>`__, 
`gitweb.conf(5) <../man5/gitweb.conf.5.html>`__, 
`mime.convs(5) <../man5/mime.convs.5.html>`__, 
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
