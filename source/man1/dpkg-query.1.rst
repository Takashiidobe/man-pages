.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dpkg-query(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   dpkg-query(1)                  dpkg suite                  dpkg-query(1)

NAME
-------------------------------------------------

::

          dpkg-query - a tool to query the dpkg database


---------------------------------------------------------

::

          dpkg-query [option...] command


---------------------------------------------------------------

::

          dpkg-query is a tool to show information about packages listed in
          the dpkg database.


---------------------------------------------------------

::

          -l, --list [package-name-pattern...]
                 List all known packages matching one or more patterns,
                 regardless of their status, which includes any real or
                 virtual package referenced in any dependency relationship
                 field (such as Breaks, Enhances, etc.).  If no package-
                 name-pattern is given, list all packages in
                 /usr/local/var/lib/dpkg/status, excluding the ones marked
                 as not-installed (i.e.  those which have been previously
                 purged).  Normal shell wildcard characters are allowed in
                 package-name-pattern.  Please note you will probably have
                 to quote package-name-pattern to prevent the shell from
                 performing filename expansion.  For example this will list
                 all package names starting with “libc6”:

                   dpkg-query -l 'libc6*'

                 The first three columns of the output show the desired
                 action, the package status, and errors, in that order.

                 Desired action:
                   u = Unknown
                   i = Install
                   h = Hold
                   r = Remove
                   p = Purge

                 Package status:
                   n = Not-installed
                   c = Config-files
                   H = Half-installed
                   U = Unpacked
                   F = Half-configured
                   W = Triggers-awaiting
                   t = Triggers-pending
                   i = Installed

                 Error flags:
                   <empty> = (none)
                   R = Reinst-required

                 An uppercase status or error letter indicates the package
                 is likely to cause severe problems. Please refer to
                 dpkg(1) for information about the above states and flags.

                 The output format of this option is not configurable, but
                 varies automatically to fit the terminal width. It is
                 intended for human readers, and is not easily machine-
                 readable. See -W (--show) and --showformat for a way to
                 configure the output format.

          -W, --show [package-name-pattern...]
                 Just like the --list option this will list all packages
                 matching the given pattern. However the output can be
                 customized using the --showformat option.  The default
                 output format gives one line per matching package, each
                 line having the name (extended with the architecture
                 qualifier for Multi-Arch same packages) and installed
                 version of the package, separated by a tab.

          -s, --status [package-name...]
                 Report status of specified package. This just displays the
                 entry in the installed package status database.  If no
                 package-name is specified it will display all package
                 entries in the status database (since dpkg 1.19.1).  When
                 multiple package-name entries are listed, the requested
                 status entries are separated by an empty line, with the
                 same order as specified on the argument list.

          -L, --listfiles package-name...
                 List files installed to your system from package-name.
                 When multiple package-name are listed, the requested lists
                 of files are separated by an empty line, with the same
                 order as specified on the argument list.  However, note
                 that files created by package-specific installation-
                 scripts are not listed.

          --control-list package-name
                 List control files installed to your system from package-
                 name (since dpkg 1.16.5).  These can be used as input
                 arguments to --control-show.

          --control-show package-name control-file
                 Print the control-file installed to your system from
                 package-name to the standard output (since dpkg 1.16.5).

          -c, --control-path package-name [control-file]
                 List paths for control files installed to your system from
                 package-name (since dpkg 1.15.4).  If control-file is
                 specified then only list the path for that control file if
                 it is present.

                 Warning: this command is deprecated as it gives direct
                 access to the internal dpkg database, please switch to use
                 --control-list and --control-show instead for all cases
                 where those commands might give the same end result.
                 Although, as long as there is still at least one case
                 where this command is needed (i.e. when having to remove a
                 damaging postrm maintainer script), and while there is no
                 good solution for that, this command will not get removed.

          -S, --search filename-search-pattern...
                 Search for packages that own files corresponding to the
                 given pattern.  Standard shell wildcard characters can be
                 used in the pattern, where asterisk (*) and question mark
                 (?) will match a slash, and blackslash (\) will be used as
                 an escape character.

                 If the first character in the filename-search-pattern is
                 none of ‘*[?/’ then it will be considered a substring
                 match and will be implicitly surrounded by ‘*’ (as in
                 *filename-search-pattern*).  If the subsequent string
                 contains any of ‘*[?\’, then it will handled like a glob
                 pattern, otherwise any trailing ‘/’ or ‘/.’ will be
                 removed and a literal path lookup will be performed.

                 This command will not list extra files created by
                 maintainer scripts, nor will it list alternatives.

          -p, --print-avail [package-name...]
                 Display details about packages, as found in
                 /usr/local/var/lib/dpkg/available.  If no package-name is
                 specified, it will display all package entries in the
                 available database (since dpkg 1.19.1).  When multiple
                 package-name are listed, the requested available entries
                 are separated by an empty line, with the same order as
                 specified on the argument list.

                 Users of APT-based frontends should use apt-cache show
                 package-name instead as the available file is only kept
                 up-to-date when using dselect.

          -?, --help
                 Show the usage message and exit.

          --version
                 Show the version and exit.


-------------------------------------------------------

::

          --admindir=dir
                 Change the location of the dpkg database. The default
                 location is /usr/local/var/lib/dpkg.

          --load-avail
                 Also load the available file when using the --show and
                 --list commands, which now default to only querying the
                 status file (since dpkg 1.16.2).

          --no-pager
                 Disables the use of any pager when showing information
                 (since dpkg 1.19.2).

          -f, --showformat=format
                 This option is used to specify the format of the output
                 --show will produce (short option since dpkg 1.13.1).  The
                 format is a string that will be output for each package
                 listed.

                 In the format string, “\” introduces escapes:

                     \n  newline
                     \r  carriage return
                     \t  tab

                 “\” before any other character suppresses any special
                 meaning of the following character, which is useful for
                 “\” and “$”.

                 Package information can be included by inserting variable
                 references to package fields using the syntax
                 “${field[;width]}”. Fields are printed right-aligned
                 unless the width is negative in which case left alignment
                 will be used. The following fields are recognized but they
                 are not necessarily available in the status file (only
                 internal fields or fields stored in the binary package end
                 up in it):

                     Architecture
                     Bugs
                     Conffiles (internal)
                     Config-Version (internal)
                     Conflicts
                     Breaks
                     Depends
                     Description
                     Enhances
                     Essential
                     Filename (internal, front-end related)
                     Homepage
                     Installed-Size
                     MD5sum (internal, front-end related)
                     MSDOS-Filename (internal, front-end related)
                     Maintainer
                     Origin
                     Package
                     Pre-Depends
                     Priority
                     Provides
                     Recommends
                     Replaces
                     Revision (obsolete)
                     Section
                     Size (internal, front-end related)
                     Source
                     Status (internal)
                     Suggests
                     Tag (usually not in .deb but in repository Packages files)
                     Triggers-Awaited (internal)
                     Triggers-Pending (internal)
                     Version

                 The following are virtual fields, generated by dpkg-query
                 from values from other fields (note that these do not use
                 valid names for fields in control files):

                 binary:Package
                        It contains the binary package name with a possible
                        architecture qualifier like “libc6:amd64” (since
                        dpkg 1.16.2).  An architecture qualifier will be
                        present to make the package name unambiguous, for
                        example if the package has a Multi-Arch field with
                        a value of same or the package is of a foreign
                        architecture.

                 binary:Synopsis
                        It contains the package short description (since
                        dpkg 1.19.1).

                 binary:Summary
                        This is an alias for binary:Synopsis (since dpkg
                        1.16.2).

                 db:Status-Abbrev
                        It contains the abbreviated package status (as
                        three characters), such as “ii ” or “iHR” (since
                        dpkg 1.16.2).  See the --list command description
                        for more details.

                 db:Status-Want
                        It contains the package wanted status, part of the
                        Status field (since dpkg 1.17.11).

                 db:Status-Status
                        It contains the package status word, part of the
                        Status field (since dpkg 1.17.11).

                 db:Status-Eflag
                        It contains the package status error flag, part of
                        the Status field (since dpkg 1.17.11).

                 db-fsys:Files
                        It contains the list of the package filesystem
                        entries separated by newlines (since dpkg 1.19.3).

                 db-fsys:Last-Modified
                        It contains the timestamp in seconds of the last
                        time the package filesystem entries were modified
                        (since dpkg 1.19.3).

                 source:Package
                        It contains the source package name for this binary
                        package (since dpkg 1.16.2).

                 source:Version
                        It contains the source package version for this
                        binary package (since dpkg 1.16.2)

                 source:Upstream-Version
                        It contains the source package upstream version for
                        this binary package (since dpkg 1.18.16)

                 The default format string is
                 “${binary:Package}\t${Version}\n”.  Actually, all other
                 fields found in the status file (i.e. user defined fields)
                 can be requested, too. They will be printed as-is, though,
                 no conversion nor error checking is done on them. To get
                 the name of the dpkg maintainer and the installed version,
                 you could run:

                   dpkg-query -W -f='${binary:Package} ${Version}\t${Maintainer}\n' dpkg


---------------------------------------------------------------

::

          0      The requested query was successfully performed.

          1      The requested query failed either fully or partially, due
                 to no file or package being found (except for
                 --control-path, --control-list and --control-show were
                 such errors are fatal).

          2      Fatal or unrecoverable error due to invalid command-line
                 usage, or interactions with the system, such as accesses
                 to the database, memory allocations, etc.


---------------------------------------------------------------

::

      External environment
          SHELL  Sets the program to execute when spawning a command via a
                 shell (since dpkg 1.19.2).

          PAGER
          DPKG_PAGER
                 Sets the pager command to use (since dpkg 1.19.1), which
                 will be executed with «$SHELL -c».  If SHELL is not set,
                 «sh» will be used instead.  The DPKG_PAGER overrides the
                 PAGER environment variable (since dpkg 1.19.2).

          DPKG_ADMINDIR
                 If set and the --admindir option has not been specified,
                 it will be used as the dpkg data directory.

          DPKG_COLORS
                 Sets the color mode (since dpkg 1.18.5).  The currently
                 accepted values are: auto (default), always and never.

      Internal environment
          LESS   Defined by dpkg-query to “-FRSXMQ”, if not already set,
                 when spawning a pager (since dpkg 1.19.2).  To change the
                 default behavior, this variable can be preset to some
                 other value including an empty string, or the PAGER or
                 DPKG_PAGER variables can be set to disable specific
                 options with «-+», for example DPKG_PAGER="less -+F".


---------------------------------------------------------

::

          dpkg(1).

COLOPHON
---------------------------------------------------------

::

          This page is part of the dpkg (Debian Package Manager) project.
          Information about the project can be found at 
          ⟨https://wiki.debian.org/Teams/Dpkg/⟩.  If you have a bug report
          for this manual page, see
          ⟨http://bugs.debian.org/cgi-bin/pkgreport.cgi?src=dpkg⟩.  This
          page was obtained from the project's upstream Git repository
          ⟨https://salsa.debian.org/dpkg-team/dpkg.git⟩ on 2021-08-27.  (At
          that time, the date of the most recent commit that was found in
          the repository was 2021-06-17.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   1.19.6-2-g6e42d5               2019-03-25                  dpkg-query(1)

--------------

Pages that refer to this page: `dpkg(1) <../man1/dpkg.1.html>`__, 
`dpkg-deb(1) <../man1/dpkg-deb.1.html>`__

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
