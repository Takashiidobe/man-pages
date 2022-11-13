.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stg-new(1) — Linux manual page
==============================

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

   STG-NEW(1)                    StGit Manual                    STG-NEW(1)

NAME
-------------------------------------------------

::

          stg-new - Create a new, empty patch


---------------------------------------------------------

::

          stg new [options] [--] [<name>]


---------------------------------------------------------------

::

          Create a new, empty patch on the current stack. The new patch is
          created on top of the currently applied patches, and is made the
          new top of the stack. Uncommitted changes in the work tree are
          not included in the patch — that is handled by stg-refresh(1).

          The given name must be unique in the stack, and may only contain
          alphanumeric characters, dashes and underscores. If no name is
          given, one is generated from the first line of the patch’s commit
          message.

          An editor will be launched to edit the commit message to be used
          for the patch, unless the --message flag already specified one.
          The patchdescr.tmpl template file (if available) is used to
          pre-fill the editor.


-------------------------------------------------------

::

          --author "NAME <EMAIL>"
              Set the author details.

          --authname NAME
              Set the author name.

          --authemail EMAIL
              Set the author email.

          --authdate DATE
              Set the author date.

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

          --sign
              Add a "Signed-off-by:" to the end of the patch.

          --ack
              Add an "Acked-by:" line to the end of the patch.

          --review
              Add a "Reviewed-by:" line to the end of the patch.

          --no-verify
              This option bypasses the commit-msg hook.


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

   StGit 1.0-10-ga6b3             08/27/2021                     STG-NEW(1)

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
