.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setuid(2) — Linux manual page
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

   SETUID(2)               Linux Programmer's Manual              SETUID(2)

NAME
-------------------------------------------------

::

          setuid - set user identity


---------------------------------------------------------

::

          #include <unistd.h>

          int setuid(uid_t uid);


---------------------------------------------------------------

::

          setuid() sets the effective user ID of the calling process.  If
          the calling process is privileged (more precisely: if the process
          has the CAP_SETUID capability in its user namespace), the real
          UID and saved set-user-ID are also set.

          Under Linux, setuid() is implemented like the POSIX version with
          the _POSIX_SAVED_IDS feature.  This allows a set-user-ID (other
          than root) program to drop all of its user privileges, do some
          un-privileged work, and then reengage the original effective user
          ID in a secure manner.

          If the user is root or the program is set-user-ID-root, special
          care must be taken: setuid() checks the effective user ID of the
          caller and if it is the superuser, all process-related user ID's
          are set to uid.  After this has occurred, it is impossible for
          the program to regain root privileges.

          Thus, a set-user-ID-root program wishing to temporarily drop root
          privileges, assume the identity of an unprivileged user, and then
          regain root privileges afterward cannot use setuid().  You can
          accomplish this with seteuid(2).


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.

          Note: there are cases where setuid() can fail even when the
          caller is UID 0; it is a grave security error to omit checking
          for a failure return from setuid().


-----------------------------------------------------

::

          EAGAIN The call would change the caller's real UID (i.e., uid
                 does not match the caller's real UID), but there was a
                 temporary failure allocating the necessary kernel data
                 structures.

          EAGAIN uid does not match the real user ID of the caller and this
                 call would bring the number of processes belonging to the
                 real user ID uid over the caller's RLIMIT_NPROC resource
                 limit.  Since Linux 3.1, this error case no longer occurs
                 (but robust applications should check for this error); see
                 the description of EAGAIN in execve(2).

          EINVAL The user ID specified in uid is not valid in this user
                 namespace.

          EPERM  The user is not privileged (Linux: does not have the
                 CAP_SETUID capability in its user namespace) and uid does
                 not match the real UID or saved set-user-ID of the calling
                 process.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4.  Not quite compatible with the
          4.4BSD call, which sets all of the real, saved, and effective
          user IDs.


---------------------------------------------------

::

          Linux has the concept of the filesystem user ID, normally equal
          to the effective user ID.  The setuid() call also sets the
          filesystem user ID of the calling process.  See setfsuid(2).

          If uid is different from the old effective UID, the process will
          be forbidden from leaving core dumps.

          The original Linux setuid() system call supported only 16-bit
          user IDs.  Subsequently, Linux 2.4 added setuid32() supporting
          32-bit IDs.  The glibc setuid() wrapper function transparently
          deals with the variation across kernel versions.

      C library/kernel differences
          At the kernel level, user IDs and group IDs are a per-thread
          attribute.  However, POSIX requires that all threads in a process
          share the same credentials.  The NPTL threading implementation
          handles the POSIX requirements by providing wrapper functions for
          the various system calls that change process UIDs and GIDs.
          These wrapper functions (including the one for setuid()) employ a
          signal-based technique to ensure that when one thread changes
          credentials, all of the other threads in the process also change
          their credentials.  For details, see nptl(7).


---------------------------------------------------------

::

          getuid(2), seteuid(2), setfsuid(2), setreuid(2), capabilities(7),
          credentials(7), user_namespaces(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      SETUID(2)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`access(2) <../man2/access.2.html>`__, 
`execve(2) <../man2/execve.2.html>`__, 
`getresuid(2) <../man2/getresuid.2.html>`__, 
`getuid(2) <../man2/getuid.2.html>`__, 
`seccomp(2) <../man2/seccomp.2.html>`__, 
`seteuid(2) <../man2/seteuid.2.html>`__, 
`setresuid(2) <../man2/setresuid.2.html>`__, 
`setreuid(2) <../man2/setreuid.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`vfork(2) <../man2/vfork.2.html>`__, 
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`euidaccess(3) <../man3/euidaccess.3.html>`__, 
`posix_spawn(3) <../man3/posix_spawn.3.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/setuid.2.license.html>`__

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
