.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setquota(8) — Linux manual page
===============================

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

   SETQUOTA(8)              System Manager's Manual             SETQUOTA(8)

NAME
-------------------------------------------------

::

          setquota - set disk quotas


---------------------------------------------------------

::

          setquota [ -rm ] [ -u | -g | -P ] [ -F quotaformat ] name block-
          softlimit block-hardlimit inode-softlimit inode-hardlimit -a |
          filesystem...

          setquota [ -rm ] [ -u | -g | -P ] [ -F quotaformat ] [ -p
          protoname ] name -a | filesystem...

          setquota -b [ -rm ] [ -u | -g | -P ] [ -F quotaformat ] -a |
          filesystem...

          setquota -t [ -u | -g | -P ] [ -F quotaformat ] block-grace
          inode-grace -a | filesystem...

          setquota -T [ -u | -g | -P ] [ -F quotaformat ] name block-grace
          inode-grace -a | filesystem...


---------------------------------------------------------------

::

          setquota is a command line quota editor.  The filesystem,
          user/group/project name and new quotas for this filesystem can be
          specified on the command line. Note that if a number is given in
          the place of a user/group/project name it is treated as an
          UID/GID/project ID.

          -r, --remote
                 Edit also remote quota use rpc.rquotad on remote server to
                 set quota. This option is available only if quota tools
                 were compiled with enabled support for setting quotas over
                 RPC.

          -m, --no-mixed-pathnames
                 Currently, pathnames of NFSv4 mountpoints are sent without
                 leading slash in the path.  rpc.rquotad uses this to
                 recognize NFSv4 mounts and properly prepend pseudoroot of
                 NFS filesystem to the path. If you specify this option,
                 setquota will always send paths with a leading slash. This
                 can be useful for legacy reasons but be aware that quota
                 over RPC will stop working if you are using new
                 rpc.rquotad.

          -F, --format=quotaformat
                 Perform setting for specified format (ie. don't perform
                 format autodetection).  Possible format names are: vfsold
                 Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota
                 format with 32-bit UIDs / GIDs, 64-bit space usage, 32-bit
                 inode usage and limits, vfsv1 Quota format with 64-bit
                 quota limits and usage, rpc (quota over NFS), xfs (quota
                 on XFS filesystem)

          -u, --user
                 Set user quotas for named user. This is the default.

          -g, --group
                 Set group quotas for named group.

          -P, --project
                 Set project quotas for named project.

          -p, --prototype=protoname
                 Use quota settings of user, group or project protoname to
                 set the quota for the named user, group or project.

          --always-resolve
                 Always try to translate user / group / project name to uid
                 / gid / project ID even if the name is composed of digits
                 only.

          -b, --batch
                 Read information to set from stdin (input format is name
                 block-softlimit block-hardlimit inode-softlimit inode-
                 hardlimit ). Empty lines and lines starting with # are
                 ignored.

          -c, --continue-batch
                 If parsing of an input line in batch mode fails, continue
                 with processing the next line.

          -t, --edit-period
                 Set grace times for users/groups/projects. Times block-
                 grace and inode-grace are specified in seconds.

          -T, --edit-times
                 Alter times for individual user/group/project when
                 softlimit is enforced. Times block-grace and inode-grace
                 are specified in seconds or can be string 'unset'.

          -a, --all
                 Go through all filesystems with quota in /etc/mtab and
                 perform setting.

          block-softlimit and block-hardlimit are interpreted as multiples
          of kibibyte (1024 bytes) blocks by default.  Symbols K, M, G, and
          T can be appended to numeric value to express kibibytes,
          mebibytes, gibibytes, and tebibytes.

          inode-softlimit and inode-hardlimit are interpreted literally.
          Symbols k, m, g, and t can be appended to numeric value to
          express multiples of 10^3, 10^6, 10^9, and 10^12 inodes.

          To disable a quota, set the corresponding parameter to 0. To
          change quotas for several filesystems, invoke once for each
          filesystem.

          Only the super-user may edit quotas.


---------------------------------------------------

::

          aquota.user or aquota.group
                 quota file at the filesystem root (version 2 quota, non-
                 XFS filesystems)
          quota.user or quota.group
                 quota file at the filesystem root (version 1 quota, non-
                 XFS filesystems)
          /etc/mtab
                 mounted filesystem table


---------------------------------------------------------

::

          edquota(8), quota(1), quotactl(2), quotacheck(8), quotaon(8),
          repquota(8)

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

                                                                SETQUOTA(8)

--------------

Pages that refer to this page: `quota(1) <../man1/quota.1.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__, 
`convertquota(8) <../man8/convertquota.8.html>`__, 
`edquota(8) <../man8/edquota.8.html>`__, 
`quotacheck(8) <../man8/quotacheck.8.html>`__, 
`repquota(8) <../man8/repquota.8.html>`__

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
