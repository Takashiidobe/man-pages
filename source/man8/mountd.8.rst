.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mountd(8) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIGURAT                       |                                   |
| ION FILE <#CONFIGURATION_FILE>`__ |                                   |
| \|                                |                                   |
| `TCP_WRAPPERS S                   |                                   |
| UPPORT <#TCP_WRAPPERS_SUPPORT>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   rpc.mountd(8)            System Manager's Manual           rpc.mountd(8)

NAME
-------------------------------------------------

::

          rpc.mountd - NFS mount daemon


---------------------------------------------------------

::

          /usr/sbin/rpc.mountd [options]


---------------------------------------------------------------

::

          The rpc.mountd daemon implements the server side of the NFS MOUNT
          protocol, an NFS side protocol used by NFS version 2 [RFC1094]
          and NFS version 3 [RFC1813].  It also responds to requests from
          the Linux kernel to authenticate clients and provides details of
          access permissions.

          The NFS server (nfsd) maintains a cache of authentication and
          authorization information which is used to identify the source of
          each request, and then what access permissions that source has to
          any local filesystem.  When required information is not found in
          the cache, the server sends a request to mountd to fill in the
          missing information.  Mountd uses a table of information stored
          in /var/lib/nfs/etab and maintained by exportfs(8), possibly
          based on the contents of exports(5), to respond to each request.

      Mounting exported NFS File Systems
          The NFS MOUNT protocol has several procedures.  The most
          important of these are MNT (mount an export) and UMNT (unmount an
          export).

          A MNT request has two arguments: an explicit argument that
          contains the pathname of the root directory of the export to be
          mounted, and an implicit argument that is the sender's IP
          address.

          When receiving a MNT request from an NFS client, rpc.mountd
          checks both the pathname and the sender's IP address against its
          export table.  If the sender is permitted to access the requested
          export, rpc.mountd returns an NFS file handle for the export's
          root directory to the client.  The client can then use the root
          file handle and NFS LOOKUP requests to navigate the directory
          structure of the export.

      The rmtab File
          The rpc.mountd daemon registers every successful MNT request by
          adding an entry to the /var/lib/nfs/rmtab file.  When receivng a
          UMNT request from an NFS client, rpc.mountd simply removes the
          matching entry from /var/lib/nfs/rmtab, as long as the access
          control list for that export allows that sender to access the
          export.

          Clients can discover the list of file systems an NFS server is
          currently exporting, or the list of other clients that have
          mounted its exports, by using the showmount(8) command.
          showmount(8) uses other procedures in the NFS MOUNT protocol to
          report information about the server's exported file systems.

          Note, however, that there is little to guarantee that the
          contents of /var/lib/nfs/rmtab are accurate.  A client may
          continue accessing an export even after invoking UMNT.  If the
          client reboots without sending a UMNT request, stale entries
          remain for that client in /var/lib/nfs/rmtab.

      Mounting File Systems with NFSv4
          Version 4 (and later) of NFS does not use a separate NFS MOUNT
          protocol.  Instead mounting is performed using regular NFS
          requests handled by the NFS server in the Linux kernel (nfsd).
          Consequently /var/lib/nfs/rmtab is not updated to reflect any
          NFSv4 activity.


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
                 /etc/nfs.conf with "debug = auth" in the [mountd] section.

                 rpc.mountd will always log authentication responses to
                 MOUNT requests when NFSv3 is used, but to get similar logs
                 for NFSv4, this option is required.

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

          -o num  or  --descriptors num
                 Set the limit of the number of open file descriptors to
                 num. The default is to leave the limit unchanged.

          -N mountd-version  or  --no-nfs-version mountd-version
                 This option can be used to request that rpc.mountd do not
                 offer certain versions of NFS. The current version of
                 rpc.mountd can support both NFS version 2, 3 and 4. If the
                 either one of these version should not be offered,
                 rpc.mountd must be invoked with the option --no-nfs-
                 version <vers> .

          -n  or  --no-tcp
                 Don't advertise TCP for mount.

          -p num  or  -P num  or  --port num
                 Specifies the port number used for RPC listener sockets.
                 If this option is not specified, rpc.mountd will try to
                 consult /etc/services, if gets port succeed, set the same
                 port for all listener socket, otherwise chooses a random
                 ephemeral port for each listener socket.

                 This option can be used to fix the port value of
                 rpc.mountd's listeners when NFS MOUNT requests must
                 traverse a firewall between clients and servers.

          -H  prog or  --ha-callout prog
                 Specify a high availability callout program.  This program
                 receives callouts for all MOUNT and UNMOUNT requests.
                 This allows rpc.mountd to be used in a High Availability
                 NFS (HA-NFS) environment.

                 The callout program is run with 4 arguments.  The first is
                 mount or unmount depending on the reason for the callout.
                 The second will be the name of the client performing the
                 mount.  The third will be the path that the client is
                 mounting.  The last is the number of concurrent mounts
                 that we believe the client has of that path.

                 This callout is not needed with 2.6 and later kernels.
                 Instead, mount the nfsd filesystem on /proc/fs/nfsd.

          -s, --state-directory-path directory
                 Specify a directory in which to place state information
                 (etab and rmtab).  If this option is not specified the
                 default of /var/lib/nfs is used.

          -r, --reverse-lookup
                 rpc.mountd tracks IP addresses in the rmtab file.  When a
                 DUMP request is made (by someone running showmount -a, for
                 instance), it returns IP addresses instead of hostnames by
                 default. This option causes rpc.mountd to perform a
                 reverse lookup on each IP address and return that hostname
                 instead.  Enabling this can have a substantial negative
                 effect on performance in some situations.

          -t N or --num-threads=N or --num-threads N
                 This option specifies the number of worker threads that
                 rpc.mountd spawns.  The default is 1 thread, which is
                 probably enough.  More threads are usually only needed for
                 NFS servers which need to handle mount storms of hundreds
                 of NFS mounts in a few seconds, or when your DNS server is
                 slow or unreliable.

          -u  or  --no-udp
                 Don't advertise UDP for mounting

          -V version  or  --nfs-version version
                 This option can be used to request that rpc.mountd offer
                 certain versions of NFS. The current version of rpc.mountd
                 can support both NFS version 2 and the newer version 3.

          -v  or  --version
                 Print the version of rpc.mountd and exit.

          -g  or  --manage-gids
                 Accept requests from the kernel to map user id numbers
                 into  lists of group id numbers for use in access control.
                 An NFS request will normally (except when using Kerberos
                 or other cryptographic authentication) contains a user-id
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
          be controlled through values set in the [mountd] or, in some
          cases, the [nfsd] sections of the /etc/nfs.conf configuration
          file.  Values recognized in the [mountd] section include manage-
          gids, cache-use-ipaddr, descriptors, port, threads, ttl, reverse-
          lookup, and state-directory-path, ha-callout which each have the
          same effect as the option with the same name.

          The values recognized in the [nfsd] section include TCP, UDP,
          vers2, vers3, and vers4 which each have same same meaning as
          given by rpc.nfsd(8).


---------------------------------------------------------------------------------

::

          You can protect your rpc.mountd listeners using the tcp_wrapper
          library or iptables(8).

          Note that the tcp_wrapper library supports only IPv4 networking.

          Add the hostnames of NFS peers that are allowed to access
          rpc.mountd to /etc/hosts.allow.  Use the daemon name mountd even
          if the rpc.mountd binary has a different name.

          Hostnames used in either access file will be ignored when they
          can not be resolved into IP addresses.  For further information
          see the tcpd(8) and hosts_access(5) man pages.

      IPv6 and TI-RPC support
          TI-RPC is a pre-requisite for supporting NFS on IPv6.  If TI-RPC
          support is built into rpc.mountd, it attempts to start listeners
          on network transports marked 'visible' in /etc/netconfig.  As
          long as at least one network transport listener starts
          successfully, rpc.mountd will operate.


---------------------------------------------------

::

          /etc/exports
                 input file for exportfs, listing exports, export options,
                 and access control lists

          /var/lib/nfs/rmtab
                 table of clients accessing server's exports


---------------------------------------------------------

::

          exportfs(8), exports(5), showmount(8), rpc.nfsd(8),
          rpc.rquotad(8), nfs(5), nfs.conf(5), tcpd(8), hosts_access(5),
          iptables(8), netconfig(5)

          RFC 1094 - "NFS: Network File System Protocol Specification"
          RFC 1813 - "NFS Version 3 Protocol Specification"
          RFC 7530 - "Network File System (NFS) Version 4 Protocol"
          RFC 8881 - "Network File System (NFS) Version 4 Minor Version 1
          Protocol"


-----------------------------------------------------

::

          Olaf Kirch, H. J. Lu, G. Allan Morris III, and a host of others.

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

                                  31 Dec 2009                 rpc.mountd(8)

--------------

Pages that refer to this page: `exports(5) <../man5/exports.5.html>`__, 
`nfs.conf(5) <../man5/nfs.conf.5.html>`__, 
`nfsd(7) <../man7/nfsd.7.html>`__, 
`exportfs(8) <../man8/exportfs.8.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`nfsd(8) <../man8/nfsd.8.html>`__, 
`showmount(8) <../man8/showmount.8.html>`__

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
