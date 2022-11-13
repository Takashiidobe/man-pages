.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

xfs_logprint(8) — Linux manual page
===================================

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

   xfs_logprint(8)          System Manager's Manual         xfs_logprint(8)

NAME
-------------------------------------------------

::

          xfs_logprint - print the log of an XFS filesystem


---------------------------------------------------------

::

          xfs_logprint [ options ] device


---------------------------------------------------------------

::

          xfs_logprint prints the log of an XFS filesystem (see xfs(5)).
          The device argument is the pathname of the partition or logical
          volume containing the filesystem. The device can be a regular
          file if the -f option is used. The contents of the filesystem
          remain undisturbed.  There are two major modes of operation in
          xfs_logprint.

          One mode is better for filesystem operation debugging.  It is
          called the transactional view and is enabled through the -t
          option. The transactional view prints only the portion of the log
          that pertains to recovery. In other words, it prints out complete
          transactions between the tail and the head. This view tries to
          display each transaction without regard to how they are split
          across log records.

          The second mode starts printing out information from the
          beginning of the log.  Some error blocks might print out in the
          beginning because the last log record usually overlaps the oldest
          log record. A message is printed when the physical end of the log
          is reached and when the logical end of the log is reached. A log
          record view is displayed one record at a time. Transactions that
          span log records may not be decoded fully.


-------------------------------------------------------

::

          -b     Extract and print buffer information. Only used in
                 transactional view.

          -c     Attempt to continue when an error is detected.

          -C filename
                 Copy the log from the filesystem to the file filename.
                 The log itself is not printed.

          -d     Dump the log from front to end, printing where each log
                 record is located on disk.

          -D     Do not decode anything; just print data.

          -e     Exit when an error is found in the log. Normally,
                 xfs_logprint tries to continue and unwind from bad logs.
                 However, sometimes it just dies in bad ways.  Using this
                 option prevents core dumps.

          -f     Specifies that the filesystem image to be processed is
                 stored in a regular file at device (see the mkfs.xfs(8) -d
                 file option).  This might happen if an image copy of a
                 filesystem has been made into an ordinary file with
                 xfs_copy(8).

          -l logdev
                 External log device. Only for those filesystems which use
                 an external log.

          -i     Extract and print inode information. Only used in
                 transactional view.

          -q     Extract and print quota information. Only used in
                 transactional view.

          -n     Do not try and interpret log data; just interpret log
                 header information.

          -o     Also print buffer data in hex.  Normally, buffer data is
                 just decoded, so better information can be printed.

          -s start-block
                 Override any notion of where to start printing.

          -t     Print out the transactional view.

          -v     Print "overwrite" data.

          -V     Prints the version number and exits.


---------------------------------------------------------

::

          mkfs.xfs(8), mount(8).

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

                                                            xfs_logprint(8)

--------------

Pages that refer to this page: `xfs_db(8) <../man8/xfs_db.8.html>`__

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
