.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dh_link(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DH_LINK(1)                      Debhelper                     DH_LINK(1)

NAME
-------------------------------------------------

::

          dh_link - create symlinks in package build directories


---------------------------------------------------------

::

          dh_link [debhelper options] [-A] [-Xitem]
          [source destination ...]


---------------------------------------------------------------

::

          dh_link is a debhelper program that creates symlinks in package
          build directories.

          dh_link accepts a list of pairs of source and destination files.
          The source files are the already existing files that will be
          symlinked from (called target by ln(1)). The destination files
          are the symlinks that will be created (called link name by
          ln(1)). There must be an equal number of source and destination
          files specified.

          Be sure you do specify the absolute path to both the source and
          destination files (unlike you would do if you were using
          something like ln(1)).  Please note that the leading slash is
          optional.

          dh_link will generate symlinks that comply with Debian policy -
          absolute when policy says they should be absolute, and relative
          links with as short a path as possible. It will also create any
          subdirectories it needs to put the symlinks in.

          Any pre-existing destination files will be replaced with
          symlinks.

          dh_link also scans the package build tree for existing symlinks
          which do not conform to Debian policy, and corrects them (v4 or
          later).


---------------------------------------------------

::

          debian/package.links
              Lists pairs of source and destination files to be symlinked.
              Each pair should be put on its own line, with the source and
              destination separated by whitespace.

              In each pair the source file (called target by ln(1)) comes
              first and is followed by the destination file (called link
              name by ln(1)). Thus the pairs of source and destination
              files in each line are given in the same order as they would
              be given to ln(1).

              In contrast to ln(1), source and destination paths must be
              absolute (the leading slash is optional).

              Supports substitution variables in compat 13 and later as
              documented in debhelper(7).


-------------------------------------------------------

::

          -A, --all
              Create any links specified by command line parameters in ALL
              packages acted on, not just the first.

          -Xitem, --exclude=item
              Exclude symlinks that contain item anywhere in their filename
              from being corrected to comply with Debian policy.

          source destination ...
              Create a file named destination as a link to a file named
              source. Do this in the package build directory of the first
              package acted on.  (Or in all packages if -A is specified.)


---------------------------------------------------------

::

           dh_link usr/share/man/man1/foo.1 usr/share/man/man1/bar.1

          Make bar.1 be a symlink to foo.1

           dh_link var/lib/foo usr/lib/foo \
             usr/share/man/man1/foo.1 usr/share/man/man1/bar.1

          Make /usr/lib/foo/ be a link to /var/lib/foo/, and bar.1 be a
          symlink to the foo.1

           var/lib/foo usr/lib/foo
           usr/share/man/man1/foo.1 usr/share/man/man1/bar.1

          Same as above but as content for a debian/package.links file.


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

   13.0.1                         2020-05-16                     DH_LINK(1)

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
