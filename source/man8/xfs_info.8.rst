.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfs_info(8) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::


   xfs_info(8)              System Manager's Manual             xfs_info(8)

NAME
-------------------------------------------------

::

          xfs_info - display XFS filesystem geometry information


---------------------------------------------------------

::

          xfs_info [ -t mtab ] [ mount-point | block-device | file-image ]
          xfs_info -V


---------------------------------------------------------------

::

          xfs_info displays geometry information about an existing XFS
          filesystem.  The mount-point argument is the pathname of a
          directory where the filesystem is mounted.  The block-device or
          file-image contain a raw XFS filesystem.  The existing contents
          of the filesystem are undisturbed.


-------------------------------------------------------

::

          -t     Specifies an alternate mount table file (default is
                 /proc/mounts if it exists, else /etc/mtab).  This is used
                 when working with filesystems mounted without writing to
                 /etc/mtab file - refer to mount(8) for further details.
                 This option has no effect with the block-device or file-
                 image parameters.

          -V     Prints the version number and exits. The mount-point
                 argument is not required with -V.


---------------------------------------------------------

::

          Understanding xfs_info output.

          Suppose one has the following "xfs_info /dev/sda" output:

            meta-data=/dev/pmem0             isize=512    agcount=8, agsize=5974144 blks
                     =                       sectsz=512   attr=2, projid32bit=1
                     =                       crc=1        finobt=1, sparse=1, rmapbt=1
                     =                       reflink=1
            data     =                       bsize=4096   blocks=47793152, imaxpct=25
                     =                       sunit=32     swidth=128 blks
            naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
            log      =internal log           bsize=4096   blocks=23336, version=2
                     =                       sectsz=512   sunit=0 blks, lazy-count=1
            realtime =none                   extsz=4096   blocks=0, rtextents=0

          Here, the data section of the output indicates "bsize=4096",
          meaning the data block size for this filesystem is 4096 bytes.
          This section also shows "sunit=32 swidth=128 blks", which means
          the stripe unit is 32*4096 bytes = 128 kibibytes and the stripe
          width is 128*4096 bytes = 512 kibibytes.  A single stripe of this
          filesystem therefore consists of four stripe units (128 blocks /
          32 blocks per unit).


---------------------------------------------------------

::

          mkfs.xfs(8), md(4), lvm(8), mount(8).

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

                                                                xfs_info(8)

--------------

Pages that refer to this page: `xfsctl(3) <../man3/xfsctl.3.html>`__, 
`xfs(5) <../man5/xfs.5.html>`__,  `fsadm(8) <../man8/fsadm.8.html>`__, 
`mkfs.xfs(8) <../man8/mkfs.xfs.8.html>`__, 
`xfs_db(8) <../man8/xfs_db.8.html>`__, 
`xfs_growfs(8) <../man8/xfs_growfs.8.html>`__, 
`xfs_spaceman(8) <../man8/xfs_spaceman.8.html>`__

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
