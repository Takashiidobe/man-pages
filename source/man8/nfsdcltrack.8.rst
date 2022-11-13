.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsdcltrack(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `COMMANDS <#COMMANDS>`__ \|       |                                   |
| `EXTERNAL CONFIGURA               |                                   |
| TION <#EXTERNAL_CONFIGURATION>`__ |                                   |
| \|                                |                                   |
| `LEGACY TRANSITION MECHANISM      |                                   |
| <#LEGACY_TRANSITION_MECHANISM>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFSDCLTRACK(8)                                            NFSDCLTRACK(8)

NAME
-------------------------------------------------

::

          nfsdcltrack - NFSv4 Client Tracking Callout Program


---------------------------------------------------------

::

          nfsdcltrack [-d] [-f] [-s stable storage dir] <command> <args...>


---------------------------------------------------------------

::

          nfsdcltrack is the NFSv4 client tracking callout program. It is
          not necessary to install this program on machines that are not
          acting as NFSv4 servers.

          When a network partition is combined with a server reboot, there
          are edge conditions that can cause the server to grant lock
          reclaims when other clients have taken conflicting locks in the
          interim. A more detailed explanation of this issue is described
          in RFC 3530, section 8.6.3 and in RFC 5661, section 8.4.3.

          In order to prevent these problems, the server must track a small
          amount of per-client information on stable storage. This program
          provides the userspace piece of that functionality. When the
          kernel needs to manipulate the database that stores this info, it
          will execute this program to handle it.


-------------------------------------------------------

::

          -d, --debug
              Enable debug level logging.

          -f, --foreground
              Log to stderr instead of syslog.

          -s storagedir, --storagedir=storage_dir
              Directory where stable storage information should be kept.
              The default value is /var/lib/nfs/nfsdcltrack.


---------------------------------------------------------

::

          nfsdcltrack requires a command for each invocation. Supported
          commands are:

          init
              Initialize the database. This command requires no argument.

          create
              Create a new client record (or update the timestamp on an
              existing one). This command requires a hex-encoded
              nfs_client_id4 as an argument.

          remove
              Remove a client record from the database. This command
              requires a hex-encoded nfs_client_id4 as an argument.

          check
              Check to see if a nfs_client_id4 is allowed to reclaim. This
              command requires a hex-encoded nfs_client_id4 as an argument.

          gracedone
              Remove any unreclaimed client records from the database. This
              command requires a epoch boot time as an argument.


-------------------------------------------------------------------------------------

::

          The directory for stable storage information can be set via the
          file /etc/nfs.conf by setting the storagedir value in the
          nfsdcltrack section.  For example:
               [nfsdcltrack]
                 storagedir = /shared/nfs/nfsdcltrack
          Debuging to syslog can also be enabled by setting "debug = 1" in
          this file.


-----------------------------------------------------------------------------------------------

::

          The Linux kernel NFSv4 server has historically tracked this
          information on stable storage by manipulating information on the
          filesystem directly, in the directory to which
          /proc/fs/nfsd/nfsv4recoverydir points. If the kernel passes the
          correct information, then nfsdcltrack can use it to allow a
          seamless transition from the old client tracking scheme to the
          new one.

          On a check operation, if there is no record of the client in the
          database, nfsdcltrack will look to see if the
          NFSDCLTRACK_LEGACY_RECDIR environment variable is set. If it is,
          then it will fetch that value and see if a directory exists by
          that name. If it does, then the check operation will succeed and
          the directory will be removed.

          On a gracedone operation, nfsdcltrack will look to see if the
          NFSDCLTRACK_LEGACY_TOPDIR environment variable is set. If it is,
          then it will attempt to clean out that directory prior to
          exiting.

          Note that this transition is one-way. If the machine subsequently
          reboots back into an older kernel that does not support the
          nfsdcltrack upcall then the clients will not be able to recover
          their state.


---------------------------------------------------

::

          This program requires a kernel that supports the nfsdcltrack
          usermodehelper upcall. This support was first added to mainline
          kernels in 3.8.


-------------------------------------------------------

::

          nfsdcltrack was developed by Jeff Layton <jlayton@redhat.com>.

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

                                  2012-10-24                 NFSDCLTRACK(8)

--------------

Pages that refer to this page:
`nfs.conf(5) <../man5/nfs.conf.5.html>`__, 
`nfsdcld(8) <../man8/nfsdcld.8.html>`__

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
