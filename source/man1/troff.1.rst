.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

troff(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Warnings <#Warnings>`__ \|       |                                   |
| `Environment <#Environment>`__ \| |                                   |
| `Files <#Files>`__ \|             |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   troff(1)                 General Commands Manual                troff(1)


-------------------------------------------------

::

          troff - GNU roff typesetter and document formatter


---------------------------------------------------------

::

          troff [-abcCEiRUz] [-d cs] [-d name=string] [-f fam] [-F dir]
                [-I dir] [-m name] [-M dir] [-n num] [-o list] [-r cn]
                [-r reg=expr] [-T dev] [-w name] [-W name] [file ...]

          troff --help

          troff -v
          troff --version


---------------------------------------------------------------

::

          The GNU version of troff is the heart of the groff document
          formatting system.  troff is the groff system's formatter, the
          program that transforms roff language input into a device-
          independent output format.  It is functionally compatible with
          the AT&T troff typesetter and features numerous extensions.  Many
          people prefer to use the groff(1) command, a front end which also
          runs preprocessors and output drivers in the appropriate order
          and with appropriate options.


-------------------------------------------------------

::

          -a     Generate a plain text approximation of the typeset output.
                 The read-only register .A is set to 1.  This option
                 produces a sort of abstract preview of the formatted
                 output.

                 •      Page breaks are marked by a phrase in angle
                        brackets; for example, “<beginning of page>”.

                 •      Lines are broken where they would be in the
                        formatted output.

                 •      A horizontal motion of any size is represented as
                        one space.  Adjacent horizontal motions are not
                        combined.  Inter-sentence space nodes (those
                        arising from the second argument to the .ss
                        request) are not represented.

                 •      Vertical motions are not represented.

                 •      Special characters are rendered in angle brackets;
                        for example, the default soft hyphen character
                        appears as “<hy>”.

                 The above description should not be considered a
                 specification; the details of -a output are subject to
                 change.

          -b     Write a backtrace reporting the state of troff's input
                 parser to the standard error stream with each diagnostic
                 message.  The line numbers given in the backtrace might
                 not always be correct, because troff's idea of line
                 numbers can be confused by requests that append to strings
                 or macros.

          -c     Start with color output disabled.

          -C     Enable AT&T troff compatibility mode; implies -c.

          -d cs
          -d name=string
                 Define roff string c or name as s or string; c must be a
                 one-character name.  Due to getopt_long(3) limitations,
                 c cannot be and name cannot contain an equals sign, even
                 though that is a valid character in a roff identifier.

          -E     Inhibit troff error messages; implies -Ww.  This option
                 does not suppress messages sent to the standard error
                 stream by documents or macro packages using .tm or related
                 requests.

          -f fam Use fam as the default font family.

          -F dir Search in directory dir for the selected output device's
                 directory of device and font description files.  See the
                 description of GROFF_FONT_PATH in section “Environment”
                 below for the default search locations and ordering.

          -i     Read the standard input after all the named input files
                 have been processed.

          -I dir Search dir for input files (those on the command line,
                 those named in .psbb, .so, and .soquiet requests, and
                 those named in “\X'ps: import'”, “\X'ps: file'”, and
                 “\X'pdf: pdfpic'” escape sequences).  This option may be
                 specified more than once; the directories are then
                 searched in the order specified.  If you want to search
                 the current directory before others, add “-I .” at the
                 appropriate place.  The current working directory is
                 otherwise searched last.  -I works similarly to, and is
                 named for, the “include” option of Unix C compilers.  No
                 directory search is performed for files specified using an
                 absolute file name.

          -m name
                 Process name.tmac before any input files.  If name.tmac is
                 not found, tmac.name is attempted.  name (in both
                 arrangements) is presumed to be a macro file; see the
                 description of GROFF_TMAC_PATH in section “Environment”
                 below for the default search locations and ordering.

          -M dir Search directory dir for macro files.  See the description
                 of GROFF_TMAC_PATH in section “Environment” below for the
                 default search locations and ordering.

          -n num Number the first page num.

          -o list
                 Output only pages in list, which is a comma-separated list
                 of page ranges; n means print page n, m-n means print
                 every page between m and n, n, -n means print every page
                 up to n, and n- means print every page from n on.  troff
                 stops processing and exits after formatting the last page
                 enumerated in list.

          -r cn
          -r reg=n
                 Define roff register c or reg as groff numeric
                 expression n or expr; c must be a one-character name.  Due
                 to getopt_long(3) limitations, c cannot be and reg cannot
                 contain an equals sign, even though that is a valid
                 character in a roff identifier.

          -R     Don't load troffrc and troffrc-end.

          -T dev Prepare output for device dev, rather than the default,
                 “ps”; see groff(1).

          -U     Operate in unsafe mode, which enables the .open, .opena,
                 .pi, .pso, and .sy requests.  These requests are disabled
                 by default because they allow an untrusted input document
                 to write to arbitrary file names and run arbitrary
                 commands.  This option also adds the current directory to
                 the macro search path; see the -m option above.

          -w name
          -W name
                 Enable (-w) or inhibit (-W) emission of warnings in
                 category name.  See section “Warnings” below.

          -z     Suppress formatted output.


---------------------------------------------------------

::

          Warning diagnostics emitted by troff are divided into named,
          numbered categories.  The name associated with each warning
          category is used by the -w and -W options.  Each category is also
          assigned a power of two; the sum of enabled category codes is
          used by the warn request and the .warn register.  Warnings of
          each category are produced under the following circumstances.

                ┌──────────────────────┬─────────────────────────────┐
                │Bit   Code   Category │ Bit    Code      Category   │
                ├──────────────────────┼─────────────────────────────┤
                │  0      1   char     │  10      1024   reg         │
                │  1      2   number   │  11      2048   tab         │
                │  2      4   break    │  12      4096   right-brace │
                │  3      8   delim    │  13      8192   missing     │
                │  4     16   el       │  14     16384   input       │
                │  5     32   scale    │  15     32768   escape      │
                │  6     64   range    │  16     65536   space       │
                │  7    128   syntax   │  17    131072   font        │
                │  8    256   di       │  18    262144   ig          │
                │  9    512   mac      │  19    524288   color       │
                │                      │  20   1048576   file        │
                └──────────────────────┴─────────────────────────────┘
          break           4   When filling is enabled, a line could not be
                              broken such that its length was less than the
                              output line length \n[.l].  This is enabled
                              by default.

          char            1   An undefined glyph was requested for output.
                              (“char” is a misnomer since it reports
                              missing glyphs—there are no “missing” input
                              characters, only invalid ones.)  This
                              cateogry is enabled by default.

          color      524288   An undefined color was dereferenced, an
                              attempt was made to define a color using an
                              unrecognized color space, an invalid
                              component in a color definition was
                              encountered, or an attempt was made to
                              redefine the default color.

          delim           8   The closing delimiter in an escape sequence
                              was missing or mismatched.

          di            256   A di, da, box, or boxa request was invoked
                              without an argument when there was no current
                              diversion.

          el             16   The el request was encountered with no prior
                              corresponding ie request.

          escape      32768   An unsupported escape sequence was
                              encountered.  In such a sequence \X, the
                              escape character is ignored and X is output.

          file      1048576   An attempt was made to load a file that does
                              not exist.  This category is enabled by
                              default.

          font       131072   A non-existent font was dereferenced.  This
                              category is enabled by default.

          ig         262144   An invalid escape sequence occurred in input
                              ignored using the ig request.  This warning
                              category diagnoses a condition that is an
                              error when it occurs in non-ignored input.

          input       16384   An invalid character occurred on the input
                              stream.

          mac           512   An undefined string, macro, diversion, or box
                              was used.  When such an object is
                              dereferenced, an empty object of that name is
                              automatically created.  So, in most cases, at
                              most one warning is given for each name.

                              This warning is also emitted upon an attempt
                              to move an unplanted trap.  In such cases,
                              the unplanted macro is not dereferenced, so
                              it is not created if it does not exist.

          missing      8192   A request was invoked with a mandatory
                              argument absent.

          number          2   An invalid numeric expression was
                              encountered.  This category is enabled by
                              default.

          range          64   A numeric expression was out of range for its
                              context.

          reg          1024   An undefined register was used.  When an
                              undefined register is dereferenced, it is
                              automatically defined with a value of 0.  So,
                              in most cases, at most one warning is given
                              for each name.

          right-brace  4096   A right brace escape sequence \} was
                              encountered where a number was expected.

          scale          32   An inappropriate scaling indicator was used
                              in a numeric expression.

          space       65536   A space was missing between a request or
                              macro and its argument.  This warning is
                              produced when an undefined name longer than
                              two characters is encountered and the first
                              two characters of the name constitute a
                              defined name.  No request is invoked, no
                              macro called, and an empty macro is not
                              defined.  This category is enabled by
                              default.  It never occurs in compatibility
                              mode.

          syntax        128   A self-contradictory hyphenation mode was
                              requested; an empty or incomplete numeric
                              expression was encountered; an operand to a
                              numeric operator was missing; an attempt was
                              made to define a recursive, empty, or
                              nonsensical character class; or a groff
                              extension conditional expression operator was
                              used while in compatibility mode.

          tab          2048   A tab character was encountered where a
                              number was expected, or appeared in an
                              unquoted macro argument.

          Two warning names group other warning categories for convenience.

          all    All warning categories except di, mac, and reg.  This
                 shorthand is intended to produce all warnings that are
                 useful with macro packages written for AT&T troff and its
                 descendants, which have less fastidious diagnostics than
                 GNU troff.

          w      All warning categories.  Authors of documents and macro
                 packages targeting groff are encouraged to use this
                 setting.


