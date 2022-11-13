.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

groff(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Usage <#Usage>`__ \|             |                                   |
| `Environment <#Environment>`__ \| |                                   |
| `Examples <#Examples>`__ \|       |                                   |
| `Notes <#Notes>`__ \|             |                                   |
| `Bugs <#Bugs>`__ \|               |                                   |
| `Installation directori           |                                   |
| es <#Installation_directories>`__ |                                   |
| \|                                |                                   |
| `Availability <#Availability>`__  |                                   |
| \| `Authors <#Authors>`__ \|      |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   groff(1)                 General Commands Manual                groff(1)


-------------------------------------------------

::

          groff - front end to the GNU roff document formatting system


---------------------------------------------------------

::

          groff [-abcCeEgGijklNpRsStUVXzZ] [-d cs] [-d name=string]
                [-D enc] [-f fam] [-F dir] [-I dir] [-K enc] [-L arg]
                [-m name] [-M dir] [-n num] [-o list] [-P arg] [-r cn]
                [-r reg=expr] [-T dev] [-w name] [-W name] [file ...]

          groff -h
          groff --help

          groff -v [option ...] [file ...]
          groff --version [option ...] [file ...]


---------------------------------------------------------------

::

          groff is the primary front end to the GNU roff document
          formatting system.  GNU roff transforms text input files into
          typeset output in a variety of formats, such as PDF and HTML.  It
          is also used to format man pages for viewing on terminals.  The
          groff command orchestrates the execution of preprocessors, the
          loading of macro packages, the formatting of input documents, and
          the production of output appropriate to a variety of hardware
          devices and file formats.


-------------------------------------------------------

::

          -h and --help display a usage message and exit.

          Because groff is intended to subsume most users' direct
          invocations of the troff(1) formatter, the two programs share a
          set of options.  However, groff has some options that troff does
          not share, and others which groff interprets differently.  At the
          same time, not all valid troff options can be given to groff.

      groff-specific options
          The following options either do not exist for troff or are
          interpreted differently by groff.

          -D enc Set default input encoding used by preconv(1) to enc;
                 implies -k.

          -e     Run eqn(1) preprocessor.

          -g     Run grn(1) preprocessor.

          -G     Run grap(1) preprocessor; implies -p.

          -I dir Works as troff's option (see below), but also implies -s
                 and is passed to soelim(1).

          -j     Run chem(1) preprocessor; implies -p.

          -k     Run preconv(1), which is run before any other
                 preprocessor.  Please refer to preconv's manual page for
                 its behavior if neither of groff's -K or -D options is
                 also specified.

          -K enc Set input encoding used by preconv(1) to enc; implies -k.

          -l     Send the output to a spooler program for printing.  The
                 “print” directive in the device description file specifies
                 the default command to be used; see groff_font(5).  If no
                 such directive is present for the output device, output is
                 piped to lpr(1).  See options -L and -X.

          -L arg Pass arg to the print spooler program.  If multiple args
                 are required, each should be passed with a separate -L
                 option.  groff does not prepend “-” (a minus sign) to arg
                 before passing it to the spooler program.

          -N     Don't allow newlines within eqn delimiters.  This is the
                 same as the -N option in eqn(1).

          -p     Run pic(1) preprocessor.

          -P arg Pass arg to the postprocessor.  If multiple args are
                 required, each should be passed with a separate -P option.
                 groff does not prepend “-” (a minus sign) to arg before
                 passing it to the postprocessor.

          -R     Run refer(1) preprocessor.  No mechanism is provided for
                 passing arguments to refer because most refer options have
                 equivalent language elements that can be specified within
                 the document; see refer(1).

          -s     Run soelim(1) preprocessor.

          -S     Operate in “safer” mode; see -U below for its opposite.
                 For security reasons, safer mode is enabled by default.

          -t     Run tbl(1) preprocessor.

          -T dev Direct troff to format the input for the device dev.
                 groff then calls a postprocessor to convert troff's output
                 to a format appropriate for dev.  See subsection “Devices”
                 below.

          -U     Operate in unsafe mode; see -S.  Pass the -U option to pic
                 and troff.

          -v
          --version
                 Write version information of groff and of all programs run
                 by it to the standard output stream; that is, the given
                 command line is processed in the usual way, passing -v to
                 the formatter and any pre- or postprocessors invoked.

          -V     Output the pipeline that would be run by groff (as a
                 wrapper program) to the standard output stream, but do not
                 execute it.  If given more than once, the pipeline is both
                 written to the standard error stream and run.

          -X     Use gxditview(1) instead of the usual postprocessor to
                 (pre)view a document on an X11 display.

          -Z     Disable postprocessing.  troff output will appear on the
                 standard output stream (unless suppressed with -z); see
                 groff_out(5) for a description of this format.

      Transparent options
          The following options are passed as-is to the formatter program
          troff(1), and described in more detail in its man page.

          -a     Generate a plain text approximation of the typeset output.

          -b     Write a backtrace to the standard error stream on each
                 error or warning.

          -c     Start with color output disabled.

          -C     Enable AT&T troff compatibility mode; implies -c.

          -d cs
          -d name=string
                 Define string.

          -E     Inhibit troff error messages; implies -Ww.

          -f fam Set default font family.

          -F dir Search in directory dir for the selected output device's
                 directory of device and font description files.

          -i     Process standard input after the specified input files.

          -I dir Search dir for input files.

          -m name
                 Process name.tmac before any input files.

          -M dir Search directory dir for macro files.

          -n num Number the first page num.

          -o list
                 Output only pages in list.

          -r cn
          -r reg=expr
                 Define register.

          -w name
          -W name
                 Enable (-w) or inhibit (-W) emission of warnings in
                 category name.

          -z     Suppress formatted device-independent output of troff.


---------------------------------------------------

::

          The architecture of the GNU roff system follows that of other
          device-independent roff implementations, comprising
          preprocessors, macro packages, output drivers (or
          “postprocessors”), a suite of utilities, and the formatter troff
          at its heart.  See roff(7) for a survey of how a roff system
          works.

          The front end programs available in the GNU roff system make it
          easier to use than traditional roffs that required the
          construction of pipelines or use of temporary files to carry a
          source document from maintainable form to device-ready output.
          The discussion below summarizes the constituent parts of the GNU
          roff system.  It complements roff(7) with groff-specific
          information.

      Getting started
          Those who prefer to learn by experimenting or are desirous of
          rapid feedback from the system may wish to start with a “Hello,
          world!” document.

          $ echo "Hello, world!" | groff -Tascii | sed '/^$/d'
          Hello, world!

          We used a sed command only to eliminate the 65 blank lines that
          would otherwise flood the terminal screen.  (roff systems were
          developed in the days of paper-based terminals with 66 lines to a
          page.)

          Today's users may prefer output to a UTF-8-capable terminal.

          $ echo "Hello, world!" | groff -Tutf8 | sed '/^$/d'

          Producing PDF, HTML, or TeX's DVI is also straightforward.  The
          hard part may be selecting a viewer program for the output.

          $ echo "Hello, world!" | groff -Tpdf > hello.pdf
          $ evince hello.pdf
          $ echo "Hello, world!" | groff -Thtml > hello.html
          $ firefox hello.html
          $ echo "Hello, world!" | groff -Tdvi > hello.dvi
          $ xdvi hello.html

      Using groff as a REPL
          Those with a programmer's bent may be pleased to know that they
          can use groff in a read-evaluate-print loop (REPL).  Doing so can
          be handy to verify one's understanding of the formatter's
          behavior and/or the syntax it accepts.  Turning on all warnings
          with -ww can aid this goal.

          $ groff -ww -Tutf8
          \# This is a comment. Let's define a register.
          .nr a 1
          \# Do integer arithmetic with operators evaluated left-to-right.
          .nr b \n[a]+5/2
          \# Let's get the result on the standard error stream.
          .tm \n[b]
          3
          \# Now we'll define a string.
          .ds name Leslie\" This is another form of comment.
          .nr b (\n[a] + (7/2))
          \# Center the next two text input lines.
          .ce 2
          Hi, \*[name].
          Your secret number is \n[b].
          \# We will see that the division rounded toward zero.
          It is
          \# Here's an if-else control structure.
          .ie (\n[b] % 2) odd.
          .el even.
          \# This trick sets the page length to the current vertical
          \# position, so that blank lines don't spew when we're done.
          .pl \n[nl]u
          <Control-D>
                                     Hi, Leslie.
                              Your secret number is 4.
          It is even.

      Paper size
          In groff, the page dimensions for the formatter troff and for
          output devices are handled separately.  In the formatter,
          requests are used to set the page length (.pl), page offset (or
          left margin, .po), and line length (.ll).  The right margin is
          not explicitly configured; the combination of page offset and
          line length provides the information necessary to derive it.  The
          papersize macro package, automatically loaded by troffrc at
          start-up, provides an interface for configuring page dimensions
          by convenient names, like “letter” or “A4”; see groff_tmac(5).
          The default used by the formatter depends on its build
          configuration, but is usually one of the foregoing, as
          geographically appropriate.

          It is up to each macro package to respect the page dimensions
          configured in this way.  Some offer alternative mechanisms.

          For each output driver, the size of the output medium can be set
          in its DESC file.  Most also recognize a command-line option -p
          to override the default dimensions and an option -l to use
          landscape orientation.  See groff_font(5) for a description of
          the papersize directive, which takes an argument of the same form
          as -p.  The output driver's man page, such as grops(1), may also
          be helpful.  groff uses the command-line option -P to pass
          options to output devices; for example, use the following for
          PostScript output on A4 paper in landscape orientation.

                 groff -Tps -dpaper=a4l -P-pa4 -P-l -ms foo.ms > foo.ps

      Front end
          The groff program is a wrapper around the troff(1) program.  It
          allows one to specify preprocessors via command-line options and
          automatically runs the appropriate postprocessor for the selected
          output device.  Doing so, the manual construction of pipelines or
          management of temporary files required of users of traditional
          roff(7) systems can be avoided.  The grog(1) program can be used
          to infer an appropriate groff command line to format a document.

      Language
          Input to a roff system is in plain text interleaved with control
          lines and escape sequences.  The combination constitutes a
          document in one of a family of languages we also call roff; see
          roff(7) for background.  An overview of GNU roff language syntax
          and features, including lists of all supported escape sequences,
          requests, and pre-defined registers, can be found in groff(7).
          groff extensions to the AT&T troff language, a common subset of
          roff dialects extant today, are detailed in groff_diff(7).

      Preprocessors
          A preprocessor is an interpreter of a domain-specific language
          that produces roff language output.  Frequently, such input is
          confined to sections or regions of a roff input file (bracketed
          with macro calls specific to each preprocessor), which it
          replaces.  Preprocessors therefore often interpret a subset of
          roff syntax along with their own language.  GNU roff provides
          reimplementations of most preprocessors familiar to users of AT&T
          troff; these routinely have extended features and/or require GNU
          troff to format their output.  Preprocessors distributed with GNU
          roff include

                 eqn(1) for mathematical formulae,

                 grn(1) for pictures in gremlin(1) format,

                 pic(1) for diagrams,

                 chem(1)
                        for chemical structure diagrams,

                 refer(1)
                        for bibliographic references,

                 soelim(1)
                        to preprocess files included with roff .so
                        requests, and

                 tbl(1) for tables.

          A preprocessor unique to GNU roff is preconv(1), which converts
          various input encodings to something GNU troff can understand.
          When used, it is run before any other preprocessors.

      Macro packages
          Macro files are roff input files designed to produce no output
          themselves but instead ease the preparation of other roff
          documents.  When a macro file is installed at a standard location
          and suitable for use by a general audience, it is termed a macro
          package.

          Macro packages can be loaded prior to any roff input documents
          with the -m option.  The groff system implements most well-known
          macro packages for AT&T troff in a compatible way, extends them,
          and adds some packages of its own.  Several of them have one- or
          two-letter names due to the intense sense of naming economy
          practiced in early Unix culture.  This laconic approach led to
          many of the packages being identified in general usage with the
          nroff and troff option letter used to invoke them, sometimes to
          punning effect, as with “man” (short for “manual”), and even with
          the option dash, as in the case of the s package, much better
          known as ms or even -ms.

          Macro packages serve a variety of purposes.  Some are “full-
          service” packages, adopting responsibility for page layout among
          other fundamental tasks, and defining their own lexicon of macros
          for document composition; each such package stands alone and a
          given document can use at most one.  GNU roff provides the
          following such packages.

          an     is used to compose man pages in the format originating in
                 Version 7 Unix (1979); see groff_man(7).  It can be
                 specified on the command line as -man.

          doc    is used to compose man pages in the format originating in
                 4.3BSD-Reno (1990); see groff_mdoc(7).  It can be
                 specified on the command line as -mdoc.

          e      is the Berkeley general-purpose macro suite, developed as
                 an alternative to AT&T's s; see groff_me(7).  It can be
                 specified on the command line as -me.

          m      implements the format used by the second-generation AT&T
                 macro suite for general documents, a successor to s; see
                 groff_mm(7).  It can be specified on the command line as
                 -mm.

          om     (invariably called “mom”) is a modern package written by
                 Peter Schaffter specifically for groff.  Consult the mom
                 home page ⟨https://www.schaffter.ca/mom/⟩ for extensive
                 documentation.  She—for mom takes the female pronoun—can
                 be specified on the command line as -mom.

          s      is the original AT&T general-purpose document format; see
                 groff_ms(7).  It can be specified on the command line as
                 -ms.

          Others are supplemental.  For instance, andoc is a wrapper
          package specific to groff that recognizes whether a document uses
          man or mdoc format and loads the corresponding macro package.  It
          can be specified on the command line as -mandoc.  A man(1)
          librarian program may use this macro file to delegate loading of
          the correct macro package; it is thus unnecessary for man itself
          to scan the contents of a document to decide the issue.

          Many macro files augment the function of the full-service
          packages, or of roff documents that do not employ such a package—
          the latter are sometimes characterized as “raw”.  These auxiliary
          packages are described, along with details of macro file naming
          and placement, in groff_tmac(5).

      Formatters
          The central roff formatter within the groff system is troff(1).
          It provides the features of both the classical troff and nroff,
          as well as the groff extensions.  The command-line option -C
          switches troff into compatibility mode which tries to emulate
          classical roff as much as possible.

          There is a shell script nroff(1) that emulates the behavior of
          classical nroff.  It tries to automatically select the proper
          output encoding, according to the current locale.

          The formatter program generates a device-independent, but not
          device-agnostic, intermediate output format, documented in
          groff_out(5).

      Devices
          Real devices in groff are

                        dvi    TeX DVI format (postprocessor is grodvi(1)).

                        html
                        xhtml  HTML and XHTML output (preprocessors are
                               soelim and pre-grohtml, postprocessor is
                               post-grohtml).

                        lbp    Canon CAPSL printers (LBP-4 and LBP-8 series
                               laser printers; postprocessor is grolbp(1)).

                        lj4    HP LaserJet4-compatible (or other
                               PCL5-compatible) printers (postprocessor is
                               grolj4(1)).

                        ps     PostScript output (postprocessor is
                               grops(1)).

                        pdf    Portable Document Format (PDF) output
                               (postprocessor is gropdf(1)).

                 For the following TTY output devices (where postprocessor
                 is grotty(1)), -T selects the output encoding:

                        ascii  ISO 646 1991:IRV, also known as US-ASCII.

                        cp1047 IBM code page 1047, an EBCDIC arrangement of
                               ISO Latin-1.

                        latin1 ISO Latin-1 (ISO 8859-1).

                        utf8   ISO 10646 (“Unicode”) character set in UTF-8
                               encoding.  This encoding has the largest
                               character repertoire, so it is the best
                               choice for terminal output.

                 The following arguments select gxditview as the
                 postprocessor.

                        X75    75dpi resolution, 10pt document base font.

                        X75-12 75dpi resolution, 12pt document base font.

                        X100   100dpi resolution, 10pt document base font.

                        X100-12
                               100dpi resolution, 12pt document base font.

                 The default device is ps.  In roff, the output targets are
                 called devices.  A device can be a piece of hardware,
                 e.g., a printer, or a software file format.  A device is
                 specified by the option -T.  The groff devices are as
                 follows.

          ascii  Text output using the ascii(7) character set.

          cp1047 Text output using the EBCDIC code page IBM cp1047 (e.g.,
                 OS/390 Unix).

          dvi    TeX DVI format.

          html   HTML output.

          latin1 Text output using the ISO Latin-1 (ISO 8859-1) character
                 set; see iso_8859_1(7).

          lbp    Output for Canon CAPSL printers (LBP-4 and LBP-8 series
                 laser printers).

          lj4    HP LaserJet4-compatible (or other PCL5-compatible)
                 printers.

          ps     PostScript output; suitable for printers and previewers
                 like gv(1).

          pdf    PDF files; suitable for viewing with tools such as
                 evince(1) and okular(1).

          utf8   Text output using the Unicode (ISO 10646) character set
                 with UTF-8 encoding; see unicode(7).

          xhtml  XHTML output.

          X75    75dpi X Window System output suitable for the previewers
                 xditview(1x) and gxditview(1).  A variant for a 12pt
                 document base font is X75-12.

          X100   100dpi X Window System output suitable for the previewers
                 xditview(1x) and gxditview(1).  A variant for a 12pt
                 document base font is X100-12.

          The postprocessor to be used for a device is specified by the
          postpro directive in the device description file; see
          groff_font(5).  This can be overridden with the -X option.

          The default device is ps.

      Postprocessors
          groff provides 3 hardware postprocessors:

          grolbp(1)
                 for some Canon printers,

          grolj4(1)
                 for printers compatible to the HP LaserJet 4 and PCL5,

          grotty(1)
                 for text output using various encodings, e.g., on text-
                 oriented terminals or line printers.

          Today, most printing or drawing hardware is handled by the
          operating system, by device drivers, or by software interfaces,
          usually accepting PostScript.  Consequently, there isn't an
          urgent need for more hardware device postprocessors.

          The groff software devices for conversion into other document
          file formats are

          grodvi(1)
                 for the DVI format,

          grohtml(1)
                 for HTML and XHTML formats,

          grops(1)
                 for PostScript.

          gropdf(1)
                 for PDF.

          Combined with the many existing free conversion tools this should
          be sufficient to convert a troff document into virtually any
          existing data format.

      Utilities
          The following utility programs around groff are available.

          addftinfo(1)
                 Add information to troff font description files for use
                 with groff.

          afmtodit(1)
                 Create font description files for PostScript device.

          eqn2graph(1)
                 Convert an eqn image into a cropped image.

          gdiffmk(1)
                 Mark differences between groff, nroff, or troff files.

          grap2graph(1)
                 Convert a grap diagram into a cropped bitmap image.

          gxditview(1)
                 The groff X viewer, the GNU version of xditview.

          hpftodit(1)
                 Create font description files for lj4 device.

          indxbib(1)
                 Make inverted index for bibliographic databases.

          lkbib(1)
                 Search bibliographic databases.

          lookbib(1)
                 Interactively search bibliographic databases.

          pdfroff(1)
                 Create PDF documents using groff.

          pfbtops(1)
                 Translate a PostScript font in .pfb format to ASCII.

          pic2graph(1)
                 Convert a pic diagram into a cropped image.

          tfmtodit(1)
                 Create font description files for TeX DVI device.

          xditview(1x)
                 roff viewer historically distributed with the X Window
                 System.

          xtotroff(1)
                 Convert X font metrics into GNU troff font metrics.


---------------------------------------------------------------

::

          Normally, the path separator in the following environment
          variables is the colon; this may vary depending on the operating
          system.  For example, DOS and Windows use a semicolon instead.

          GROFF_BIN_PATH
                 This search path, followed by PATH, is used for commands
                 that are executed by groff.  If it is not set then the
                 directory where the groff binaries were installed is
                 prepended to PATH.

          GROFF_COMMAND_PREFIX
                 When there is a need to run different roff implementations
                 at the same time groff provides the facility to prepend a
                 prefix to most of its programs that could provoke name
                 clashings at run time (default is to have none).
                 Historically, this prefix was the character g, but it can
                 be anything.  For example, gtroff stood for groff's troff,
                 gtbl for the groff version of tbl.  By setting
                 GROFF_COMMAND_PREFIX to different values, the different
                 roff installations can be addressed.  More exactly, if it
                 is set to prefix xxx then groff as a wrapper program
                 internally calls xxxtroff instead of troff.  This also
                 applies to the preprocessors eqn, grn, pic, refer, tbl,
                 soelim, and to the utilities indxbib and lookbib.  This
                 feature does not apply to any programs different from the
                 ones above (most notably groff itself) since they are
                 unique to the groff package.

          GROFF_ENCODING
                 The value of this environment value is passed to the
                 preconv preprocessor to select the encoding of input
                 files.  Setting this option implies groff's command-line
                 option -k (this is, groff actually always calls preconv).
                 If set without a value, groff calls preconv without
                 arguments.  An explicit -K command-line option overrides
                 the value of GROFF_ENCODING.  See preconv(1) for details.

          GROFF_FONT_PATH
                 A list of directories in which to seek the selected output
                 device's directory of device and font description files.
                 See troff(1) and groff_font(5).

          GROFF_TMAC_PATH
                 A list of directories in which to seek macro files.  See
                 troff(1) and groff_tmac(5).

          GROFF_TMPDIR
                 The directory in which temporary files are created.  If
                 not set, but the environment variable TMPDIR is set,
                 temporary files are created there instead.  On MS-DOS and
                 Windows platforms, if neither of the foregoing are set,
                 the environment variables TMP and TEMP (in that order) are
                 checked also.  Otherwise, temporary files are created in
                 /tmp.  The refer(1), grohtml(1), and grops(1) commands use
                 temporary files.

          GROFF_TYPESETTER
                 Set the default output device.  If empty or not set, “ps”
                 is used.  The -T option overrides GROFF_TYPESETTER.

          SOURCE_DATE_EPOCH
                 A timestamp (expressed as seconds since the Unix epoch) to
                 use as the creation timestamp in place of the current
                 time.  The time is converted to human-readable form using
                 ctime(3) when the formatter starts up and stored in
                 registers usable by documents and macro packages.

          TZ     The time zone to use when converting the current time (or
                 value of SOURCE_DATE_EPOCH) to human-readable form; see
                 tzset(3).


---------------------------------------------------------

::

          roff systems are best known for formatting man pages.  Once it is
          has located a man page, a man(1) librarian program may execute a
          groff command much like the following, constructing a pipeline to
          page the output.

                 groff -t -man /usr/share/man/man1/groff.1.man | less -R

          To process a roff input file using the preprocessors tbl and pic
          and the me macro package in the way to which AT&T troff users
          were accustomed, one would type (or script) a pipeline.

                 pic foo.me | tbl | troff -me -Tutf8 | grotty

          Using groff, this pipe can be shortened to the equivalent command

                 groff -p -t -me -T utf8 foo.me

          An even easier way to do this is to use grog(1) to guess the
          preprocessor and macro options and execute the result by using
          the command substitution feature of the shell.

                 $(grog -Tutf8 foo.me)

          Each command-line option to a postprocessor must be specified
          with any required leading dashes “-” because groff passes the
          arguments as-is to the postprocessor; this permits arbitrary
          arguments to be transmitted.  For example, to pass a title to the
          gxditview postprocessor, the shell commands
                 groff -X -P -title -P 'trial run' mydoc.t
          and
                 groff -X -Z mydoc.t | gxditview -title 'trial run' -
          are equivalent.


---------------------------------------------------

::

          When paging output for the “ascii”, “cp1047”, “latin1”, and
          “utf8” devices, programs like more(1) and less(1) may require
          command-line options to correctly handle some output sequences;
          see grotty(1).


-------------------------------------------------

::

          On EBCDIC hosts (e.g., OS/390 Unix), output devices ascii and
          latin1 aren't available.  Similarly, output for EBCDIC code page
          cp1047 is not available on ASCII based operating systems.


-----------------------------------------------------------------------------------------

::

          groff installs files in varying locations depending on its
          compile-time configuration.  On this installation, the following
          locations are used.

          Application defaults directory for
                 gxditview(1).

          /usr/local/bin
                 Directory containing groff's executable commands.

          /usr/local/share/groff/1.23.0/eign
                 List of common words for indxbib(1).

          /usr/local/share/groff/1.23.0
                 Directory for data files.

          /usr/dict/papers/Ind
                 Default index for lkbib(1) and refer(1).

          /usr/local/share/doc/groff-1.23.0
                 Documentation directory.

          /usr/local/share/doc/groff-1.23.0/examples
                 Example directory.

          /usr/local/share/groff/1.23.0/font
                 Font directory.

          /usr/local/share/doc/groff-1.23.0/html
                 HTML documentation directory.

          /usr/lib/font
                 Legacy font directory.

          /usr/local/share/groff/site-font
                 Local font directory.

          /usr/local/share/groff/site-tmac
                 Local macro package (tmac file) directory.

          /usr/local/share/groff/1.23.0/tmac
                 Macro package (tmac file) directory.

          /usr/local/share/groff/1.23.0/oldfont
                 Font directory for compatibility with old versions of
                 groff; see grops(1).

          /usr/local/share/doc/groff-1.23.0/pdf
                 PDF documentation directory.

          /usr/local/lib/groff/site-tmac
                 System macro package (tmac file) directory.

      groff macro directory
          This contains all information related to macro packages.  Note
          that more than a single directory is searched for those files as
          documented in groff_tmac(5).  For the groff installation
          corresponding to this document, it is located at /usr/local/
          share/groff/1.23.0/tmac.  The following files contained in the
          groff macro directory have a special meaning:

          troffrc
                 Initialization file for troff.  This is interpreted by
                 troff before reading the macro sets and any input.

          troffrc-end
                 Final startup file for troff.  It is parsed after all
                 macro sets have been read.

          name.tmac
          tmac.name
                 Macro file for macro package name.

      groff font directory
          This contains all information related to output devices.  Note
          that more than a single directory is searched for those files;
          see troff(1).  For the groff installation corresponding to this
          document, it is located at /usr/local/share/groff/1.23.0/font.
          The following files contained in the groff font directory have a
          special meaning:

          devname/DESC
                 Device description file for device name, see
                 groff_font(5).

          devname/F
                 Font file for font F of device name.


-----------------------------------------------------------------

::

          Information on how to get groff and related information is
          available at the groff page of the GNU website 
          ⟨http://www.gnu.org/software/groff⟩.

          Three groff mailing lists are available:

                 bug tracker activity (read-only) ⟨bug-groff@gnu.org⟩;

                 general discussion ⟨groff@gnu.org⟩; and

                 commit activity (read-only) ⟨groff-commit@gnu.org⟩, which
                 reports changes to groff's source code repository by its
                 developers.

          Details on repository access and much more can be found in the
          file README at the top directory of the groff source package.

          A free implementation of the grap preprocessor, written by Ted
          Faber ⟨faber@lunabase.org⟩, can be found at the grap website 
          ⟨http://www.lunabase.org/~faber/Vault/software/grap/⟩.  This is
          the only grap supported by groff.


-------------------------------------------------------

::

          groff was written by James Clark ⟨jjc@jclark.com⟩.  This document
          was rewritten, enhanced, and put under the GNU FDL license in
          2002 by Bernd Warken ⟨groff-bernd.warken-72@web.de⟩.


---------------------------------------------------------

::

          Groff: The GNU Implementation of troff, by Trent A. Fisher and
          Werner Lemberg, is the primary groff manual.  You can browse it
          interactively with “info groff”.

          Introduction, history, and further reading:
                 roff(7), ditroff(7)

          Viewer for groff (and AT&T device-independent) troff documents:
                 gxditview(1)

          Preprocessors:
                 chem(1), eqn(1), neqn(1), glilypond(1), grn(1),
                 preconv(1), gperl(1), pic(1), gpinyin(1), refer(1),
                 soelim(1), tbl(1)

          Macro packages and macro-specific utilities:
                 groff_hdtbl(7), groff_man(7), groff_man_style(7),
                 groff_mdoc(7), groff_me(7), groff_mm(7), groff_mmse(7),
                 mmroff(1), groff_mom(7), pdfmom(1), groff_ms(7),
                 groff_rfc1345(7), groff_trace(7), groff_www(7)

          Bibliographic and index tools:
                 indxbib(1), lkbib(1), lookbib(1)

          Language, conventions, and GNU extensions:
                 groff(7), groff_char(7), groff_diff(7),
                 groff_filenames(5), groff_font(5), groff_tmac(5)

          Intermediate output language:
                 groff_out(5)

          Formatter program:
                 troff(1)

          Formatter wrappers:
                 nroff(1), pdfroff(1)

          Postprocessors for output devices:
                 grodvi(1), grohtml(1), grolbp(1), grolj4(1), lj4_font(5),
                 gropdf(1), grops(1), grotty(1)

          Font support utilities:
                 addftinfo(1), afmtodit(1), hpftodit(1), pfbtops(1),
                 tfmtodit(1), xtotroff(1)

          Graphics conversion utilities:
                 eqn2graph(1), grap2graph(1), pic2graph(1)

          Difference-marking utility:
                 gdiffmk(1)

          “groff guess” utility:
                 grog(1)

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

   groff 1.23.0.rc1.1101-d1263-di2r6tyAugust 2021                     groff(1)

--------------

Pages that refer to this page:
`addftinfo(1) <../man1/addftinfo.1.html>`__, 
`afmtodit(1) <../man1/afmtodit.1.html>`__, 
`chem(1) <../man1/chem.1.html>`__,  `eqn(1) <../man1/eqn.1.html>`__, 
`eqn2graph(1) <../man1/eqn2graph.1.html>`__, 
`gdiffmk(1) <../man1/gdiffmk.1.html>`__, 
`glilypond(1) <../man1/glilypond.1.html>`__, 
`gperl(1) <../man1/gperl.1.html>`__, 
`gpinyin(1) <../man1/gpinyin.1.html>`__, 
`grap2graph(1) <../man1/grap2graph.1.html>`__, 
`grn(1) <../man1/grn.1.html>`__, 
`grodvi(1) <../man1/grodvi.1.html>`__, 
`groffer(1) <../man1/groffer.1.html>`__, 
`grog(1) <../man1/grog.1.html>`__, 
`grohtml(1) <../man1/grohtml.1.html>`__, 
`grolbp(1) <../man1/grolbp.1.html>`__, 
`grolj4(1) <../man1/grolj4.1.html>`__, 
`gropdf(1) <../man1/gropdf.1.html>`__, 
`grops(1) <../man1/grops.1.html>`__, 
`grotty(1) <../man1/grotty.1.html>`__, 
`hpftodit(1) <../man1/hpftodit.1.html>`__, 
`man(1) <../man1/man.1.html>`__, 
`mmroff(1) <../man1/mmroff.1.html>`__, 
`nroff(1) <../man1/nroff.1.html>`__, 
`pdfmom(1) <../man1/pdfmom.1.html>`__, 
`pdfroff(1) <../man1/pdfroff.1.html>`__, 
`pfbtops(1) <../man1/pfbtops.1.html>`__, 
`pic(1) <../man1/pic.1.html>`__, 
`pic2graph(1) <../man1/pic2graph.1.html>`__, 
`preconv(1) <../man1/preconv.1.html>`__, 
`refer(1) <../man1/refer.1.html>`__, 
`roff2dvi(1) <../man1/roff2dvi.1.html>`__, 
`roff2html(1) <../man1/roff2html.1.html>`__, 
`roff2pdf(1) <../man1/roff2pdf.1.html>`__, 
`roff2ps(1) <../man1/roff2ps.1.html>`__, 
`roff2text(1) <../man1/roff2text.1.html>`__, 
`roff2x(1) <../man1/roff2x.1.html>`__, 
`soelim(1) <../man1/soelim.1.html>`__, 
`tbl(1) <../man1/tbl.1.html>`__, 
`tfmtodit(1) <../man1/tfmtodit.1.html>`__, 
`troff(1) <../man1/troff.1.html>`__, 
`zsoelim(1) <../man1/zsoelim.1.html>`__, 
`groff_font(5) <../man5/groff_font.5.html>`__, 
`groff_out(5) <../man5/groff_out.5.html>`__, 
`groff_tmac(5) <../man5/groff_tmac.5.html>`__, 
`lj4_font(5) <../man5/lj4_font.5.html>`__, 
`ditroff(7) <../man7/ditroff.7.html>`__, 
`groff(7) <../man7/groff.7.html>`__, 
`groff_char(7) <../man7/groff_char.7.html>`__, 
`groff_diff(7) <../man7/groff_diff.7.html>`__, 
`groff_hdtbl(7) <../man7/groff_hdtbl.7.html>`__, 
`groff_me(7) <../man7/groff_me.7.html>`__, 
`groff_mm(7) <../man7/groff_mm.7.html>`__, 
`groff_mmse(7) <../man7/groff_mmse.7.html>`__, 
`groff_mom(7) <../man7/groff_mom.7.html>`__, 
`groff_ms(7) <../man7/groff_ms.7.html>`__, 
`groff_trace(7) <../man7/groff_trace.7.html>`__, 
`groff_www(7) <../man7/groff_www.7.html>`__, 
`man(7) <../man7/man.7.html>`__,  `roff(7) <../man7/roff.7.html>`__, 
`suffixes(7) <../man7/suffixes.7.html>`__

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
