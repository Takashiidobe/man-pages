.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-http-push(1) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SPECIFYING T                     |                                   |
| HE REFS <#SPECIFYING_THE_REFS>`__ |                                   |
| \| `GIT <#GIT>`__ \|              |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-HTTP-PUSH(1)               Git Manual               GIT-HTTP-PUSH(1)

NAME
-------------------------------------------------

::

          git-http-push - Push objects over HTTP/DAV to another repository


---------------------------------------------------------

::

          git http-push [--all] [--dry-run] [--force] [--verbose] <url> <ref> [<ref>...]


---------------------------------------------------------------

::

          Sends missing objects to remote repository, and updates the
          remote branch.

          NOTE: This command is temporarily disabled if your libcurl is
          older than 7.16, as the combination has been reported not to work
          and sometimes corrupts repository.


-------------------------------------------------------

::

          --all
              Do not assume that the remote repository is complete in its
              current state, and verify all objects in the entire local
              ref’s history exist in the remote repository.

          --force
              Usually, the command refuses to update a remote ref that is
              not an ancestor of the local ref used to overwrite it. This
              flag disables the check. What this means is that the remote
              repository can lose commits; use it with care.

          --dry-run
              Do everything except actually send the updates.

          --verbose
              Report the list of objects being walked locally and the list
              of objects successfully sent to the remote repository.

          -d, -D
              Remove <ref> from remote repository. The specified branch
              cannot be the remote HEAD. If -d is specified the following
              other conditions must also be met:

              •   Remote HEAD must resolve to an object that exists locally

              •   Specified branch resolves to an object that exists
                  locally

              •   Specified branch is an ancestor of the remote HEAD

          <ref>...
              The remote refs to update.


-------------------------------------------------------------------------------

::

          A <ref> specification can be either a single pattern, or a pair
          of such patterns separated by a colon ":" (this means that a ref
          name cannot have a colon in it). A single pattern <name> is just
          a shorthand for <name>:<name>.

          Each pattern pair consists of the source side (before the colon)
          and the destination side (after the colon). The ref to be pushed
          is determined by finding a match that matches the source side,
          and where it is pushed is determined by using the destination
          side.

          •   It is an error if <src> does not match exactly one of the
              local refs.

          •   If <dst> does not match any remote ref, either

              •   it has to start with "refs/"; <dst> is used as the
                  destination literally in this case.

              •   <src> == <dst> and the ref that matched the <src> must
                  not exist in the set of remote refs; the ref matched
                  <src> locally is used as the name of the destination.

          Without ‘--force`, the <src> ref is stored at the remote only if
          <dst> does not exist, or <dst> is a proper subset (i.e. an
          ancestor) of <src>. This check, known as "fast-forward check", is
          performed in order to avoid accidentally overwriting the remote
          ref and lose other peoples’ commits from there.

          With --force, the fast-forward check is disabled for all refs.

          Optionally, a <ref> parameter can be prefixed with a plus + sign
          to disable the fast-forward check only on that ref.


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

   Git 2.33.0.69.gc420321         08/27/2021               GIT-HTTP-PUSH(1)

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
