.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

hgignore(5) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SYNTAX <#SYNTAX>`__ \|           |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COPYING <#COPYING>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   HGIGNORE(5)                 Mercurial Manual                 HGIGNORE(5)

NAME
-------------------------------------------------

::

          hgignore - syntax for Mercurial ignore files


---------------------------------------------------------

::

          The Mercurial system uses a file called .hgignore in the root
          directory of a repository to control its behavior when it
          searches for files that it is not currently tracking.


---------------------------------------------------------------

::

          The working directory of a Mercurial repository will often
          contain files that should not be tracked by Mercurial. These
          include backup files created by editors and build products
          created by compilers.  These files can be ignored by listing them
          in a .hgignore file in the root of the working directory. The
          .hgignore file must be created manually. It is typically put
          under version control, so that the settings will propagate to
          other repositories with push and pull.

          An untracked file is ignored if its path relative to the
          repository root directory, or any prefix path of that path, is
          matched against any pattern in .hgignore.

          For example, say we have an untracked file, file.c, at a/b/file.c
          inside our repository. Mercurial will ignore file.c if any
          pattern in .hgignore matches a/b/file.c, a/b or a.

          In addition, a Mercurial configuration file can reference a set
          of per-user or global ignore files. See the ignore configuration
          key on the [ui] section of hg help config for details of how to
          configure these files.

          To control Mercurial's handling of files that it manages, many
          commands support the -I and -X options; see hg help <command> and
          hg help patterns for details.

          Files that are already tracked are not affected by .hgignore,
          even if they appear in .hgignore. An untracked file X can be
          explicitly added with hg add X, even if X would be excluded by a
          pattern in .hgignore.


-----------------------------------------------------

::

          An ignore file is a plain text file consisting of a list of
          patterns, with one pattern per line. Empty lines are skipped. The
          # character is treated as a comment character, and the \
          character is treated as an escape character.

          Mercurial supports several pattern syntaxes. The default syntax
          used is Python/Perl-style regular expressions.

          To change the syntax used, use a line of the following form:

          syntax: NAME

          where NAME is one of the following:

          regexp

                 Regular expression, Python/Perl syntax.

          glob

                 Shell-style glob.

          The chosen syntax stays in effect when parsing all patterns that
          follow, until another syntax is selected.

          Neither glob nor regexp patterns are rooted. A glob-syntax
          pattern of the form *.c will match a file ending in .c in any
          directory, and a regexp pattern of the form \.c$ will do the
          same. To root a regexp pattern, start it with ^.

          Note   Patterns specified in other than .hgignore are always
                 rooted.  Please see hg help patterns for details.


-------------------------------------------------------

::

          Here is an example ignore file.

          # use glob syntax.
          syntax: glob

          *.elc
          *.pyc
          *~

          # switch to regexp syntax.
          syntax: regexp
          ^\.pc/


-----------------------------------------------------

::

          Vadim Gelfer <vadim.gelfer@gmail.com>

          Mercurial was written by Matt Mackall <mpm@selenic.com>.


---------------------------------------------------------

::

          hg(1), hgrc(5)


-------------------------------------------------------

::

          This manual page is copyright 2006 Vadim Gelfer.  Mercurial is
          copyright 2005-2012 Matt Mackall.  Free use of this software is
          granted under the terms of the GNU General Public License version
          2 or any later version.

.. _author-top-1:


-----------------------------------------------------

::

          Vadim Gelfer <vadim.gelfer@gmail.com>

          Organization: Mercurial

COLOPHON
---------------------------------------------------------

::

          This page is part of the hg (Mercurial source code management
          system) project.  Information about the project can be found at
          ⟨http://mercurial.selenic.com/⟩.  If you have a bug report for
          this manual page, see
          ⟨http://mercurial.selenic.com/wiki/BugTracker⟩.  This page was
          obtained from the project's upstream Mercurial repository
          ⟨http://selenic.com/hg⟩ on 2021-08-27.  (At that time, the date
          of the most recent commit that was found in the repository was
          2021-08-20.)  If you discover any rendering problems in this HTML
          version of the page, or you believe there is a better or more up-
          to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                                                                HGIGNORE(5)

--------------

Pages that refer to this page: `hg(1) <../man1/hg.1.html>`__, 
`hgrc(5) <../man5/hgrc.5.html>`__

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
