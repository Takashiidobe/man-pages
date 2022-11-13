.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

dumpe2fs(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXIT CODE <#EXIT_CODE>`__ \|     |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   DUMPE2FS(8)              System Manager's Manual             DUMPE2FS(8)

NAME
-------------------------------------------------

::

          dumpe2fs - dump ext2/ext3/ext4 file system information


---------------------------------------------------------

::

          dumpe2fs [ -bfghixV ] [ -o superblock=superblock ] [ -o
          blocksize=blocksize ] device


---------------------------------------------------------------

::

          dumpe2fs prints the super block and blocks group information for
          the file system present on device.

          Note: When used with a mounted file system, the printed
          information may be old or inconsistent.


-------------------------------------------------------

::

          -b     print the blocks which are reserved as bad in the file
                 system.

          -o superblock=superblock
                 use the block superblock when examining the file system.
                 This option is not usually needed except by a file system
                 wizard who is examining the remains of a very badly
                 corrupted file system.

          -o blocksize=blocksize
                 use blocks of blocksize bytes when examining the file
                 system.  This option is not usually needed except by a
                 file system wizard who is examining the remains of a very
                 badly corrupted file system.

          -f     force dumpe2fs to display a file system even though it may
                 have some file system feature flags which dumpe2fs may not
                 understand (and which can cause some of dumpe2fs's display
                 to be suspect).

          -g     display the group descriptor information in a machine
                 readable colon-separated value format.  The fields
                 displayed are the group number; the number of the first
                 block in the group; the superblock location (or -1 if not
                 present); the range of blocks used by the group
                 descriptors (or -1 if not present); the block bitmap
                 location; the inode bitmap location; and the range of
                 blocks used by the inode table.

          -h     only display the superblock information and not any of the
                 block group descriptor detail information.

          -i     display the file system data from an image file created by
                 e2image, using device as the pathname to the image file.

          -m     If the mmp feature is enabled on the file system, check if
                 device is in use by another node, see e2mmpstatus(8) for
                 full details.  If used together with the -i option, only
                 the MMP block information is printed.

          -x     print the detailed group information block numbers in
                 hexadecimal format

          -V     print the version number of dumpe2fs and exit.


-----------------------------------------------------------

::

          dumpe2fs exits with a return code of 0 if the operation completed
          without errors.  It will exit with a non-zero return code if
          there are any errors, such as problems reading a valid
          superblock, bad checksums, or if the device is in use by another
          node and -m is specified.


-------------------------------------------------

::

          You may need to know the physical file system structure to
          understand the output.


-----------------------------------------------------

::

          dumpe2fs was written by Remy Card <Remy.Card@linux.org>.  It is
          currently being maintained by Theodore Ts'o <tytso@alum.mit.edu>.


-----------------------------------------------------------------

::

          dumpe2fs is part of the e2fsprogs package and is available from
          http://e2fsprogs.sourceforge.net.


---------------------------------------------------------

::

          e2fsck(8), e2mmpstatus(8), mke2fs(8), tune2fs(8).  ext4(5)

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

   E2fsprogs version 1.46.4       August 2021                   DUMPE2FS(8)

--------------

Pages that refer to this page: `ext4(5) <../man5/ext4.5.html>`__, 
`badblocks(8) <../man8/badblocks.8.html>`__, 
`debugfs(8) <../man8/debugfs.8.html>`__, 
`e2freefrag(8) <../man8/e2freefrag.8.html>`__, 
`e2fsck(8) <../man8/e2fsck.8.html>`__, 
`e2image(8) <../man8/e2image.8.html>`__, 
`e2mmpstatus(8) <../man8/e2mmpstatus.8.html>`__, 
`mke2fs(8) <../man8/mke2fs.8.html>`__, 
`tune2fs(8) <../man8/tune2fs.8.html>`__

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
