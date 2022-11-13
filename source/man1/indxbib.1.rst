.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

indxbib(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `Name <#Name>`__ \|               |                                   |
| `Synopsis <#Synopsis>`__ \|       |                                   |
| `Description <#Description>`__ \| |                                   |
| `Options <#Options>`__ \|         |                                   |
| `Files <#Files>`__ \|             |                                   |
| `See also <#See_also>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   indxbib(1)               General Commands Manual              indxbib(1)


-------------------------------------------------

::

          indxbib - make inverted index for bibliographic databases


---------------------------------------------------------

::

          indxbib [-w] [-c common-words-file] [-d dir] [-f list-file]
                  [-h n] [-i string] [-k n] [-l n] [-n n] [-o file] [-t n]
                  [file ...]

          indxbib --help

          indxbib -v
          indxbib --version


---------------------------------------------------------------

::

          indxbib makes an inverted index for the bibliographic databases
          in each file for use with refer(1), lookbib(1), and lkbib(1).
          Each created index is named file.i; writing is done to a
          temporary file which is then renamed to this.  If no file
          operands are given on the command line because the -f option has
          been used, and no -o option is given, the index will be named
          Ind.i.

          Bibliographic databases are divided into records by blank lines.
          Within a record, each field starts with a % character at the
          beginning of a line.  Fields have a one letter name that follows
          the % character.

          The values set by the -c, -n, -l, and -t options are stored in
          the index: when the index is searched, keys will be discarded and
          truncated in a manner appropriate to these options; the original
          keys will be used for verifying that any record found using the
          index actually contains the keys.  This means that a user of an
          index need not know whether these options were used in the
          creation of the index, provided that not all the keys to be
          searched for would have been discarded during indexing and that
          the user supplies at least the part of each key that would have
          remained after being truncated during indexing.  The value set by
          the -i option is also stored in the index and will be used in
          verifying records found using the index.


-------------------------------------------------------

::

          --help displays a usage message, while -v and --version show
          version information; all exit afterward.

          -c common-words-file
                 Read the list of common words from file instead of /usr/
                 local/share/groff/1.23.0/eign.

          -d dir Use dir as the pathname of the current working directory
                 to store in the index, instead of the path printed by
                 pwd(1).  Usually dir will be a symbolic link that points
                 to the directory printed by pwd(1).

          -f list-file
                 Read the files to be indexed from file.  If file is -,
                 files will be read from the standard input.  The -f option
                 can be given at most once.

          -i string
                 Don't index the contents of fields whose names are in
                 string.  Field names are one character each.  Initially,
                 string is XYZ.

          -h n   Use the first prime greater than or equal to n for the
                 size of the hash table.  Larger values of n will usually
                 make searching faster, but will make the index larger and
                 indxbib use more memory.  Initially, n is 997.

          -k n   Use at most n keys per input record.  Initially, n is 100.

          -l n   Discard keys that are shorter than n.  Initially, n is 3.

          -n n   Discard the n most common words.  Initially, n is 100.

          -o basename
                 The index should be named basename.i.

          -t n   Truncate keys to n.  Initially, n is 6.

          -w     Index whole files.  Each file is a separate record.


---------------------------------------------------

::

          file.i Index.

          Ind.i  Default index name.

          /usr/local/share/groff/1.23.0/eign
                 List of common words.  The traditional name, “eign”, is an
                 abbreviation of “English ignored [word list]”.

          indxbibXXXXXX
                 Temporary file.


---------------------------------------------------------

::

          “Some Applications of Inverted Indexes on the Unix System”, by M.
          E. Lesk, 1978, AT&T Bell Laboratories Computing Science Technical
          Report No. 69.

          refer(1), lkbib(1), lookbib(1)

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

   groff 1.23.0.rc1.654-4e1db-dir1t9yAugust 2021                   indxbib(1)

--------------

Pages that refer to this page: `groff(1) <../man1/groff.1.html>`__

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
