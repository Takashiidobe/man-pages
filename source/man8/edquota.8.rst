.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

edquota(8) — Linux manual page
==============================

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

   EDQUOTA(8)               System Manager's Manual              EDQUOTA(8)

NAME
-------------------------------------------------

::

          edquota - edit user quotas


---------------------------------------------------------

::

          edquota [ -p protoname ] [ -u | -g | -P ] [ -rm ] [ -F format-
          name ] [ -f filesystem ] username | groupname | projectname...

          edquota [ -u | -g | -P ] [ -F format-name ] [ -f filesystem ] -t

          edquota [ -u | -g | -P ] [ -F format-name ] [ -f filesystem ] -T
          username | groupname | projectname...


---------------------------------------------------------------

::

          edquota is a quota editor.  One or more users, groups, or
          projects may be specified on the command line. If a number is
          given in the place of user/group/project name it is treated as an
          UID/GID/Project ID. For each user, group, or project a temporary
          file is created with an ASCII representation of the current disk
          quotas for that user, group, or project and an editor is then
          invoked on the file.  The quotas may then be modified, new quotas
          added, etc.  Setting a quota to zero indicates that no quota
          should be imposed.

          Block usage and limits are reported and interpreted as multiples
          of kibibyte (1024 bytes) blocks by default. Symbols K, M, G, and
          T can be appended to numeric value to express kibibytes,
          mebibytes, gibibytes, and tebibytes.

          Inode usage and limits are interpreted literally. Symbols k, m,
          g, and t can be appended to numeric value to express multiples of
          10^3, 10^6, 10^9, and 10^12 inodes.

          Users are permitted to exceed their soft limits for a grace
          period that may be specified per filesystem.  Once the grace
          period has expired, the soft limit is enforced as a hard limit.

          The current usage information in the file is for informational
          purposes; only the hard and soft limits can be changed.

          Upon leaving the editor, edquota reads the temporary file and
          modifies the binary quota files to reflect the changes made.

          The editor invoked is vi(1) unless either the EDITOR or the
          VISUAL environment variable specifies otherwise.

          Only the super-user may edit quotas.


-------------------------------------------------------

::

          -r, --remote
                 Edit also non-local quota use rpc.rquotad on remote server
                 to set quota.  This option is available only if quota
                 tools were compiled with enabled support for setting
                 quotas over RPC.  The -n option is equivalent, and is
                 maintained for backward compatibility.

          -m, --no-mixed-pathnames
                 Currently, pathnames of NFSv4 mountpoints are sent without
                 leading slash in the path.  rpc.rquotad uses this to
                 recognize NFSv4 mounts and properly prepend pseudoroot of
                 NFS filesystem to the path. If you specify this option,
                 edquota will always send paths with a leading slash. This
                 can be useful for legacy reasons but be aware that quota
                 over RPC will stop working if you are using new
                 rpc.rquotad.

          -u, --user
                 Edit the user quota. This is the default.

          -g, --group
                 Edit the group quota.

          -P, --project
                 Edit the project quota.

          -p, --prototype=protoname
                 Duplicate the quotas of the prototypical user specified
                 for each user specified.  This is the normal mechanism
                 used to initialize quotas for groups of users.

          --always-resolve
                 Always try to translate user / group name to uid / gid
                 even if the name is composed of digits only.

          -F, --format=format-name
                 Edit quota for specified format (ie. don't perform format
                 autodetection).  Possible format names are: vfsold
                 Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota
                 format with 32-bit UIDs / GIDs, 64-bit space usage, 32-bit
                 inode usage and limits, vfsv1 Quota format with 64-bit
                 quota limits and usage, rpc (quota over NFS), xfs (quota
                 on XFS filesystem)

          -f, --filesystem filesystem
                 Perform specified operations only for given filesystem
                 (default is to perform operations for all filesystems with
                 quota).

          -t, --edit-period
                 Edit the soft time limits for each filesystem.  In old
                 quota format if the time limits are zero, the default time
                 limits in <linux/quota.h> are used. In new quota format
                 time limits must be specified (there is no default value
                 set in kernel). Time units of 'seconds', 'minutes',
                 'hours', and 'days' are understood. Time limits are
                 printed in the greatest possible time unit such that the
                 value is greater than or equal to one.

          -T, --edit-times
                 Edit time for the user/group/project when softlimit is
                 enforced. Possible values are 'unset' or number and unit.
                 Units are the same as in -t option.


---------------------------------------------------

::

          aquota.user or aquota.group
                 quota file at the filesystem root (version 2 quota, non-
                 XFS filesystems)
          quota.user or quota.group
                 quota file at the filesystem root (version 1 quota, non-
                 XFS filesystems)
          /etc/mtab
                 mounted filesystems table


---------------------------------------------------------

::

          quota(1), vi(1), quotactl(2), quotacheck(8), quotaon(8),
          repquota(8), setquota(8)

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

                                                                 EDQUOTA(8)

--------------

Pages that refer to this page: `quota(1) <../man1/quota.1.html>`__, 
`convertquota(8) <../man8/convertquota.8.html>`__, 
`quotacheck(8) <../man8/quotacheck.8.html>`__, 
`repquota(8) <../man8/repquota.8.html>`__, 
`rpc.rquotad(8) <../man8/rpc.rquotad.8.html>`__, 
`setquota(8) <../man8/setquota.8.html>`__, 
`warnquota(8) <../man8/warnquota.8.html>`__

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
