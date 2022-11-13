.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsdcld(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CONFIGURAT                       |                                   |
| ION FILE <#CONFIGURATION_FILE>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFSDCLD(8)                                                    NFSDCLD(8)

NAME
-------------------------------------------------

::

          nfsdcld - NFSv4 Client Tracking Daemon


---------------------------------------------------------

::

          nfsdcld [-d] [-F] [-p path] [-s stable storage dir]


---------------------------------------------------------------

::

          nfsdcld is the NFSv4 client tracking daemon. It is not necessary
          to run this daemon on machines that are not acting as NFSv4
          servers.

          When a network partition is combined with a server reboot, there
          are edge conditions that can cause the server to grant lock
          reclaims when other clients have taken conflicting locks in the
          interim. A more detailed explanation of this issue is described
          in RFC 3530, section 8.6.3.

          In order to prevent these problems, the server must track a small
          amount of per-client information on stable storage. This daemon
          provides the userspace piece of that functionality.


-------------------------------------------------------

::

          -d, --debug
              Enable debug level logging.

          -F, --foreground
              Runs the daemon in the foreground and prints all output to
              stderr

          -p path, --pipefsdir=path
              Location of the rpc_pipefs filesystem. The default value is
              /var/lib/nfs/rpc_pipefs.

          -s storage_dir, --storagedir=storage_dir
              Directory where stable storage information should be kept.
              The default value is /var/lib/nfs/nfsdcld.


-----------------------------------------------------------------------------

::

          The following values are recognized in the [nfsdcld] section of
          the /etc/nfs.conf configuration file:

          storagedir
              Equivalent to -s/--storagedir.

          debug
              Setting "debug = 1" is equivalent to -d/--debug.

          In addition, the following value is recognized from the [general]
          section:

          pipefs-directory
              Equivalent to -p/--pipefsdir.


---------------------------------------------------

::

          The Linux kernel NFSv4 server has historically tracked this
          information on stable storage by manipulating information on the
          filesystem directly, in the directory to which
          /proc/fs/nfsd/nfsv4recoverydir points.

          This changed with the original introduction of nfsdcld upcall in
          kernel version 3.4, which was later deprecated in favor of the
          nfsdcltrack(8) usermodehelper program, support for which was
          added in kernel version 3.8.  However, since the usermodehelper
          upcall does not work in containers, support for a new version of
          the nfsdcld upcall was added in kernel version 5.2.

          This daemon requires a kernel that supports the nfsdcld upcall.
          On older kernels, if the legacy client name tracking code was in
          use, then the kernel would not create the pipe that nfsdcld uses
          to talk to the kernel.  On newer kernels, nfsd attempts to
          initialize client tracking in the following order:  First, the
          nfsdcld upcall.  Second, the nfsdcltrack usermodehelper upcall.
          Finally, the legacy client tracking.

          This daemon should be run as root, as the pipe that it uses to
          communicate with the kernel is only accessable by root. The
          daemon however does drop all superuser capabilities after
          starting. Because of this, the storagedir should be owned by
          root, and be readable and writable by owner.

          The daemon now supports different upcall versions to allow the
          kernel to pass additional data to be stored in the on-disk
          database.  The kernel will query the supported upcall version
          from nfsdcld during client tracking initialization.  A restart of
          nfsd is not necessary after upgrading nfsdcld, however nfsd will
          not use a later upcall version until restart.  A restart of nfsd
          is necessary after downgrading nfsdcld, to ensure that nfsd does
          not use an upcall version that nfsdcld does not support.
          Additionally, a downgrade of nfsdcld requires the schema of the
          on-disk database to be downgraded as well.  That can be
          accomplished using the nfsdclddb(8) utility.


---------------------------------------------------

::

          /var/lib/nfs/nfsdcld/main.sqlite


---------------------------------------------------------

::

          nfsdcltrack(8), nfsdclddb(8)


-------------------------------------------------------

::

          The nfsdcld daemon was developed by Jeff Layton
          <jlayton@redhat.com> with modifications from Scott Mayhew
          <smayhew@redhat.com>.

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

                                  2011-12-21                     NFSDCLD(8)

--------------

Pages that refer to this page:
`nfsdclddb(8) <../man8/nfsdclddb.8.html>`__

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
