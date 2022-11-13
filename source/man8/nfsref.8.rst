.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsref(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `INTRODUCTION <#INTRODUCTION>`__  |                                   |
| \| `DESCRIPTION <#DESCRIPTION>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::


   NFSREF(8)                System Manager's Manual               NFSREF(8)

NAME
-------------------------------------------------

::

          nfsref - manage NFS referrals


---------------------------------------------------------

::

          nfsref [-?d] [-t type] add pathname server export [ server export
          ... ]

          nfsref [-?d] [-t type] remove pathname

          nfsref [-?d] [-t type] lookup pathname


-----------------------------------------------------------------

::

          NFS version 4 introduces the concept of file system referrals to
          NFS.  A file system referral is like a symbolic link on a file
          server to another file system share, possibly on another file
          server.  On an NFS client, a referral behaves like an automounted
          directory.  The client, under the server's direction, mounts a
          new NFS export automatically when an application first accesses
          that directory.

          Referrals are typically used to construct a single file name
          space across multiple file servers.  Because file servers control
          the shape of the name space, no client configuration is required,
          and all clients see the same referral information.

          The Linux NFS server supports NFS version 4 referrals.
          Administrators can specify the refer= export option in
          /etc/exports to configure a list of exports from which the client
          can choose.  See exports(5) for details.


---------------------------------------------------------------

::

          The nfsref(8) command is a simple way to get started managing
          junction metadata.  Other administrative commands provide richer
          access to junction information.

      Subcommands
          Valid nfsref(8) subcommands are:

          add    Adds junction information to the directory named by
                 pathname.  The named directory must already exist, and
                 must not already contain junction information.  Regular
                 directory contents are obscured to NFS clients by this
                 operation.

                 A list of one or more file server and export path pairs is
                 also specified on the command line.  When creating an NFS
                 basic junction, this list is stored in an extended
                 attribute of the directory.

                 If junction creation is successful, the nfsref(8) command
                 flushes the kernel's export cache to remove previously
                 cached junction information.

          remove Removes junction information from the directory named by
                 pathname.  The named directory must exist, and must
                 contain junction information.  Regular directory contents
                 are made visible to NFS clients again by this operation.

                 If junction deletion is successful, the nfsref(8) command
                 flushes the kernel's export cache to remove previously
                 cached junction information.

          lookup Displays junction information stored in the directory
                 named by pathname.  The named directory must exist, and
                 must contain junction information.

                 When looking up an NFS basic junction, the junction
                 information in the directory is listed on stdout.

      Command line options
          -d, --debug
                 Enables debugging messages during operation.

          -t, --type=junction-type
                 Specifies the junction type for the operation.  Valid
                 values for junction-type are nfs-basic or nfs-fedfs.

                 For the add subcommand, the default value if this option
                 is not specified is nfs-basic.  For the remove and lookup
                 subcommands, the --type option is not required.  The
                 nfsref(8) command operates on whatever junction contents
                 are available.


---------------------------------------------------------

::

          Suppose you have two file servers, top.example.net and
          home.example.net.  You want all your clients to mount
          top.example.net:/ and then see the files under home.example.net:/
          automatically in top:/home.

          On top.example.net, you might issue this command as root:

                 # mkdir /home
                 # nfsref --type=nfs-basic add /home home.example.net /
                 Created junction /home.


---------------------------------------------------

::

          /etc/exports
                 NFS server export table


---------------------------------------------------------

::

          exports(5)

          RFC 5661 for a description of NFS version 4 referrals


-----------------------------------------------------

::

          Chuck Lever <chuck.lever@oracle.com>

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

                                  9 Jan 2018                      NFSREF(8)

--------------

Pages that refer to this page: `nfsref(8) <../man8/nfsref.8.html>`__

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
