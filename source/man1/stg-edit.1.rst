.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stg-edit(1) — Linux manual page
===============================

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

   STG-EDIT(1)                   StGit Manual                   STG-EDIT(1)

NAME
-------------------------------------------------

::

          stg-edit - Edit a patch description or diff


---------------------------------------------------------

::

          stg edit [options] [--] [<patch>]


---------------------------------------------------------------

::

          Edit the description and author information of the given patch
          (or the current patch if no patch name was given). With --diff,
          also edit the diff.

          The editor is invoked with the following contents:

              From: A U Thor <author@example.com>
              Date: creation date

              Patch description

          If --diff was specified, the diff appears at the bottom, after a
          separator:

              ---

              Diff text

          Command-line options can be used to modify specific information
          without invoking the editor. (With the --edit option, the editor
          is invoked even if such command-line options are given.)

          If the patch diff is edited but does not apply, no changes are
          made to the patch at all. The edited patch is saved to a file
          which you can feed to "stg edit --file", once you have made sure
          it does apply.

          With --set-tree you set the git tree of the patch to the
          specified TREE-ISH without changing the tree of any other
          patches. When used on the top patch, the index and work tree will
          be updated to match the tree. This low-level option is primarily
          meant to be used by tools built on top of StGit, such as the
          Emacs mode. See also the --set-tree flag of stg push.


-------------------------------------------------------

::

          -d, --diff
              Edit the patch diff.

          -e, --edit
              Invoke interactive editor.

          --sign
              Add a "Signed-off-by:" to the end of the patch.

          --ack
              Add an "Acked-by:" line to the end of the patch.

          --review
              Add a "Reviewed-by:" line to the end of the patch.

          -m MESSAGE, --message MESSAGE
              Use MESSAGE instead of invoking the editor.

          -f FILE, --file FILE
              Use the contents of FILE instead of invoking the editor. (If
              FILE is "-", write to stdout.)

          --save-template FILE
              Instead of running the command, just write the message
              template to FILE, and exit. (If FILE is "-", write to
              stdout.)

              When driving StGit from another program, it is often useful
              to first call a command with --save-template, then let the
              user edit the message, and then call the same command with
              --file.

          --no-verify
              This option bypasses the commit-msg hook.

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

          -t TREE-ISH, --set-tree TREE-ISH
              Set the git tree of the patch to TREE-ISH.


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

   StGit 1.0-10-ga6b3             08/27/2021                    STG-EDIT(1)

--------------

Pages that refer to this page: `stg(1) <../man1/stg.1.html>`__

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
