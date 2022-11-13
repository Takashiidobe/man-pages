.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_installexamples(1) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_INSTALLEXAMPLES(1)           Debhelper          DH_INSTALLEXAMPLES(1)

NAME
-------------------------------------------------

::

          dh_installexamples - install example files into package build
          directories


---------------------------------------------------------

::

          dh_installexamples [debhelper options] [-A] [-Xitem] [file ...]


---------------------------------------------------------------

::

          dh_installexamples is a debhelper program that is responsible for
          installing examples into usr/share/doc/package/examples in
          package build directories.

          From debhelper compatibility level 11 on, dh_install will fall
          back to looking in debian/tmp for files, if it does not find them
          in the current directory (or wherever you've told it to look
          using --sourcedir).


---------------------------------------------------

::

          debian/package.examples
              Lists example files or directories to be installed.

              Supports substitution variables in compat 13 and later as
              documented in debhelper(7).


-------------------------------------------------------

::

          -A, --all
              Install any files specified by command line parameters in ALL
              packages acted on.

          --sourcedir=dir
              Look in the specified directory for files to be installed.
              This option requires compat 11 or later (it is silently
              ignored in compat 10 or earlier).

              Note that this is not the same as the --sourcedirectory
              option used by the dh_auto_* commands. You rarely need to use
              this option, since dh_installexamples automatically looks for
              files in debian/tmp in debhelper compatibility level 11 and
              above.

          --doc-main-package=main-package
              Set the main package for a documentation package.  This is
              used to install the documentation of the documentation
              package in /usr/share/doc/main-package as recommended by the
              Debian policy manual 3.9.7 in §12.3.

              In compat 11 (or later), this option is only useful if
              debhelper's auto-detection of the main package is wrong.  The
              option can also be used to silence a warning from debhelper
              when the auto-detection fails but the default happens to be
              correct.

              This option cannot be used when dh_installexamples is
              instructed to act on multiple packages.  If you need this
              option, you will generally need to combine it with -p to
              ensure exactly one package is acted on.

          -Xitem, --exclude=item
              Exclude files that contain item anywhere in their filename
              from being installed.

          file ...
              Install these files (or directories) as examples into the
              first package acted on. (Or into all packages if -A is
              specified.)


---------------------------------------------------

::

          Note that dh_installexamples will happily copy entire directory
          hierarchies if you ask it to (similar to cp -a). If it is asked
          to install a directory, it will install the complete contents of
          the directory.


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

   13.0.1                         2020-05-16          DH_INSTALLEXAMPLES(1)

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
