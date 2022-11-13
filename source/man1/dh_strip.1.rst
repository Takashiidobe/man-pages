.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_strip(1) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `CONFORMS TO <#CONFORMS_TO>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_STRIP(1)                     Debhelper                    DH_STRIP(1)

NAME
-------------------------------------------------

::

          dh_strip - strip executables, shared libraries, and some static
          libraries


---------------------------------------------------------

::

          dh_strip [debhelper options] [-Xitem] [--dbg-package=package]
          [--keep-debug]


---------------------------------------------------------------

::

          dh_strip is a debhelper program that is responsible for stripping
          out debug symbols in executables, shared libraries, and static
          libraries that are not needed during execution.

          This program examines your package build directories and works
          out what to strip on its own. It uses file(1) and file
          permissions and filenames to figure out what files are shared
          libraries (*.so), executable binaries, and static (lib*.a) and
          debugging libraries (lib*_g.a, debug/*.so), and strips each as
          much as is possible. (Which is not at all for debugging
          libraries.) In general it seems to make very good guesses, and
          will do the right thing in almost all cases.

          Since it is very hard to automatically guess if a file is a
          module, and hard to determine how to strip a module, dh_strip
          does not currently deal with stripping binary modules such as .o
          files.


-------------------------------------------------------

::

          -Xitem, --exclude=item
              Exclude files that contain item anywhere in their filename
              from being stripped. You may use this option multiple times
              to build up a list of things to exclude.

          --dbg-package=package
              This option is a now special purpose option that you normally
              do not need.  In most cases, there should be little reason to
              use this option for new source packages as debhelper
              automatically generates debug packages ("dbgsym packages").
              If you have a manual --dbg-package that you want to replace
              with an automatically generated debug symbol package, please
              see the --dbgsym-migration option.

              Causes dh_strip to save debug symbols stripped from the
              packages it acts on as independent files in the package build
              directory of the specified debugging package.

              For example, if your packages are libfoo and foo and you want
              to include a foo-dbg package with debugging symbols, use
              dh_strip --dbg-package=foo-dbg.

              This option implies --no-automatic-dbgsym and cannot be used
              with --automatic-dbgsym or --dbgsym-migration.

          -k, --keep-debug
              This option is a now special purpose option that you normally
              do not need.  In most cases, there should be little reason to
              use this option for new source packages as debhelper
              automatically generates debug packages ("dbgsym packages").
              If you have a manual --dbg-package that you want to replace
              with an automatically generated debug symbol package, please
              see the --dbgsym-migration option.

              Debug symbols will be retained, but split into an independent
              file in usr/lib/debug/ in the package build directory.
              --dbg-package is easier to use than this option, but this
              option is more flexible.

              This option implies --no-automatic-dbgsym and cannot be used
              with --automatic-dbgsym.

          --dbgsym-migration=package-relation
              This option is used to migrate from a manual "-dbg" package
              (created with --dbg-package) to an automatic generated debug
              symbol package. This option should describe a valid Replaces-
              and Breaks-relation, which will be added to the debug symbol
              package to avoid file conflicts with the (now obsolete) -dbg
              package.

              This option implies --automatic-dbgsym and cannot be used
              with --keep-debug, --dbg-package or --no-automatic-dbgsym.

              Examples:

                dh_strip --dbgsym-migration='libfoo-dbg (<< 2.1-3~)'

                dh_strip --dbgsym-migration='libfoo-tools-dbg (<< 2.1-3~), libfoo2-dbg (<< 2.1-3~)'

          --automatic-dbgsym, --no-automatic-dbgsym
              Control whether dh_strip should be creating debug symbol
              packages when possible.

              The default is to create debug symbol packages.

          --ddebs, --no-ddebs
              Historical name for --automatic-dbgsym and
              --no-automatic-dbgsym.

          --ddeb-migration=package-relation
              Historical name for --dbgsym-migration.


---------------------------------------------------

::

          If the DEB_BUILD_OPTIONS environment variable contains nostrip,
          nothing will be stripped, in accordance with Debian policy
          (section 10.1 "Binaries").  This will also inhibit the automatic
          creation of debug symbol packages.

          The automatic creation of debug symbol packages can also be
          prevented by adding noautodbgsym to the DEB_BUILD_OPTIONS
          environment variable.  However, dh_strip will still add
          debuglinks to ELF binaries when this flag is set.  This is to
          ensure that the regular deb package will be identical with and
          without this flag (assuming it is otherwise "bit-for-bit"
          reproducible).


---------------------------------------------------------------

::

          Debian policy, version 3.0.1


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

   13.3.4                         2021-03-13                    DH_STRIP(1)

--------------

Pages that refer to this page: `dh(1) <../man1/dh.1.html>`__, 
`dh_builddeb(1) <../man1/dh_builddeb.1.html>`__, 
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
