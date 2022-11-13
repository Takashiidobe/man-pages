.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

git-replace(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FORMATS <#FORMATS>`__ \|         |                                   |
| `CREATING REPLACEMENT OBJECTS <   |                                   |
| #CREATING_REPLACEMENT_OBJECTS>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `GIT <#GIT>`__ \|                 |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GIT-REPLACE(1)                 Git Manual                 GIT-REPLACE(1)

NAME
-------------------------------------------------

::

          git-replace - Create, list, delete refs to replace objects


---------------------------------------------------------

::

          git replace [-f] <object> <replacement>
          git replace [-f] --edit <object>
          git replace [-f] --graft <commit> [<parent>...]
          git replace [-f] --convert-graft-file
          git replace -d <object>...
          git replace [--format=<format>] [-l [<pattern>]]


---------------------------------------------------------------

::

          Adds a replace reference in refs/replace/ namespace.

          The name of the replace reference is the SHA-1 of the object that
          is replaced. The content of the replace reference is the SHA-1 of
          the replacement object.

          The replaced object and the replacement object must be of the
          same type. This restriction can be bypassed using -f.

          Unless -f is given, the replace reference must not yet exist.

          There is no other restriction on the replaced and replacement
          objects. Merge commits can be replaced by non-merge commits and
          vice versa.

          Replacement references will be used by default by all Git
          commands except those doing reachability traversal (prune, pack
          transfer and fsck).

          It is possible to disable use of replacement references for any
          command using the --no-replace-objects option just after git.

          For example if commit foo has been replaced by commit bar:

              $ git --no-replace-objects cat-file commit foo

          shows information about commit foo, while:

              $ git cat-file commit foo

          shows information about commit bar.

          The GIT_NO_REPLACE_OBJECTS environment variable can be set to
          achieve the same effect as the --no-replace-objects option.


-------------------------------------------------------

::

          -f, --force
              If an existing replace ref for the same object exists, it
              will be overwritten (instead of failing).

          -d, --delete
              Delete existing replace refs for the given objects.

          --edit <object>
              Edit an object’s content interactively. The existing content
              for <object> is pretty-printed into a temporary file, an
              editor is launched on the file, and the result is parsed to
              create a new object of the same type as <object>. A
              replacement ref is then created to replace <object> with the
              newly created object. See git-var(1) for details about how
              the editor will be chosen.

          --raw
              When editing, provide the raw object contents rather than
              pretty-printed ones. Currently this only affects trees, which
              will be shown in their binary form. This is harder to work
              with, but can help when repairing a tree that is so corrupted
              it cannot be pretty-printed. Note that you may need to
              configure your editor to cleanly read and write binary data.

          --graft <commit> [<parent>...]
              Create a graft commit. A new commit is created with the same
              content as <commit> except that its parents will be
              [<parent>...] instead of <commit>'s parents. A replacement
              ref is then created to replace <commit> with the newly
              created commit. Use --convert-graft-file to convert a
              $GIT_DIR/info/grafts file and use replace refs instead.

          --convert-graft-file
              Creates graft commits for all entries in $GIT_DIR/info/grafts
              and deletes that file upon success. The purpose is to help
              users with transitioning off of the now-deprecated graft
              file.

          -l <pattern>, --list <pattern>
              List replace refs for objects that match the given pattern
              (or all if no pattern is given). Typing "git replace" without
              arguments, also lists all replace refs.

          --format=<format>
              When listing, use the specified <format>, which can be one of
              short, medium and long. When omitted, the format defaults to
              short.


-------------------------------------------------------

::

          The following format are available:

          •   short: <replaced sha1>

          •   medium: <replaced sha1> → <replacement sha1>

          •   long: <replaced sha1> (<replaced type>) → <replacement sha1>
              (<replacement type>)


-------------------------------------------------------------------------------------------------

::

          git-hash-object(1), git-rebase(1), and git-filter-repo[1], among
          other git commands, can be used to create replacement objects
          from existing objects. The --edit option can also be used with
          git replace to create a replacement object by editing an existing
          object.

          If you want to replace many blobs, trees or commits that are part
          of a string of commits, you may just want to create a replacement
          string of commits and then only replace the commit at the tip of
          the target string of commits with the commit at the tip of the
          replacement string of commits.


-------------------------------------------------

::

          Comparing blobs or trees that have been replaced with those that
          replace them will not work properly. And using git reset --hard
          to go back to a replaced commit will move the branch to the
          replacement commit instead of the replaced commit.

          There may be other problems when using git rev-list related to
          pending objects.


---------------------------------------------------------

::

          git-hash-object(1) git-rebase(1) git-tag(1) git-branch(1)
          git-commit(1) git-var(1) git(1) git-filter-repo[1]


-----------------------------------------------

::

          Part of the git(1) suite


---------------------------------------------------

::

           1. git-filter-repo
              https://github.com/newren/git-filter-repo

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

   Git 2.33.0.69.gc420321         08/27/2021                 GIT-REPLACE(1)

--------------

Pages that refer to this page: `git(1) <../man1/git.1.html>`__, 
`git-config(1) <../man1/git-config.1.html>`__, 
`gitrepository-layout(5) <../man5/gitrepository-layout.5.html>`__, 
`gitglossary(7) <../man7/gitglossary.7.html>`__

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
