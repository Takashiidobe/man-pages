.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getuid(2) — Linux manual page
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

   GETUID(2)               Linux Programmer's Manual              GETUID(2)

NAME
-------------------------------------------------

::

          getuid, geteuid - get user identity


---------------------------------------------------------

::

          #include <unistd.h>

          uid_t getuid(void);
          uid_t geteuid(void);


---------------------------------------------------------------

::

          getuid() returns the real user ID of the calling process.

          geteuid() returns the effective user ID of the calling process.


-----------------------------------------------------

::

          These functions are always successful and never modify errno.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD.


---------------------------------------------------

::

      History
          In UNIX V6 the getuid() call returned (euid << 8) + uid.  UNIX V7
          introduced separate calls getuid() and geteuid().

          The original Linux getuid() and geteuid() system calls supported
          only 16-bit user IDs.  Subsequently, Linux 2.4 added getuid32()
          and geteuid32(), supporting 32-bit IDs.  The glibc getuid() and
          geteuid() wrapper functions transparently deal with the
          variations across kernel versions.

          On Alpha, instead of a pair of getuid() and geteuid() system
          calls, a single getxuid() system call is provided, which returns
          a pair of real and effective UIDs.  The glibc getuid() and
          geteuid() wrapper functions transparently deal with this.  See
          syscall(2) for details regarding register mapping.


---------------------------------------------------------

::

          getresuid(2), setreuid(2), setuid(2), credentials(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      GETUID(2)

--------------

Pages that refer to this page: `gawk(1) <../man1/gawk.1.html>`__, 
`groups(1@@shadow-utils) <../man1/groups.1@@shadow-utils.html>`__, 
`homectl(1) <../man1/homectl.1.html>`__, 
`journalctl(1) <../man1/journalctl.1.html>`__, 
`localectl(1) <../man1/localectl.1.html>`__, 
`loginctl(1) <../man1/loginctl.1.html>`__, 
`machinectl(1) <../man1/machinectl.1.html>`__, 
`portablectl(1) <../man1/portablectl.1.html>`__, 
`procps(1) <../man1/procps.1.html>`__,  `ps(1) <../man1/ps.1.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`systemctl(1) <../man1/systemctl.1.html>`__, 
`systemd(1) <../man1/systemd.1.html>`__, 
`systemd-analyze(1) <../man1/systemd-analyze.1.html>`__, 
`systemd-inhibit(1) <../man1/systemd-inhibit.1.html>`__, 
`systemd-nspawn(1) <../man1/systemd-nspawn.1.html>`__, 
`timedatectl(1) <../man1/timedatectl.1.html>`__, 
`userdbctl(1) <../man1/userdbctl.1.html>`__, 
`getresuid(2) <../man2/getresuid.2.html>`__, 
`seteuid(2) <../man2/seteuid.2.html>`__, 
`setpgid(2) <../man2/setpgid.2.html>`__, 
`setresuid(2) <../man2/setresuid.2.html>`__, 
`setreuid(2) <../man2/setreuid.2.html>`__, 
`setuid(2) <../man2/setuid.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`getlogin(3) <../man3/getlogin.3.html>`__, 
`pam_close_session(3) <../man3/pam_close_session.3.html>`__, 
`pam_open_session(3) <../man3/pam_open_session.3.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__, 
`systemd-tmpfiles(8) <../man8/systemd-tmpfiles.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/getuid.2.license.html>`__

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
