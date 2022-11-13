.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

showmount(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SHOWMOUNT(8)             System Manager's Manual            SHOWMOUNT(8)

NAME
-------------------------------------------------

::

          showmount - show mount information for an NFS server


---------------------------------------------------------

::

          showmount [ -adehv ] [ --all ] [ --directories ] [ --exports ]
          [ --help ] [ --version ] [ host ]


---------------------------------------------------------------

::

          showmount queries the mount daemon on a remote host for
          information about the state of the NFS server on that machine.
          With no options showmount lists the set of clients who are
          mounting from that host.  The output from showmount is designed
          to appear as though it were processed through ``sort -u''.


-------------------------------------------------------

::

          -a or --all
                 List both the client hostname or IP address and mounted
                 directory in host:dir format. This info should not be
                 considered reliable. See the notes on rmtab in
                 rpc.mountd(8).

          -d or --directories
                 List only the directories mounted by some client.

          -e or --exports
                 Show the NFS server's export list.

          -h or --help
                 Provide a short help summary.

          -v or --version
                 Report the current version number of the program.

          --no-headers
                 Suppress the descriptive headings from the output.


---------------------------------------------------------

::

          rpc.mountd(8), rpc.nfsd(8)


-------------------------------------------------

::

          The completeness and accuracy of the information that showmount
          displays varies according to the NFS server's implementation.

          Because showmount sorts and uniqs the output, it is impossible to
          determine from the output whether a client is mounting the same
          directory more than once.

          showmount works by contacting the server's MNT service directly.
          NFSv4-only servers have no need to advertise their exported root
          filehandles via this method, and may not expose their MNT service
          to clients.


-----------------------------------------------------

::

          Rick Sladkey <jrs@world.std.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs-utils (NFS utilities) project.
          Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  If you have a
          bug report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
          obtained from the project's upstream Git repository
          ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                6 October 1993                 SHOWMOUNT(8)

--------------

Pages that refer to this page: `exports(5) <../man5/exports.5.html>`__, 
`exportd(8) <../man8/exportd.8.html>`__, 
`mountd(8) <../man8/mountd.8.html>`__

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
