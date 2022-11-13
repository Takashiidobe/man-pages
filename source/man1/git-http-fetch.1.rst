.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-http-fetch(1) — Linux manual page
=====================================

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

   GIT-HTTP-FETCH(1)              Git Manual              GIT-HTTP-FETCH(1)

NAME
-------------------------------------------------

::

          git-http-fetch - Download from a remote Git repository via HTTP


---------------------------------------------------------

::

          git http-fetch [-c] [-t] [-a] [-d] [-v] [-w filename] [--recover] [--stdin | --packfile=<hash> | <commit>] <url>


---------------------------------------------------------------

::

          Downloads a remote Git repository via HTTP.

          This command always gets all objects. Historically, there were
          three options -a, -c and -t for choosing which objects to
          download. They are now silently ignored.


-------------------------------------------------------

::

          commit-id
              Either the hash or the filename under [URL]/refs/ to pull.

          -a, -c, -t
              These options are ignored for historical reasons.

          -v
              Report what is downloaded.

          -w <filename>
              Writes the commit-id into the filename under
              $GIT_DIR/refs/<filename> on the local end after the transfer
              is complete.

          --stdin
              Instead of a commit id on the command line (which is not
              expected in this case), git http-fetch expects lines on stdin
              in the format

                  <commit-id>['\t'<filename-as-in--w>]

          --packfile=<hash>
              For internal use only. Instead of a commit id on the command
              line (which is not expected in this case), git http-fetch
              fetches the packfile directly at the given URL and uses
              index-pack to generate corresponding .idx and .keep files.
              The hash is used to determine the name of the temporary file
              and is arbitrary. The output of index-pack is printed to
              stdout. Requires --index-pack-args.

          --index-pack-args=<args>
              For internal use only. The command to run on the contents of
              the downloaded pack. Arguments are URL-encoded separated by
              spaces.

          --recover
              Verify that everything reachable from target is fetched. Used
              after an earlier fetch is interrupted.


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

   Git 2.33.0.69.gc420321         08/27/2021              GIT-HTTP-FETCH(1)

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
