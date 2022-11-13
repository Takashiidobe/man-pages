.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_installman(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_INSTALLMAN(1)                Debhelper               DH_INSTALLMAN(1)

NAME
-------------------------------------------------

::

          dh_installman - install man pages into package build directories


---------------------------------------------------------

::

          dh_installman [debhelper options] [manpage ...]


---------------------------------------------------------------

::

          dh_installman is a debhelper program that handles installing man
          pages into the correct locations in package build directories.

          In compat 10 and earlier, this program was primarily for when
          upstream's build system does not properly install them as a part
          of its install step (or it does not have an install step).  In
          compat 11 and later, it also supports the default searchdir plus
          --sourcedir like dh_install(1) and has the advantage that it
          respects the nodoc build profile (unlike dh_install(1)).

          Even if you prefer to use dh_install(1) for installing the
          manpages, dh_installman can still be useful for converting the
          manpage encoding to UTF-8 and for converting .so links (as
          described below).  However, that part happens automatically
          without any explicit configuration.

          You tell dh_installman what man pages go in your packages, and it
          figures out where to install them based on the section field in
          their .TH or .Dt line. If you have a properly formatted .TH or
          .Dt line, your man page will be installed into the right
          directory, with the right name (this includes proper handling of
          pages with a subsection, like 3perl, which are placed in man3,
          and given an extension of .3perl). If your .TH or .Dt line is
          incorrect or missing, the program may guess wrong based on the
          file extension.

          It also supports translated man pages, by looking for extensions
          like .ll.8 and .ll_LL.8, or by use of the --language switch.

          If dh_installman seems to install a man page into the wrong
          section or with the wrong extension, this is because the man page
          has the wrong section listed in its .TH or .Dt line. Edit the man
          page and correct the section, and dh_installman will follow suit.
          See man(7) for details about the .TH section, and mdoc(7) for the
          .Dt section. If dh_installman seems to install a man page into a
          directory like /usr/share/man/pl/man1/, that is because your
          program has a name like foo.pl, and dh_installman assumes that
          means it is translated into Polish. Use --language=C to avoid
          this.

          After the man page installation step, dh_installman will check to
          see if any of the man pages in the temporary directories of any
          of the packages it is acting on contain .so links. If so, it
          changes them to symlinks.

          Also, dh_installman will use man to guess the character encoding
          of each manual page and convert it to UTF-8. If the guesswork
          fails for some reason, you can override it using an encoding
          declaration. See manconv(1) for details.

          From debhelper compatibility level 11 on, dh_install will fall
          back to looking in debian/tmp for files, if it does not find them
          in the current directory (or wherever you've told it to look
          using --sourcedir).


---------------------------------------------------

::

          debian/package.manpages
              Lists man pages to be installed.

              Supports substitution variables in compat 13 and later as
              documented in debhelper(7).


-------------------------------------------------------

::

          -A, --all
              Install all files specified by command line parameters in ALL
              packages acted on.

          --language=ll
              Use this to specify that the man pages being acted on are
              written in the specified language.

          --sourcedir=dir
              Look in the specified directory for files to be installed.
              This option requires compat 11 or later (it is silently
              ignored in compat 10 or earlier).

              Note that this is not the same as the --sourcedirectory
              option used by the dh_auto_* commands. You rarely need to use
              this option, since dh_installman automatically looks for
              files in debian/tmp in debhelper compatibility level 11 and
              above.

          manpage ...
              Install these man pages into the first package acted on. (Or
              in all packages if -A is specified).


---------------------------------------------------------

::

          An example debian/manpages file could look like this:

            doc/man/foo.1
            # Translations
            doc/man/foo.da.1
            doc/man/foo.de.1
            doc/man/foo.fr.1
            # NB: The following line is considered a polish translation
            # of "foo.1" (and not a manpage written in perl called "foo.pl")
            doc/man/foo.pl.1
            # ...


---------------------------------------------------

::

          An older version of this program, dh_installmanpages(1), is still
          used by some packages, and so is still included in debhelper.  It
          is, however, deprecated, due to its counterintuitive and
          inconsistent interface. Use this program instead.


---------------------------------------------------------

::

          debhelper(7)

          This program is a part of debhelper.


-----------------------------------------------------

::

          Joey Hess <joeyh@debian.org>

COLOPHON
---------------------------------------------------------

::

          This page is part of the debhelper (helper programs for
          debian/rules) project.  Information about the project can be
          found at [unknown -- if you know, please contact man-
          pages@man7.org] If you have a bug report for this manual page,
          send it to submit@bugs.debian.org.  This page was obtained from
          the project's upstream Git repository
          ⟨https://salsa.debian.org/debian/debhelper.git⟩ on 2021-08-27.
          (At that time, the date of the most recent commit that was found
          in the repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   13.0.1                         2020-05-16               DH_INSTALLMAN(1)

--------------

Pages that refer to this page:
`dh_installmanpages(1) <../man1/dh_installmanpages.1.html>`__, 
`debhelper(7) <../man7/debhelper.7.html>`__

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
