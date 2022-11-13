.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

seteuid(2) — Linux manual page
==============================

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

   SETEUID(2)              Linux Programmer's Manual             SETEUID(2)

NAME
-------------------------------------------------

::

          seteuid, setegid - set effective user or group ID


---------------------------------------------------------

::

          #include <unistd.h>

          int seteuid(uid_t euid);
          int setegid(gid_t egid);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          seteuid(), setegid():
              _POSIX_C_SOURCE >= 200112L
                  || /* Glibc <= 2.19: */ _BSD_SOURCE


---------------------------------------------------------------

::

          seteuid() sets the effective user ID of the calling process.
          Unprivileged processes may only set the effective user ID to the
          real user ID, the effective user ID or the saved set-user-ID.

          Precisely the same holds for setegid() with "group" instead of
          "user".


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.

          Note: there are cases where seteuid() can fail even when the
          caller is UID 0; it is a grave security error to omit checking
          for a failure return from seteuid().


-----------------------------------------------------

::

          EINVAL The target user or group ID is not valid in this user
                 namespace.

          EPERM  In the case of seteuid(): the calling process is not
                 privileged (does not have the CAP_SETUID capability in its
                 user namespace) and euid does not match the current real
                 user ID, current effective user ID, or current saved set-
                 user-ID.

                 In the case of setegid(): the calling process is not
                 privileged (does not have the CAP_SETGID capability in its
                 user namespace) and egid does not match the current real
                 group ID, current effective group ID, or current saved
                 set-group-ID.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, 4.3BSD.


---------------------------------------------------

::

          Setting the effective user (group) ID to the saved set-user-ID
          (saved set-group-ID) is possible since Linux 1.1.37 (1.1.38).  On
          an arbitrary system one should check _POSIX_SAVED_IDS.

          Under glibc 2.0, seteuid(euid) is equivalent to setreuid(-1,
          euid) and hence may change the saved set-user-ID.  Under glibc
          2.1 and later, it is equivalent to setresuid(-1, euid, -1) and
          hence does not change the saved set-user-ID.  Analogous remarks
          hold for setegid(), with the difference that the change in
          implementation from setregid(-1, egid) to setresgid(-1, egid, -1)
          occurred in glibc 2.2 or 2.3 (depending on the hardware
          architecture).

          According to POSIX.1, seteuid() (setegid()) need not permit euid
          (egid) to be the same value as the current effective user (group)
          ID, and some implementations do not permit this.

      C library/kernel differences
          On Linux, seteuid() and setegid() are implemented as library
          functions that call, respectively, setreuid(2) and setregid(2).


---------------------------------------------------------

::

          geteuid(2), setresuid(2), setreuid(2), setuid(2),
          capabilities(7), credentials(7), user_namespaces(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     SETEUID(2)

--------------

Pages that refer to this page:
`pmdaproc(1) <../man1/pmdaproc.1.html>`__, 
`setgid(2) <../man2/setgid.2.html>`__, 
`setreuid(2) <../man2/setreuid.2.html>`__, 
`setuid(2) <../man2/setuid.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`nptl(7) <../man7/nptl.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/seteuid.2.license.html>`__

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
