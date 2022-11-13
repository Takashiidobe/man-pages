.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fuse2fs(1) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AVAILABILITY <#AVAILABILITY>`__  |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FUSE2FS(1)               General Commands Manual              FUSE2FS(1)

NAME
-------------------------------------------------

::

          fuse2fs - FUSE file system client for ext2/ext3/ext4 file systems


---------------------------------------------------------

::

          fuse2fs [ device/image ] [ mountpoint ] [ options ]


---------------------------------------------------------------

::

          fuse2fs is a FUSE file system client that supports reading and
          writing from devices or image files containing ext2, ext3, and
          ext4 file systems.


-------------------------------------------------------

::

      general options:
          -o opt,[opt...]
                 mount options

          -h   --help
                 print help

          -V   --version
                 print version

      fuse2fs options:
          -o ro  read-only mount

          -o errors=panic
                 dump core on error

          -o minixdf
                 minix-style df

          -o fakeroot
                 pretend to be root for permission checks

          -o no_default_opts
                 do not include default fuse options

          -o norecovery
                 do not replay the journal and mount the file system read-
                 only

          -o fuse2fs_debug
                 enable fuse2fs debugging

      FUSE options:
          -d -o debug
                 enable debug output (implies -f)

          -f     foreground operation

          -s     disable multi-threaded operation

          For other FUSE options please see mount.fuse(8) or see the output
          of fuse2fs --helpfull


-----------------------------------------------------------------

::

          fuse2fs is part of the e2fsprogs package and is available from
          http://e2fsprogs.sourceforge.net.


---------------------------------------------------------

::

          ext4(5) e2fsck(8), mount.fuse(8)

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

   E2fsprogs version 1.46.4       August 2021                    FUSE2FS(1)

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
