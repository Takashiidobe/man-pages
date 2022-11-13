.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

group(5) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `FILES <#FILES>`__ \|             |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GROUP(5)                Linux Programmer's Manual               GROUP(5)

NAME
-------------------------------------------------

::

          group - user group file


---------------------------------------------------------------

::

          The /etc/group file is a text file that defines the groups on the
          system.  There is one entry per line, with the following format:

              group_name:password:GID:user_list

          The fields are as follows:

          group_name
                 the name of the group.

          password
                 the (encrypted) group password.  If this field is empty,
                 no password is needed.

          GID    the numeric group ID.

          user_list
                 a list of the usernames that are members of this group,
                 separated by commas.


---------------------------------------------------

::

          /etc/group


-------------------------------------------------

::

          As the 4.2BSD initgroups(3) man page says: no one seems to keep
          /etc/group up-to-date.


---------------------------------------------------------

::

          chgrp(1), gpasswd(1), groups(1), login(1), newgrp(1), sg(1),
          getgrent(3), getgrnam(3), gshadow(5), passwd(5), vigr(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-04-11                       GROUP(5)

--------------

Pages that refer to this page: `gpasswd(1) <../man1/gpasswd.1.html>`__, 
`lslogins(1) <../man1/lslogins.1.html>`__, 
`newgrp(1) <../man1/newgrp.1.html>`__,  `sg(1) <../man1/sg.1.html>`__, 
`fgetgrent(3) <../man3/fgetgrent.3.html>`__, 
`getgrent(3) <../man3/getgrent.3.html>`__, 
`getgrent_r(3) <../man3/getgrent_r.3.html>`__, 
`getgrnam(3) <../man3/getgrnam.3.html>`__, 
`getgrouplist(3) <../man3/getgrouplist.3.html>`__, 
`group_member(3) <../man3/group_member.3.html>`__, 
`putgrent(3) <../man3/putgrent.3.html>`__, 
`gshadow(5) <../man5/gshadow.5.html>`__, 
`passwd(5) <../man5/passwd.5.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`grpck(8) <../man8/grpck.8.html>`__, 
`nscd(8) <../man8/nscd.8.html>`__,  `pwck(8) <../man8/pwck.8.html>`__, 
`vipw(8) <../man8/vipw.8.html>`__

--------------

`Copyright and license for this manual
page <../man5/group.5.license.html>`__

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
