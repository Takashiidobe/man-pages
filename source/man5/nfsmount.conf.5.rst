.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

nfsmount.conf(5) — Linux manual page
====================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   NFSMOUNT.CONF(5)           File Formats Manual          NFSMOUNT.CONF(5)

NAME
-------------------------------------------------

::

          nfsmount.conf - Configuration file for NFS mounts


---------------------------------------------------------

::

          Configuration file for NFS mounts that allows options to be set
          globally, per server or per mount point.


---------------------------------------------------------------

::

          The configuration file is made up of multiple section headers
          followed by variable assignments associated with that section.  A
          section header is defined by a string enclosed by [ and ]
          brackets.  Variable assignments are assignment statements that
          assign values to particular variables using the = operator, as in
          Proto=Tcp.  The variables that can be assigned are the set of NFS
          specific mount options listed in nfs(5) together with the
          filesystem-independant mount options listed in mount(8) and three
          additions: Sloppy=True has the same effect as the -s option to
          mount, and Foreground=True and Background=True have the same
          effect as bg and fg.

          Options in the config file may be given in upper, lower, or mixed
          case and will be shifted to lower case before being passed to the
          filesystem.

          Boolean mount options which do not need an equals sign must be
          given as "option=True".  Instead of preceeding such an option
          with "no" its negation must be given as "option=False".

          Sections are broken up into three basic categories: Global
          options, Server options and Mount Point options.

          [ NFSMount_Global_Options ] - This statically named section
                 defines all of the global mount options that can be
                 applied to every NFS mount.

          [ Server "Server_Name" ] - This section defines all the mount
                 options that should be used on mounts to a particular NFS
                 server. The "Server_Name" strings needs to be surrounded
                 by '"' and be an exact match (ignoring case) of the server
                 name used in the mount command.

          [ MountPoint "Mount_Point" ] - This section defines all the mount
                 options that should be used on a particular mount point.
                 The "Mount_Point" string needs to be surrounded by '"' and
                 be an exact match of the mount point used in the mount
                 command.  Though path names are usually case-sensitive,
                 the Mount_Point name is matched insensitive to case.

          The sections are processed in the reverse of the order listed
          above, and any options already seen, either in a previous section
          or on the command line, will be ignored when seen again.


---------------------------------------------------------

::

          These are some example lines of how sections and variables are
          defined in the configuration file.

          [ NFSMount_Global_Options ]
              Proto=Tcp

                 The TCP/IPv4 protocol will be used on every NFS mount.

          [ Server "nfsserver.foo.com" ]
              rsize=32k
              wsize=32k
              proto=udp6

                 A 32k (32768 bytes) block size will be used as the read
                 and write size on all mounts to the 'nfsserver.foo.com'
                 server.  UDP/IPv6 is the protocol to be used.

          [ MountPoint "/export/home" ]
              Background=True

                 All mounts to the '/export/home' export will be performed
                 in the background (i.e. done asynchronously).


---------------------------------------------------

::

          /etc/nfsmount.conf
                 Default NFS mount configuration file

          /etc/nfsmount.conf.d
                 When this directory exists and files ending with ".conf"
                 exist, those files will be used to set configuration
                 variables. These files will override variables set in
                 /etc/nfsmount.conf


---------------------------------------------------------

::

          nfs(5), mount(8),

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

                               16 December 2020            NFSMOUNT.CONF(5)

--------------

Pages that refer to this page: `nfs(5) <../man5/nfs.5.html>`__, 
`nfs.conf(5) <../man5/nfs.conf.5.html>`__, 
`nfs.systemd(7) <../man7/nfs.systemd.7.html>`__, 
`mount.nfs(8) <../man8/mount.nfs.8.html>`__

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
