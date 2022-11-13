.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lkbib(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Environment <#Environment>`__ \| |                                   |
| `Files <#Files>`__ \|             |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   lkbib(1)                 General Commands Manual                lkbib(1)


-------------------------------------------------

::

          lkbib - search bibliographic databases


---------------------------------------------------------

::

          lkbib [-n] [-i fields] [-p filename] [-t n] key ...

          lkbib --help

          lkbib -v
          lkbib --version


---------------------------------------------------------------

::

          lkbib searches bibliographic databases for references that
          contain the keys key ... and prints any references found on the
          standard output.  lkbib will search any databases given by -p
          options, and then a default database.  The default database is
          taken from the REFER environment variable if it is set, otherwise
          it is /usr/dict/papers/Ind.  For each database filename to be
          searched, if an index filename.i created by indxbib(1) exists,
          then it will be searched instead; each index can cover multiple
          databases.


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          -i string
                 When searching files for which no index exists, ignore the
                 contents of fields whose names are in string.

          -p filename
                 Search filename.  Multiple -p options can be used.

          -t n   Only require the first n characters of keys to be given.
                 Initially, n is 6.


---------------------------------------------------------------

::

          REFER  Default database.


---------------------------------------------------

::

          /usr/dict/papers/Ind
                 Default database to be used if the REFER environment
                 variable is not set.

          filename.i
                 Index files.


---------------------------------------------------------

::

          “Some Applications of Inverted Indexes on the Unix System”, by M.
          E. Lesk, 1978, AT&T Bell Laboratories Computing Science Technical
          Report No. 69.

          refer(1), lookbib(1), indxbib(1)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                     lkbib(1)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__, 
`lookbib(1) <../man1/lookbib.1.html>`__

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
