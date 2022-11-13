.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_movefiles(1) — Linux manual page
===================================

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

   DH_MOVEFILES(1)                 Debhelper                DH_MOVEFILES(1)

NAME
-------------------------------------------------

::

          dh_movefiles - move files out of debian/tmp into subpackages


---------------------------------------------------------

::

          dh_movefiles [debhelper options] [--sourcedir=dir] [-Xitem]
          [file ...]


---------------------------------------------------------------

::

          dh_movefiles is a debhelper program that is responsible for
          moving files out of debian/tmp or some other directory and into
          other package build directories. This may be useful if your
          package has a Makefile that installs everything into debian/tmp,
          and you need to break that up into subpackages.

          Note: dh_install is a much better program, and you are
          recommended to use it instead of dh_movefiles.


---------------------------------------------------

::

          debian/package.files
              Lists the files to be moved into a package, separated by
              whitespace. The filenames listed should be relative to
              debian/tmp/. You can also list directory names, and the whole
              directory will be moved.


-------------------------------------------------------

::

          --sourcedir=dir
              Instead of moving files out of debian/tmp (the default), this
              option makes it move files out of some other directory. Since
              the entire contents of the sourcedir is moved, specifying
              something like --sourcedir=/ is very unsafe, so to prevent
              mistakes, the sourcedir must be a relative filename; it
              cannot begin with a `/'.

          -Xitem, --exclude=item
              Exclude files that contain item anywhere in their filename
              from being installed.

          file ...
              Lists files to move. The filenames listed should be relative
              to debian/tmp/. You can also list directory names, and the
              whole directory will be moved. It is an error to list files
              here unless you use -p, -i, or -a to tell dh_movefiles which
              subpackage to put them in.


---------------------------------------------------

::

          Note that files are always moved out of debian/tmp by default
          (even if you have instructed debhelper to use a compatibility
          level higher than one, which does not otherwise use debian/tmp
          for anything at all). The idea behind this is that the package
          that is being built can be told to install into debian/tmp, and
          then files can be moved by dh_movefiles from that directory. Any
          files or directories that remain are ignored, and get deleted by
          dh_clean later.


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

   13.0.1                         2020-05-16                DH_MOVEFILES(1)

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
