.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-hash-object(1) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-HASH-OBJECT(1)             Git Manual             GIT-HASH-OBJECT(1)

NAME
-------------------------------------------------

::

          git-hash-object - Compute object ID and optionally creates a blob
          from a file


---------------------------------------------------------

::

          git hash-object [-t <type>] [-w] [--path=<file>|--no-filters] [--stdin [--literally]] [--] <file>...
          git hash-object [-t <type>] [-w] --stdin-paths [--no-filters]


---------------------------------------------------------------

::

          Computes the object ID value for an object with specified type
          with the contents of the named file (which can be outside of the
          work tree), and optionally writes the resulting object into the
          object database. Reports its object ID to its standard output.
          When <type> is not specified, it defaults to "blob".


-------------------------------------------------------

::

          -t <type>
              Specify the type (default: "blob").

          -w
              Actually write the object into the object database.

          --stdin
              Read the object from standard input instead of from a file.

          --stdin-paths
              Read file names from the standard input, one per line,
              instead of from the command-line.

          --path
              Hash object as it were located at the given path. The
              location of file does not directly influence on the hash
              value, but path is used to determine what Git filters should
              be applied to the object before it can be placed to the
              object database, and, as result of applying filters, the
              actual blob put into the object database may differ from the
              given file. This option is mainly useful for hashing
              temporary files located outside of the working directory or
              files read from stdin.

          --no-filters
              Hash the contents as is, ignoring any input filter that would
              have been chosen by the attributes mechanism, including the
              end-of-line conversion. If the file is read from standard
              input then this is always implied, unless the --path option
              is given.

          --literally
              Allow --stdin to hash any garbage into a loose object which
              might not otherwise pass standard object parsing or git-fsck
              checks. Useful for stress-testing Git itself or reproducing
              characteristics of corrupt or bogus objects encountered in
              the wild.


-----------------------------------------------

::

          Part of the git(1) suite

COLOPHON
---------------------------------------------------------

::

          This page is part of the git (Git distributed version control
          system) project.  Information about the project can be found at
          ⟨http://git-scm.com/⟩.  If you have a bug report for this manual
          page, see ⟨http://git-scm.com/community⟩.  This page was obtained
          from the project's upstream Git repository
          ⟨https://github.com/git/git.git⟩ on 2021-08-27.  (At that time,
          the date of the most recent commit that was found in the
          repository was 2021-08-24.)  If you discover any rendering
          problems in this HTML version of the page, or you believe there
          is a better or more up-to-date source for the page, or you have
          corrections or improvements to the information in this COLOPHON
          (which is not part of the original manual page), send a mail to
          man-pages@man7.org

   Git 2.33.0.69.gc420321         08/27/2021             GIT-HASH-OBJECT(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-mktag(1) <../man1/git-mktag.1.html>`__, 
`git-replace(1) <../man1/git-replace.1.html>`__

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
