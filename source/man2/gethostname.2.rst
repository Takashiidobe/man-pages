.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

gethostname(2) — Linux manual page
==================================

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

   GETHOSTNAME(2)          Linux Programmer's Manual         GETHOSTNAME(2)

NAME
-------------------------------------------------

::

          gethostname, sethostname - get/set hostname


---------------------------------------------------------

::

          #include <unistd.h>

          int gethostname(char *name, size_t len);
          int sethostname(const char *name, size_t len);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          gethostname():
              _XOPEN_SOURCE >= 500 || _POSIX_C_SOURCE >= 200112L
                  || /* Glibc 2.19 and earlier */ _BSD_SOURCE

          sethostname():
              Since glibc 2.21:
                  _DEFAULT_SOURCE
              In glibc 2.19 and 2.20:
                  _DEFAULT_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)
              Up to and including glibc 2.19:
                  _BSD_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)


---------------------------------------------------------------

::

          These system calls are used to access or to change the system
          hostname.  More precisely, they operate on the hostname
          associated with the calling process's UTS namespace.

          sethostname() sets the hostname to the value given in the
          character array name.  The len argument specifies the number of
          bytes in name.  (Thus, name does not require a terminating null
          byte.)

          gethostname() returns the null-terminated hostname in the
          character array name, which has a length of len bytes.  If the
          null-terminated hostname is too large to fit, then the name is
          truncated, and no error is returned (but see NOTES below).
          POSIX.1 says that if such truncation occurs, then it is
          unspecified whether the returned buffer includes a terminating
          null byte.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT name is an invalid address.

          EINVAL len is negative or, for sethostname(), len is larger than
                 the maximum allowed size.

          ENAMETOOLONG
                 (glibc gethostname()) len is smaller than the actual size.
                 (Before version 2.1, glibc uses EINVAL for this case.)

          EPERM  For sethostname(), the caller did not have the
                 CAP_SYS_ADMIN capability in the user namespace associated
                 with its UTS namespace (see namespaces(7)).


-------------------------------------------------------------------

::

          SVr4, 4.4BSD  (these interfaces first appeared in 4.2BSD).
          POSIX.1-2001 and POSIX.1-2008 specify gethostname() but not
          sethostname().


---------------------------------------------------

::

          SUSv2 guarantees that "Host names are limited to 255 bytes".
          POSIX.1 guarantees that "Host names (not including the
          terminating null byte) are limited to HOST_NAME_MAX bytes".  On
          Linux, HOST_NAME_MAX is defined with the value 64, which has been
          the limit since Linux 1.0 (earlier kernels imposed a limit of 8
          bytes).

      C library/kernel differences
          The GNU C library does not employ the gethostname() system call;
          instead, it implements gethostname() as a library function that
          calls uname(2) and copies up to len bytes from the returned
          nodename field into name.  Having performed the copy, the
          function then checks if the length of the nodename was greater
          than or equal to len, and if it is, then the function returns -1
          with errno set to ENAMETOOLONG; in this case, a terminating null
          byte is not included in the returned name.

          Versions of glibc before 2.2 handle the case where the length of
          the nodename was greater than or equal to len differently:
          nothing is copied into name and the function returns -1 with
          errno set to ENAMETOOLONG.


---------------------------------------------------------

::

          hostname(1), getdomainname(2), setdomainname(2), uname(2),
          uts_namespaces(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                 GETHOSTNAME(2)

--------------

Pages that refer to this page: `crontab(1) <../man1/crontab.1.html>`__, 
`hostname(1) <../man1/hostname.1.html>`__, 
`logger(1) <../man1/logger.1.html>`__, 
`pmhostname(1) <../man1/pmhostname.1.html>`__, 
`getdomainname(2) <../man2/getdomainname.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`uname(2) <../man2/uname.2.html>`__, 
`gethostid(3) <../man3/gethostid.3.html>`__, 
`rcmd(3) <../man3/rcmd.3.html>`__, 
`sysconf(3) <../man3/sysconf.3.html>`__, 
`hostname(5) <../man5/hostname.5.html>`__, 
`resolv.conf(5) <../man5/resolv.conf.5.html>`__, 
`systemd.unit(5) <../man5/systemd.unit.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__, 
`uts_namespaces(7) <../man7/uts_namespaces.7.html>`__, 
`cron(8) <../man8/cron.8.html>`__,  `lsof(8) <../man8/lsof.8.html>`__, 
`nss-myhostname(8) <../man8/nss-myhostname.8.html>`__, 
`systemd-hostnamed.service(8) <../man8/systemd-hostnamed.service.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/gethostname.2.license.html>`__

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
