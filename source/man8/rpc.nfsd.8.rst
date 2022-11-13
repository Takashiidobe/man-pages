.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsd(8) — Linux manual page
===========================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIGURAT                       |                                   |
| ION FILE <#CONFIGURATION_FILE>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   rpc.nfsd(8)              System Manager's Manual             rpc.nfsd(8)

NAME
-------------------------------------------------

::

          rpc.nfsd - NFS server process


---------------------------------------------------------

::

          /usr/sbin/rpc.nfsd [options] nproc


---------------------------------------------------------------

::

          The rpc.nfsd program implements the user level part of the NFS
          service. The main functionality is handled by the nfsd kernel
          module. The user space program merely specifies what sort of
          sockets the kernel service should listen on, what NFS versions it
          should support, and how many kernel threads it should use.

          The rpc.mountd server provides an ancillary service needed to
          satisfy mount requests by NFS clients.


-------------------------------------------------------

::

          -d  or  --debug
                 enable logging of debugging messages

          -H  or  --host hostname
                 specify a particular hostname (or address) that NFS
                 requests will be accepted on. By default, rpc.nfsd will
                 accept NFS requests on all known network addresses.  Note
                 that lockd (which performs file locking services for NFS)
                 may still accept request on all known network addresses.
                 This may change in future releases of the Linux Kernel.
                 This option can be used multiple time to listen to more
                 than one interface.

          -p  or  --port port
                 specify a different port to listen on for NFS requests. By
                 default, rpc.nfsd will listen on port 2049.

          -r  or  --rdma
                 specify that NFS requests on the standard RDMA port
                 ("nfsrdma", port 20049) should be honored.

          --rdma=port
                 Listen for RDMA requests on an alternate port - may be a
                 number or a name listed in /etc/services.

          -N  or  --no-nfs-version vers
                 This option can be used to request that rpc.nfsd does not
                 offer certain versions of NFS. The current version of
                 rpc.nfsd can support major NFS versions 2,3,4 and the
                 minor versions 4.0, 4.1 and 4.2.

          -s  or  --syslog
                 By default, rpc.nfsd logs error messages (and debug
                 messages, if enabled) to stderr. This option makes
                 rpc.nfsd log these messages to syslog instead. Note that
                 errors encountered during option processing will still be
                 logged to stderr regardless of this option.

          -t  or  --tcp
                 Instruct the kernel nfs server to open and listen on a TCP
                 socket. This is the default.

          -T  or  --no-tcp
                 Instruct the kernel nfs server not to open and listen on a
                 TCP socket.

          -u  or  --udp
                 Instruct the kernel nfs server to open and listen on a UDP
                 socket.

          -U  or  --no-udp
                 Instruct the kernel nfs server not to open and listen on a
                 UDP socket. This is the default.

          -V  or  --nfs-version vers
                 This option can be used to request that rpc.nfsd offer
                 certain versions of NFS. The current version of rpc.nfsd
                 can support major NFS versions 2,3,4 and the minor
                 versions 4.0, 4.1 and 4.2.

          -L  or  --lease-time seconds
                 Set the lease-time used for NFSv4.  This corresponds to
                 how often clients need to confirm their state with the
                 server. Valid range is from 10 to 3600 seconds.

          -G  or  --grace-time seconds
                 Set the grace-time used for NFSv4 and NLM (for NFSv2 and
                 NFSv3).  New file open requests (NFSv4) and new file locks
                 (NLM) will not be allowed until after this time has passed
                 to allow clients to recover state.

          nproc  specify the number of NFS server threads. By default,
                 eight threads are started. However, for optimum
                 performance several threads should be used. The actual
                 figure depends on the number of and the work load created
                 by the NFS clients, but a useful starting point is eight
                 threads. Effects of modifying that number can be checked
                 using the nfsstat(8) program.

          Note that if the NFS server is already running, then the options
          for specifying host, port, and protocol will be ignored.  The
          number of processes given will be the only option considered, and
          the number of active nfsd processes will be increased or
          decreased to match this number.  In particular rpc.nfsd 0 will
          stop all threads and thus close any open connections.


-----------------------------------------------------------------------------

::

          Many of the options that can be set on the command line can also
          be controlled through values set in the [nfsd] section of the
          /etc/nfs.conf configuration file.  Values recognized include:

          threads
                 The number of threads to start.

          host   A host name, or comma separated list of host names, that
                 rpc.nfsd will listen on.  Use of the --host option
                 replaces all host names listed here.

          grace-time
                 The grace time, for both NFSv4 and NLM, in seconds.

          lease-time
                 The lease time for NFSv4, in seconds.

          port   Set the port for TCP/UDP to bind to.

          rdma   Enable RDMA port (with "on" or "yes" etc) on the standard
                 port ("nfsrdma", port 20049).

          rdma-port
                 Set an alternate RDMA port.

          UDP    Enable (with "on" or "yes" etc) or disable ("off", "no")
                 UDP support.

          TCP    Enable or disable TCP support.

          vers2

          vers3

          vers4  Enable or disable a major NFS version.  3 and 4 are
                 normally enabled by default.

          vers4.1

          vers4.2
                 Setting these to "off" or similar will disable the
                 selected minor versions.  Setting to "on" will enable
                 them.  The default values are determined by the kernel,
                 and usually minor versions default to being enabled once
                 the implementation is sufficiently complete.


---------------------------------------------------

::

          If the program is built with TI-RPC support, it will enable any
          protocol and address family combinations that are marked visible
          in the netconfig database.


---------------------------------------------------------

::

          nfsd(7), rpc.mountd(8), exports(5), exportfs(8), nfs.conf(5),
          rpc.rquotad(8), nfsstat(8), netconfig(5).


-----------------------------------------------------

::

          Olaf Kirch, Bill Hawes, H. J. Lu, G. Allan Morris III, and a host
          of others.

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

                                  20 Feb 2014                   rpc.nfsd(8)

--------------

Pages that refer to this page: `exports(5) <../man5/exports.5.html>`__, 
`nfs(5) <../man5/nfs.5.html>`__, 
`nfs.conf(5) <../man5/nfs.conf.5.html>`__, 
`nfsd(7) <../man7/nfsd.7.html>`__, 
`mount(8) <../man8/mount.8.html>`__, 
`mountd(8) <../man8/mountd.8.html>`__, 
`nfsconf(8) <../man8/nfsconf.8.html>`__, 
`nfsdclnts(8) <../man8/nfsdclnts.8.html>`__, 
`nfsstat(8) <../man8/nfsstat.8.html>`__, 
`rpcdebug(8) <../man8/rpcdebug.8.html>`__, 
`showmount(8) <../man8/showmount.8.html>`__, 
`statd(8) <../man8/statd.8.html>`__

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
