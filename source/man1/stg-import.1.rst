.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stg-import(1) — Linux manual page
=================================

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

   STG-IMPORT(1)                 StGit Manual                 STG-IMPORT(1)

NAME
-------------------------------------------------

::

          stg-import - Import a GNU diff file as a new patch


---------------------------------------------------------

::

          stg import [options] [--] [<file>|<url>]


---------------------------------------------------------------

::

          Create a new patch and apply the given GNU diff file (or the
          standard input). By default, the file name is used as the patch
          name but this can be overridden with the --name option. The patch
          can either be a normal file with the description at the top or it
          can have standard mail format, the Subject, From and Date headers
          being used for generating the patch information. The command can
          also read series and mbox files.

          If a patch does not apply cleanly, the failed diff is written to
          the .stgit-failed.patch file and an empty StGIT patch is added to
          the stack.

          The patch description has to be separated from the data with a
          --- line.


-------------------------------------------------------

::

          -m, --mail
              Import the patch from a standard e-mail file.

          -M, --mbox
              Import a series of patches from an mbox file.

          -s, --series
              Import a series of patches from a series file or a tar
              archive.

          -u, --url
              Import a patch from a URL.

          -n NAME, --name NAME
              Use NAME as the patch name.

          -p N, --strip N
              Remove N leading slashes from diff paths (default 1).

          -t, --stripname
              Strip numbering and extension from patch name.

          -i, --ignore
              Ignore the applied patches in the series.

          --replace
              Replace the unapplied patches in the series.

          -b BASE, --base BASE
              Use BASE instead of HEAD for file importing.

          --reject
              Leave the rejected hunks in corresponding *.rej files.

          --keep-cr
              Do not remove "\r" from email lines ending with "\r\n".

          -e, --edit
              Invoke an editor for the patch description.

          -d, --showdiff
              Show the patch content in the editor buffer.

          --author "NAME <EMAIL>"
              Set the author details.

          --authname NAME
              Set the author name.

          --authemail EMAIL
              Set the author email.

          --authdate DATE
              Set the author date.

          --sign
              Add a "Signed-off-by:" to the end of the patch.

          --ack
              Add an "Acked-by:" line to the end of the patch.

          --review
              Add a "Reviewed-by:" line to the end of the patch.


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

   StGit 1.0-10-ga6b3             08/27/2021                  STG-IMPORT(1)

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