---------------------------------------------------------------

::

          GROFF_FONT_PATH and GROFF_TMAC_PATH each accept a search path of
          directories; that is, a list of directory names separated by the
          system's path component separator character.  On Unix systems,
          this character is a colon (:); on Windows systems, it is a
          semicolon (;).

          GROFF_FONT_PATH
                 A list of directories in which to seek the selected output
                 device's directory of device and font description files.
                 troff will scan directories given as arguments to any
                 specified -F options before these, then in a site-specific
                 directory (/usr/local/share/groff/site-font), a standard
                 location (/usr/local/share/groff/1.23.0/font), and a
                 compatibility directory (/usr/lib/font) after them.

          GROFF_TMAC_PATH
                 A list of directories in which to search for macro files.
                 troff will scan directories given as arguments to any
                 specified -M options before these, then the current
                 directory (only if in unsafe mode), the user's home
                 directory, a platform-specific directory (/usr/local/lib/
                 groff/site-tmac), a site-specific directory (/usr/local/
                 share/groff/site-tmac), and a standard location (/usr/
                 local/share/groff/1.23.0/tmac) after them.

          GROFF_TYPESETTER
                 Set the default output device.  If empty or not set, “ps”
                 is used.  The -T option overrides GROFF_TYPESETTER.

          SOURCE_DATE_EPOCH
                 A timestamp (expressed as seconds since the Unix epoch) to
                 use as the creation timestamp in place of the current
                 time.  The time is converted to human-readable form using
                 ctime(3) when the formatter starts up and stored in
                 registers usable by documents and macro packages.

          TZ     The timezone to use when converting the current time (or
                 value of SOURCE_DATE_EPOCH) to human-readable form; see
                 tzset(3).


