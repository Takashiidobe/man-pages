.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

idmapd(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `CONFIGURATIO                     |                                   |
| N FILES <#CONFIGURATION_FILES>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RPC.IDMAPD(8)          BSD System Manager's Manual         RPC.IDMAPD(8)

NAME
-------------------------------------------------

::

        rpc.idmapd — NFSv4 ID <-> Name Mapper


---------------------------------------------------------

::

        rpc.idmapd [-h] [-f] [-v] [-C] [-S] [-p path] [-c path]


---------------------------------------------------------------

::

        rpc.idmapd is the NFSv4 ID <-> name mapping daemon.  It provides
        functionality to the NFSv4 kernel client and server, to which it
        communicates via upcalls, by translating user and group IDs to
        names, and vice versa.

        The system derives the part of the string by performing a password
        or group lookup.  The lookup mechanism is configured in
        /etc/idmapd.conf

        By default, the part of the string is the system's DNS domain name.
        It can also be specified in /etc/idmapd.conf if the system is
        multi-homed, or if the system's DNS domain name does not match the
        name of the system's Kerberos realm.

        When the domain is not specified in /etc/idmapd.conf the local DNS
        server will be queried for the _nfsv4idmapdomain text record. If
        the record exists that will be used as the domain. When the record
        does not exist, the domain part of the DNS domain will used.

        Note that on more recent kernels only the NFSv4 server uses
        rpc.idmapd.  The NFSv4 client instead uses nfsidmap(8), and only
        falls back to rpc.idmapd if there was a problem running the
        nfsidmap(8) program.

        The options are as follows:

        -h           Display usage message.

        -v           Increases the verbosity level (can be specified
                     multiple times).

        -f           Runs rpc.idmapd in the foreground and prints all
                     output to the terminal.

        -p path      Specifies the location of the RPC pipefs to be path.
                     The default value is "/var/lib/nfs/rpc_pipefs".

        -c path      Use configuration file path.  This option is
                     deprecated.

        -C           Client-only: perform no idmapping for any NFS server,
                     even if one is detected.

        -S           Server-only: perform no idmapping for any NFS client,
                     even if one is detected.


-------------------------------------------------------------------------------

::

        rpc.idmapd recognizes the following value from the [general]
        section of the /etc/nfs.conf configuration file:

        pipefs-directory
                     Equivalent to -p.

        All other settings related to id mapping are found in the
        /etc/idmapd.conf configuration file.


---------------------------------------------------------

::

        rpc.idmapd -f -vvv

        Runs rpc.idmapd printing all messages to console, and with a
        verbosity level of 3.


---------------------------------------------------

::

        /etc/idmapd.conf, /etc/nfs.conf


---------------------------------------------------------

::

        idmapd.conf(5), nfs.conf(5), nfsidmap(8)


-------------------------------------------------------

::

        The rpc.idmapd software has been developed by Marius Aamodt Eriksen
        ⟨marius@citi.umich.edu⟩.

COLOPHON
---------------------------------------------------------

::

        This page is part of the nfs-utils (NFS utilities) project.
        Information about the project can be found at
        http://linux-nfs.org/wiki/index.php/Main_Page.  If you have a bug
        report for this manual page, see
        ⟨http://linux-nfs.org/wiki/index.php/Main_Page⟩.  This page was
        obtained from the project's upstream Git repository
        ⟨http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=summary⟩ on
        2021-08-27.  (At that time, the date of the most recent commit that
        was found in the repository was 2021-08-21.)  If you discover any
        rendering problems in this HTML version of the page, or you believe
        there is a better or more up-to-date source for the page, or you
        have corrections or improvements to the information in this
        COLOPHON (which is not part of the original manual page), send a
        mail to man-pages@man7.org

   BSD                         February 3, 2003                         BSD

--------------

Pages that refer to this page: `nfs(5) <../man5/nfs.5.html>`__, 
`nfs.conf(5) <../man5/nfs.conf.5.html>`__, 
`nfsconf(8) <../man8/nfsconf.8.html>`__, 
`nfsdclnts(8) <../man8/nfsdclnts.8.html>`__

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
