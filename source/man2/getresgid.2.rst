.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getresuid(2) — Linux manual page
================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GETRESUID(2)            Linux Programmer's Manual           GETRESUID(2)

NAME
-------------------------------------------------

::

          getresuid, getresgid - get real, effective, and saved user/group
          IDs


---------------------------------------------------------

::

          #define _GNU_SOURCE         /* See feature_test_macros(7) */
          #include <unistd.h>

          int getresuid(uid_t *ruid, uid_t *euid, uid_t *suid);
          int getresgid(gid_t *rgid, gid_t *egid, gid_t *sgid);


---------------------------------------------------------------

::

          getresuid() returns the real UID, the effective UID, and the
          saved set-user-ID of the calling process, in the arguments ruid,
          euid, and suid, respectively.  getresgid() performs the analogous
          task for the process's group IDs.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT One of the arguments specified an address outside the
                 calling program's address space.


---------------------------------------------------------

::

          These system calls appeared on Linux starting with kernel 2.1.44.

          The prototypes are given by glibc since version 2.3.2, provided
          _GNU_SOURCE is defined.


-------------------------------------------------------------------

::

          These calls are nonstandard; they also appear on HP-UX and some
          of the BSDs.


---------------------------------------------------

::

          The original Linux getresuid() and getresgid() system calls
          supported only 16-bit user and group IDs.  Subsequently, Linux
          2.4 added getresuid32() and getresgid32(), supporting 32-bit IDs.
          The glibc getresuid() and getresgid() wrapper functions
          transparently deal with the variations across kernel versions.


---------------------------------------------------------

::

          getuid(2), setresuid(2), setreuid(2), setuid(2), credentials(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                   GETRESUID(2)

--------------

Pages that refer to this page: `getgid(2) <../man2/getgid.2.html>`__, 
`getuid(2) <../man2/getuid.2.html>`__, 
`setresuid(2) <../man2/setresuid.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getresuid.2.license.html>`__

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
