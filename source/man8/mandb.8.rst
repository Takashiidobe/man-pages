.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mandb(8) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `DATA                             |                                   |
| BASE CACHES <#DATABASE_CACHES>`__ |                                   |
| \| `OPTIONS <#OPTIONS>`__ \|      |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MANDB(8)                   Manual pager utils                   MANDB(8)

NAME
-------------------------------------------------

::

          mandb - create or update the manual page index caches


---------------------------------------------------------

::

          mandb [-dqsucpt?V] [-C file] [manpath]
          mandb [-dqsut] [-C file] -f filename ...


---------------------------------------------------------------

::

          mandb is used to initialise or manually update index database
          caches.  The caches contain information relevant to the current
          state of the manual page system and the information stored within
          them is used by the man-db utilities to enhance their speed and
          functionality.

          When creating or updating an index, mandb will warn of bad ROFF
          .so requests, bogus manual page filenames and manual pages from
          which the whatis cannot be parsed.

          Supplying mandb with an optional colon-delimited path will
          override the internal system manual page hierarchy search path,
          determined from information found within the man-db configuration
          file.


-----------------------------------------------------------------------

::

          mandb can be compiled with support for any one of the following
          database types.

          Name          Async   Filename
          ──────────────────────────────────────
          Berkeley db   Yes     index.bt
          GNU gdbm      Yes     index.db
          UNIX ndbm     No      index.(dir|pag)

          Those database types that support asynchronous updates provide
          enhanced speed at the cost of possible corruption in the event of
          unusual termination.  In an unusual case where this has occurred,
          it may be necessary to rerun mandb with the -c option to re-
          create the databases from scratch.


-------------------------------------------------------

::

          -d, --debug
                 Print debugging information.

          -q, --quiet
                 Produce no warnings.

          -s, --no-straycats
                 Do not spend time looking for or adding information to the
                 databases regarding stray cats.

          -p, --no-purge
                 Do not spend time checking for deleted manual pages and
                 purging them from the databases.

          -c, --create
                 By default, mandb will try to update any previously
                 created databases.  If a database does not exist, it will
                 create it.  This option forces mandb to delete previous
                 databases and re-create them from scratch, and implies
                 --no-purge.  This may be necessary if a database becomes
                 corrupt or if a new database storage scheme is introduced
                 in the future.

          -u, --user-db
                 Create user databases only, even with write permissions
                 necessary to create system databases.

          -t, --test
                 Perform correctness checks on manual pages in the
                 hierarchy search path.  With this option, mandb will not
                 alter existing databases.

          -f, --filename
                 Update only the entries for the given filename.  This
                 option is not for general use; it is used internally by
                 man when it has been compiled with the MAN_DB_UPDATES
                 option and finds that a page is out of date.  It implies
                 -p and disables -c and -s.

          -C file, --config-file=file
                 Use this user configuration file rather than the default
                 of ~/.manpath.

          -?, --help
                 Show the usage message, then exit.

          --usage
                 Print a short usage message and exit.

          -V, --version
                 Show the version, then exit.


---------------------------------------------------------------

::

          0      Successful program execution.

          1      Usage, syntax, or configuration file error.

          2      Operational error.

          3      A child process failed.


---------------------------------------------------------------

::

          The following warning messages can be emitted during database
          building.

          <filename>: whatis parse for page(sec) failed
                 An attempt to extract whatis line(s) from the given
                 <filename> failed.  This is usually due to a poorly
                 written manual page, but if many such messages are emitted
                 it is likely that the system contains non-standard manual
                 pages which are incompatible with the man-db whatis
                 parser.  See the WHATIS PARSING section in lexgrog(1) for
                 more information.

          <filename>: is a dangling symlink
                 <filename> does not exist but is referenced by a symbolic
                 link.  Further diagnostics are usually emitted to identify
                 the <filename> of the offending link.

          <filename>: bad symlink or ROFF `.so' request
                 <filename> is either a symbolic link to, or contains a
                 ROFF include request to, a non existent file.

          <filename>: ignoring bogus filename
                 The <filename> may or may not be a valid manual page but
                 its name is invalid.  This is usually due to a manual page
                 with sectional extension <x> being put in manual page
                 section <y>.

          <filename_mask>: competing extensions
                 The wildcard <filename_mask> is not unique.  This is
                 usually caused by the existence of both a compressed and
                 uncompressed version of the same manual page.  All but the
                 most recent are ignored.


---------------------------------------------------

::

          /usr/local/etc/man_db.conf
                 man-db configuration file.

          /var/cache/man/index.(bt|db|dir|pag)
                 An FHS compliant global index database cache.

          Older locations for the database cache included:

          /usr/man/index.(bt|db|dir|pag)
                 A traditional global index database cache.

          /var/catman/index.(bt|db|dir|pag)
                 An alternate or FSSTND compliant global index database
                 cache.


---------------------------------------------------------

::

          lexgrog(1), man(1), manpath(5), catman(8)

          The WHATIS PARSING section formerly in this manual page is now
          part of lexgrog(1).


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

   2.9.4                          2021-02-08                       MANDB(8)

--------------

Pages that refer to this page: `apropos(1) <../man1/apropos.1.html>`__, 
`lexgrog(1) <../man1/lexgrog.1.html>`__, 
`man(1) <../man1/man.1.html>`__, 
`whatis(1) <../man1/whatis.1.html>`__, 
`groff_man(7) <../man7/groff_man.7.html>`__, 
`groff_man_style(7) <../man7/groff_man_style.7.html>`__, 
`man(7) <../man7/man.7.html>`__,  `catman(8) <../man8/catman.8.html>`__

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
