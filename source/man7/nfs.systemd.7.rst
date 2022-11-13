.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfs.systemd(7) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFS.SYSTEMD(7)      Miscellaneous Information Manual      NFS.SYSTEMD(7)

NAME
-------------------------------------------------

::

          nfs.systemd - managing NFS services through systemd.


---------------------------------------------------------

::

          nfs-utils.service
          nfs-server.service
          nfs-client.target
          etc


---------------------------------------------------------------

::

          The nfs-utils package provides a suite of systemd unit files
          which allow the various services to be started and managed.
          These unit files ensure that the services are started in the
          correct order, and the prerequisites are active before dependant
          services start.  As there are quite  few unit files, it is not
          immediately obvious how best to achieve certain results.  The
          following subsections attempt to cover the issues that are most
          likely to come up.

      Configuration
          The standard systemd unit files do not provide any easy way to
          pass any command line arguments to daemons so as to configure
          their behavior.  In many case such configuration can be performed
          by making changes to /etc/nfs.conf or other configuration files.
          When that is not convenient, a distribution might provide systemd
          "drop-in" files which replace the ExecStart= setting to start the
          program with different arguments.  For example a drop-in file
          systemd/system/nfs-mountd.service.d/local.conf containing
                 [Service]
                 EnvironmentFile=/etc/sysconfig/nfs
                 ExecStart=
                 ExecStart= /usr/sbin/rpc.mountd $RPCMOUNTDOPTS
          would cause the nfs-mountd.service unit to run the rpc.mountd
          program using, for arguments, the value given for RPCMOUNTDOPTS
          in /etc/sysconfig/nfs.  This allows for seamless integration with
          existing configuration tools.

      Enabling unit files
          There are three unit files which are designed to be manually
          enabled.  All others are automatically run as required.  The
          three are:

          nfs-client.target
                 This should be enabled on any host which ever serves as an
                 NFS client.  There is little cost in transparently
                 enabling it whenever NFS client software is installed.

          nfs-server.service
                 This must be enabled to provide NFS service to clients.
                 It starts and configures the required daemons in the
                 required order.

          nfs-blkmap.service
                 The blkmapd daemon is only required on NFS clients which
                 are using pNFS (parallel NFS), and particularly using the
                 blocklayout layout protocol.  If you might use this
                 particular extension to NFS, the nfs-blkmap.service unit
                 should be enabled.

          Several other units which might be considered to be optional,
          such as rpc-gssd.service are careful to only start if the
          required configuration file exists.  rpc-gssd.service will not
          start if the krb5.keytab file does not exist (typically in /etc).

      Restarting NFS services
          Most NFS daemons can be restarted at any time.  They will reload
          any state that they need, and continue servicing requests.  This
          is rarely necessary though.

          When configuration changesare make, it can be hard to know
          exactly which services need to be restarted to ensure that the
          configuration takes effect.  The simplest approach, which is
          often the best, is to restart everything.  To help with this, the
          nfs-utils.service unit is provided.  It declares appropriate
          dependencies with other unit files so that
                 systemctl restart nfs-utils
          will restart all NFS daemons that are running.  This will cause
          all configuration changes to take effect except for changes to
          mount options lists in /etc/fstab or /etc/nfsmount.conf.  Mount
          options can only be changed by unmounting and remounting
          filesystem.  This can be a disruptive operation so it should only
          be done when the value justifies the cost.  The command
                 umount -a -t nfs; mount -a -t nfs
          should unmount and remount all NFS filesystems.

      Masking unwanted services
          Rarely there may be a desire to prohibit some services from
          running even though there are normally part of a working NFS
          system.  This may be needed to reduce system load to an absolute
          minimum, or to reduce attack surface by not running daemons that
          are not absolutely required.

          Three particular services which this can apply to are rpcbind,
          idmapd, and rpc-gssd.  rpcbind is not part of the nfs-utils
          package, but it used by several NFS services.  However it is not
          needed when only NFSv4 is in use.  If a site will never use NFSv3
          (or NFSv2) and does not want rpcbind to be running, the correct
          approach is to run
                 systemctl mask rpcbind
          This will disable rpcbind, and the various NFS services which
          depend on it (and are only needed for NFSv3) will refuse to
          start, without interfering with the operation of NFSv4 services.
          In particular, rpc.statd will not run when rpcbind is masked.

          idmapd is only needed for NFSv4, and even then is not needed when
          the client and server agree to use user-ids rather than user-
          names to identify the owners of files.  If idmapd is not needed
          and not wanted, it can be masked with
                 systemctl mask idmapd
          rpc-gssd is assumed to be needed if the krb5.keytab file is
          present.  If a site needs this file present but does not want
          rpc-gssd running, it can be masked with
                 systemctl mask rpc-gssd


---------------------------------------------------

::

          /etc/nfs.conf
          /etc/nfsmount.conf
          /etc/idmapd.conf


---------------------------------------------------------

::

          systemd.unit(5), nfs.conf(5), nfsmount.conf(5).

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

                                                             NFS.SYSTEMD(7)

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
