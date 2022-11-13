.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

soelim(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   soelim(1)                General Commands Manual               soelim(1)


-------------------------------------------------

::

          soelim - recursively interpolate source requests in roff files


---------------------------------------------------------

::

          soelim [-Crt] [-I dir] [file ...]

          soelim --help

          soelim -v
          soelim --version


---------------------------------------------------------------

::

          GNU soelim is a preprocessor for the groff(7) document formatting
          system.  soelim works as a filter to eliminate source requests in
          roff(7) input files; that is, it replaces lines of the form “.so
          macro-file” within each text input-file with the contents of
          macro-file, recursively.  By default, it writes .lf requests as
          well to record the name and line number of each input-file and
          macro-file, so that any diagnostics produced by later processing
          can be accurately traced to the original input.  Options allow
          this information to be suppressed (-r) or supplied in TeX
          comments instead (-t).  In the absence of input-file arguments,
          soelim reads the standard input stream.  Output is written to the
          standard output stream.

          To embed a backslash “\” in the name of a macro-file, write “\\”
          or “\e”.  To embed a space, write “\ ” (backslash followed by a
          space).  Any other escape sequence in macro-file, including
          “\[rs]”, prevents soelim from replacing the source request.

          The dot must be at the beginning of a line and must be followed
          by “so” without intervening spaces or tabs for soelim to handle
          it.  This convention allows source requests to be “protected”
          from processing by soelim, for instance as part of macro
          definitions or .if requests.

          There must also be at least one space between “so” and its macro-
          file argument.  The -C option overrides this requirement.

          The foregoing is the limit of soelim's understanding of roff
          languages; it does not, for example, replace the input line
                 .if 1 .so otherfile
          with the contents of otherfile.  With its -r option, therefore,
          soelim can be used to process text files in general, to flatten a
          tree of input documents.

          soelim was designed to handle situations where the target of a
          roff source request requires a preprocessor such as eqn(1),
          pic(1), refer(1), or tbl(1).  The usual processing sequence of
          groff(1) is as follows.

                    input        sourced
                    file          file
                      ⎪             ⎪
                      ↓             ↓
                  preprocessor ⎯→ troff ⎯→ postprocessor
                                                ⎪
                                                ↓
                                             output
                                              file

          That is, files sourced with .so are normally read only by troff
          (the actual formatter).  soelim is not required for troff to
          source files.

          If a file to be sourced should also be preprocessed, it must
          already be read before the input file passes through the
          preprocessor.  soelim, normally invoked via groff's -s option,
          handles this.

                    input
                    file
                      ⎪
                      ↓
                    soelim ⎯→ preprocessor ⎯→ troff ⎯→ postprocessor
                      ↑                                     ⎪
                      ⎪                                     ↓
                   sourced                               output
                    file                                  file


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          -C     Recognize .so even when followed by a character other than
                 space or newline.

          -I dir Add the directory dir to the search path for macro files
                 (both those on the command line and those named in .so
                 requests).  The search path is initialized with the
                 current directory.  This option may be specified more than
                 once; the directories are then searched in the order
                 specified (but before the current directory).  If you want
                 to search the current directory before other directories,
                 add “-I .” at the appropriate place.  No directory search
                 is performed for files with an absolute file name.

          -r     Write files “raw”; do not add .lf requests.

          -t     Emit TeX comment lines starting with “%” indicating the
                 current file and line number, rather than .lf requests for
                 the same purpose.

          If both -r and -t are given, the last one specified controls.


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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                    soelim(1)

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
