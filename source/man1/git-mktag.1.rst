.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-mktag(1) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `TAG FORMAT <#TAG_FORMAT>`__ \|   |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-MKTAG(1)                   Git Manual                   GIT-MKTAG(1)

NAME
-------------------------------------------------

::

          git-mktag - Creates a tag object with extra validation


---------------------------------------------------------

::

          git mktag


---------------------------------------------------------------

::

          Reads a tag contents on standard input and creates a tag object.
          The output is the new tag’s <object> identifier.

          This command is mostly equivalent to git-hash-object(1) invoked
          with -t tag -w --stdin. I.e. both of these will create and write
          a tag found in my-tag:

              git mktag <my-tag
              git hash-object -t tag -w --stdin <my-tag

          The difference is that mktag will die before writing the tag if
          the tag doesn’t pass a git-fsck(1) check.

          The "fsck" check done mktag is stricter than what git-fsck(1)
          would run by default in that all fsck.<msg-id> messages are
          promoted from warnings to errors (so e.g. a missing "tagger" line
          is an error).

          Extra headers in the object are also an error under mktag, but
          ignored by git-fsck(1). This extra check can be turned off by
          setting the appropriate fsck.<msg-id> varible:

              git -c fsck.extraHeaderEntry=ignore mktag <my-tag-with-headers


-------------------------------------------------------

::

          --strict
              By default mktag turns on the equivalent of git-fsck(1)
              --strict mode. Use --no-strict to disable it.


-------------------------------------------------------------

::

          A tag signature file, to be fed to this command’s standard input,
          has a very simple fixed format: four lines of

              object <hash>
              type <typename>
              tag <tagname>
              tagger <tagger>

          followed by some optional free-form message (some tags created by
          older Git may not have tagger line). The message, when it exists,
          is separated by a blank line from the header. The message part
          may contain a signature that Git itself doesn’t care about, but
          that can be verified with gpg.


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

   Git 2.33.0.69.gc420321         08/27/2021                   GIT-MKTAG(1)

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
