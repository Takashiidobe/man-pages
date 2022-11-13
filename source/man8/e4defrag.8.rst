.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

e4defrag(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   E4DEFRAG(8)              System Manager's Manual             E4DEFRAG(8)

NAME
-------------------------------------------------

::

          e4defrag - online defragmenter for ext4 file system


---------------------------------------------------------

::

          e4defrag [ -c ] [ -v ] target ...


---------------------------------------------------------------

::

          e4defrag reduces fragmentation of extent based file. The file
          targeted by e4defrag is created on ext4 file system made with "-O
          extent" option (see mke2fs(8)).  The targeted file gets more
          contiguous blocks and improves the file access speed.

          target is a regular file, a directory, or a device that is
          mounted as ext4 file system.  If target is a directory, e4defrag
          reduces fragmentation of all files in it. If target is a device,
          e4defrag gets the mount point of it and reduces fragmentation of
          all files in this mount point.


-------------------------------------------------------

::

          -c     Get a current fragmentation count and an ideal
                 fragmentation count, and calculate fragmentation score
                 based on them. By seeing this score, we can determine
                 whether we should execute e4defrag to target.  When used
                 with -v option, the current fragmentation count and the
                 ideal fragmentation count are printed for each file.

                 Also this option outputs the average data size in one
                 extent. If you see it, you'll find the file has ideal
                 extents or not. Note that the maximum extent size is
                 131072KB in ext4 file system (if block size is 4KB).

                 If this option is specified, target is never defragmented.

          -v     Print error messages and the fragmentation count before
                 and after defrag for each file.


---------------------------------------------------

::

          e4defrag does not support swap file, files in lost+found
          directory, and files allocated in indirect blocks. When target is
          a device or a mount point, e4defrag doesn't defragment files in
          mount point of other device.

          It is safe to run e4defrag on a file while it is actively in use
          by another application.  Since the contents of file blocks are
          copied using the page cache, this can result in a performance
          slowdown to both e4defrag and the application due to contention
          over the system's memory and disk bandwidth.

          If the file system's free space is fragmented, or if there is
          insufficient free space available, e4defrag may not be able to
          improve the file's fragmentation.

          Non-privileged users can execute e4defrag to their own file, but
          the score is not printed if -c option is specified. Therefore, it
          is desirable to be executed by root user.


-----------------------------------------------------

::

          Written by Akira Fujita <a-fujita@rs.jp.nec.com> and Takashi Sato
          <t-sato@yk.jp.nec.com>.


---------------------------------------------------------

::

          mke2fs(8), mount(8).

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

   e4defrag version 2.0            May 2009                     E4DEFRAG(8)

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
