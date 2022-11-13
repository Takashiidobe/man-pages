.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-check-ignore(1) — Linux manual page
=======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `OUTPUT <#OUTPUT>`__ \|           |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-CHECK-IGNORE(1)            Git Manual            GIT-CHECK-IGNORE(1)

NAME
-------------------------------------------------

::

          git-check-ignore - Debug gitignore / exclude files


---------------------------------------------------------

::

          git check-ignore [<options>] <pathname>...
          git check-ignore [<options>] --stdin


---------------------------------------------------------------

::

          For each pathname given via the command-line or from a file via
          --stdin, check whether the file is excluded by .gitignore (or
          other input files to the exclude mechanism) and output the path
          if it is excluded.

          By default, tracked files are not shown at all since they are not
          subject to exclude rules; but see ‘--no-index’.


-------------------------------------------------------

::

          -q, --quiet
              Don’t output anything, just set exit status. This is only
              valid with a single pathname.

          -v, --verbose
              Instead of printing the paths that are excluded, for each
              path that matches an exclude pattern, print the exclude
              pattern together with the path. (Matching an exclude pattern
              usually means the path is excluded, but if the pattern begins
              with !  then it is a negated pattern and matching it means
              the path is NOT excluded.)

              For precedence rules within and between exclude sources, see
              gitignore(5).

          --stdin
              Read pathnames from the standard input, one per line, instead
              of from the command-line.

          -z
              The output format is modified to be machine-parsable (see
              below). If --stdin is also given, input paths are separated
              with a NUL character instead of a linefeed character.

          -n, --non-matching
              Show given paths which don’t match any pattern. This only
              makes sense when --verbose is enabled, otherwise it would not
              be possible to distinguish between paths which match a
              pattern and those which don’t.

          --no-index
              Don’t look in the index when undertaking the checks. This can
              be used to debug why a path became tracked by e.g.  git add .
              and was not ignored by the rules as expected by the user or
              when developing patterns including negation to match a path
              previously added with git add -f.


-----------------------------------------------------

::

          By default, any of the given pathnames which match an ignore
          pattern will be output, one per line. If no pattern matches a
          given path, nothing will be output for that path; this means that
          path will not be ignored.

          If --verbose is specified, the output is a series of lines of the
          form:

          <source> <COLON> <linenum> <COLON> <pattern> <HT> <pathname>

          <pathname> is the path of a file being queried, <pattern> is the
          matching pattern, <source> is the pattern’s source file, and
          <linenum> is the line number of the pattern within that source.
          If the pattern contained a ! prefix or / suffix, it will be
          preserved in the output. <source> will be an absolute path when
          referring to the file configured by core.excludesFile, or
          relative to the repository root when referring to
          .git/info/exclude or a per-directory exclude file.

          If -z is specified, the pathnames in the output are delimited by
          the null character; if --verbose is also specified then null
          characters are also used instead of colons and hard tabs:

          <source> <NULL> <linenum> <NULL> <pattern> <NULL> <pathname>
          <NULL>

          If -n or --non-matching are specified, non-matching pathnames
          will also be output, in which case all fields in each output
          record except for <pathname> will be empty. This can be useful
          when running non-interactively, so that files can be
          incrementally streamed to STDIN of a long-running check-ignore
          process, and for each of these files, STDOUT will indicate
          whether that file matched a pattern or not. (Without this option,
          it would be impossible to tell whether the absence of output for
          a given file meant that it didn’t match any pattern, or that the
          output hadn’t been generated yet.)

          Buffering happens as documented under the GIT_FLUSH option in
          git(1). The caller is responsible for avoiding deadlocks caused
          by overfilling an input buffer or reading from an empty output
          buffer.


---------------------------------------------------------------

::

          0
              One or more of the provided paths is ignored.

          1
              None of the provided paths are ignored.

          128
              A fatal error was encountered.


---------------------------------------------------------

::

          gitignore(5) git-config(1) git-ls-files(1)


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

   Git 2.33.0.69.gc420321         08/27/2021            GIT-CHECK-IGNORE(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`gitignore(5) <../man5/gitignore.5.html>`__

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
