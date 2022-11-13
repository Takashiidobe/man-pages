.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-ls-tree(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `                                 |                                   |
| OUTPUT FORMAT <#OUTPUT_FORMAT>`__ |                                   |
| \| `GIT <#GIT>`__ \|              |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-LS-TREE(1)                 Git Manual                 GIT-LS-TREE(1)

NAME
-------------------------------------------------

::

          git-ls-tree - List the contents of a tree object


---------------------------------------------------------

::

          git ls-tree [-d] [-r] [-t] [-l] [-z]
                      [--name-only] [--name-status] [--full-name] [--full-tree] [--abbrev[=<n>]]
                      <tree-ish> [<path>...]


---------------------------------------------------------------

::

          Lists the contents of a given tree object, like what "/bin/ls -a"
          does in the current working directory. Note that:

          •   the behaviour is slightly different from that of "/bin/ls" in
              that the <path> denotes just a list of patterns to match,
              e.g. so specifying directory name (without -r) will behave
              differently, and order of the arguments does not matter.

          •   the behaviour is similar to that of "/bin/ls" in that the
              <path> is taken as relative to the current working directory.
              E.g. when you are in a directory sub that has a directory
              dir, you can run git ls-tree -r HEAD dir to list the contents
              of the tree (that is sub/dir in HEAD). You don’t want to give
              a tree that is not at the root level (e.g.  git ls-tree -r
              HEAD:sub dir) in this case, as that would result in asking
              for sub/sub/dir in the HEAD commit. However, the current
              working directory can be ignored by passing --full-tree
              option.


-------------------------------------------------------

::

          <tree-ish>
              Id of a tree-ish.

          -d
              Show only the named tree entry itself, not its children.

          -r
              Recurse into sub-trees.

          -t
              Show tree entries even when going to recurse them. Has no
              effect if -r was not passed.  -d implies -t.

          -l, --long
              Show object size of blob (file) entries.

          -z
              \0 line termination on output and do not quote filenames. See
              OUTPUT FORMAT below for more information.

          --name-only, --name-status
              List only filenames (instead of the "long" output), one per
              line.

          --abbrev[=<n>]
              Instead of showing the full 40-byte hexadecimal object lines,
              show the shortest prefix that is at least <n> hexdigits long
              that uniquely refers the object. Non default number of digits
              can be specified with --abbrev=<n>.

          --full-name
              Instead of showing the path names relative to the current
              working directory, show the full path names.

          --full-tree
              Do not limit the listing to the current working directory.
              Implies --full-name.

          [<path>...]
              When paths are given, show them (note that this isn’t really
              raw pathnames, but rather a list of patterns to match).
              Otherwise implicitly uses the root level of the tree as the
              sole path argument.


-------------------------------------------------------------------

::

              <mode> SP <type> SP <object> TAB <file>

          This output format is compatible with what --index-info --stdin
          of git update-index expects.

          When the -l option is used, format changes to

              <mode> SP <type> SP <object> SP <object size> TAB <file>

          Object size identified by <object> is given in bytes, and
          right-justified with minimum width of 7 characters. Object size
          is given only for blobs (file) entries; for other entries -
          character is used in place of size.

          Without the -z option, pathnames with "unusual" characters are
          quoted as explained for the configuration variable core.quotePath
          (see git-config(1)). Using -z the filename is output verbatim and
          the line is terminated by a NUL byte.


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

   Git 2.33.0.69.gc420321         08/27/2021                 GIT-LS-TREE(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`gitweb.conf(5) <../man5/gitweb.conf.5.html>`__

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
