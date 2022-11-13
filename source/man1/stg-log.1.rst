.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stg-log(1) — Linux manual page
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

   STG-LOG(1)                    StGit Manual                    STG-LOG(1)

NAME
-------------------------------------------------

::

          stg-log - Display or optionally clear the patch changelog


---------------------------------------------------------

::

          stg log [options] [--] [<patches>]


---------------------------------------------------------------

::

          List the history of the patch stack: the stack log. If one or
          more patch names are given, limit the list to the log entries
          that touch the named patches.

          "stg undo" and "stg redo" let you step back and forth in the
          patch stack. "stg reset" lets you go directly to any state.

          Given the --clear option, the log history will be deleted. This
          may be useful if the tree view has become too cluttered to be
          useful.


-------------------------------------------------------

::

          -b BRANCH, --branch BRANCH
              Use BRANCH instead of the default one.

          -d, --diff
              Show the refresh diffs.

          -n NUMBER, --number NUMBER
              Limit the output to NUMBER commits.

          -f, --full
              Show the full commit ids.

          -g, --graphical
              Run gitk instead of printing.

          --clear
              Clear the log history.


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

   StGit 1.0-10-ga6b3             08/27/2021                     STG-LOG(1)

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
