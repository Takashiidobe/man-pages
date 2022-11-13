.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfs_estimate(8) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   xfs_estimate(8)          System Manager's Manual         xfs_estimate(8)

NAME
-------------------------------------------------

::

          xfs_estimate - estimate the space that an XFS filesystem will
          take


---------------------------------------------------------

::

          xfs_estimate [ -h ] [ -b blocksize ] [ -i logsize ]
                       [ -e logsize ] [ -v ] directory ...
          xfs_estimate -V


---------------------------------------------------------------

::

          For each directory argument, xfs_estimate estimates the space
          that directory would take if it were copied to an XFS filesystem.
          xfs_estimate does not cross mount points.  The following
          definitions are used:
                 KB = *1024
                 MB = *1024*1024
                 GB = *1024*1024*1024

          The xfs_estimate options are:

          -b blocksize
                 Use blocksize instead of the default blocksize of 4096
                 bytes.  The modifier k can be used after the number to
                 indicate multiplication by 1024.  For example,

                      xfs_estimate -b 64k /

                 requests an estimate of the space required by the
                 directory / on an XFS filesystem using a blocksize of 64K
                 (65536) bytes.

          -v     Display more information, formatted.

          -h     Display usage message.

          -i, -e logsize
                 Use logsize instead of the default log size of 1000
                 blocks.  -i refers to an internal log, while -e refers to
                 an external log.  The modifiers k or m can be used after
                 the number to indicate multiplication by 1024 or 1048576,
                 respectively.

                 For example,

                      xfs_estimate -i 1m /

                 requests an estimate of the space required by the
                 directory / on an XFS filesystem using an internal log of
                 1 megabyte.

          -V     Print the version number and exits.


---------------------------------------------------------

::

          % xfs_estimate -e 10m /var/tmp
          /var/tmp will take about 4.2 megabytes
                  with the external log using 2560 blocks or about 10.0 megabytes

          % xfs_estimate -v -e 10m /var/tmp
          directory                     bsize   blocks    megabytes    logsize
          /var/tmp                       4096      792        4.0MB   10485760

          % xfs_estimate -v /var/tmp
          directory                     bsize   blocks    megabytes    logsize
          /var/tmp                       4096     3352       14.0MB   10485760

          % xfs_estimate /var/tmp
          /var/tmp will take about 14.0 megabytes

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

                                                            xfs_estimate(8)

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
