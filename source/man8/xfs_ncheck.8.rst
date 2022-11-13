.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfs_ncheck(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   xfs_ncheck(8)            System Manager's Manual           xfs_ncheck(8)

NAME
-------------------------------------------------

::

          xfs_ncheck - generate pathnames from i-numbers for XFS


---------------------------------------------------------

::

          xfs_ncheck [ -i ino ] ... [ -f ] [ -s ] [ -l logdev ] device
          xfs_ncheck -V


---------------------------------------------------------------

::

          xfs_ncheck with no -i arguments generates an inode number and
          pathname list of all files on the given filesystem. Names of
          directory files are followed by /..  The output is not sorted in
          any particular order.  The filesystem to be examined is specified
          by the device argument, which should be the disk or volume device
          for the filesystem.  Filesystems stored in files can also be
          checked, using the -f flag.


-------------------------------------------------------

::

          -f       Specifies that the filesystem image to be processed is
                   stored in a regular file at device (see the mkfs.xfs -d
                   file option). This might happen if an image copy of a
                   filesystem has been made into an ordinary file.

          -l logdev
                   Specifies the device where the filesystem's external log
                   resides.  Only for those filesystems which use an
                   external log. See the mkfs.xfs -l option, and refer to
                   xfs(5) for a detailed description of the XFS log.

          -s       Limits the report to special files and files with
                   setuserid mode.  This option may be used to detect
                   violations of security policy.

          -i ino   Limits the report to only those files whose inode
                   numbers follow.  May be given multiple times to select
                   multiple inode numbers.

          -V       Prints the version number and exits.

          If the filesystem is seriously corrupted, or very busy and looks
          like it is corrupt, a message of the form that would be generated
          by the xfs_db(8) "check" command may appear.

          xfs_ncheck is only useful with XFS filesystems.


---------------------------------------------------------

::

          mkfs.xfs(8), xfs(5).

COLOPHON
---------------------------------------------------------

::

          This page is part of the xfsprogs (utilities for XFS filesystems)
          project.  Information about the project can be found at 
          ⟨http://xfs.org/⟩.  If you have a bug report for this manual page,
          send it to linux-xfs@vger.kernel.org.  This page was obtained
          from the project's upstream Git repository
          ⟨https://git.kernel.org/pub/scm/fs/xfs/xfsprogs-dev.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-20.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                              xfs_ncheck(8)

--------------

Pages that refer to this page: `xfs_db(8) <../man8/xfs_db.8.html>`__, 
`xfs_fsr(8) <../man8/xfs_fsr.8.html>`__

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
