.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mount.nfs(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MOUNT.NFS(8)             System Manager's Manual            MOUNT.NFS(8)

NAME
-------------------------------------------------

::

          mount.nfs, mount.nfs4 - mount a Network File System


---------------------------------------------------------

::

          mount.nfs remotetarget dir [-rvVwfnsh ] [-o options]


---------------------------------------------------------------

::

          mount.nfs is a part of nfs(5) utilities package, which provides
          NFS client functionality.

          mount.nfs is meant to be used by the mount(8) command for
          mounting NFS shares. This subcommand, however, can also be used
          as a standalone command with limited functionality.

          remotetarget is a server share usually in the form of
          servername:/path/to/share.  dir is the directory on which the
          file system is to be mounted.

          Under Linux 2.6.32 and later kernel versions, mount.nfs can mount
          all NFS file system versions.  Under earlier Linux kernel
          versions, mount.nfs4 must be used for mounting NFSv4 file systems
          while mount.nfs must be used for NFSv3 and v2.


-------------------------------------------------------

::

          -r     Mount file system readonly.

          -v     Be verbose.

          -V     Print version.

          -w     Mount file system read-write.

          -f     Fake mount. Don't actually call the mount system call.

          -n     Do not update /etc/mtab.  By default, an entry is created
                 in /etc/mtab for every mounted file system. Use this
                 option to skip making an entry.

          -s     Tolerate sloppy mount options rather than fail.

          -h     Print help message.

          nfsoptions
                 Refer to nfs(5) or mount(8) manual pages.


-------------------------------------------------

::

          For further information please refer nfs(5) and mount(8) manual
          pages.


---------------------------------------------------

::

          /etc/fstab
                 file system table

          /etc/mtab
                 table of mounted file systems

          /etc/nfsmount.conf
                 Configuration file for NFS mounts


---------------------------------------------------------

::

          nfs(5), nfsmount.conf(5), mount(8),


-----------------------------------------------------

::

          Amit Gud <agud@redhat.com>

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

                                  5 Jun 2006                   MOUNT.NFS(8)

--------------

Pages that refer to this page:
`autofs.conf(5) <../man5/autofs.conf.5.html>`__

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
