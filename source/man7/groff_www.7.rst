.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff_www(7) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Requests <#Requests>`__ \|       |                                   |
| `Section heading                  |                                   |
| links <#Section_heading_links>`__ |                                   |
| \|                                |                                   |
| `Limitations of [22mg            |                                   |
| rohtml[24m [1m <#Limitations_of |                                   |
| _%5B22mgrohtml%5B24m_%5B1m>`__ |                                   |
| \| `Files <#Files>`__ \|          |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff_www(7)        Miscellaneous Information Manual        groff_www(7)


-------------------------------------------------

::

          groff_www - GNU roff macros for authoring web pages


---------------------------------------------------------

::

          groff -m www [option ...] [file ...]


---------------------------------------------------------------

::

          This manual page describes the GNU www macro package, which is
          part of the groff document formatting system.  The manual page is
          very a basic guide, and the HTML device driver (grohtml) has been
          completely rewritten but still remains as in an alpha state.  It
          has been included into the distribution so that a lot of people
          have a chance to test it.  Note that this macro file is
          automatically called (via the troffrc file) if you use -Thtml or
          -Txhtml.

          To see the hyperlinks in action, please format this man page with
          the grohtml device.

          Here is a summary of the functions found in this macro set.

          .JOBNAME     split output into multiple files
          .HX          automatic heading level cut off
          .BCL         specify colours on a web page
          .BGIMG       specify background image
          .URL         create a URL using two parameters
          .FTP         create an FTP reference
          .MTO         create an HTML email address
          .TAG         generate an HTML name
          .IMG         include an image file
          .PIMG        include PNG image
          .MPIMG       place PNG on the margin and wrap text around it
          .HnS         begin heading
          .HnE         end heading
          .LK          emit automatically collected links.
          .HR          produce a horizontal rule
          .NHR         suppress automatic generation of rules.
          .HTL         only generate HTML title
          .HEAD        add data to <head> block
          .ULS         unorder list begin
          .ULE         unorder list end
          .OLS         ordered list begin
          .OLE         ordered list end
          .DLS         definition list begin
          .DLE         definition list end
          .LI          insert a list item
          .DC          generate a drop capital
          .HTML        pass an HTML raw request to the device driver
          .CDS         code example begin
          .CDE         code example end
          .ALN         place links on left of main text.
          .LNS         start a new two-column table with links in the left.
          .LNE         end the two-column table.
          .LINKSTYLE   initialize default URL attributes.

          Output of the pic, eqn, refer, and tbl preprocessors is
          acceptable as input.


---------------------------------------------------------

