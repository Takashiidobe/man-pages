.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-upload-archive(1) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `SECURITY <#SECURITY>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-UPLOAD-ARCHIVE(1)          Git Manual          GIT-UPLOAD-ARCHIVE(1)

NAME
-------------------------------------------------

::

          git-upload-archive - Send archive back to git-archive


---------------------------------------------------------

::

          git upload-archive <directory>


---------------------------------------------------------------

::

          Invoked by git archive --remote and sends a generated archive to
          the other end over the Git protocol.

          This command is usually not invoked directly by the end user. The
          UI for the protocol is on the git archive side, and the program
          pair is meant to be used to get an archive from a remote
          repository.


---------------------------------------------------------

::

          In order to protect the privacy of objects that have been removed
          from history but may not yet have been pruned, git-upload-archive
          avoids serving archives for commits and trees that are not
          reachable from the repository’s refs. However, because
          calculating object reachability is computationally expensive,
          git-upload-archive implements a stricter but easier-to-check set
          of rules:

           1. Clients may request a commit or tree that is pointed to
              directly by a ref. E.g., git archive --remote=origin v1.0.

           2. Clients may request a sub-tree within a commit or tree using
              the ref:path syntax. E.g., git archive --remote=origin
              v1.0:Documentation.

           3. Clients may not use other sha1 expressions, even if the end
              result is reachable. E.g., neither a relative commit like
              master^ nor a literal sha1 like abcd1234 is allowed, even if
              the result is reachable from the refs.

          Note that rule 3 disallows many cases that do not have any
          privacy implications. These rules are subject to change in future
          versions of git, and the server accessed by git archive --remote
          may or may not follow these exact rules.

          If the config option uploadArchive.allowUnreachable is true,
          these rules are ignored, and clients may use arbitrary sha1
          expressions. This is useful if you do not care about the privacy
          of unreachable objects, or if your object database is already
          publicly available for access via non-smart-http.


-------------------------------------------------------

::

          <directory>
              The repository to get a tar archive from.


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

   Git 2.33.0.69.gc420321         08/27/2021          GIT-UPLOAD-ARCHIVE(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-archive(1) <../man1/git-archive.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__

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
