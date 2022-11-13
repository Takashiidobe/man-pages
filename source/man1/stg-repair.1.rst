.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

stg-repair(1) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `STGIT <#STGIT>`__ \|             |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   STG-REPAIR(1)                 StGit Manual                 STG-REPAIR(1)

NAME
-------------------------------------------------

::

          stg-repair - Fix StGit metadata if branch was modified with git
          commands


---------------------------------------------------------

::

          stg repair


---------------------------------------------------------------

::

          If you modify an StGit stack (branch) with some git commands —
          such as commit, pull, merge, and rebase — you will leave the
          StGit metadata in an inconsistent state. In that situation, you
          have two options:

           1. Use "stg undo" to undo the effect of the git commands. (If
              you know what you are doing and want more control, "git
              reset" or similar will work too.)

           2. Use "stg repair". This will fix up the StGit metadata to
              accommodate the modifications to the branch. Specifically, it
              will do the following:

              •   If you have made regular git commits on top of your stack
                  of StGit patches, "stg repair" makes new StGit patches
                  out of them, preserving their contents.

              •   However, merge commits cannot become patches; if you have
                  committed a merge on top of your stack, "repair" will
                  simply mark all patches below the merge unapplied, since
                  they are no longer reachable. If this is not what you
                  want, use "stg undo" to get rid of the merge and run "stg
                  repair" again.

              •   The applied patches are supposed to be precisely those
                  that are reachable from the branch head. If you have used
                  e.g. "git reset" to move the head, some applied patches
                  may no longer be reachable, and some unapplied patches
                  may have become reachable. "stg repair" will correct the
                  appliedness of such patches.

                      "stg repair" will fix these inconsistencies reliably, so as long
                      as you like what it does, you have no reason to avoid causing
                      them in the first place. For example, you might find it
                      convenient to make commits with a graphical tool and then have
                      "stg repair" make proper patches of the commits.

              Note
              If using git commands on the stack was a mistake, running
              "stg repair" is not what you want. In that case, what you
              want is option (1) above.


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

   StGit 1.0-10-ga6b3             08/27/2021                  STG-REPAIR(1)

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
