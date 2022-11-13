.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

quotacheck(8) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `OPTIONS <#OPTIONS>`__ \|         |                                   |
| `NOTE <#NOTE>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `AUTHOR <#AUTHOR>`__ \|           |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   quotacheck(8)            System Manager's Manual           quotacheck(8)

NAME
-------------------------------------------------

::

          quotacheck - scan a filesystem for disk usage, create, check and
          repair quota files


---------------------------------------------------------

::

          quotacheck [ -gubcfinvdMmR ] [ -F quota-format ] -a | filesystem


---------------------------------------------------------------

::

          quotacheck examines each filesystem, builds a table of current
          disk usage, and compares this table against that recorded in the
          disk quota file for the filesystem (this step is omitted if
          option -c is specified). If any inconsistencies are detected,
          both the quota file and the current system copy of the incorrect
          quotas are updated (the latter only occurs if an active
          filesystem is checked which is not advised).  By default, only
          user quotas are checked.  quotacheck expects each filesystem to
          be checked to have quota files named [a]quota.user and
          [a]quota.group located at the root of the associated filesystem.
          If a file is not present, quotacheck will create it.

          If the quota file is corrupted, quotacheck tries to save as much
          data as possible.  Rescuing data may need user intervention. With
          no additional options quotacheck will simply exit in such a
          situation. When in interactive mode (option -i) , the user is
          asked for advice. Advice can also be provided from command line
          (see option -n) , which is useful when quotacheck is run
          automatically (ie. from script) and failure is unacceptable.

          quotacheck should be run each time the system boots and mounts
          non-valid filesystems.  This is most likely to happen after a
          system crash.

          It is strongly recommended to run quotacheck with quotas turned
          off for the filesystem. Otherwise, possible damage or loss to
          data in the quota files can result.  It is also unwise to run
          quotacheck on a live filesystem as actual usage may change during
          the scan.  To prevent this, quotacheck tries to remount the
          filesystem read-only before starting the scan.  After the scan is
          done it remounts the filesystem read-write. You can disable this
          with option -m.  You can also make quotacheck ignore the failure
          to remount the filesystem read-only with option -M.


-------------------------------------------------------

::

          -b, --backup
                 Forces quotacheck to make backups of the quota file before
                 writing the new data.

          -v, --verbose
                 quotacheck reports its operation as it progresses.
                 Normally it operates silently.  If the option is specified
                 twice, also the current directory is printed (note that
                 printing can slow down the scan measurably).

          -d, --debug
                 Enable debugging mode.  It will result in a lot of
                 information which can be used in debugging the program.
                 The output is very verbose and the scan will be slow.

          -u, --user
                 Only user quotas listed in /etc/mtab or on the filesystems
                 specified are to be checked.  This is the default action.

          -g, --group
                 Only group quotas listed in /etc/mtab or on the
                 filesystems specified are to be checked.

          -c, --create-files
                 Don't read existing quota files. Just perform a new scan
                 and save it to disk.  quotacheck also skips scanning of
                 old quota files when they are not found.

          -f, --force
                 Forces checking and writing of new quota files on
                 filesystems with quotas enabled. This is not recommended
                 as the created quota files may be out of sync.

          -M, --try-remount
                 This flag forces checking of filesystem in read-write mode
                 if a remount fails. Do this only when you are sure no
                 process will write to a filesystem while scanning.

          -m, --no-remount
                 Don't try to remount filesystem read-only. See comment
                 with option -M.

          -i, --interactive
                 Interactive mode. By default quotacheck exits when it
                 finds an error. In interactive mode user is asked for
                 input instead.  See option -n.

          -n, --use-first-dquot
                 If the quota files become corrupted, it is possible for
                 duplicate entries for a single user or group ID to exist.
                 Normally in this case, quotacheck exits or asks user for
                 input. When this option is set, the first entry found is
                 always used (this option works in interactive mode too).

          -F, --format=format-name
                 Check and fix quota files of specified format (ie. don't
                 perform format auto-detection). This is recommended as
                 detection might not work well on corrupted quota files.
                 Possible format names are: vfsold Original quota format
                 with 16-bit UIDs / GIDs, vfsv0 Quota format with 32-bit
                 UIDs / GIDs, 64-bit space usage, 32-bit inode usage and
                 limits, vfsv1 Quota format with 64-bit quota limits and
                 usage, rpc (quota over NFS), xfs (quota on XFS filesystem)

          -a, --all
                 Check all mounted non-NFS filesystems in /etc/mtab

          -R, --exclude-root
                 When used together with the -a option, all filesystems
                 except for the root filesystem are checked for quotas.


-------------------------------------------------

::

          quotacheck should only be run by super-user. Non-privileged users
          are presumably not allowed to read all the directories on the
          given filesystem.


---------------------------------------------------------

::

          quota(1), quotactl(2), fstab(5), quotaon(8), repquota(8),
          convertquota(8), setquota(8), edquota(8), fsck(8), efsck(8),
          e2fsck(8), xfsck(8)


---------------------------------------------------

::

          aquota.user or aquota.group
                 located at filesystem root with quotas (version 2 quota,
                 non-XFS filesystems)
          quota.user or quota.group
                 located at filesystem root with quotas (version 1 quota,
                 non-XFS filesystems)
          /etc/mtab
                 names and locations of mounted filesystems


-----------------------------------------------------

::

          Jan Kara <jack@suse.cz>
          Based on old quotacheck by:
          Edvard Tuinder <ed@elm.net>
          Marco van Wieringen <mvw@planets.elm.net>

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

                                Fri Jul 20 2001               quotacheck(8)

--------------

Pages that refer to this page: `quota(1) <../man1/quota.1.html>`__, 
`quotasync(1) <../man1/quotasync.1.html>`__, 
`quotactl(2) <../man2/quotactl.2.html>`__, 
`convertquota(8) <../man8/convertquota.8.html>`__, 
`edquota(8) <../man8/edquota.8.html>`__, 
`repquota(8) <../man8/repquota.8.html>`__, 
`setquota(8) <../man8/setquota.8.html>`__, 
`systemd-quotacheck.service(8) <../man8/systemd-quotacheck.service.8.html>`__

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
