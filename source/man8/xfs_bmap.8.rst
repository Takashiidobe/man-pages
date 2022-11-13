.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfs_bmap(8) — Linux manual page
===============================

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

   xfs_bmap(8)              System Manager's Manual             xfs_bmap(8)

NAME
-------------------------------------------------

::

          xfs_bmap - print block mapping for an XFS file


---------------------------------------------------------

::

          xfs_bmap [ -adelpv ] [ -n num_extents ] file
          xfs_bmap -V


---------------------------------------------------------------

::

          xfs_bmap prints the map of disk blocks used by files in an XFS
          filesystem.  The map lists each extent used by the file, as well
          as regions in the file that do not have any corresponding blocks
          (holes).  Each line of the listings takes the following form:

                 extent: [startoffset..endoffset]: startblock..endblock

          Holes are marked by replacing the startblock..endblock with hole.
          All the file offsets and disk blocks are in units of 512-byte
          blocks, no matter what the filesystem's block size is.


-------------------------------------------------------

::

          -a     If this option is specified, information about the file's
                 attribute fork is printed instead of the default data
                 fork.

          -e     If this option is used, xfs_bmap obtains all delayed
                 allocation extents, and does not flush dirty pages to disk
                 before querying extent data. With the -v option, the flags
                 column will show which extents have not yet been
                 allocated.

          -l     If this option is used, then

                      <nblocks>  blocks

                 will be appended to each line.  nblocks is the length of
                 the extent described on the line in units of 512-byte
                 blocks.

                 This flag has no effect if the -v option is used.

          -n num_extents
                 If this option is given, xfs_bmap will display at most
                 num_extents extents. In the absence of -n, xfs_bmap will
                 display all extents in the file.

          -p     If this option is used, xfs_bmap obtains all unwritten
                 (preallocated) extents that do not contain written data.
                 With the -v option, the flags column will show which
                 extents are preallocated/unwritten.

          -v     Shows verbose information. When this flag is specified,
                 additional AG specific information is appended to each
                 line in the following form:

                      agno (startagoffset..endagoffset) nblocks flags

                 A second -v option will print out the flags legend.

          -V     Prints the version number and exits.


---------------------------------------------------------

::

          xfs_fsr(8), xfs(5).

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

                                                                xfs_bmap(8)

--------------

Pages that refer to this page: `xfs_io(8) <../man8/xfs_io.8.html>`__

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
