.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lsmem(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LSMEM(1)                      User Commands                     LSMEM(1)

NAME
-------------------------------------------------

::

          lsmem - list the ranges of available memory with their online
          status


---------------------------------------------------------

::

          lsmem [options]


---------------------------------------------------------------

::

          The lsmem command lists the ranges of available memory with their
          online status. The listed memory blocks correspond to the memory
          block representation in sysfs. The command also shows the memory
          block size and the amount of memory in online and offline state.

          The default output compatible with original implementation from
          s390-tools, but it’s strongly recommended to avoid using default
          outputs in your scripts. Always explicitly define expected
          columns by using the --output option together with a columns list
          in environments where a stable output is required.

          The lsmem command lists a new memory range always when the
          current memory block distinguish from the previous block by some
          output column. This default behavior is possible to override by
          the --split option (e.g., lsmem --split=ZONES). The special word
          "none" may be used to ignore all differences between memory
          blocks and to create as large as possible continuous ranges. The
          opposite semantic is --all to list individual memory blocks.

          Note that some output columns may provide inaccurate information
          if a split policy forces lsmem to ignore differences in some
          attributes. For example if you merge removable and non-removable
          memory blocks to the one range than all the range will be marked
          as non-removable on lsmem output.

          Not all columns are supported on all systems. If an unsupported
          column is specified, lsmem prints the column but does not provide
          any data for it.

          Use the --help option to see the columns description.


-------------------------------------------------------

::

          -a, --all
              List each individual memory block, instead of combining
              memory blocks with similar attributes.

          -b, --bytes
              Print the SIZE column in bytes rather than in a
              human-readable format.

          -h, --help
              Display help text and exit.

          -J, --json
              Use JSON output format.

          -n, --noheadings
              Do not print a header line.

          -o, --output list
              Specify which output columns to print. Use --help to get a
              list of all supported columns. The default list of columns
              may be extended if list is specified in the format +list
              (e.g., lsmem -o +NODE).

          --output-all
              Output all available columns.

          -P, --pairs
              Produce output in the form of key="value" pairs. All
              potentially unsafe value characters are hex-escaped
              (\x<code>).

          -r, --raw
              Produce output in raw format. All potentially unsafe
              characters are hex-escaped (\x<code>).

          -S, --split list
              Specify which columns (attributes) use to split memory blocks
              to ranges. The supported columns are STATE, REMOVABLE, NODE
              and ZONES, or "none". The other columns are silently ignored.
              For more details see DESCRIPTION above.

          -s, --sysroot directory
              Gather memory data for a Linux instance other than the
              instance from which the lsmem command is issued. The
              specified directory is the system root of the Linux instance
              to be inspected.

          -V, --version
              Display version information and exit.

          --summary[=when]
              This option controls summary lines output. The optional
              argument when can be never, always or only. If the when
              argument is omitted, it defaults to "only". The summary
              output is suppressed for --raw, --pairs and --json.


-------------------------------------------------------

::

          lsmem was originally written by Gerald Schaefer for s390-tools in
          Perl. The C version for util-linux was written by Clemens von
          Mann, Heiko Carstens and Karel Zak.


---------------------------------------------------------

::

          chmem(8)


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The lsmem command is part of the util-linux package which can be
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

   util-linux 2.37.85-637cc       2021-04-02                       LSMEM(1)

--------------

Pages that refer to this page: `chmem(8) <../man8/chmem.8.html>`__

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
