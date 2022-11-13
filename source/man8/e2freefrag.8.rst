.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

e2freefrag(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLE <#EXAMPLE>`__ \|         |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   E2FREEFRAG(8)            System Manager's Manual           E2FREEFRAG(8)

NAME
-------------------------------------------------

::

          e2freefrag - report free space fragmentation information


---------------------------------------------------------

::

          e2freefrag [ -c chunk_kb ] [ -h ] filesys


---------------------------------------------------------------

::

          e2freefrag is used to report free space fragmentation on ext2/3/4
          file systems.  filesys is the file system device name (e.g.
          /dev/hdc1, /dev/md0).  The e2freefrag program will scan the block
          bitmap information to check how many free blocks are present as
          contiguous and aligned free space. The percentage of contiguous
          free blocks of size and of alignment chunk_kb is reported.  It
          also displays the minimum/maximum/average free chunk size in the
          file system, along with a histogram of all free chunks.  This
          information can be used to gauge the level of free space
          fragmentation in the file system.


-------------------------------------------------------

::

          -c chunk_kb
                 If a chunk size is specified, then e2freefrag will print
                 how many free chunks of size chunk_kb are available in
                 units of kilobytes (Kb).  The chunk size must be a power
                 of two and be larger than file system block size.

          -h     Print the usage of the program.


-------------------------------------------------------

::

          # e2freefrag /dev/vgroot/lvhome
          Device: /dev/vgroot/lvhome
          Blocksize: 4096 bytes
          Total blocks: 1504085
          Free blocks: 292995 (19.5%)

          Min. free extent: 4 KB
          Max. free extent: 24008 KB
          Avg. free extent: 252 KB

          HISTOGRAM OF FREE EXTENT SIZES:
          Extent Size Range :   Free extents   Free Blocks  Percent
              4K...    8K- :           704           704     0.2%
              8K...   16K- :           810          1979     0.7%
             16K...   32K- :           843          4467     1.5%
             32K...   64K- :           579          6263     2.1%
             64K...  128K- :           493         11067     3.8%
            128K...  256K- :           394         18097     6.2%
            256K...  512K- :           281         25477     8.7%
            512K... 1024K- :           253         44914    15.3%
              1M...    2M- :           143         51897    17.7%
              2M...    4M- :            73         50683    17.3%
              4M...    8M- :            37         52417    17.9%
              8M...   16M- :             7         19028     6.5%
             16M...   32M- :             1          6002     2.0%


-----------------------------------------------------

::

          This version of e2freefrag was written by Rupesh Thakare, and
          modified by Andreas Dilger <adilger@sun.com>, and Kalpak Shah.


---------------------------------------------------------

::

          debugfs(8), dumpe2fs(8), e2fsck(8)

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

   E2fsprogs version 1.46.4       August 2021                 E2FREEFRAG(8)

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
