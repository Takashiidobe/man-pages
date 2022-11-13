.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_installchangelogs(1) — Linux manual page
===========================================

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

   DH_INSTALLCHANGELOGS(1)         Debhelper        DH_INSTALLCHANGELOGS(1)

NAME
-------------------------------------------------

::

          dh_installchangelogs - install changelogs into package build
          directories


---------------------------------------------------------

::

          dh_installchangelogs [debhelper options] [-k] [-Xitem] [upstream]


---------------------------------------------------------------

::

          dh_installchangelogs is a debhelper program that is responsible
          for installing changelogs into package build directories.

          An upstream changelog file may be specified as an option. If none
          is specified, dh_installchangelogs may look for files with names
          that seem likely to be changelogs as described in the next
          paragraphs.

          In non-native packages, dh_installchangelogs will first look for
          changelog files installed by the upstream build system into
          usr/share/doc/package (of the package build directory) and rename
          the most likely candidate (if any) to
          usr/share/doc/package/changelog.  Note that dh_installchangelogs
          does not look into any source directory (such as debian/tmp).
          Otherwise, dh_installchangelogs (at compatibility level 7 or any
          later) will look for changelog files in the source directory
          (e.g. the root or the docs subdirectory).  It will look for
          changelog, changes and history optionally with common extensions
          (such as .txt, .md and .rst).

          If a changelog file is specified and is an html file (determined
          by file extension), it will be installed as
          usr/share/doc/package/changelog.html instead. If the html
          changelog is converted to plain text, that variant can be
          specified as a second parameter. When no plain text variant is
          specified, a short usr/share/doc/package/changelog is generated,
          pointing readers at the html changelog file.


---------------------------------------------------

::

          debian/changelog
          debian/NEWS
          debian/package.changelog
          debian/package.NEWS
              Automatically installed into usr/share/doc/package/ in the
              package build directory.

              Use the package specific name if package needs a different
              NEWS or changelog file.

              The changelog file is installed with a name of changelog for
              native packages, and changelog.Debian for non-native
              packages.  The NEWS file is always installed with a name of
              NEWS.Debian.


-------------------------------------------------------

::

          -k, --keep
              Keep the original name of the upstream changelog. This will
              be accomplished by installing the upstream changelog as
              changelog, and making a symlink from that to the original
              name of the changelog file. This can be useful if the
              upstream changelog has an unusual name, or if other
              documentation in the package refers to the changelog file.

          -Xitem, --exclude=item
              Exclude upstream changelog files that contain item anywhere
              in their filename from being installed.

              Note that directory name of the changelog is also part of the
              match.

          upstream
              Install this file as the upstream changelog.


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

   13.0.1                         2020-05-16        DH_INSTALLCHANGELOGS(1)

--------------

Pages that refer to this page:
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
