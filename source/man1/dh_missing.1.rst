.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_missing(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_MISSING(1)                   Debhelper                  DH_MISSING(1)

NAME
-------------------------------------------------

::

          dh_missing - check for missing files


---------------------------------------------------------

::

          dh_missing [-Xitem] [--sourcedir=dir] [debhelper options]


---------------------------------------------------------------

::

          dh_missing compares the list of installed files with the files in
          the source directory. If any of the files (and symlinks) in the
          source directory were not installed to somewhere, it will warn on
          stderr about that (--list-missing) or fail (--fail-missing).

          Please note that in compat 11 and earlier without either of these
          options, dh_missing will silently do nothing.  In compat 12,
          --list-missing is the default  In compat 13 and later,
          --fail-missing is the default.

          This may be useful if you have a large package and want to make
          sure that you don't miss installing newly added files in new
          upstream releases.

          Remember to test different kinds of builds (dpkg-buildpackage
          -A/-B/...) as you may experience varying results when only a
          subset of the packages are built.


---------------------------------------------------

::

          debian/not-installed
              List the files that are deliberately not installed in any
              binary package.  Paths listed in this file are ignored by
              dh_missing.  However, it is not a method to exclude files
              from being installed by any of the debhelper tool.  If you
              want a tool to not install a given file, please use its
              --exclude option (where available).

              dh_missing will expand wildcards in this file (since
              debhelper 11.1).  Wildcards without matches will be ignored.

              Supports substitution variables in compat 13 and later as
              documented in debhelper(7).


-------------------------------------------------------

::

          --list-missing
              Warn on stderr about source files not installed to somewhere.

              Note that many dh-tools acting on a path will mark the path
              as installed even if it has been excluded via -X or
              --exclude.  This is also seen when a dh-tool is acting on a
              directory and exclusion is used to ignore some files in the
              directory.  In either case, this will make dh_missing
              silently assume the excluded files have been handled.

              This is the default in compat 12.

          --fail-missing
              This option is like --list-missing, except if a file was
              missed, it will not only list the missing files, but also
              fail with a nonzero exit code.

              This is the default in compat 13 and later.


---------------------------------------------------------

::

          debhelper(7)

          This program is a part of debhelper.


-----------------------------------------------------

::

          Michael Stapelberg <stapelberg@debian.org>

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

   13.4+nmu1                      2021-08-19                  DH_MISSING(1)

--------------

Pages that refer to this page:
`dh_install(1) <../man1/dh_install.1.html>`__, 
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
