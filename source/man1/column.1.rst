.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

column(1) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `HISTORY <#HISTORY>`__ \|         |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   COLUMN(1)                     User Commands                    COLUMN(1)

NAME
-------------------------------------------------

::

          column - columnate lists


---------------------------------------------------------

::

          column [options] [file ...]


---------------------------------------------------------------

::

          The column utility formats its input into multiple columns. The
          util support three modes:

          columns are filled before rows
              This is the default mode (required by backward
              compatibility).

          rows are filled before columns
              This mode is enabled by option -x, --fillrows

          table
              Determine the number of columns the input contains and create
              a table. This mode is enabled by option -t, --table and
              columns formatting is possible to modify by --table-*
              options. Use this mode if not sure.

          Input is taken from file, or otherwise from standard input. Empty
          lines are ignored and all invalid multibyte sequences are encoded
          by x<hex> convention.


-------------------------------------------------------

::

          The argument columns for --table-* options is a comma separated
          list of the column names as defined by --table-columns or it’s
          column number in order as specified by input. It’s possible to
          mix names and numbers. The special placeholder '0' (e.g. -R0) may
          be used to specify all columns.

          -J, --json
              Use JSON output format to print the table, the option
              --table-columns is required and the option --table-name is
              recommended.

          -c, --output-width width
              Output is formatted to a width specified as number of
              characters. The original name of this option is --columns;
              this name is deprecated since v2.30. Note that input longer
              than width is not truncated by default.

          -d, --table-noheadings
              Do not print header. This option allows the use of logical
              column names on the command line, but keeps the header hidden
              when printing the table.

          -o, --output-separator string
              Specify the columns delimiter for table output (default is
              two spaces).

          -s, --separator separators
              Specify the possible input item delimiters (default is
              whitespace).

          -t, --table
              Determine the number of columns the input contains and create
              a table. Columns are delimited with whitespace, by default,
              or with the characters supplied using the --output-separator
              option. Table output is useful for pretty-printing.

          -N, --table-columns names
              Specify the columns names by comma separated list of names.
              The names are used for the table header or to address column
              in option arguments.

          -l, --table-columns-limit number
              Specify maximal number of the input columns. The last column
              will contain all remaining line data if the limit is smaller
              than the number of the columns in the input data.

          -R, --table-right columns
              Right align text in the specified columns.

          -T, --table-truncate columns
              Specify columns where text can be truncated when necessary,
              otherwise very long table entries may be printed on multiple
              lines.

          -E, --table-noextreme columns
              Specify columns where is possible to ignore unusually long
              (longer than average) cells when calculate column width. The
              option has impact to the width calculation and table
              formatting, but the printed text is not affected.

              The option is used for the last visible column by default.

          -e, --table-header-repeat
              Print header line for each page.

          -W, --table-wrap columns
              Specify columns where is possible to use multi-line cell for
              long text when necessary.

          -H, --table-hide columns
              Don’t print specified columns. The special placeholder '-'
              may be used to hide all unnamed columns (see
              --table-columns).

          -O, --table-order columns
              Specify columns order on output.

          -n, --table-name name
              Specify the table name used for JSON output. The default is
              "table".

          -L, --keep-empty-lines
              Preserve whitespace-only lines in the input. The default is
              ignore empty lines at all. This option’s original name was
              --table-empty-lines but is now deprecated because it gives
              the false impression that the option only applies to table
              mode.

          -r, --tree column
              Specify column to use tree-like output. Note that the
              circular dependencies and other anomalies in child and parent
              relation are silently ignored.

          -i, --tree-id column
              Specify column with line ID to create child-parent relation.

          -p, --tree-parent column
              Specify column with parent ID to create child-parent
              relation.

          -x, --fillrows
              Fill rows before filling columns.

          -V, --version
              Display version information and exit.

          -h, --help
              Display help text and exit.


---------------------------------------------------------------

::

          The environment variable COLUMNS is used to determine the size of
          the screen if no other information is available.


-------------------------------------------------------

::

          The column command appeared in 4.3BSD-Reno.


-------------------------------------------------

::

          Version 2.23 changed the -s option to be non-greedy, for example:

              printf "a:b:c\n1::3\n" | column -t -s ':'

          Old output:

              a  b  c
              1  3

          New output (since util-linux 2.23):

              a  b  c
              1     3

          Historical versions of this tool indicated that "rows are filled
          before columns" by default, and that the -x option reverses this.
          This wording did not reflect the actual behavior, and it has
          since been corrected (see above). Other implementations of column
          may continue to use the older documentation, but the behavior
          should be identical in any case.


---------------------------------------------------------

::

          Print fstab with header line and align number to the right:

              sed 's/#.*//' /etc/fstab | column --table --table-columns SOURCE,TARGET,TYPE,OPTIONS,PASS,FREQ --table-right PASS,FREQ

          Print fstab and hide unnamed columns:

              sed 's/#.*//' /etc/fstab | column --table --table-columns SOURCE,TARGET,TYPE --table-hide -

          Print a tree:

              echo -e '1 0 A\n2 1 AA\n3 1 AB\n4 2 AAA\n5 2 AAB' | column --tree-id 1 --tree-parent 2 --tree 3
              1  0  A
              2  1  |-AA
              4  2  | |-AAA
              5  2  | `-AAB
              3  1  `-AB


---------------------------------------------------------

::

          colrm(1), ls(1), paste(1), sort(1)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The column command is part of the util-linux package which can be
          downloaded from Linux Kernel Archive
          <https://www.kernel.org/pub/linux/utils/util-linux/>. This page
          is part of the util-linux (a random collection of Linux
          utilities) project. Information about the project can be found at
          ⟨https://www.kernel.org/pub/linux/utils/util-linux/⟩. If you have
          a bug report for this manual page, send it to
          util-linux@vger.kernel.org. This page was obtained from the
          project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/util-linux/util-linux.git⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-24.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   util-linux 2.37.85-637cc       2021-06-17                      COLUMN(1)

--------------

Pages that refer to this page: `colrm(1) <../man1/colrm.1.html>`__

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
