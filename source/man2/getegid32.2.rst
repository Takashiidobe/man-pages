.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getgid(2) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `ERRORS <#ERRORS>`__ \|           |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETGID(2)               Linux Programmer's Manual              GETGID(2)

NAME
-------------------------------------------------

::

          getgid, getegid - get group identity


---------------------------------------------------------

::

          #include <unistd.h>

          gid_t getgid(void);
          gid_t getegid(void);


---------------------------------------------------------------

::

          getgid() returns the real group ID of the calling process.

          getegid() returns the effective group ID of the calling process.


-----------------------------------------------------

::

          These functions are always successful and never modify errno.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD.


---------------------------------------------------

::

          The original Linux getgid() and getegid() system calls supported
          only 16-bit group IDs.  Subsequently, Linux 2.4 added getgid32()
          and getegid32(), supporting 32-bit IDs.  The glibc getgid() and
          getegid() wrapper functions transparently deal with the
          variations across kernel versions.

          On Alpha, instead of a pair of getgid() and getegid() system
          calls, a single getxgid() system call is provided, which returns
          a pair of real and effective GIDs.  The glibc getgid() and
          getegid() wrapper functions transparently deal with this.  See
          syscall(2) for details regarding register mapping.


---------------------------------------------------------

::

          getresgid(2), setgid(2), setregid(2), credentials(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      GETGID(2)

--------------

Pages that refer to this page: `gawk(1) <../man1/gawk.1.html>`__, 
`groups(1@@shadow-utils) <../man1/groups.1@@shadow-utils.html>`__, 
`procps(1) <../man1/procps.1.html>`__,  `ps(1) <../man1/ps.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`getgroups(2) <../man2/getgroups.2.html>`__, 
`setgid(2) <../man2/setgid.2.html>`__, 
`setreuid(2) <../man2/setreuid.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`group_member(3) <../man3/group_member.3.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getgid.2.license.html>`__

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
