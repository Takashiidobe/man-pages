.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

btrfs-find-root(8) — Linux manual page
======================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT STATUS <#EXIT_STATUS>`__ \| |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   BTRFS-FIND-ROOT(8)            Btrfs Manual            BTRFS-FIND-ROOT(8)

NAME
-------------------------------------------------

::

          btrfs-find-root - filter to find btrfs root


---------------------------------------------------------

::

          btrfs-find-root [options] <device>


---------------------------------------------------------------

::

          btrfs-find-root is used to find the satisfied root, you can
          filter by root tree’s objectid, generation, level.


-------------------------------------------------------

::

          -a
              Search through all metadata extents, even the root has been
              already found.

          -g <generation>
              Filter root tree by it’s original transaction id, tree root’s
              generation in default.

          -o <objectid>
              Filter root tree by it’s objectid,tree root’s objectid in
              default.

          -l <level>
              Filter root tree by B-+ tree’s level, level 0 in default.


---------------------------------------------------------------

::

          btrfs-find-root will return 0 if no error happened. If any
          problems happened, 1 will be returned.


---------------------------------------------------------

::

          mkfs.btrfs(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the btrfs-progs (btrfs filesystem tools)
          project.  Information about the project can be found at 
          ⟨https://btrfs.wiki.kernel.org/index.php/Btrfs_source_repositories⟩.
          If you have a bug report for this manual page, see
          ⟨https://btrfs.wiki.kernel.org/index.php/Problem_FAQ#How_do_I_report_bugs_and_issues.3F⟩.
          This page was obtained from the project's upstream Git repository
          ⟨git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git⟩
          on 2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-07-30.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   Btrfs v4.6.1                   05/16/2020             BTRFS-FIND-ROOT(8)

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
