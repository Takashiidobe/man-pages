.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lexgrog(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `WH                               |                                   |
| ATIS PARSING <#WHATIS_PARSING>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LEXGROG(1)                 Manual pager utils                 LEXGROG(1)

NAME
-------------------------------------------------

::

          lexgrog - parse header information in man pages


---------------------------------------------------------

::

          lexgrog [-m|-c] [-dfw?V] [-E encoding] file ...


---------------------------------------------------------------

::

          lexgrog is an implementation of the traditional “groff guess”
          utility in lex.  It reads the list of files on its command line
          as either man page source files or preformatted “cat” pages, and
          displays their name and description as used by apropos and
          whatis, the list of preprocessing filters required by the man
          page before it is passed to nroff or troff, or both.

          If its input is badly formatted, lexgrog will print “parse
          failed”; this may be useful for external programs that need to
          check man pages for correctness.  If one of lexgrog's input files
          is “-”, it will read from standard input; if any input file is
          compressed, a decompressed version will be read automatically.


-------------------------------------------------------

::

          -d, --debug
                 Print debugging information.

          -m, --man
                 Parse input as man page source files.  This is the default
                 if neither --man nor --cat is given.

          -c, --cat
                 Parse input as preformatted man pages (“cat pages”).
                 --man and --cat may not be given simultaneously.

          -w, --whatis
                 Display the name and description from the man page's
                 header, as used by apropos and whatis.  This is the
                 default if neither --whatis nor --filters is given.

          -f, --filters
                 Display the list of filters needed to preprocess the man
                 page before formatting with nroff or troff.

          -E encoding, --encoding encoding
                 Override the guessed character set for the page to
                 encoding.

          -?, --help
                 Print a help message and exit.

          --usage
                 Print a short usage message and exit.

          -V, --version
                 Display version information.


---------------------------------------------------------------

::

          0      Successful program execution.

          1      Usage error.

          2      lexgrog failed to parse one or more of its input files.


---------------------------------------------------------

::

            $ lexgrog man.1
            man.1: "man - an interface to the system reference manuals"
            $ lexgrog -fw man.1
            man.1 (t): "man - an interface to the system reference manuals"
            $ lexgrog -c whatis.cat1
            whatis.cat1: "whatis - display manual page descriptions"
            $ lexgrog broken.1
            broken.1: parse failed


---------------------------------------------------------------------

::

          mandb (which uses the same code as lexgrog) parses the NAME
          section at the top of each manual page looking for names and
          descriptions of the features documented in each.  While the
          parser is quite tolerant, as it has to cope with a number of
          different forms that have historically been used, it may
          sometimes fail to extract the required information.

          When using the traditional man macro set, a correct NAME section
          looks something like this:

                 .SH NAME
                 foo \- program to do something

          Some manual pagers require the ‘\-’ to be exactly as shown; mandb
          is more tolerant, but for compatibility with other systems it is
          nevertheless a good idea to retain the backslash.

          On the left-hand side, there may be several names, separated by
          commas.  Names containing whitespace will be ignored to avoid
          pathological behaviour on certain ill-formed NAME sections.  The
          text on the right-hand side is free-form, and may be spread over
          multiple lines.  If several features with different descriptions
          are being documented in the same manual page, the following form
          is therefore used:

                 .SH NAME
                 foo, bar \- programs to do something
                 .br
                 baz \- program to do nothing

          (A macro which starts a new paragraph, like .PP, may be used
          instead of the break macro .br.)

          When using the BSD-derived mdoc macro set, a correct NAME section
          looks something like this:

                 .Sh NAME
                 .Nm foo
                 .Nd program to do something

          There are several common reasons why whatis parsing fails.
          Sometimes authors of manual pages replace ‘.SH NAME’ with ‘.SH
          MYPROGRAM’, and then mandb cannot find the section from which to
          extract the information it needs.  Sometimes authors include a
          NAME section, but place free-form text there rather than ‘name \-
          description’.  However, any syntax resembling the above should be
          accepted.


---------------------------------------------------------

::

          apropos(1), man(1), whatis(1), mandb(8)


---------------------------------------------------

::

          lexgrog attempts to parse files containing .so requests, but will
          only be able to do so correctly if the files are properly
          installed in a manual page hierarchy.


-----------------------------------------------------

::

          The code used by lexgrog to scan man pages was written by:

          Wilf. (G.Wilford@ee.surrey.ac.uk).
          Fabrizio Polacco (fpolacco@debian.org).
          Colin Watson (cjwatson@debian.org).

          Colin Watson wrote the current incarnation of the command-line
          front-end, as well as this man page.


-------------------------------------------------

::

          https://savannah.nongnu.org/bugs/?group=man-db

COLOPHON
---------------------------------------------------------

::

          This page is part of the man-db (manual pager suite) project.
          Information about the project can be found at 
          ⟨http://www.nongnu.org/man-db/⟩.  If you have a bug report for
          this manual page, send it to man-db-devel@nongnu.org.  This page
          was obtained from the project's upstream Git repository
          ⟨https://git.savannah.gnu.org/r/man-db.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-07-11.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   2.9.4                          2021-02-08                     LEXGROG(1)

--------------

Pages that refer to this page: `man(7) <../man7/man.7.html>`__, 
`mandb(8) <../man8/mandb.8.html>`__

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
