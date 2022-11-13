.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

apropos(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `ENVIRONMENT <#ENVIRONMENT>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   APROPOS(1)                 Manual pager utils                 APROPOS(1)

NAME
-------------------------------------------------

::

          apropos - search the manual page names and descriptions


---------------------------------------------------------

::

          apropos [-dalv?V] [-e|-w|-r] [-s list] [-m system[,...]] [-M
          path] [-L locale] [-C file] keyword ...


---------------------------------------------------------------

::

          Each manual page has a short description available within it.
          apropos searches the descriptions for instances of keyword.

          keyword is usually a regular expression, as if (-r) was used, or
          may contain wildcards (-w), or match the exact keyword (-e).
          Using these options, it may be necessary to quote the keyword or
          escape (\) the special characters to stop the shell from
          interpreting them.

          The standard matching rules allow matches to be made against the
          page name and word boundaries in the description.

          The database searched by apropos is updated by the mandb program.
          Depending on your installation, this may be run by a periodic
          cron job, or may need to be run manually after new manual pages
          have been installed.


-------------------------------------------------------

::

          -d, --debug
                 Print debugging information.

          -v, --verbose
                 Print verbose warning messages.

          -r, --regex
                 Interpret each keyword as a regular expression.  This is
                 the default behaviour.  Each keyword will be matched
                 against the page names and the descriptions independently.
                 It can match any part of either.  The match is not limited
                 to word boundaries.

          -w, --wildcard
                 Interpret each keyword as a pattern containing shell style
                 wildcards.  Each keyword will be matched against the page
                 names and the descriptions independently.  If --exact is
                 also used, a match will only be found if an expanded
                 keyword matches an entire description or page name.
                 Otherwise the keyword is also allowed to match on word
                 boundaries in the description.

          -e, --exact
                 Each keyword will be exactly matched against the page
                 names and the descriptions.

          -a, --and
                 Only display items that match all the supplied keywords.
                 The default is to display items that match any keyword.

          -l, --long
                 Do not trim output to the terminal width.  Normally,
                 output will be truncated to the terminal width to avoid
                 ugly results from poorly-written NAME sections.

          -s list, --sections=list, --section=list
                 Search only the given manual sections.  list is a colon-
                 or comma-separated list of sections.  If an entry in list
                 is a simple section, for example "3", then the displayed
                 list of descriptions will include pages in sections "3",
                 "3perl", "3x", and so on; while if an entry in list has an
                 extension, for example "3perl", then the list will only
                 include pages in that exact part of the manual section.

          -m system[,...], --systems=system[,...]
                 If this system has access to other operating system's
                 manual page descriptions, they can be searched using this
                 option.  To search NewOS's manual page descriptions, use
                 the option -m NewOS.

                 The system specified can be a combination of comma-
                 delimited operating system names.  To include a search of
                 the native operating system's whatis descriptions, include
                 the system name man in the argument string.  This option
                 will override the $SYSTEM environment variable.

          -M path, --manpath=path
                 Specify an alternate set of colon-delimited manual page
                 hierarchies to search.  By default, apropos uses the
                 $MANPATH environment variable, unless it is empty or
                 unset, in which case it will determine an appropriate
                 manpath based on your $PATH environment variable.  This
                 option overrides the contents of $MANPATH.

          -L locale, --locale=locale
                 apropos will normally determine your current locale by a
                 call to the C function setlocale(3) which interrogates
                 various environment variables, possibly including
                 $LC_MESSAGES and $LANG.  To temporarily override the
                 determined value, use this option to supply a locale
                 string directly to apropos.  Note that it will not take
                 effect until the search for pages actually begins.  Output
                 such as the help message will always be displayed in the
                 initially determined locale.

          -C file, --config-file=file
                 Use this user configuration file rather than the default
                 of ~/.manpath.

          -?, --help
                 Print a help message and exit.

          --usage
                 Print a short usage message and exit.

          -V, --version
                 Display version information.


---------------------------------------------------------------

::

          0      Successful program execution.

          1      Usage, syntax or configuration file error.

          2      Operational error.

          16     Nothing was found that matched the criteria specified.


---------------------------------------------------------------

::

          SYSTEM If $SYSTEM is set, it will have the same effect as if it
                 had been specified as the argument to the -m option.

          MANPATH
                 If $MANPATH is set, its value is interpreted as the colon-
                 delimited manual page hierarchy search path to use.

          MANWIDTH
                 If $MANWIDTH is set, its value is used as the terminal
                 width (see the --long option).  If it is not set, the
                 terminal width will be calculated using the value of
                 $COLUMNS, and ioctl(2) if available, or falling back to 80
                 characters if all else fails.

          POSIXLY_CORRECT
                 If $POSIXLY_CORRECT is set, even to a null value, the
                 default apropos search will be as an extended regex (-r).
                 Nowadays, this is the default behaviour anyway.


---------------------------------------------------

::

          /usr/share/man/index.(bt|db|dir|pag)
                 A traditional global index database cache.

          /var/cache/man/index.(bt|db|dir|pag)
                 An FHS compliant global index database cache.

          /usr/share/man/.../whatis
                 A traditional whatis text database.


---------------------------------------------------------

::

          man(1), whatis(1), mandb(8)


-----------------------------------------------------

::

          Wilf. (G.Wilford@ee.surrey.ac.uk).
          Fabrizio Polacco (fpolacco@debian.org).
          Colin Watson (cjwatson@debian.org).


-------------------------------------------------

::

          https://savannah.nongnu.org/bugs/?group=man-db

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

   2.9.4                          2021-02-08                     APROPOS(1)

--------------

Pages that refer to this page: `groffer(1) <../man1/groffer.1.html>`__, 
`lexgrog(1) <../man1/lexgrog.1.html>`__, 
`man(1) <../man1/man.1.html>`__, 
`manpath(1) <../man1/manpath.1.html>`__, 
`whatis(1) <../man1/whatis.1.html>`__,  `man(7) <../man7/man.7.html>`__

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
