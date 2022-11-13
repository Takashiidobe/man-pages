.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

quotaon(8) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTES ON XFS FILESYSTE           |                                   |
| MS <#NOTES_ON_XFS_FILESYSTEMS>`__ |                                   |
| \| `FILES <#FILES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   QUOTAON(8)               System Manager's Manual              QUOTAON(8)

NAME
-------------------------------------------------

::

          quotaon, quotaoff - turn filesystem quotas on and off


---------------------------------------------------------

::

          quotaon [ -vugfp ] [ -F format-name ] filesystem...
          quotaon [ -avugPfp ] [ -F format-name ]

          quotaoff [ -vugPp ] [ -x state ] filesystem...
          quotaoff [ -avugp ]


---------------------------------------------------------------

::

      quotaon
          quotaon announces to the system that disk quotas should be
          enabled on one or more filesystems. The filesystem quota files
          must be present in the root directory of the specified filesystem
          and be named either aquota.user (for version 2 user quota),
          quota.user (for version 1 user quota), aquota.group (for version
          2 group quota), or quota.group (for version 1 group quota).

          XFS filesystems are a special case - XFS considers quota
          information as filesystem metadata and uses journaling to provide
          a higher level guarantee of consistency.  There are two
          components to the XFS disk quota system: accounting and limit
          enforcement.  XFS filesystems require that quota accounting be
          turned on at mount time.  It is possible to enable and disable
          limit enforcement on an XFS filesystem after quota accounting is
          already turned on.  The default is to turn on both accounting and
          enforcement.

          The XFS quota implementation does not maintain quota information
          in user-visible files, but rather stores this information
          internally.

      quotaoff
          quotaoff announces to the system that the specified filesystems
          should have any disk quotas turned off.


-------------------------------------------------------

::

      quotaon
          -F, --format=format-name
                 Report quota for specified format (ie. don't perform
                 format autodetection).  Possible format names are: vfsold
                 Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota
                 format with 32-bit UIDs / GIDs, 64-bit space usage, 32-bit
                 inode usage and limits, vfsv1 Quota format with 64-bit
                 quota limits and usage, xfs (quota on XFS filesystem)

          -a, --all
                 All automatically mounted (no noauto option) non-NFS
                 filesystems in /etc/fstab with quotas will have their
                 quotas turned on.  This is normally used at boot time to
                 enable quotas.

          -v, --verbose
                 Display a message for each filesystem where quotas are
                 turned on.

          -u, --user
                 Manipulate user quotas. This is the default.

          -g, --group
                 Manipulate group quotas.

          -P, --project
                 Manipulate project quotas.

          -p, --print-state
                 Instead of turning quotas on just print state of quotas
                 (ie. whether. quota is on or off)

          -x, --xfs-command enforce
                 Switch on limit enforcement for XFS filesystems. This is
                 the default action for any XFS filesystem. This option is
                 only applicable to XFS, and is silently ignored for other
                 filesystem types.

          -f, --off
                 Make quotaon behave like being called as quotaoff.

      quotaoff
          -F, --format=format-name
                 Report quota for specified format (ie. don't perform
                 format autodetection).  Possible format names are: vfsold
                 (version 1 quota), vfsv0 (version 2 quota), xfs (quota on
                 XFS filesystem)

          -a, --all
                 Force all filesystems in /etc/fstab to have their quotas
                 disabled.

          -v, --verbose
                 Display a message for each filesystem affected.

          -u, --user
                 Manipulate user quotas. This is the default.

          -g, --group
                 Manipulate group quotas.

          -P, --project
                 Manipulate project quotas.

          -p, --print-state
                 Instead of turning quotas off just print state of quotas
                 (ie. whether. quota is on or off)

          -x, --xfs-command delete
                 Free up the space used to hold quota information
                 (maintained internally) within XFS.  This option is only
                 applicable to XFS, and is silently ignored for other
                 filesystem types.  It can only be used on a filesystem
                 with quota previously turned off.

          -x, --xfs-command enforce
                 Switch off limit enforcement for XFS filesystems (perform
                 quota accounting only). This is the default action for any
                 XFS filesystem.  This option is only applicable to XFS,
                 and is silently ignored for other filesystem types.

          -x, --xfs-command account
                 This option can be used to disable quota accounting. It is
                 not possible to enable quota accounting by quota tools.
                 Use mount(8) for that. This option is only applicable to
                 XFS filesystems, and is silently ignored for other
                 filesystem types.


-----------------------------------------------------------------------------------------

::

          To enable quotas on an XFS filesystem, use mount(8) or /etc/fstab
          quota option to enable both accounting and limit enforcement.
          quotaon utility cannot be used for this purpose.

          Turning on quotas on an XFS root filesystem requires the quota
          mount options be passed into the kernel at boot time through the
          Linux rootflags boot option.

          To turn off quota limit enforcement on any XFS filesystem, first
          make sure that quota accounting and enforcement are both turned
          on using repquota -v filesystem.  Then, use quotaoff -v
          filesystem to disable limit enforcement.  This may be done while
          the filesystem is mounted.

          Turning on quota limit enforcement on an XFS filesystem is
          achieved using quotaon -v filesystem.  This may be done while the
          filesystem is mounted.


---------------------------------------------------

::

          aquota.user or aquota.group
                 quota file at the filesystem root (version 2 quota, non-
                 XFS filesystems)
          quota.user or quota.group
                 quota file at the filesystem root (version 1 quota, non-
                 XFS filesystems)
          /etc/fstab
                 default filesystems


---------------------------------------------------------

::

          quotactl(2), fstab(5), quota_nld(8), repquota(8), warnquota(8)

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

   4th Berkeley Distribution                                     QUOTAON(8)

--------------

Pages that refer to this page: `quota(1) <../man1/quota.1.html>`__, 
`quotasync(1) <../man1/quotasync.1.html>`__, 
`quotactl(2) <../man2/quotactl.2.html>`__, 
`convertquota(8) <../man8/convertquota.8.html>`__, 
`edquota(8) <../man8/edquota.8.html>`__, 
`quotacheck(8) <../man8/quotacheck.8.html>`__, 
`repquota(8) <../man8/repquota.8.html>`__, 
`setquota(8) <../man8/setquota.8.html>`__

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
