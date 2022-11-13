.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

whereis(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILE SEA                         |                                   |
| RCH PATHS <#FILE_SEARCH_PATHS>`__ |                                   |
| \| `ENVIRONMENT <#ENVIRONMENT>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `RE                               |                                   |
| PORTING BUGS <#REPORTING_BUGS>`__ |                                   |
| \|                                |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WHEREIS(1)                    User Commands                   WHEREIS(1)

NAME
-------------------------------------------------

::

          whereis - locate the binary, source, and manual page files for a
          command


---------------------------------------------------------

::

          whereis [options] [-BMS directory... -f] name...


---------------------------------------------------------------

::

          whereis locates the binary, source and manual files for the
          specified command names. The supplied names are first stripped of
          leading pathname components. Prefixes of s. resulting from use of
          source code control are also dealt with. whereis then attempts to
          locate the desired program in the standard Linux places, and in
          the places specified by $PATH and $MANPATH.

          The search restrictions (options -b, -m and -s) are cumulative
          and apply to the subsequent name patterns on the command line.
          Any new search restriction resets the search mask. For example,

             whereis -bm ls tr -m gcc

          searches for "ls" and "tr" binaries and man pages, and for "gcc"
          man pages only.

          The options -B, -M and -S reset search paths for the subsequent
          name patterns. For example,

             whereis -m ls -M /usr/share/man/man1 -f cal

          searches for "ls" man pages in all default paths, but for "cal"
          in the /usr/share/man/man1 directory only.


-------------------------------------------------------

::

          -b
              Search for binaries.

          -m
              Search for manuals.

          -s
              Search for sources.

          -u
              Only show the command names that have unusual entries. A
              command is said to be unusual if it does not have just one
              entry of each explicitly requested type. Thus 'whereis -m -u
              *' asks for those files in the current directory which have
              no documentation file, or more than one.

          -B list
              Limit the places where whereis searches for binaries, by a
              whitespace-separated list of directories.

          -M list
              Limit the places where whereis searches for manuals and
              documentation in Info format, by a whitespace-separated list
              of directories.

          -S list
              Limit the places where whereis searches for sources, by a
              whitespace-separated list of directories.

          -f
              Terminates the directory list and signals the start of
              filenames. It must be used when any of the -B, -M, or -S
              options is used.

          -l
              Output the list of effective lookup paths that whereis is
              using. When none of -B, -M, or -S is specified, the option
              will output the hard-coded paths that the command was able to
              find on the system.

          -h, --help
              Display help text and exit.

          -V, --version
              Display version information and exit.


---------------------------------------------------------------------------

::

          By default whereis tries to find files from hard-coded paths,
          which are defined with glob patterns. The command attempts to use
          the contents of $PATH and $MANPATH environment variables as
          default search path. The easiest way to know what paths are in
          use is to add the -l listing option. Effects of the -B, -M, and
          -S are displayed with -l.


---------------------------------------------------------------

::

          WHEREIS_DEBUG=all
              enables debug output.


---------------------------------------------------------

::

          To find all files in /usr/bin which are not documented in
          /usr/man/man1 or have no source in /usr/src:

          cd /usr/bin whereis -u -ms -M /usr/man/man1 -S /usr/src -f *


---------------------------------------------------------------------

::

          For bug reports, use the issue tracker at
          https://github.com/karelzak/util-linux/issues.


-----------------------------------------------------------------

::

          The whereis command is part of the util-linux package which can
          be downloaded from Linux Kernel Archive
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

   util-linux 2.37.85-637cc       2021-06-17                     WHEREIS(1)

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
