.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-request-pull(1) — Linux manual page
=======================================

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

   GIT-REQUEST-PULL(1)            Git Manual            GIT-REQUEST-PULL(1)

NAME
-------------------------------------------------

::

          git-request-pull - Generates a summary of pending changes


---------------------------------------------------------

::

          git request-pull [-p] <start> <url> [<end>]


---------------------------------------------------------------

::

          Generate a request asking your upstream project to pull changes
          into their tree. The request, printed to the standard output,
          begins with the branch description, summarizes the changes and
          indicates from where they can be pulled.

          The upstream project is expected to have the commit named by
          <start> and the output asks it to integrate the changes you made
          since that commit, up to the commit named by <end>, by visiting
          the repository named by <url>.


-------------------------------------------------------

::

          -p
              Include patch text in the output.

          <start>
              Commit to start at. This names a commit that is already in
              the upstream history.

          <url>
              The repository URL to be pulled from.

          <end>
              Commit to end at (defaults to HEAD). This names the commit at
              the tip of the history you are asking to be pulled.

              When the repository named by <url> has the commit at a tip of
              a ref that is different from the ref you have locally, you
              can use the <local>:<remote> syntax, to have its local name,
              a colon :, and its remote name.


---------------------------------------------------------

::

          Imagine that you built your work on your master branch on top of
          the v1.0 release, and want it to be integrated to the project.
          First you push that change to your public repository for others
          to see:

              git push https://git.ko.xz/project master

          Then, you run this command:

              git request-pull v1.0 https://git.ko.xz/project master

          which will produce a request to the upstream, summarizing the
          changes between the v1.0 release and your master, to pull it from
          your public repository.

          If you pushed your change to a branch whose name is different
          from the one you have locally, e.g.

              git push https://git.ko.xz/project master:for-linus

          then you can ask that to be pulled with

              git request-pull v1.0 https://git.ko.xz/project master:for-linus


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

   Git 2.33.0.69.gc420321         08/27/2021            GIT-REQUEST-PULL(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`giteveryday(7) <../man7/giteveryday.7.html>`__, 
`gitworkflows(7) <../man7/gitworkflows.7.html>`__

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