::

          .JOBNAME filename
                 Split output into multiple HTML files.  A file is split
                 whenever a .SH or .NH 1 is encountered.  Its argument is
                 the file stem name for future output files.  This option
                 is equivalent to grohtml's -j option.

          .HX n  Specify the cut off depth when generating links from
                 section headings.  For example, a parameter of 2 would
                 cause grohtml to generate a list of links for .NH 1 and
                 .NH 2 but not for .NH 3.  Whereas

                        .HX 0

                 tells grohtml that no heading links should be created at
                 all.  Another method for turning automatic headings off is
                 by issuing the command-line switch -P-l to groff.

          .BCL foreground background active not-visited visited
                 This macro takes five parameters: foreground, background,
                 active hypertext link, hypertext link not yet visited, and
                 visited hypertext link colour.

          .BGIMG imagefile
                 the only parameter to this macro is the background image
                 file.

          .URL url [description] [after]
                 generates a URL using either one, two, or three arguments.
                 The first parameter is the actual URL, the second is the
                 name of the link, and the third is optional stuff to be
                 printed immediately afterwards.  If description and after
                 are absent then the URL becomes the anchor text.
                 Hyphenation is disabled while printing the actual URL;
                 explicit breakpoints should be inserted with the \:
                 escape.  Here is how to encode foo ⟨http://foo.org/⟩:

                        .URL http://\:foo\:.org/ foo :

                 If this is processed by a device other than -Thtml or
                 -Txhtml it appears as:

                        foo ⟨http://foo.org⟩:

                 The URL macro can be of any type; for example, we can
                 reference Eric Raymond's pic guide ⟨pic.html⟩ by:

                        .URL pic\:.html "Eric Raymond's pic guide"

          .MTO address [description] [after]
                 Generate an email HTML reference.  The first argument is
                 mandatory as the email address.  The optional second
                 argument is the text you see in your browser.  If an empty
                 argument is given, address is used instead.  An optional
                 third argument is stuff printed immediately afterwards.
                 Hyphenation is disabled while printing the actual email
                 address.  For example, Joe User ⟨joe@user.org⟩ can be
                 achieved by the following macro:

                        .MTO joe@user.org "Joe User"

                 Note that all the URLs actually are treated as consuming
                 no textual space in groff.  This could be considered as a
                 bug since it causes some problems.  To circumvent this,
                 www.tmac inserts a zero-width character which expands to a
                 harmless space (only if run with -Thtml or -Txhtml).

          .FTP url [description] [after]
                 indicates that data can be obtained via FTP.  The first
                 argument is the URL and the second is the browser text.  A
                 third argument, similar to the macros above, is intended
                 for stuff printed immediately afterwards.  The second and
                 the third parameter are optional.  Hyphenation is disabled
                 while printing the actual URL.  As an example, here is the
                 location of the GNU FTP server ⟨ftp://ftp.gnu.org/⟩.  The
                 macro example above can be specified as:

                        .FTP ftp://\:ftp\:.gnu\:.org/ "GNU FTP server" .

          .TAG name
                 Generates an HTML name tag from its argument.  This can
                 then be referenced using the URL ⟨#URL⟩ macro.  As you can
                 see, you must precede the tag name with # since it is a
                 local reference.  This link was achieved via placing a TAG
                 in the URL description above; the source looks like this:

                        .TP
                        .B URL
                        generates
                        .TAG URL
                        a URL using either two or three arguments.
                        ...

          .IMG [-R|-L|-C] filename [width] [height]
                 Include a picture into the document.  The first argument
                 is the horizontal location: right, left, or center (-R,
                 -L, or -C).  Alignment is centered by default (-C).  The
                 second argument is the filename.  The optional third and
                 fourth arguments are the width and height.  If the width
                 is absent it defaults to 1 inch.  If the height is absent
                 it defaults to the width.  This maps onto an HTML img tag.
                 If you are including a PNG image then it is advisable to
                 use the PIMG macro.

          .PIMG [-R|-L|-C] filename [width [height]]
                 Include an image in PNG format.  This macro takes exactly
                 the same parameters as the IMG macro; it has the advantage
                 of working with PostScript and HTML devices also since it
                 can automatically convert the image into the EPS format,
                 using the following programs of the netpbm package:
                 pngtopnm, pnmcrop, and pnmtops.  If the document isn't
                 processed with -Thtml or -Txhtml it is necessary to use
                 the -U option of groff.

          .MPIMG [-R|-L] [-G gap] filename [width [height]]
                 Place a PNG image on the margin and wrap text around it.
                 The first parameters are optional.  The alignment: left or
                 right (-L or -R) specifies the margin where the picture is
                 placed at.  The default alignment is left (-L).
                 Optionally, -G gap can be used to arrange a gap between
                 the picture and the text that wraps around it.  The
                 default gap width is zero.
                 The first non-optional argument is the filename.  The
                 optional following arguments are the width and height.  If
                 the width is absent it defaults to 1 inch.  If the height
                 is absent it defaults to the width.  Example:

                        .MPIMG -L -G 2c foo.png 3c 1.5c

                 The height and width may also be given as percentages.
                 The PostScript device calculates the width from the .l
                 register and the height from the .p register.  For
                 example:

                        .MPIMG -L -G 2c foo.png 15%

          .HnS n Begin heading.  The numeric heading level n is specified
                 by the first parameter.  Use this macro if your headings
                 contain URL, FTP or MTO macros.  Example:

                        .HnS 1
                        .HR
                        GNU Troff
                        .URL https://\:www\:.gnu\:.org/\:software/\:groff/
                        \[em]a
                        .URL http://www\:.gnu\:.org/ GNU
                        project.
                        .HR
                        .HnE

                 In this case you might wish to disable automatic links to
                 headings.  This can be done via -P-l from the command
                 line.

          .HnE   End heading.

          .LK    Force grohtml to place the automatically generated links
                 at this position.

          .HR    Generate a full-width horizontal rule for -Thtml and
                 -Txhtml.  No effect for all other devices.

          .NHR   Suppress generation of the top and bottom rules which
                 grohtml emits by default.

          .HTL   Generate an HTML title only.  This differs from the TL
                 macro of the ms macro package which generates both an HTML
                 title and an <H1> heading.  Use it to provide an HTML
                 title as search engine fodder but a graphic title in the
                 document.  The macro terminates when a space or break is
                 seen (.sp, .br).

          .HEAD  Add arbitrary HTML data to the <head> block.  Ignored if
                 not processed with -Thtml or -Txhtml.  Example:

                        .HEAD "<link \
                          rel=""icon"" \
                          type=""image/png"" \
                          href=""http://foo.org//bar.png""/>"

          .HTML  All text after this macro is treated as raw HTML.  If the
                 document is processed without -Thtml or -Txhtml then the
                 macro is ignored.  Internally, this macro is used as a
                 building block for other higher-level macros.

                 For example, the BGIMG macro is defined as

                        .de BGIMG
                        .   HTML <body background=\\$1>
                        ..

          .DC l text [color]
                 Produce a drop capital.  The first parameter is the letter
                 to be dropped and enlarged, the second parameter text is
                 the adjoining text whose height the first letter should
                 not exceed.  The optional third parameter is the color of
                 the dropped letter.  It defaults to black.

          .CDS   Start displaying a code section in constant width font.

          .CDE   End code display

          .ALN [color] [percentage]
                 Place section heading links automatically to the left of
                 the main text.  The color argument is optional and if
                 present indicates which HTML background color is to be
                 used under the links.  The optional percentage indicates
                 the amount of width to devote to displaying the links.
                 The default values are #eeeeee and 30 for color and
                 percentage width, respectively.  This macro should only be
                 called once at the beginning of the document.  After
                 calling this macro each section heading emits an HTML
                 table consisting of the links in the left and the section
                 text on the right.

          .LNS   Start a new two-column table with links in the left
                 column.  This can be called if the document has text
                 before the first .SH and if .ALN is used.  Typically this
                 is called just before the first paragraph and after the
                 main title as it indicates that text after this point
                 should be positioned to the right of the left-hand
                 navigational links.

          .LNE   End a two-column table.  This should be called at the end
                 of the document if .ALN was used.

          .LINKSTYLE color [ fontstyle [ openglyph closeglyph ] ]
                 Initialize default URL attributes to be used if this macro
                 set is not used with the HTML device.  The macro set
                 initializes itself with the following call

                        .LINKSTYLE blue CR \[la] \[ra]

                 but these values will be superseded by a user call to
                 LINKSTYLE.


-----------------------------------------------------------------------------------

::

          By default grohtml generates links to all section headings and
          places these at the top of the HTML document.  (See LINKS ⟨#LK⟩
          for details of how to switch this off or alter the position).


-------------------------------------------------------------------------------------------------------------------------

::

          tbl information is currently rendered as a PNG image.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/tmac/www.tmac


-------------------------------------------------------

::

          The www macro package was written by Gaius Mulley ⟨gaius@glam.ac
          .uk⟩, with additions by Werner Lemberg ⟨wl@gnu.org⟩ and Bernd
          Warken ⟨groff-bernd.warken-72@web.de⟩.


---------------------------------------------------------

::

          groff(1), troff(1), grohtml(1), netpbm(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the groff (GNU troff) project.  Information
          about the project can be found at 
          ⟨http://www.gnu.org/software/groff/⟩.  If you have a bug report
          for this manual page, see ⟨http://www.gnu.org/software/groff/⟩.
          This page was obtained from the project's upstream Git repository
          ⟨https://git.savannah.gnu.org/git/groff.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-08-23.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                 groff_www(7)

--------------

Pages that refer to this page:
`groff_tmac(5) <../man5/groff_tmac.5.html>`__, 
`man(7) <../man7/man.7.html>`__

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
