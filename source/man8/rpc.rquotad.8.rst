.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

rpc.rquotad(8) — Linux manual page
==================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   RQUOTAD(8)               System Manager's Manual              RQUOTAD(8)

NAME
-------------------------------------------------

::

          rpc.rquotad - remote quota server


---------------------------------------------------------

::

          /usr/sbin/rpc.rquotad [ -FI ] [ -p port ] [ -s | -S ] [ -x path ]

          /usr/sbin/rpc.rquotad [ -h | -V ]


---------------------------------------------------------------

::

          rpc.rquotad is an rpc(3) server which returns quotas for a user
          of a local filesystem which is mounted by a remote machine over
          the NFS.  It also allows setting of quotas on NFS mounted
          filesystem (if configured during compilation and allowed by a
          command line option -S).  The results are used by quota(1) to
          display user quotas for remote filesystems and by edquota(8) to
          set quotas on remote filesystems.  rquotad daemon uses tcp-
          wrappers library (under service name rquotad) which allows you to
          specify hosts allowed/disallowed to use the daemon (see
          hosts.allow(5) manpage for more information). The rquotad daemon
          is normally started at boot time from the system startup scripts.


-------------------------------------------------------

::

          -h, --help
                 Show program usage and exit.  -V, --version Show version
                 of quota tools.

          -s, --no-setquota
                 Don't allow setting of quotas (default). This option is
                 available only if utilities were compiled with the
                 rpcsetquota option.

          -S, --setquota
                 Allow setting of quotas. This option is available only if
                 utilities were compiled with the rpcsetquota option.

          -F, --foreground
                 Run daemon in foreground (may be useful for debugging
                 purposes).

          -I, --autofs
                 Do not ignore autofs mountpoints.

          -p port, --port port
                 Listen on alternate port port.

          -x path, --xtab path
                 Set an alternative file with NFSD export table. This file
                 is used to determine pseudoroot of NFSv4 exports. The
                 pseudoroot is then prepended to each relative path (i.e. a
                 path not beginning by '/') received in a quota RPC
                 request.


---------------------------------------------------

::

          aquota.user or aquota.group
                 quota file at the filesystem root (version 2 quota, non-
                 XFS filesystems)
          quota.user or quota.group
                 quota file at the filesystem root (version 1 quota, non-
                 XFS filesystems)
          /etc/mtab
                 default filesystems


---------------------------------------------------------

::

          quota(1), rpc(3), nfs(5), services(5), inetd(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of the quota (Linux Diskquota Tools) project.
          Information about the project can be found at [unknown -- if you
          know, please contact man-pages@man7.org] It is not known how to
          report bugs for this man page; if you know, please send a mail to
          man-pages@man7.org.  This page was obtained from the project's
          upstream Git repository
          ⟨git://git.kernel.org/pub/scm/utils/quota/quota-tools.git⟩ on
          2021-08-27.  (At that time, the date of the most recent commit
          that was found in the repository was 2021-08-20.)  If you
          discover any rendering problems in this HTML version of the page,
          or you believe there is a better or more up-to-date source for
          the page, or you have corrections or improvements to the
          information in this COLOPHON (which is not part of the original
          manual page), send a mail to man-pages@man7.org

                                                                 RQUOTAD(8)

--------------

Pages that refer to this page: `mountd(8) <../man8/mountd.8.html>`__, 
`nfsd(8) <../man8/nfsd.8.html>`__

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
