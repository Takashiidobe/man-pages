.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

repquota(8) — Linux manual page
===============================

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

   REPQUOTA(8)              System Manager's Manual             REPQUOTA(8)

NAME
-------------------------------------------------

::

          repquota - summarize quotas for a filesystem


---------------------------------------------------------

::

          /usr/sbin/repquota [ -vspiugP ] [ -c | -C ] [ -t | -n ] [ -F
          format-name ] filesystem...

          /usr/sbin/repquota [ -avtpsiugP ] [ -c | -C ] [ -t | -n ] [ -F
          format-name ]


---------------------------------------------------------------

::

          repquota prints a summary of the disc usage and quotas for the
          specified file systems.  For each user the current number of
          files and amount of space (in kilobytes) is printed, along with
          any quota limits set with edquota(8) or setquota(8).  In the
          second column repquota prints two characters marking which limits
          are exceeded. If user is over his space softlimit or reaches his
          space hardlimit in case softlimit is unset, the first character
          is '+'. Otherwise the character printed is '-'. The second
          character denotes the state of inode usage analogously.

          repquota has to translate ids of all users/groups/projects to
          names (unless option -n was specified) so it may take a while to
          print all the information. To make translating as fast as
          possible repquota tries to detect (by reading /etc/nsswitch.conf)
          whether entries are stored in standard plain text file or in a
          database and either translates chunks of 1024 names or each name
          individually. You can override this autodetection by -c or -C
          options.


-------------------------------------------------------

::

          -a, --all
                 Report on all filesystems indicated in /etc/mtab to be
                 read-write with quotas.

          -v, --verbose
                 Report all quotas, even if there is no usage. Be also more
                 verbose about quotafile information.

          -c, --cache
                 Cache entries to report and translate uids/gids to names
                 in big chunks by scanning all users (default). This is
                 good (fast) behaviour when using /etc/passwd file.

          -C, --no-cache
                 Translate individual entries. This is faster when you have
                 users stored in database.

          -t, --truncate-names
                 Truncate user/group names longer than 9 characters. This
                 results in nicer output when there are such names.

          -n, --no-names
                 Don't resolve UIDs/GIDs to names. This can speedup
                 printing a lot.

          -s, --human-readable[=units]
                 Try to report used space, number of used inodes and limits
                 in more appropriate units than the default ones. Units can
                 be also specified explicitely by an optional argument in
                 format [ kgt ],[ kgt ] where the first character specifies
                 space units and the second character specifies inode
                 units.

          -p, --raw-grace
                 When user is in grace period, report time in seconds since
                 epoch when his grace time runs out (or has run out). Field
                 is '0' when no grace time is in effect.  This is
                 especially useful when parsing output by a script.

          -i, --no-autofs
                 Ignore mountpoints mounted by automounter.

          -F, --format=format-name
                 Report quota for specified format (ie. don't perform
                 format autodetection).  Possible format names are: vfsold
                 Original quota format with 16-bit UIDs / GIDs, vfsv0 Quota
                 format with 32-bit UIDs / GIDs, 64-bit space usage, 32-bit
                 inode usage and limits, vfsv1 Quota format with 64-bit
                 quota limits and usage, xfs (quota on XFS filesystem)

          -g, --group
                 Report quotas for groups.

          -P, --project
                 Report quotas for projects.

          -u, --user
                 Report quotas for users. This is the default.

          -O, --output=format-name
                 Output quota report in the specified format.  Possible
                 format names are: default The default format, optimized
                 for console viewing csv Comma-separated values, a text
                 file with the columns delimited by commas xml Output is
                 XML encoded, useful for processing with XSLT

          Only the super-user may view quotas which are not their own.


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
          /etc/passwd
                 default set of users
          /etc/group
                 default set of groups


---------------------------------------------------------

::

          quota(1), quotactl(2), edquota(8), quotacheck(8), quotaon(8),
          quota_nld(8), setquota(8), warnquota(8)

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

   4th Berkeley Distribution                                    REPQUOTA(8)

--------------

Pages that refer to this page: `quota(1) <../man1/quota.1.html>`__, 
`quotasync(1) <../man1/quotasync.1.html>`__, 
`convertquota(8) <../man8/convertquota.8.html>`__, 
`edquota(8) <../man8/edquota.8.html>`__, 
`quotacheck(8) <../man8/quotacheck.8.html>`__, 
`quotaon(8) <../man8/quotaon.8.html>`__, 
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
