.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semind(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SUBCOMMANDS <#SUBCOMMANDS>`__ \| |                                   |
| `CO                               |                                   |
| MMON OPTIONS <#COMMON_OPTIONS>`__ |                                   |
| \| `ADD OPTIONS <#ADD_OPTIONS>`__ |                                   |
| \|                                |                                   |
| `SE                               |                                   |
| ARCH OPTIONS <#SEARCH_OPTIONS>`__ |                                   |
| \| `FORMAT <#FORMAT>`__ \|        |                                   |
| `KIND <#KIND>`__ \|               |                                   |
| `MODE <#MODE>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `HOMEPAGE <#HOMEPAGE>`__ \|       |                                   |
| `MAILING LIST <#MAILING_LIST>`__  |                                   |
| \| `COLOPHON <#COLOPHON>`__       |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   semind(1)                General Commands Manual               semind(1)

NAME
-------------------------------------------------

::

          semind - Semantic Indexer for C


---------------------------------------------------------

::

          semind [options]
          semind [options] add [command options] [--] [compiler options]
          [files...]
          semind [options] rm [command options] pattern
          semind [options] search [command options] [pattern]
          semind [options] search [command options] (-e|-l)
          filename:linenr:column


---------------------------------------------------------------

::

          semind is the simple to use cscope-like tool based on
          sparse/dissect.  Unlike cscope it runs after pre-processor and
          thus it can't index the code filtered out by ifdef's, but otoh it
          understands how the symbol is used and it can track the usage of
          struct members.


---------------------------------------------------------------

::

          add    generates or updates semantic index file.

          rm     removes files from the index by pattern. The pattern is a
                 glob(7) wildcard pattern.

          search queries information about symbol by pattern. The pattern
                 is a glob(7) wildcard pattern.


---------------------------------------------------------------------

::

          -D, --database=FILE
                 specify database file (default: ./semind.sqlite).

          -v, --verbose
                 show information about what is being done.

          -h, --help
                 show this text and exit.


---------------------------------------------------------------

::

          --include-local-syms
                 include into the index local symbols.


---------------------------------------------------------------------

::

          -f, --format=STRING
                 specify an output format. Default: '(%m)
                 %f\t%l\t%c\t%C\t%s' (see FORMAT below).

          -p, --path=PATTERN
                 search symbols only in specified directories.

          -m, --mode=MODE
                 search only the specified type of access (see MODE below).

          -k, --kind=KIND
                 specify a kind of symbol (see KIND below).

          -e, --explain
                 Show what happens in the specified file position;

          -l, --location
                 Show usage of symbols from a specific file position;

          -v, --verbose
                 show information about what is being done;

          -h, --help
                 show this text and exit.


-----------------------------------------------------

::

          %m     access mode in human readable form (see MODE below).

          %f     file name.

          %l     line number.

          %c     column number.

          %C     the name of the function in which the symbol occurs.

          %n     symbol name.

          %s     source code line. Indexer does not save source code lines.
                 They are read from the file during the search.


-------------------------------------------------

::

          f      function

          s      strict

          m      struct member


-------------------------------------------------

::

          The MODE is dumped as a 3-letter string. The first letter denotes
          address of part, 2-nd - access by value, 3-rd - access by
          pointer. A special value 'def' means a symbol definition.

          r      read

          w      write

          m      read and write


---------------------------------------------------------

::

          sparse(1)


---------------------------------------------------------

::

          https://sparse.docs.kernel.org


-----------------------------------------------------------------

::

          linux-sparse@vger.kernel.org

COLOPHON
---------------------------------------------------------

::

          This page is part of the sparse (a Semantic Parser for C)
          project.  Information about the project can be found at 
          ⟨https://sparse.wiki.kernel.org/⟩.  If you have a bug report for
          this manual page, send it to linux-sparse@vger.kernel.org.  This
          page was obtained from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/devel/sparse/sparse.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-02.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                                  semind(1)

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
