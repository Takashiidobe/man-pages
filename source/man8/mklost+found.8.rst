.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mklost+found(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MKLOST+FOUND(8)          System Manager's Manual         MKLOST+FOUND(8)

NAME
-------------------------------------------------

::

          mklost+found - create a lost+found directory on a mounted Linux
          second extended file system


---------------------------------------------------------

::

          mklost+found


---------------------------------------------------------------

::

          mklost+found is used to create a lost+found directory in the
          current working directory on a Linux second extended file system.
          There is normally a lost+found directory in the root directory of
          each file system.

          mklost+found pre-allocates disk blocks to the lost+found
          directory so that when e2fsck(8) is being run to recover a file
          system, it does not need to allocate blocks in the file system to
          store a large number of unlinked files.  This ensures that e2fsck
          will not have to allocate data blocks in the file system during
          recovery.


-------------------------------------------------------

::

          There are none.


-----------------------------------------------------

::

          mklost+found has been written by Remy Card <Remy.Card@linux.org>.
          It is currently being maintained by Theodore Ts'o
          <tytso@alum.mit.edu>.


-------------------------------------------------

::

          There are none :-)


-----------------------------------------------------------------

::

          mklost+found is part of the e2fsprogs package and is available
          from http://e2fsprogs.sourceforge.net.


---------------------------------------------------------

::

          e2fsck(8), mke2fs(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the e2fsprogs (utilities for ext2/3/4
          filesystems) project.  Information about the project can be found
          at ⟨http://e2fsprogs.sourceforge.net/⟩.  It is not known how to
          report bugs for this man page; if you know, please send a mail to
          man-pages@man7.org.  This page was obtained from the project's
          upstream Git repository
          ⟨git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-22.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

   E2fsprogs version 1.46.4       August 2021               MKLOST+FOUND(8)

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
