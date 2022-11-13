.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

roff2html(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See Also <#See_Also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   roff2html(1)             General Commands Manual            roff2html(1)


-------------------------------------------------

::

          roff2html - transform roff code into html mode


---------------------------------------------------------

::

          roff2html [groffer-option ...] [--] [filespec ...]

          roff2html -h
          roff2html --help

          roff2html -v
          roff2html --version

          The options -v and --version print the version information of the
          program to standard output and exit.  The options -h and --help
          print a usage information of the program to standard output and
          stop the program instantly.

          All other options are assumed to be groffer options.  They are
          internally passed to groffer.  They override the behavior of the
          program.  The options are optional, they can be omitted.

          The filespec arguments correspond to the filespec arguments of
          groffer.  So they are either the names of existing, readable
          files or - for standard input, or the name of a man page or a
          groffer(1) man page search pattern.  If no filespec is specified
          standard input is assumed automatically.


---------------------------------------------------------------

::

          roff2html transforms roff code into html mode.  Print the result
          to standard output.

          There are more of these programs for generating other formats of
          roff input.

          roff2dvi(1)
                 is for dvi mode.

          roff2pdf(1)
                 outputs pdf mode.

          roff2ps(1)
                 prints PostScript format to standard output.

          roff2text(1)
                 generates text output in the groff device latin1.

          roff2x(1)
                 prints the output in the groff device X that is suitable
                 for programs like gxditview(1) or xditview(1).


-------------------------------------------------------

::

          roff2html was written by Bernd Warken ⟨groff-bernd.warken-72@
          web.de⟩.


---------------------------------------------------------

::

          groff(1), groffer(1), roff2dvi(1), roff2pdf(1), roff2ps(1),
          roff2text(1), roff2x(1), gxditview(1).

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

   groff 1.22.4.12-7f8a         30 January 2020                roff2html(1)

--------------

Pages that refer to this page:
`roff2dvi(1) <../man1/roff2dvi.1.html>`__, 
`roff2pdf(1) <../man1/roff2pdf.1.html>`__, 
`roff2ps(1) <../man1/roff2ps.1.html>`__, 
`roff2text(1) <../man1/roff2text.1.html>`__, 
`roff2x(1) <../man1/roff2x.1.html>`__

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
