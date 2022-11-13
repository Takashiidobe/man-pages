.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setgid(2) — Linux manual page
=============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETGID(2)               Linux Programmer's Manual              SETGID(2)

NAME
-------------------------------------------------

::

          setgid - set group identity


---------------------------------------------------------

::

          #include <unistd.h>

          int setgid(gid_t gid);


---------------------------------------------------------------

::

          setgid() sets the effective group ID of the calling process.  If
          the calling process is privileged (more precisely: has the
          CAP_SETGID capability in its user namespace), the real GID and
          saved set-group-ID are also set.

          Under Linux, setgid() is implemented like the POSIX version with
          the _POSIX_SAVED_IDS feature.  This allows a set-group-ID program
          that is not set-user-ID-root to drop all of its group privileges,
          do some un-privileged work, and then reengage the original
          effective group ID in a secure manner.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL The group ID specified in gid is not valid in this user
                 namespace.

          EPERM  The calling process is not privileged (does not have the
                 CAP_SETGID capability in its user namespace), and gid does
                 not match the real group ID or saved set-group-ID of the
                 calling process.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4.


---------------------------------------------------

::

          The original Linux setgid() system call supported only 16-bit
          group IDs.  Subsequently, Linux 2.4 added setgid32() supporting
          32-bit IDs.  The glibc setgid() wrapper function transparently
          deals with the variation across kernel versions.

      C library/kernel differences
          At the kernel level, user IDs and group IDs are a per-thread
          attribute.  However, POSIX requires that all threads in a process
          share the same credentials.  The NPTL threading implementation
          handles the POSIX requirements by providing wrapper functions for
          the various system calls that change process UIDs and GIDs.
          These wrapper functions (including the one for setgid()) employ a
          signal-based technique to ensure that when one thread changes
          credentials, all of the other threads in the process also change
          their credentials.  For details, see nptl(7).


---------------------------------------------------------

::

          getgid(2), setegid(2), setregid(2), capabilities(7),
          credentials(7), user_namespaces(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      SETGID(2)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`pmdammv(1) <../man1/pmdammv.1.html>`__, 
`access(2) <../man2/access.2.html>`__, 
`getgid(2) <../man2/getgid.2.html>`__, 
`getgroups(2) <../man2/getgroups.2.html>`__, 
`setreuid(2) <../man2/setreuid.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`euidaccess(3) <../man3/euidaccess.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/setgid.2.license.html>`__

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
