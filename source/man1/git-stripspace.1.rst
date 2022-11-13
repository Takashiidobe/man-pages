.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-stripspace(1) — Linux manual page
=====================================

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

   GIT-STRIPSPACE(1)              Git Manual              GIT-STRIPSPACE(1)

NAME
-------------------------------------------------

::

          git-stripspace - Remove unnecessary whitespace


---------------------------------------------------------

::

          git stripspace [-s | --strip-comments]
          git stripspace [-c | --comment-lines]


---------------------------------------------------------------

::

          Read text, such as commit messages, notes, tags and branch
          descriptions, from the standard input and clean it in the manner
          used by Git.

          With no arguments, this will:

          •   remove trailing whitespace from all lines

          •   collapse multiple consecutive empty lines into one empty line

          •   remove empty lines from the beginning and end of the input

          •   add a missing \n to the last line if necessary.

          In the case where the input consists entirely of whitespace
          characters, no output will be produced.

          NOTE: This is intended for cleaning metadata, prefer the
          --whitespace=fix mode of git-apply(1) for correcting whitespace
          of patches or files in the repository.


-------------------------------------------------------

::

          -s, --strip-comments
              Skip and remove all lines starting with comment character
              (default #).

          -c, --comment-lines
              Prepend comment character and blank to each line. Lines will
              automatically be terminated with a newline. On empty lines,
              only the comment character will be prepended.


---------------------------------------------------------

::

          Given the following noisy input with $ indicating the end of a
          line:

              |A brief introduction   $
              |   $
              |$
              |A new paragraph$
              |# with a commented-out line    $
              |explaining lots of stuff.$
              |$
              |# An old paragraph, also commented-out. $
              |      $
              |The end.$
              |  $

          Use git stripspace with no arguments to obtain:

              |A brief introduction$
              |$
              |A new paragraph$
              |# with a commented-out line$
              |explaining lots of stuff.$
              |$
              |# An old paragraph, also commented-out.$
              |$
              |The end.$

          Use git stripspace --strip-comments to obtain:

              |A brief introduction$
              |$
              |A new paragraph$
              |explaining lots of stuff.$
              |$
              |The end.$


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

   Git 2.33.0.69.gc420321         08/27/2021              GIT-STRIPSPACE(1)

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
