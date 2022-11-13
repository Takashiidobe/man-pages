.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grotty(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Environment <#Environment>`__ \| |                                   |
| `Files <#Files>`__ \|             |                                   |
| `Bugs <#Bugs>`__ \|               |                                   |
| `Example <#Example>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   grotty(1)                General Commands Manual               grotty(1)


-------------------------------------------------

::

          grotty - groff output driver for typewriter-like (terminal)
          devices


---------------------------------------------------------

::

          grotty [-dfho] [-i|-r] [-F dir] [file ...]

          grotty -c [-bBdfhouU] [-F dir] [file ...]

          grotty --help

          grotty -v
          grotty --version


---------------------------------------------------------------

::

          The GNU roff TTY (“Teletype”) output driver translates the output
          of troff(1) into a form suitable for typewriter-like devices,
          including terminal emulators.  Normally, grotty is invoked by
          groff(1) when the latter is given one of the -Tascii, -Tlatin1,
          or -Tutf8 options on systems using ISO character encoding
          standards, or with -Tcp1047 or -Tutf8 on EBCDIC-based hosts.  If
          no file arguments are given, or if file is “-”, grotty reads the
          standard input stream.  Output is written to the standard output
          stream.

          By default, grotty emits SGR escape sequences (from ISO 6429,
          popularly called “ANSI escapes”) to change text attributes (bold,
          italic, underline, reverse-video, and colors).  Devices
          supporting the appropriate sequences can view roff documents
          using eight different background and foreground colors.

          In keeping with long-standing practice and the rarity of
          terminals, hardware or emulated, that support oblique or italic
          fonts, italicized text is represented with underlining by
          default—but see the -i option below.

          Following ISO 6429, the following colors are defined in tty.tmac:
          black, white, red, green, blue, yellow, magenta, and cyan.
          Unrecognized colors are mapped to the default color, which is
          dependent on the settings of the terminal.

      SGR support in pagers
          When paging grotty's output with less(1), the latter program must
          be instructed to pass SGR sequences through to the device; its -R
          option is one way to achieve this.  Consequently, programs like
          man(1) which page roff documents with less must call it with an
          appopriate option.

      Legacy output format
          The -c option tells grotty to use an output format compatible
          with paper terminals, like the Teletype machines for which roff
          and nroff were first developed but which are no longer in wide
          use.  SGR escape sequences are not emitted.  Instead, grotty
          overstrikes, representing a bold character c with the sequence
          “c BACKSPACE c” an italic character c with the sequence
          “_ BACKSPACE c”, and bold italics with “_ BACKSPACE c
          BACKSPACE c”.  Furthermore, color output is disabled.  The same
          effect can be achieved either by setting the GROFF_NO_SGR
          environment variable or by using a groff escape sequence within
          the document; see subsection “Device control commands”, below.

          The legacy output format can be rendered on a video terminal (or
          emulator) by piping grotty's output through ul(1), which may
          render bold italics as reverse video.  Some implementations of
          more(1) are also able to display these sequences; you may wish to
          experiment with that command's -b option.  less renders legacy
          bold and italics without requiring options.  In contrast to the
          terminal output drivers of some other roff implementations,
          grotty never outputs reverse line feeds.  There is therefore no
          need to filter its output through col(1).

      Device control commands
          grotty understands a single device control function produced
          using the roff \X escape sequence in a document.

          \X'tty: sgr [n]'
                 If n is non-zero or missing, enable SGR sequences (this is
                 the default); otherwise, use the legacy output format.

      Device description files
          If DESC file for the character encoding contains the keyword
          “unicode”, grotty emits Unicode characters in UTF-8 encoding.
          Otherwise, it emits characters in a single-byte encoding
          depending on the data in the font description files.  See
          groff_font(5) for more details.

          A font description file may contain a command “internalname n”
          where n is a decimal integer.  If the 01 bit in n is set, then
          the font is treated as an italic font; if the 02 bit is set, then
          it is treated as a bold font.


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          -b     Suppress the use of overstriking for bold characters.
                 Ignored if -c isn't used.

          -B     Use only overstriking for bold-italic characters.  Ignored
                 if -c isn't used.

          -c     Use grotty's legacy output format (see subsection “Legacy
                 output format” above).

          -d     Ignore all \D roff escapes (draw commands).  By default,
                 grotty renders \D'l...' commands that have at least one
                 zero argument (and so are either horizontal or vertical)
                 using Unicode box drawing characters (for the “utf8”
                 device) or the -, |, and + characters (for all other
                 devices).  In a similar way, grotty handles \D'p...'
                 commands which consist entirely of horizontal and vertical
                 lines.

          -f     Use form feeds in the output.  A form feed is output at
                 the end of each page that has no output on its last line.

          -F dir Prepend directory dir/devname to the search path for font
                 and device description files; name describes the output
                 device's character encoding, one of ascii, latin1, utf8,
                 or cp1047.

          -h     Use literal horizontal tab characters in the output.  Tabs
                 are assumed to be set every 8 columns.

          -i     Render italic-styled text (fonts “I” and “BI”) with the
                 SGR attribute for italic text rather than underlined text.
                 Note that many terminals don't support this attribute;
                 however, xterm(1), since patch #314 (2014-12-28), does.
                 Ignored if -c is also specified.

          -o     Suppress overstriking (other than for bold and/or
                 underlined characters when the legacy output format is in
                 use).

          -r     Render italic-styled text (fonts “I” and “BI”) with the
                 SGR attribute for reverse-video text rather than
                 underlined text.  Ignored if -c or -i is also specified.

          -u     Suppress the use of underlining for italic characters.
                 Ignored if -c isn't used.

          -U     Use only underlining for bold-italic characters.  Ignored
                 if -c isn't used.


---------------------------------------------------------------

::

          GROFF_FONT_PATH
                 A list of directories in which to seek the selected output
                 device's directory of device and font description files.
                 See troff(1) and groff_font(5).

          GROFF_NO_SGR
                 If set, grotty's legacy output format is used; see
                 subsection “Legacy output format” above.


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/font/devascii/DESC
                 Device description file for the “ascii” device.

          /usr/local/share/groff/1.23.0/font/devascii/F
                 Font description file for font F of the “ascii” device.

          /usr/local/share/groff/1.23.0/font/devcp1047/DESC
                 Device description file for the “cp1047” device.

          /usr/local/share/groff/1.23.0/font/devcp1047/F
                 Font description file for font F of the “cp1047” device.

          /usr/local/share/groff/1.23.0/font/devlatin1/DESC
                 Device description file for the “latin1” device.

          /usr/local/share/groff/1.23.0/font/devlatin1/F
                 Font description file for font F of the “latin1” device.

          /usr/local/share/groff/1.23.0/font/devutf8/DESC
                 Device description file for the “utf8” device.

          /usr/local/share/groff/1.23.0/font/devutf8/F
                 Font description file for font F of the “utf8” device.

          /usr/local/share/groff/1.23.0/tmac/tty.tmac
                 Macros for use with grotty.

          /usr/local/share/groff/1.23.0/tmac/tty-char.tmac
                 Additional character definitions for use with grotty.


-------------------------------------------------

::

          grotty is intended only for simple documents.

          There is no support for fractional horizontal or vertical
          motions.

          There is no support for the roff \D escape sequence (draw
          command) other than horizontal and vertical lines.

          Characters above the first line (i.e., with a vertical position
          of 0) cannot be printed.

          Color handling differs from grops(1).  The groff \M escape
          sequence doesn't set the fill color for closed graphic objects
          (which grotty doesn't support anyway) but instead changes the
          background color of the character cell, affecting all subsequent
          operations.


-------------------------------------------------------

::

          The following groff document exercises several features, not all
          of which may be supported by a given output device: (1) bold
          style; (2) italic (underline) style; (3) bold-italic style;
          (4) character composition by overstriking (“coöperate”);
          (5) foreground color; (6) background color; and (7) horizontal
          and vertical line-drawing.

                 You might see \f[B]bold\f[] and \f[I]italic\f[].
                 Some people see \f[BI]both\f[].
                 If the output device does (not) co\z\[ad]operate,
                 you might see \m[red]red\m[].
                 Black on cyan can have a \M[cyan]\m[black]prominent\m[]\M[]
                 \D'l 1i 0'\D'l 0 2i'\D'l 1i 0' look.
                 .\" If in nroff mode, end page now.
                 .if n .pl \n[nl]u

          Compare and contrast the output of the following:

                 $ nroff file
                 $ groff -T ascii file
                 $ groff -T utf8 -Z file | grotty -i
                 $ groff -T utf8 -Z file | grotty -c | ul

          Note that the example file above is a “raw” groff document, not a
          man page.  Use of color escapes in man pages is strongly
          discouraged.  Some implementations of man(1) completely disable
          them.  See subsection “Portability” of groff_man_style(7) for
          guidance on writing man pages that are viewable by as many
          readers as possible.


---------------------------------------------------------

::

          “Control Functions for Coded Character Sets” (ECMA-48)
          5th edition, Ecma International, June 1991.  A gratis version of
          ISO 6429, this document includes a normative description of SGR
          escape sequences.  Available at 
          ⟨http://www.ecma-international.org/publications/files/ECMA-ST/
          Ecma-048.pdf⟩.

          groff(1), troff(1), groff_out(5), groff_font(5), groff_char(7),
          ul(1), more(1), less(1), man(1)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                    grotty(1)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__, 
`nroff(1) <../man1/nroff.1.html>`__, 
`groff_out(5) <../man5/groff_out.5.html>`__, 
`groff_char(7) <../man7/groff_char.7.html>`__

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