---------------------------------------------------

::

          /usr/local/share/groff/1.23.0/tmac/troffrc
                 is an initialization macro file loaded before any macro
                 packages specified with -m options.

          /usr/local/share/groff/1.23.0/tmac/troffrc-end
                 is an initialization macro file loaded after all macro
                 packages specified with -m options.

          /usr/local/share/groff/1.23.0/tmac/name.tmac
          /usr/local/share/groff/1.23.0/tmac/tmac.name
                 are macro files distributed with groff.

          /usr/local/share/groff/1.23.0/font/devname/DESC
                 describes the output device name.

          /usr/local/share/groff/1.23.0/font/devname/F
                 describes the font F of device name.

          troffrc and troffrc-end are sought neither in the current nor the
          home directory by default for security reasons, even if the -U
          option is specified.  Use the -M command-line option or the
          GROFF_TMAC_PATH environment variable to add these directories to
          the search path if necessary.


-------------------------------------------------------

::

          The GNU version of troff was originally written by James Clark;
          he also wrote the original version of this document, which was
          updated by Werner Lemberg ⟨wl@gnu.org⟩, Bernd Warken ⟨groff-bernd
          .warken-72@web.de⟩, and G. Branden Robinson ⟨g.branden.robinson@
          gmail.com⟩.


---------------------------------------------------------

::

          Groff: The GNU Implementation of troff, by Trent A. Fisher and
          Werner Lemberg, is the primary groff manual.  You can browse it
          interactively with “info groff”.

          groff(1)
                 offers an overview of the GNU roff system and describes
                 its front end executable.

          groff(7)
                 details the groff language, including a short but complete
                 reference of all predefined requests, registers, and
                 escape sequences.

          groff_char(7)
                 explains the syntax of groff special character escape
                 sequences, and lists all special characters predefined by
                 the language.

          groff_diff(7)
                 enumerates the differences between AT&T device-independent
                 troff and groff.

          groff_font(5)
                 covers the format of groff device and font description
                 files.

          groff_out(5)
                 describes the format of troff's output.

          groff_tmac(5)
                 includes information about macro files that ship with
                 groff.

          roff(7)
                 supplies background on roff systems in general, including
                 pointers to further related documentation.

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

   groff 1.23.0.rc1.1101-d1263-di2r6tyAugust 2021                     troff(1)

--------------

Pages that refer to this page: `colcrt(1) <../man1/colcrt.1.html>`__, 
`groffer(1) <../man1/groffer.1.html>`__, 
`grops(1) <../man1/grops.1.html>`__,  `man(1) <../man1/man.1.html>`__, 
`zsoelim(1) <../man1/zsoelim.1.html>`__, 
`groff_char(7) <../man7/groff_char.7.html>`__, 
`groff_trace(7) <../man7/groff_trace.7.html>`__, 
`roff(7) <../man7/roff.7.html>`__

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
