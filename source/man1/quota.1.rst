.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

quota(1) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `DIAGNOSTICS <#DIAGNOSTICS>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   QUOTA(1)                 General Commands Manual                QUOTA(1)

NAME
-------------------------------------------------

::

          quota - display disk usage and limits


---------------------------------------------------------

::

          quota [ -F format-name ] [ -guqvswi ] [ -l | [ -QAm ]]
          quota [ -F format-name ] [ -qvswi ] [ -l | [ -QAm ]] -u user...
          quota [ -F format-name ] [ -qvswi ] [ -l | [ -QAm ]] -g group...
          quota [ -F format-name ] [ -qvswi ] [ -l | [ -QAm ]] -P
          project...
          quota [ -F format-name ] [ -qvswugQm ] -f filesystem...


---------------------------------------------------------------

::

          quota displays users' disk usage and limits.  By default only the
          user quotas are printed. By default space usage and limits are
          shown in kbytes (and are named blocks for historical reasons).

          quota reports the quotas of all the filesystems listed in
          /etc/mtab.  For filesystems that are NFS-mounted a call to the
          rpc.rquotad on the server machine is performed to get the
          information.


-------------------------------------------------------

::

          -F, --format=format-name
                 Show quota for specified format (ie. don't perform format
                 autodetection).  Possible format names are: vfsold
                 Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota
                 format with 32-bit UIDs / GIDs, 64-bit space usage, 32-bit
                 inode usage and limits, vfsv1 Quota format with 64-bit
                 quota limits and usage, rpc (quota over NFS), xfs (quota
                 on XFS filesystem)

          -g, --group
                 Print group quotas for the group of which the user is a
                 member.  The optional group argument(s) restricts the
                 display to the specified group(s).

          -u, --user
                 flag is equivalent to the default.

          -P, --project
                 Print project quotas for the specified project.

          -v, --verbose
                 will display quotas on filesystems where no storage is
                 allocated.

          -s, --human-readable[=units]
                 option will make quota(1) try to choose units for showing
                 limits, used space and used inodes. Units can be also
                 specified explicitely by an optional argument in format [
                 kgt ],[ kgt ] where the first character specifies space
                 units and the second character specifies inode units.

          --always-resolve
                 Always try to translate user / group name to uid / gid
                 even if the name is composed of digits only.

          -p, --raw-grace
                 When user is in grace period, report time in seconds since
                 epoch when his grace time runs out (or has run out). Field
                 is '0' when no grace time is in effect.  This is
                 especially useful when parsing output by a script.

          -i, --no-autofs
                 ignore mountpoints mounted by automounter

          -l, --local-only
                 report quotas only on local filesystems (ie. ignore NFS
                 mounted filesystems).

          -A, --all-nfs
                 report quotas for all NFS filesystems even if they report
                 to be on the same device.

          -f, --filesystem-list
                 report quotas only for filesystems specified on command
                 line.

          --filesystem=path
                 report quotas only for filesystem path.  This option can
                 be specified multiple types and quota will be reported for
                 each specified filesystem. Unlike command line option -f
                 remaining command like arguments are still treated as user
                 / group / project names to report.

          -m, --no-mixed-pathnames
                 Currently, pathnames of NFSv4 mountpoints are sent without
                 leading slash in the path.  rpc.rquotad uses this to
                 recognize NFSv4 mounts and properly prepend pseudoroot of
                 NFS filesystem to the path. If you specify this option,
                 quota will always send paths with a leading slash. This
                 can be useful for legacy reasons but be aware that quota
                 over RPC will stop working if you are using new
                 rpc.rquotad.

          -q, --quiet
                 Print a more terse message, containing only information on
                 filesystems where usage is over quota.

          -Q, --quiet-refuse
                 Do not print error message if connection to rpc.rquotad is
                 refused (usually this happens when rpc.rquotad is not
                 running on the server).

          -w, --no-wrap
                 Do not wrap the line if the device name is too long. This
                 can be useful when parsing the output of quota(1) by a
                 script.

          --show-mntpoint
                 Show also mount point as a filesystem identification.

          --hide-device
                 Do not show device name in a filesystem identification.

          Specifying both -g and -u displays both the user quotas and the
          group quotas (for the user).

          Only the super-user may use the -u flag and the optional user
          argument to view the limits of other users. Also viewing of
          project quota usage and limits is limited to super-user only.
          Non-super-users can use the -g flag and optional group argument
          to view only the limits of groups of which they are members.

          The -q flag takes precedence over the -v flag.


---------------------------------------------------------------

::

          If quota exits with a non-zero status, one or more filesystems
          are over quota.


---------------------------------------------------

::

          aquota.user  or  aquota.group
                 quota file at the filesystem root (version 2 quota, non-
                 XFS filesystems)
          quota.user  or  quota.group
                 quota file at the filesystem root (version 1 quota, non-
                 XFS filesystems)
          /etc/mtab
                 default filesystems


---------------------------------------------------------

::

          quotactl(2), fstab(5), edquota(8), quotacheck(8), quotaon(8),
          quota_nld(8), repquota(8), warnquota(8), setquota(8)

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

                                                                   QUOTA(1)

--------------

Pages that refer to this page: `quota(1) <../man1/quota.1.html>`__, 
`quotasync(1) <../man1/quotasync.1.html>`__, 
`quotactl(2) <../man2/quotactl.2.html>`__, 
`rquota(3) <../man3/rquota.3.html>`__, 
`convertquota(8) <../man8/convertquota.8.html>`__, 
`edquota(8) <../man8/edquota.8.html>`__, 
`quotacheck(8) <../man8/quotacheck.8.html>`__, 
`quota_nld(8) <../man8/quota_nld.8.html>`__, 
`quotastats(8) <../man8/quotastats.8.html>`__, 
`repquota(8) <../man8/repquota.8.html>`__, 
`rpc.rquotad(8) <../man8/rpc.rquotad.8.html>`__, 
`setquota(8) <../man8/setquota.8.html>`__, 
`warnquota(8) <../man8/warnquota.8.html>`__, 
`xqmstats(8) <../man8/xqmstats.8.html>`__

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
