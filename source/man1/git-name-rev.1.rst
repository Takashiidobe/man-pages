.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-name-rev(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-NAME-REV(1)                Git Manual                GIT-NAME-REV(1)

NAME
-------------------------------------------------

::

          git-name-rev - Find symbolic names for given revs


---------------------------------------------------------

::

          git name-rev [--tags] [--refs=<pattern>]
                         ( --all | --stdin | <commit-ish>... )


---------------------------------------------------------------

::

          Finds symbolic names suitable for human digestion for revisions
          given in any format parsable by git rev-parse.


-------------------------------------------------------

::

          --tags
              Do not use branch names, but only tags to name the commits

          --refs=<pattern>
              Only use refs whose names match a given shell pattern. The
              pattern can be one of branch name, tag name or fully
              qualified ref name. If given multiple times, use refs whose
              names match any of the given shell patterns. Use --no-refs to
              clear any previous ref patterns given.

          --exclude=<pattern>
              Do not use any ref whose name matches a given shell pattern.
              The pattern can be one of branch name, tag name or fully
              qualified ref name. If given multiple times, a ref will be
              excluded when it matches any of the given patterns. When used
              together with --refs, a ref will be used as a match only when
              it matches at least one --refs pattern and does not match any
              --exclude patterns. Use --no-exclude to clear the list of
              exclude patterns.

          --all
              List all commits reachable from all refs

          --stdin
              Transform stdin by substituting all the 40-character SHA-1
              hexes (say $hex) with "$hex ($rev_name)". When used with
              --name-only, substitute with "$rev_name", omitting $hex
              altogether. Intended for the scripter’s use.

          --name-only
              Instead of printing both the SHA-1 and the name, print only
              the name. If given with --tags the usual tag prefix of
              "tags/" is also omitted from the name, matching the output of
              git-describe more closely.

          --no-undefined
              Die with error code != 0 when a reference is undefined,
              instead of printing undefined.

          --always
              Show uniquely abbreviated commit object as fallback.


---------------------------------------------------------

::

          Given a commit, find out where it is relative to the local refs.
          Say somebody wrote you about that fantastic commit
          33db5f4d9027a10e477ccf054b2c1ab94f74c85a. Of course, you look
          into the commit, but that only tells you what happened, but not
          the context.

          Enter git name-rev:

              % git name-rev 33db5f4d9027a10e477ccf054b2c1ab94f74c85a
              33db5f4d9027a10e477ccf054b2c1ab94f74c85a tags/v0.99~940

          Now you are wiser, because you know that it happened 940
          revisions before v0.99.

          Another nice thing you can do is:

              % git log | git name-rev --stdin


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

   Git 2.33.0.69.gc420321         08/27/2021                GIT-NAME-REV(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__

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
