.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pdfmom(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Bugs <#Bugs>`__ \|               |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   pdfmom(1)                General Commands Manual               pdfmom(1)


-------------------------------------------------

::

          pdfmom - produce PDF documents using the mom macro package for
          groff


---------------------------------------------------------

::

          pdfmom [-Tpdf] [groff-options] [file ...]

          pdfmom -Tps [pdfroff-options] [groff-options] [file ...]

          pdfmom -v


---------------------------------------------------------------

::

          pdfmom is a wrapper around groff(1) that facilitates the
          production of PDF documents from files formatted with the mom
          macros.

          pdfmom prints to the standard output, so output must usually be
          redirected to a destination file.  The size of the final PDF can
          be reduced by piping the output through ps2pdf(1).

          If called with the -Tpdf option (which is the default), pdfmom
          processes files using groff's native PDF driver, gropdf(1).  If
          -Tps is given, processing is passed over to pdfroff, which uses
          groff's PostScript driver.  In either case, multiple runs of the
          source file are performed in order to satisfy any forward
          references in the document.

          pdfmom accepts all the same options as groff.  If -Tps is given,
          the options associated with pdfroff are accepted as well.  Please
          note that when pdfmom calls pdfroff, the
                 -mpdfmark -mom --no-toc
          options are implied and should not be given on the command line.
          Equally, it is not necessary to supply the -mom or -m mom options
          when -Tps is absent.

          PDF integration with the mom macros is discussed in full in the
          manual “Producing PDFs with groff and mom”, which was itself
          produced with pdfmom.

          If called with the -v option, pdfmom simply displays its version
          information and exits.


-------------------------------------------------

::

          pdfmom sometimes issues warnings of the type
                 ...: can't transparently output node at top level
          but this is more of an annoyance than a bug, and may safely be
          ignored.


-------------------------------------------------------

::

          pfdmom was written by Deri James ⟨deri@chuzzlewit.demon.co.uk⟩
          and Peter Schaffter ⟨peter@schaffter.ca⟩.


---------------------------------------------------------

::

          /usr/local/share/doc/groff-1.23.0/pdf/mom-pdf.pdf
                 “Producing PDFs with groff and mom”, by Deri James and
                 Peter Schaffter.  This file, together with its source,
                 mom-pdf.mom, is part of the groff distribution.

          groff(1), gropdf(1), pdfroff(1), ps2pdf(1)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                    pdfmom(1)

--------------

Pages that refer to this page:
`groff_mom(7) <../man7/groff_mom.7.html>`__

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
