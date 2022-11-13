.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

man-recode(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MAN-RECODE(1)              Manual pager utils              MAN-RECODE(1)

NAME
-------------------------------------------------

::

          man-recode - convert manual pages to another encoding


---------------------------------------------------------

::

          man-recode -t to-code {--suffix=suffix|--in-place} [-dqhV]
          [filename]


---------------------------------------------------------------

::

          man-recode converts multiple manual pages from one encoding to
          another, guessing the appropriate input encoding for each one.
          It is useful when permanently recoding pages written in legacy
          character sets, or in build systems that need to recode a set of
          pages to a single common encoding (usually UTF-8) for
          installation.  When converting many manual pages, this program is
          much faster than running man --recode or manconv on each page.

          If an encoding declaration is found on the first line of a manual
          page, then that declaration is used as the input encoding for
          that page.  Failing that, the input encoding is guessed based on
          the file name.

          Encoding declarations have the following form:

                 '\" -*- coding: UTF-8 -*-

          or (if manual page preprocessors are also to be declared):

                 '\" t -*- coding: ISO-8859-1 -*-


-------------------------------------------------------

::

          -t encoding, --to-code=encoding
                 Convert manual pages to encoding.

          --suffix=suffix
                 Form each output file name by appending suffix to the
                 input file name, after removing any compression extension.

          --in-place
                 Overwrite each input file with the output, after removing
                 any compression extension.

          -q, --quiet
                 Do not issue error messages when the page cannot be
                 converted.

          -d, --debug
                 Print debugging information.

          -h, --help
                 Print a help message and exit.

          -V, --version
                 Display version information.


---------------------------------------------------------

::

          iconv(1), man(1), manconv(1)


-------------------------------------------------

::

          https://savannah.nongnu.org/bugs/?group=man-db


-----------------------------------------------------

::

          Colin Watson (cjwatson@debian.org).

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

   2.9.4                          2021-02-08                  MAN-RECODE(1)

--------------

Pages that refer to this page: `man(1) <../man1/man.1.html>`__, 
`manconv(1) <../man1/manconv.1.html>`__

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
