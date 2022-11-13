.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

manpath(5) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FORMAT <#FORMAT>`__ \|           |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MANPATH(5)             /usr/local/etc/man_db.conf             MANPATH(5)

NAME
-------------------------------------------------

::

          manpath - format of the /usr/local/etc/man_db.conf file


---------------------------------------------------------------

::

          The manpath configuration file is used by the manual page
          utilities to assess users' manpaths at run time, to indicate
          which manual page hierarchies (manpaths) are to be treated as
          system hierarchies and to assign them directories to be used for
          storing cat files.

          If the environment variable $MANPATH is already set, the
          information contained within /usr/local/etc/man_db.conf will not
          override it.


-----------------------------------------------------

::

          The following field types are currently recognised:

          # comment
                 Blank lines or those beginning with a # will be treated as
                 comments and ignored.

          MANDATORY_MANPATH manpath_element
                 Lines of this form indicate manpaths that every
                 automatically generated $MANPATH should contain.  This
                 will typically include /usr/man.

          MANPATH_MAP path_element manpath_element
                 Lines of this form set up $PATH to $MANPATH mappings.  For
                 each path_element found in the user's $PATH,
                 manpath_element will be added to the $MANPATH.

          MANDB_MAP manpath_element [ catpath_element ]
                 Lines of this form indicate which manpaths are to be
                 treated as system manpaths, and optionally where their cat
                 files should be stored.  This field type is particularly
                 important if man is a setuid program, as (when in the
                 system configuration file /usr/local/etc/man_db.conf
                 rather than the per-user configuration file .manpath) it
                 indicates which manual page hierarchies to access as the
                 setuid user and which as the invoking user.

                 The system manual page hierarchies are usually those
                 stored under /usr such as /usr/man, /usr/local/man and
                 /usr/X11R6/man.

                 If cat pages from a particular manpath_element are not to
                 be stored or are to be stored in the traditional location,
                 catpath_element may be omitted.

                 Traditional cat placement would be impossible for read
                 only mounted manual page hierarchies and because of this
                 it is possible to specify any valid directory hierarchy
                 for their storage.  To observe the Linux FSSTND the
                 keyword FSSTND can be used in place of an actual
                 directory.

                 Unfortunately, it is necessary to specify all system man
                 tree paths, including alternate operating system paths
                 such as /usr/man/sun and any NLS locale paths such as
                 /usr/man/de_DE.88591.

                 As the information is parsed line by line in the order
                 written, it is necessary for any manpath that is a sub-
                 hierarchy of another hierarchy to be listed first,
                 otherwise an incorrect match will be made.  An example is
                 that /usr/man/de_DE.88591 must come before /usr/man.

          DEFINE key value
                 Lines of this form define miscellaneous configuration
                 variables; see the default configuration file for those
                 variables used by the manual pager utilities.  They
                 include default paths to various programs (such as grep
                 and tbl), and default sets of arguments to those programs.

          SECTION section ...
                 Lines of this form define the order in which manual
                 sections should be searched.  If there are no SECTION
                 directives in the configuration file, the default is:

                        SECTION 1 n l 8 3 0 2 5 4 9 6 7

                 If multiple SECTION directives are given, their section
                 lists will be concatenated.

                 If a particular extension is not in this list (say, 1mh)
                 it will be displayed with the rest of the section it
                 belongs to.  The effect of this is that you only need to
                 explicitly list extensions if you want to force a
                 particular order.  Sections with extensions should usually
                 be adjacent to their main section (e.g. "1 1mh 8 ...").

                 SECTIONS is accepted as an alternative name for this
                 directive.

          MINCATWIDTH width
                 If the terminal width is less than width, cat pages will
                 not be created (if missing) or displayed.  The default is
                 80.

          MAXCATWIDTH width
                 If the terminal width is greater than width, cat pages
                 will not be created (if missing) or displayed.  The
                 default is 80.

          CATWIDTH width
                 If width is non-zero, cat pages will always be formatted
                 for a terminal of the given width, regardless of the width
                 of the terminal actually being used.  This should
                 generally be within the range set by MINCATWIDTH and
                 MAXCATWIDTH.

          NOCACHE
                 This flag prevents man(1) from creating cat pages
                 automatically.


-------------------------------------------------

::

          Unless the rules above are followed and observed precisely, the
          manual pager utilities will not function as desired.  The rules
          are overly complicated.

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

   2.9.4                          2021-02-08                     MANPATH(5)

--------------

Pages that refer to this page: `man(1) <../man1/man.1.html>`__, 
`catman(8) <../man8/catman.8.html>`__, 
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
