.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

filefrag(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   FILEFRAG(8)              System Manager's Manual             FILEFRAG(8)

NAME
-------------------------------------------------

::

          filefrag - report on file fragmentation


---------------------------------------------------------

::

          filefrag [ -bblocksize ] [ -BeEkPsvVxX ] [ files...  ]


---------------------------------------------------------------

::

          filefrag reports on how badly fragmented a particular file might
          be.  It makes allowances for indirect blocks for ext2 and ext3
          file systems, but can be used on files for any file system.

          The filefrag program initially attempts to get the extent
          information using FIEMAP ioctl which is more efficient and
          faster.  If FIEMAP is not supported then filefrag will fall back
          to using FIBMAP.


-------------------------------------------------------

::

          -B     Force the use of the older FIBMAP ioctl instead of the
                 FIEMAP ioctl for testing purposes.

          -bblocksize
                 Use blocksize in bytes, or with [KMG] suffix, up to 1GB
                 for output instead of the file system blocksize.  For
                 compatibility with earlier versions of filefrag, if
                 blocksize is unspecified it defaults to 1024 bytes.  Since
                 blocksize is an optional argument, it must be added
                 without any space after -b.

          -e     Print output in extent format, even for block-mapped
                 files.

          -E     Display the contents of ext4's extent status cache.  This
                 feature is not supported on all kernels, and is only
                 supported on ext4 file systems.

          -k     Use 1024-byte blocksize for output (identical to
                 '-b1024').

          -P     Pre-load the ext4 extent status cache for the file.  This
                 is not supported on all kernels, and is only supported on
                 ext4 file systems.

          -s     Sync the file before requesting the mapping.

          -v     Be verbose when checking for file fragmentation.

          -V     Print version number of program and library.  If given
                 twice, also print the FIEMAP flags that are understood by
                 the current version.

          -x     Display mapping of extended attributes.

          -X     Display extent block numbers in hexadecimal format.


-----------------------------------------------------

::

          filefrag was written by Theodore Ts'o <tytso@mit.edu>.

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

   E2fsprogs version 1.46.4       August 2021                   FILEFRAG(8)

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
