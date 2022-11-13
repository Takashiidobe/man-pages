.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsdclnts(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFSDCLTS(8)                     nfsdclnts                    NFSDCLTS(8)

NAME
-------------------------------------------------

::

          nfsdclnts - print various nfs client information for knfsd
          server.


---------------------------------------------------------

::

          nfsdclnts [-h] [-t type] [--clientinfo] [--hostname] [-q]


---------------------------------------------------------------

::

          The nfsdclnts(8) command parses the content present in
          /proc/fs/nfsd/clients/ directories. nfsdclnts(8) displays files
          which are open, locked, delegated by the nfs-client. It also
          prints useful client information such as hostname, clientID, NFS
          version mounted by the nfs-client.


-------------------------------------------------------

::

          -t, --type=TYPE
              Specify the type of file to be displayed. Takes only one TYPE
              at a time.

              open, lock, deleg, layout, or all

              open: displays the open files by nfs-client(s).

              lock: displays the files locked by nfs-client(s).

              layout: displays the files for which layout is given.

              deleg: displays delegated files information and delegation
              type.

              all: prints all the above type.

          --clientinfo
              displays various nfs-client info fields such as version of
              nfs mounted at nfs-client and clientID.

          --hostname
              Print hostname of nfs-client instead of ip-address.

          -q, --quiet
              Hide the header information.

          -v, --verbose
              Verbose operation, show debug messages.

          -f, --file
              Instead of processing all client directories under
              /proc/fs/nfsd/clients, one can provide a specific states file
              to process. One should make sure that info file resides in
              the same directory as states file. If the info file is not
              valid or present the fields would be marked as "N/A".

          -h, --help
              Print help explaining the command line options.


---------------------------------------------------------

::

          nfsdclnts --type open
              List all files with open type only.

              Inode number | Type   | Access | Deny | ip address            | Filename
              33823232     | open   | r-     | --   | [::1]:757             | testfile

          nfsdclnts --type deleg
              List all files with deleg type only.

              Inode number | Type   | Access | ip address            | Filename
              33823232     | deleg  | r      | [::1]:757             | testfile

          nfsdclnts --hostname
              Print hostname instead of ip-address.

              Inode number | Type   | Access | Deny | Hostname              | Filename
              33823232     | open   | r-     | --   | nfs-server            | testfile
              33823232     | deleg  | r      |      | nfs-server            | testfile

          nfsdclnts --clientinfo
              Print client information.

              Inode number | Type   | Access | Deny | ip address            | Client ID           | vers | Filename
              33823232     | open   | r-     | --   | [::1]:757             | 0xc79a009f5eb65e84  | 4.2  | testfile
              33823232     | deleg  | r      |      | [::1]:757             | 0xc79a009f5eb65e84  | 4.2  | testfile

          nfsdclnts --file /proc/fs/nfsd/clients/3/states -t open
              Process specific states file.

              Inode number | Type   | Access | Deny | ip address            | Client ID           | vers | Filename
              33823232     | open   | r-     | --   | [::1]:757             | 0xc79a009f5eb65e84  | 4.2  | testfile

          nfsdclnts --quiet --hostname
              Hide the header information.

              33823232     | open   | r-     | --   | nfs-server            | testfile
              33823232     | deleg  | r      |      | nfs-server            | testfile


---------------------------------------------------

::

          /proc/fs/nfsd/clients/

          Displays basic information about each NFSv4 client.

          /proc/fs/nfsd/clients/#/info

          Displays information about all the opens held by the given
          client, including open modes, device numbers, inode numbers, and
          open owners.

          /proc/fs/nfsd/clients/#/states


---------------------------------------------------

::

          /proc/fs/nfsd/clients/ support was initially introduced in 5.3
          kernel and is only implemented for mount points using NFSv4.


-------------------------------------------------

::

          Please report any BUGs to linux-nfs@vger.kernel.org


---------------------------------------------------------

::

          nfsd(8), exportfs(8), idmapd(8), statd(8)


-------------------------------------------------------

::

          Achilles Gaikwad <agaikwad@redhat.com> and Kenneth D'souza
          <kdsouza@redhat.com>

COLOPHON
---------------------------------------------------------

::

          This page is part of the nfs-utils (NFS utilities) project.
          Information about the project can be found at 
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩. If you have a bug
          report for this manual page, see
          ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩. This page was
          obtained from the project's upstream Git repository
          ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
          2021-08-27. (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-21.) If you discover
          any rendering problems in this HTML version of the page, or you
          believe there is a better or more up-to-date source for the page,
          or you have corrections or improvements to the information in
          this COLOPHON (which is not part of the original manual page),
          send a mail to man-pages@man7.org

   nfsdclnts                      2020-05-09                    NFSDCLTS(8)

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
