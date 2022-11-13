.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lxc-snapshot(1) — Linux manual page
===================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `CO                               |                                   |
| MMON OPTIONS <#COMMON_OPTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LXC-SNAPSHOT(1)                                          LXC-SNAPSHOT(1)

NAME
-------------------------------------------------

::

          lxc-snapshot - Snapshot an existing container.


---------------------------------------------------------

::

          lxc-snapshot -n, --name name [ -c, --comment file ]

          lxc-snapshot -n, --name name -d, -destroy snapshot-name

          lxc-snapshot -n, --name name -L, --list  [ -C, --showcomments  ]

          lxc-snapshot -n, --name name -r, -restore snapshot-name [ -N,
          --newname  newname ]


---------------------------------------------------------------

::

          lxc-snapshot creates, lists, and restores container snapshots.

          Snapshots are stored as snapshotted containers under the
          container's configuration path. For instance, if the container's
          configuration path is /var/lib/lxc and the container is c1, then
          the first snapshot will be stored as container snap0 under the
          path /var/lib/lxc/c1/snaps.  If /var/lib/lxcsnaps, as used by LXC
          1.0, already exists, then it will continue to be used.


-------------------------------------------------------

::

          -c,--comment comment_file
                 Associate the comment in comment_file with the newly
                 created snapshot.

          -d,--destroy snapshot-name
                 Destroy the named snapshot. If the named snapshot is ALL,
                 then all snapshots will be destroyed.

          -L,--list
                 List existing snapshots.

          -C,--showcomments
                 Show snapshot comments in the snapshots listings.

          -r,--restore snapshot-name
                 Restore the named snapshot, meaning a full new container
                 is created which is a copy of the snapshot.

          -N, --newname
                 When restoring a snapshot, the last optional argument if
                 not given explicitly via --newname is the name to use for
                 the restored container. If the newname is identical to the
                 original name of the container, then the original
                 container will be destroyed and the restored container
                 will take its place. Note that deleting the original
                 snapshot is not possible in the case of overlayfs or zfs
                 backed snapshots.


---------------------------------------------------------------------

::

          These options are common to most of lxc commands.

          -?, -h, --help
                 Print a longer usage message than normal.

          --usage
                 Give the usage message

          -q, --quiet
                 mute on

          -P, --lxcpath=PATH
                 Use an alternate container path. The default is
                 /usr/local/var/lib/lxc.

          -o, --logfile=FILE
                 Output to an alternate log FILE. The default is no log.

          -l, --logpriority=LEVEL
                 Set log priority to LEVEL. The default log priority is
                 ERROR. Possible values are : FATAL, ALERT, CRIT, WARN,
                 ERROR, NOTICE, INFO, DEBUG, TRACE.

                 Note that this option is setting the priority of the
                 events log in the alternate log file. It do not have
                 effect on the ERROR events log on stderr.

          -n, --name=NAME
                 Use container identifier NAME.  The container identifier
                 format is an alphanumeric string.

          --rcfile=FILE
                 Specify the configuration file to configure the
                 virtualization and isolation functionalities for the
                 container.

                 This configuration file if present will be used even if
                 there is already a configuration file present in the
                 previously created container (via lxc-create).

          --version
                 Show the version number.


---------------------------------------------------------

::

          lxc(7), lxc-create(1), lxc-copy(1), lxc-destroy(1), lxc-start(1),
          lxc-stop(1), lxc-execute(1), lxc-console(1), lxc-monitor(1),
          lxc-wait(1), lxc-cgroup(1), lxc-ls(1), lxc-info(1),
          lxc-freeze(1), lxc-unfreeze(1), lxc-attach(1), lxc.conf(5)


-----------------------------------------------------

::

          Serge Hallyn <serge.hallyn@ubuntu.com >

COLOPHON
---------------------------------------------------------

::

          This page is part of the lxc (Linux containers) project.
          Information about the project can be found at 
          ⟨http://linuxcontainers.org/⟩.  If you have a bug report for this
          manual page, send it to lxc-devel@lists.linuxcontainers.org.
          This page was obtained from the project's upstream Git repository
          ⟨git://github.com/lxc/lxc⟩ on 2021-08-27.  (At that time, the
          date of the most recent commit that was found in the repository
          was 2021-08-26.)  If you discover any rendering problems in this
          HTML version of the page, or you believe there is a better or
          more up-to-date source for the page, or you have corrections or
          improvements to the information in this COLOPHON (which is not
          part of the original manual page), send a mail to
          man-pages@man7.org

                                  2021-08-26                LXC-SNAPSHOT(1)

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
