.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

grog(1) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Details <#Details>`__ \|         |                                   |
| `Exit status <#Exit_status>`__ \| |                                   |
| `Examples <#Examples>`__ \|       |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   grog(1)                  General Commands Manual                 grog(1)


-------------------------------------------------

::

          grog - “groff guess”—infer the groff command a document requires


---------------------------------------------------------

::

          grog [--run] [--ligatures] [groff-option ...] [--] [file ...]

          grog -h
          grog --help

          grog -v
          grog --version


---------------------------------------------------------------

::

          grog reads its input and guesses which groff(1) options are
          needed to render it.  If no operands are given, or if file is
          “-”, grog reads the standard input stream.  The corresponding
          groff command is normally written to the standard output stream.
          With the option --run, the generated command is written to the
          standard error stream and then executed.


-------------------------------------------------------

::

          -h and --help display a usage message, whereas -v and --version
          display version information; all exit afterward.

          --ligatures
                 includes the arguments -P-y -PU in the generated groff
                 command.  These are supported only by the pdf output
                 driver.

          --run  writes the inferred command to the standard error stream
                 and then executes it.

          All other specified short options (that is, arguments beginning
          with a minus sign “-” followed by a letter) are interpreted as
          groff options or option clusters with or without an option
          argument.  Such options are included in the constructed groff
          command line.


-------------------------------------------------------

::

          grog reads all file operands in their entirety, pattern-matching
          strings that are statistically likely to be characteristic of
          roff(7) documents.  It tries to guess which of the following
          groff options are required to correctly render the input: -e, -g,
          -G, -j, -p, -R, -t (preprocessors); and -man, -mdoc, -mdoc-old,
          -me, -mm, -mom, and -ms (macro packages).  The inferred groff
          command including these options and any file parameters is
          written to the standard output stream.

          It is possible to specify arbitrary groff options on the command
          line.  These are included in the inferred command without change.
          Choices of groff options include -C to enable compatibility mode
          and -T to specify an output device other than the default.

          groff may issue diagnostic messages when an inappropriate -m
          option, or multiple conflicting ones, are specified.
          Consequently, it is best to specify no -m options to grog unless
          it cannot correctly infer all of the -m arguments a document
          requires.

          A roff document can also be written without recourse to any macro
          package.  In such cases, grog will infer a groff command without
          an -m option.

      Limitations
          grog presumes that the input does not change the escape, control,
          and no-break control characters.

          grog does not parse roff input line continuation or control
          structures (brace escape sequences and the “if”, “ie”, and “el”
          requests) nor groff's “while”.  Thus the input
                 .if \
                 t .NH 1
                 .if n .SH
                 Introduction
          will conceal the use of the ms macros NH and SH from grog.  Such
          constructions are regarded by grog's implementors as
          insufficiently common to cause many inference problems; further,
          preprocessors are typically even stricter when matching the macro
          calls they use to bracket the regions of an input file they
          textually replace.  pic, for example, requires PS and PE calls to
          immediately follow the default control character at the beginning
          of a line, with no intervening spaces or tabs.

          Detection of the -s option (the soelim(1) preprocessor) is
          tricky; to correctly infer its necessity would require grog to
          recursively open all files given as arguments to the .so request
          under the same conditions that soelim itself does so; see its man
          page.  Recall that soelim is only necessary if sourced files need
          to be preprocessed.  Therefore, as a workaround, you may want to
          run the input through soelim manually, piping it to grog, and
          compare the output to running grog on the input directly.  If the
          “soelim”ed input causes grog to infer additional preprocessor
          options, then -s is likely necessary.

                 $ printf ".TS\nl.\nThis is my table.\n.TE\n" > 3.roff
                 $ printf ".so 3.roff\n" > 2.roff
                 $ printf ".so 2.roff\n" > 1.roff
                 $ grog 1.roff
                 groff 1.roff
                 $ soelim 1.roff | grog
                 groff -t -

          In the foregoing example, we see that this procedure enabled grog
          to detect tbl(1) macros, so we would add -s as well as the
          detected -t option to a revised grog or groff command.

                 $ grog -st 1.roff
                 groff -st 1.roff


---------------------------------------------------------------

::

          grog exits with error status 1 if a macro package appears to be
          in use by the input document, but grog was unable to infer which
          one, or 2 if there were problems handling an option or operand.
          It otherwise exits with status 0.  Inferring no preprocessors or
          macro packages is not an error condition; a valid roff document
          need not use either, and even plain text is valid input, if one
          is mindful of the syntax of the control and escape characters.


---------------------------------------------------------

::

          Running
                 grog meintro.me
          at the command line results in
                 groff -me meintro.me
          because grog recognizes that the file meintro.me is written using
          macros from the me package.  The command
                 grog pic.ms
          outputs
                 groff -t -e -p -ms pic.ms
          on the other hand.  Besides discerning the ms macro package, grog
          recognizes that the file pic.ms additionally needs the
          combination of -t for tbl, -e for eqn, and -p for pic.

          The command
                 grog -ksS -Tdvi grnexmpl.g
          contains several groff options that are passed through without
          interference from grog.  These are the option cluster -ksS and
          the typesetter option -T with argument dvi.  The output is
                 groff -ksS -T dvi grnexmpl.g
          so no additional option was added by grog.  As no -m option was
          inferred by grog, this file does not use a macro package.


-------------------------------------------------------

::

          grog was originally written by James Clark.  The current Perl
          implementation was written by Bernd Warken ⟨groff-bernd
          .warken-72@web.de⟩ with contributions from Ralph Corderoy.


---------------------------------------------------------

::

          groff(1)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                      grog(1)

--------------

Pages that refer to this page: `gperl(1) <../man1/gperl.1.html>`__, 
`gpinyin(1) <../man1/gpinyin.1.html>`__, 
`groff(1) <../man1/groff.1.html>`__, 
`groffer(1) <../man1/groffer.1.html>`__, 
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
