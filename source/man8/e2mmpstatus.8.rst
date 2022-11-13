.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

e2mmpstatus(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXIT CODE <#EXIT_CODE>`__ \|     |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   E2MMPSTATUS(8)           System Manager's Manual          E2MMPSTATUS(8)

NAME
-------------------------------------------------

::

          e2mmpstatus - Check MMP status of an ext4 file system


---------------------------------------------------------

::

          e2mmpstatus [-i] <filesystem>


-------------------------------------------------------

::

          -i     prints out the MMP information rather than check it.


---------------------------------------------------------------

::

          e2mmpstatus is used to check Multiple-Mount Protection (MMP)
          status of an ext4 file system with the mmp feature enabled.  The
          specified file system can be a device name (e.g.  /dev/hdc1,
          /dev/sdb2), or an ext4 file system label or UUID, for example
          UUID=8868abf6-88c5-4a83-98b8-bfc24057f7bd or LABEL=root.  By
          default, the e2mmpstatus program checks whether it is safe to
          mount the file system without taking the risk of mounting it more
          than once.

          MMP (multiple-mount protection) is a feature that adds protection
          against the file system being modified simultaneously by more
          than one node.  It is NOT safe to mount a file system when one of
          the following conditions is true:
               1. e2fsck is running on the file system.
               2. the file system is in use by another node.
               3. The MMP block is corrupted or cannot be read for some
          reason.
          The e2mmpstatus program might wait for some time to see whether
          the MMP block is being updated by any node during this period.
          The time taken depends on how frequently the MMP block is being
          written by the other node.


-----------------------------------------------------------

::

          The exit code returned by e2mmpstatus is 0 when it is safe to
          mount the file system, 1 when the MMP block shows the file system
          is in use on another node and it is NOT safe to mount the file
          system, and 2 if some other failure occurred that prevents the
          check from properly detecting the current MMP status.


---------------------------------------------------------

::

          dumpe2fs(8), e2fsck(8), fstab(5), fsck(8),

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

   E2fsprogs version 1.46.4       August 2021                E2MMPSTATUS(8)

--------------

Pages that refer to this page: `dumpe2fs(8) <../man8/dumpe2fs.8.html>`__

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
