.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stg-refresh(1) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `STGIT <#STGIT>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STG-REFRESH(1)                StGit Manual                STG-REFRESH(1)

NAME
-------------------------------------------------

::

          stg-refresh - Generate a new commit for the current patch


---------------------------------------------------------

::

          stg refresh [options] [--] [<files or dirs>]


---------------------------------------------------------------

::

          Include the latest work tree and index changes in the current
          patch. This command generates a new git commit object for the
          patch; the old commit is no longer visible.

          Refresh will warn if the index is dirty, and require use of
          either the --index or --force options to override this check.
          This is to prevent accidental full refresh when only some changes
          were staged using git add interative mode.

          You may optionally list one or more files or directories relative
          to the current working directory; if you do, only matching files
          will be updated.

          Behind the scenes, stg refresh first creates a new temporary
          patch with your updates, and then merges that patch into the
          patch you asked to have refreshed. If you asked to refresh a
          patch other than the topmost patch, there can be conflicts; in
          that case, the temporary patch will be left for you to take care
          of, for example with stg squash.

          The creation of the temporary patch is recorded in a separate
          entry in the patch stack log; this means that one undo step will
          undo the merge between the other patch and the temp patch, and
          two undo steps will additionally get rid of the temp patch.

          Additionally, the --spill option resets the topmost patch,
          emptying the patch while leaving the patch’s changes intact in
          the worktree.


-------------------------------------------------------

::

          -u, --update
              Only update the current patch files.

          -i, --index
              Instead of setting the patch top to the current contents of
              the worktree, set it to the current contents of the index.

          -F, --force
              Instead of warning the user when some work has already been
              staged (such as with git add interactive mode) force a full
              refresh.

          -p PATCH, --patch PATCH
              Refresh (applied) PATCH instead of the top patch.

          -e, --edit
              Invoke an editor for the patch description.

          -d, --diff
              Show diff when editing patch description.

          -a NOTE, --annotate NOTE
              Annotate the patch log entry.

          -s, --submodules
              Include submodules when refreshing patch contents.

          --no-submodules
              Exclude submodules when refreshing patch contents.

          --spill
              Spill patch content to worktree and index, erasing patch
              content..

          -m MESSAGE, --message MESSAGE
              Use MESSAGE instead of invoking the editor.

          -f FILE, --file FILE
              Use the contents of FILE instead of invoking the editor. (If
              FILE is "-", write to stdout.)

          --no-verify
              This option bypasses the commit-msg hook.

          --sign
              Add a "Signed-off-by:" to the end of the patch.

          --ack
              Add an "Acked-by:" line to the end of the patch.

          --review
              Add a "Reviewed-by:" line to the end of the patch.

          --author "NAME <EMAIL>"
              Set the author details.

          --authname NAME
              Set the author name.

          --authemail EMAIL
              Set the author email.

          --authdate DATE
              Set the author date.

          -O OPTIONS, --diff-opts OPTIONS
              Extra options to pass to "git diff".


---------------------------------------------------

::

          Part of the StGit suite - see stg(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of the stgit (Stacked Git) project.
          Information about the project can be found at 
          ⟨http://www.procode.org/stgit/⟩.  If you have a bug report for
          this manual page, see ⟨http://www.procode.org/stgit/⟩.  This page
          was obtained from the project's upstream Git repository
          ⟨http://repo.or.cz/stgit.git⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-04-20.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

   StGit 1.0-10-ga6b3             08/27/2021                 STG-REFRESH(1)

--------------

Pages that refer to this page: `stg(1) <../man1/stg.1.html>`__, 
`stg-new(1) <../man1/stg-new.1.html>`__

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
