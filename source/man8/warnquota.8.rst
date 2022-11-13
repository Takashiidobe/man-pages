.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

warnquota(8) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `AUTHORS <#AUTHORS>`__ \|         |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   WARNQUOTA(8)             System Manager's Manual            WARNQUOTA(8)

NAME
-------------------------------------------------

::

          warnquota - send mail to users over quota


---------------------------------------------------------

::

          warnquota [ -ugsid ] [ -F quotaformat ] [ -q quotatab ] [ -c
          configfile ] [ -a adminsfile ] [ filesystem...  ]


---------------------------------------------------------------

::

          warnquota checks the disk quota for specified local filesystems
          (or for each local filesystem if none specified) and mails a
          warning message to those users who have reached their softlimit.
          It is typically run via cron(8).

          -F, --format=quotaformat
                 Perform setting for specified format (ie. don't perform
                 format autodetection).  Possible format names are: vfsold
                 Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota
                 format with 32-bit UIDs / GIDs, 64-bit space usage, 32-bit
                 inode usage and limits, vfsv1 Quota format with 64-bit
                 quota limits and usage, xfs Quota on XFS filesystem.

          -q, --quota-tab=quotatab
                 Use quotatab instead of /etc/quotatab as file with device
                 description strings (see quotatab(5) for syntax).

          -c, --config=configfile
                 Use configfile instead of /etc/warnquota.conf as
                 configuration file (see warnquota.conf(5) for syntax).

          -a, --admins-file=adminsfile
                 Use adminsfile instead of /etc/quotagrpadmins as a file
                 with administrators of the groups (see quotagrpadmins(5)
                 for syntax).

          -u, --user
                 check whether users are not exceeding quotas (default).

          -g, --group
                 check whether groups are not exceeding quotas. If group is
                 exceeding quota a mail is sent to the user specified in
                 /etc/quotagrpadmins.

          -s, --human-readable[=units]
                 Try to report used space, number of used inodes and limits
                 in more appropriate units than the default ones. Units can
                 be also specified explicitely by an optional argument in
                 format [ kgt ],[ kgt ] where the first character specifies
                 space units and the second character specifies inode
                 units.

          -i, --no-autofs
                 ignore mountpoints mounted by automounter.

          -d, --no-details
                 do not attach quota report in email.


---------------------------------------------------

::

          aquota.user
                 quota file at the filesystem root (version 2 quota, non-
                 XFS filesystems)
          quota.user
                 quota file at the filesystem root (version 1 quota, non-
                 XFS filesystems)
          /etc/warnquota.conf
                 configuration file
          /etc/quotatab
                 device description
          /etc/quotagrpadmins
                 administrators of the groups
          /etc/mtab
                 default filesystems
          /etc/passwd
                 default set of users


---------------------------------------------------------

::

          quota(1), quotatab(5), quotagrpadmins(5), warnquota.conf(5),
          cron(8), edquota(8).


-------------------------------------------------------

::

          warnquota(8) was written by Marco van Wieringen
          <mvw@planets.elm.net>, modifications by Jan Kara <jack@suse.cz>.
          This reference page written by Heiko Schlittermann
          <heiko@lotte.sax.de>, modifications by Jan Kara

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

                                                               WARNQUOTA(8)

--------------

Pages that refer to this page: `quota(1) <../man1/quota.1.html>`__, 
`quotasync(1) <../man1/quotasync.1.html>`__, 
`quotagrpadmins(5) <../man5/quotagrpadmins.5.html>`__, 
`quotatab(5) <../man5/quotatab.5.html>`__, 
`warnquota.conf(5) <../man5/warnquota.conf.5.html>`__, 
`quotaon(8) <../man8/quotaon.8.html>`__, 
`repquota(8) <../man8/repquota.8.html>`__, 
`warnquota(8) <../man8/warnquota.8.html>`__, 
`xfs_quota(8) <../man8/xfs_quota.8.html>`__

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
