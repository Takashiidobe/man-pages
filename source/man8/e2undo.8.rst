.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

e2undo(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   E2UNDO(8)                System Manager's Manual               E2UNDO(8)

NAME
-------------------------------------------------

::

          e2undo - Replay an undo log for an ext2/ext3/ext4 file system


---------------------------------------------------------

::

          e2undo [ -f ] [ -h ] [ -n ] [ -o offset ] [ -v ] [ -z undo_file ]
          undo_log device


---------------------------------------------------------------

::

          e2undo will replay the undo log undo_log for an ext2/ext3/ext4
          file system found on device.  This can be used to undo a failed
          operation by an e2fsprogs program.


-------------------------------------------------------

::

          -f     Normally, e2undo will check the file system superblock to
                 make sure the undo log matches with the file system on the
                 device.  If they do not match, e2undo will refuse to apply
                 the undo log as a safety mechanism.  The -f option
                 disables this safety mechanism.

          -h     Display a usage message.

          -n     Dry-run; do not actually write blocks back to the file
                 system.

          -o offset
                 Specify the file system's offset (in bytes) from the
                 beginning of the device or file.

          -v     Report which block we're currently replaying.

          -z undo_file
                 Before overwriting a file system block, write the old
                 contents of the block to an undo file.  This undo file can
                 be used with e2undo(8) to restore the old contents of the
                 file system should something go wrong.  If the empty
                 string is passed as the undo_file argument, the undo file
                 will be written to a file named e2undo-device.e2undo in
                 the directory specified via the E2FSPROGS_UNDO_DIR
                 environment variable.

                 WARNING: The undo file cannot be used to recover from a
                 power or system crash.


-----------------------------------------------------

::

          e2undo was written by Aneesh Kumar K.V.
          (aneesh.kumar@linux.vnet.ibm.com)


-----------------------------------------------------------------

::

          e2undo is part of the e2fsprogs package and is available from
          http://e2fsprogs.sourceforge.net.


---------------------------------------------------------

::

          mke2fs(8), tune2fs(8)

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

   E2fsprogs version 1.46.4       August 2021                     E2UNDO(8)

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
