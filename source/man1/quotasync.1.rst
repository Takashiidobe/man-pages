.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

quotasync(1) — Linux manual page
================================

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

   QUOTASYNC(1)             General Commands Manual            QUOTASYNC(1)

NAME
-------------------------------------------------

::

          quotasync - synchronize in-kernel file system usage and limits to
          disk format


---------------------------------------------------------

::

          quotasync [ -ugP ] mount-point...
          quotasync [ -ugP ] -a
          quotasync -h | -V


---------------------------------------------------------------

::

          quotasync flushes file system usage and limits from kernel memory
          to quota files stored in the file system. By default only the
          user quotas are synchronized.

          This tool can be useful if you want to display accurate quotas by
          tools that parse quota files, like repquota(8).


-------------------------------------------------------

::

          -u, --user
                 Synchronize user usage and limits.

          -g, --group
                 Synchronize group usage and limits.

          -P, --project
                 Synchronize project usage and limits.

          -a, --all
                 Synchronize usage and limits on all file systems. You have
                 to specify this option or to specify desired file systems.

          -V, --version
                 Show program version information and exit.

          -h, --help
                 Show program usage and exit.


---------------------------------------------------------------

::

          If requested synchronization fails, or invalid option is given,
          quotasync will terminate with non-zero exit code. Otherwise it
          will return zero.


---------------------------------------------------

::

          aquota.user  or  aquota.group
                 Quota file at the file system root (version 2 quota, non-
                 XFS/GFS2 file systems).
          quota.user  or  quota.group
                 Quota file at the file system root (version 1 quota, non-
                 XFS/GFS2 file systems).
          /etc/mtab
                 List of mounted file systems maintained by user space.
          /proc/mounts
                 List of mounted file systems maintained by kernel.


---------------------------------------------------------

::

          quota(1), quotactl(2), mount(8), quotacheck(8), quotaon(8),
          repquota(8), warnquota(8).

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

                                                               QUOTASYNC(1)

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
