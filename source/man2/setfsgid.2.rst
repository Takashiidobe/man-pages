.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

setfsgid(2) — Linux manual page
===============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `VERSIONS <#VERSIONS>`__ \|    |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   SETFSGID(2)             Linux Programmer's Manual            SETFSGID(2)

NAME
-------------------------------------------------

::

          setfsgid - set group identity used for filesystem checks


---------------------------------------------------------

::

          #include <sys/fsuid.h>

          int setfsgid(gid_t fsgid);


---------------------------------------------------------------

::

          On Linux, a process has both a filesystem group ID and an
          effective group ID.  The (Linux-specific) filesystem group ID is
          used for permissions checking when accessing filesystem objects,
          while the effective group ID is used for some other kinds of
          permissions checks (see credentials(7)).

          Normally, the value of the process's filesystem group ID is the
          same as the value of its effective group ID.  This is so, because
          whenever a process's effective group ID is changed, the kernel
          also changes the filesystem group ID to be the same as the new
          value of the effective group ID.  A process can cause the value
          of its filesystem group ID to diverge from its effective group ID
          by using setfsgid() to change its filesystem group ID to the
          value given in fsgid.

          setfsgid() will succeed only if the caller is the superuser or if
          fsgid matches either the caller's real group ID, effective group
          ID, saved set-group-ID, or current the filesystem user ID.


-----------------------------------------------------------------

::

          On both success and failure, this call returns the previous
          filesystem group ID of the caller.


---------------------------------------------------------

::

          This system call is present in Linux since version 1.2.


-------------------------------------------------------------------

::

          setfsgid() is Linux-specific and should not be used in programs
          intended to be portable.


---------------------------------------------------

::

          The filesystem group ID concept and the setfsgid() system call
          were invented for historical reasons that are no longer
          applicable on modern Linux kernels.  See setfsuid(2) for a
          discussion of why the use of both setfsuid(2) and setfsgid() is
          nowadays unneeded.

          The original Linux setfsgid() system call supported only 16-bit
          group IDs.  Subsequently, Linux 2.4 added setfsgid32() supporting
          32-bit IDs.  The glibc setfsgid() wrapper function transparently
          deals with the variation across kernel versions.

      C library/kernel differences
          In glibc 2.15 and earlier, when the wrapper for this system call
          determines that the argument can't be passed to the kernel
          without integer truncation (because the kernel is old and does
          not support 32-bit group IDs), it will return -1 and set errno to
          EINVAL without attempting the system call.


-------------------------------------------------

::

          No error indications of any kind are returned to the caller, and
          the fact that both successful and unsuccessful calls return the
          same value makes it impossible to directly determine whether the
          call succeeded or failed.  Instead, the caller must resort to
          looking at the return value from a further call such as
          setfsgid(-1) (which will always fail), in order to determine if a
          preceding call to setfsgid() changed the filesystem group ID.  At
          the very least, EPERM should be returned when the call fails
          (because the caller lacks the CAP_SETGID capability).


---------------------------------------------------------

::

          kill(2), setfsuid(2), capabilities(7), credentials(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                    SETFSGID(2)

--------------

Pages that refer to this page:
`setfsuid(2) <../man2/setfsuid.2.html>`__, 
`setresuid(2) <../man2/setresuid.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`credentials(7) <../man7/credentials.7.html>`__, 
`path_resolution(7) <../man7/path_resolution.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/setfsgid.2.license.html>`__

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
