.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

exportd(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIGURAT                       |                                   |
| ION FILE <#CONFIGURATION_FILE>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   nfsv4.exportd(8)         System Manager's Manual        nfsv4.exportd(8)

NAME
-------------------------------------------------

::

          nfsv4.exportd - NFSv4 Server Mount Daemon


---------------------------------------------------------

::

          /usr/sbin/nfsv4.exportd [options]


---------------------------------------------------------------

::

          The nfsv4.exportd is used to manage NFSv4 exports.  The NFS
          server (nfsd) maintains a cache of authentication and
          authorization information which is used to identify the source of
          each request, and then what access permissions that source has to
          any local filesystem.  When required information is not found in
          the cache, the server sends a request to nfsv4.exportd to fill in
          the missing information.  nfsv4.exportd uses a table of
          information stored in /var/lib/nfs/etab and maintained by
          exportfs(8), possibly based on the contents of exports(5), to
          respond to each request.


-------------------------------------------------------

::

          -d kind  or  --debug kind
                 Turn on debugging. Valid kinds are: all, auth, call,
                 general and parse.

          -l or --log-auth
                 Enable logging of responses to authentication and access
                 requests from nfsd.  Each response is then cached by the
                 kernel for 30 minutes (or as set by --ttl below), and will
                 be refreshed after 15 minutes (half the ttl time) if the
                 relevant client remains active.  Note that -l is
                 equivalent to -d auth and so can be enabled in
                 /etc/nfs.conf with "debug = auth" in the [exportd]
                 section.

          -i or --cache-use-ipaddr
                 Normally each client IP address is matched against each
                 host identifier (name, wildcard, netgroup etc) found in
                 /etc/exports and a combined identity is formed from all
                 matching identifiers.  Often many clients will map to the
                 same combined identity so performing this mapping reduces
                 the number of distinct access details that the kernel
                 needs to store.  Specifying the -i option suppresses this
                 mapping so that access to each filesystem is requested and
                 cached separately for each client IP address.  Doing this
                 can increase the burden of updating the cache slightly,
                 but can make the log messages produced by the -l option
                 easier to read.

          -T  or  --ttl
                 Provide a time-to-live (TTL) for cached information given
                 to the kernel.  The kernel will normally request an update
                 if the information is needed after half of this time has
                 expired.  Increasing the provided number, which is in
                 seconds, reduces the rate of cache update requests, and
                 this is particularly noticeable when these requests are
                 logged with -l.  However increasing also means that
                 changes to hostname to address mappings can take longer to
                 be noticed.  The default TTL is 1800 (30 minutes).

          -F  or  --foreground
                 Run in foreground (do not daemonize)

          -h  or  --help
                 Display usage message.

          -t N or --num-threads=N or --num-threads N
                 This option specifies the number of worker threads that
                 nfsv4.exports spawns.  The default is 1 thread, which is
                 probably enough.  More threads are usually only needed for
                 NFS servers which need to handle mount storms of hundreds
                 of NFS mounts in a few seconds, or when your DNS server is
                 slow or unreliable.

          -g or --manage-gids
                 Accept requests from the kernel to map user id numbers
                 into lists of group id numbers for use in access control.
                 An NFS request will normally (except when using Kerberos
                 or other cryptographic authentication) contain a user-id
                 and a list of group-ids.  Due to a limitation in the NFS
                 protocol, at most 16 groups ids can be listed.  If you use
                 the -g flag, then the list of group ids received from the
                 client will be replaced by a list of group ids determined
                 by an appropriate lookup on the server. Note that the
                 'primary' group id is not affected so a newgroup command
                 on the client will still be effective.  This function
                 requires a Linux Kernel with version at least 2.6.21.


-----------------------------------------------------------------------------

::

          Many of the options that can be set on the command line can also
          be controlled through values set in the [exportd] or, in some
          cases, the [nfsd] sections of the /etc/nfs.conf configuration
          file.  Values recognized in the [exportd] section include
          cache-use-ipaddr , ttl, manage-gids, and debug which each have
          the same effect as the option with the same name.


---------------------------------------------------

::

          /etc/exports
                 input file for exportfs, listing exports, export options,
                 and access control lists


---------------------------------------------------------

::

          exportfs(8), exports(5), showmount(8), nfs.conf(5),
          firewall-cmd(1),

          RFC 7530 - "Network File System (NFS) Version 4 Protocol"
          RFC 8881 - "Network File System (NFS) Version 4 Minor Version 1
          Protocol"

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

                                  02 Feb 2021              nfsv4.exportd(8)

--------------

Pages that refer to this page:
`nfs.conf(5) <../man5/nfs.conf.5.html>`__, 
`exportfs(8) <../man8/exportfs.8.html>`__

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
