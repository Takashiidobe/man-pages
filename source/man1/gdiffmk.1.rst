.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gdiffmk(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Bugs <#Bugs>`__ \|               |                                   |
| `Authors <#Authors>`__ \|         |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   gdiffmk(1)               General Commands Manual              gdiffmk(1)


-------------------------------------------------

::

          gdiffmk - mark differences between groff/nroff/troff files


---------------------------------------------------------

::

          gdiffmk [-a add-mark] [-c change-mark] [-d delete-mark] [-x diff-
                  command] [-D [-B] [-M mark1 mark2]] [--] file1 file2
                  [output]

          gdiffmk --help

          gdiffmk --version


---------------------------------------------------------------

::

          gdiffmk compares two roff(7) documents, file1 and file2, and
          creates an output which is file2 with added margin character
          (.mc) requests that indicate the lines with differences.

          If the file1 or file2 argument is “-”, the standard input stream
          is read for that input.  If the output filename is present, the
          output is written there.  If it is “-” or absent, the output is
          written to the standard output stream.  “-” cannot be both input
          and output.


-------------------------------------------------------

::

          --help displays a usage message and --version shows version
          information; both exit afterward.

          -a add-mark
                 Use add-mark for source lines not in file1 but present in
                 file2.  Default: “+”.

          -B     By default, the deleted texts marked by the -D option end
                 with an added roff break request, .br, to ensure that the
                 deletions are marked properly.  This is the only way to
                 guarantee that deletions and small changes get flagged.
                 This option directs the program not to insert these
                 breaks; it makes no sense to use it without -D.

          -c change-mark
                 Use change-mark for changed source lines.  Default: “|”.

          -d delete-mark
                 Use the delete-mark for deleted source lines.  Default:
                 “*”.

          -D     Show the deleted portions from changed and deleted text.
                 Default delimiting marks: “[[” ... “]]”.

          -M mark1 mark2
                 Change the delimiting marks for the -D option.  It makes
                 no sense to use this option without -D.

          -x diff-command
                 Use the diff-command command to perform the comparison of
                 file1 and file2.  In particular, diff-command should
                 accept the GNU diff(1) -D option.  Default: diff.

          --     Treat all subsequent arguments as file names, even if they
                 begin with “-”.


-------------------------------------------------

::

          The output is not necessarily compatible with all macro packages
          and all preprocessors.  A workaround that often overcomes
          preprocessor problems is to run gdiffmk on the output of all the
          preprocessors instead of the input source.

          gdiffmk relies on the -D option of GNU diff to make a merged
          “#ifdef” output format.  It hasn't been tested whether other
          versions of diff support this option.  Also see the -x diff-
          command option.


-------------------------------------------------------

::

          gdiffmk was written and is maintained by Mike Bianchi ⟨MBianchi@
          Foveal.com⟩.


---------------------------------------------------------

::

          groff(1), nroff(1), gtroff(1), roff(7), diff(1)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                   gdiffmk(1)

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
