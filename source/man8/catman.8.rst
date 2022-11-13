.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

catman(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
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

   CATMAN(8)                  Manual pager utils                  CATMAN(8)

NAME
-------------------------------------------------

::

          catman - create or update the pre-formatted manual pages


---------------------------------------------------------

::

          catman [-d?V] [-M path] [-C file] [section] ...


---------------------------------------------------------------

::

          catman is used to create an up to date set of pre-formatted
          manual pages known as cat pages.  Cat pages are generally much
          faster to display than the original manual pages, but require
          extra storage space.  The decision to support cat pages is that
          of the local administrator, who must provide suitable directories
          to contain them.

          The options available to catman are the manual page hierarchies
          and sections to pre-format.  The default hierarchies are those
          specified as system hierarchies in the man-db configuration file,
          and the default sections are either the colon-delimited contents
          of the environment variable $MANSECT or the standard set compiled
          into man if $MANSECT is undefined.  Supplying catman with a set
          of whitespace-delimited section names will override both of the
          above.

          catman makes use of the index database cache associated with each
          hierarchy to determine which files need to be formatted.


-------------------------------------------------------

::

          -d, --debug
                 Print debugging information.

          -M path, --manpath=path
                 Specify an alternate colon-delimited manual page hierarchy
                 search path.  By default, this is all paths indicated as
                 system hierarchies in the man-db configuration file.

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

          MANSECT
                 If $MANSECT is set, its value is a colon-delimited list of
                 sections and it is used to determine which manual sections
                 to search and in what order.  The default is "1 n l 8 3 0
                 2 5 4 9 6 7", unless overridden by the SECTION directive
                 in /usr/local/etc/man_db.conf.

          MANPATH
                 If $MANPATH is set, its value is interpreted as the colon-
                 delimited manual page hierarchy search path to use.


---------------------------------------------------

::

          /usr/local/etc/man_db.conf
                 man-db configuration file.

          /usr/man/index.(bt|db|dir|pag)
                 A traditional global index database cache.

          /var/catman/index.(bt|db|dir|pag)
                 An alternate or FSSTND compliant global index database
                 cache.


---------------------------------------------------------

::

          man(1), manpath(5), mandb(8)


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

   2.9.4                          2021-02-08                      CATMAN(8)

--------------

Pages that refer to this page: `man(1) <../man1/man.1.html>`__, 
`mandb(8) <../man8/mandb.8.html>`__

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
