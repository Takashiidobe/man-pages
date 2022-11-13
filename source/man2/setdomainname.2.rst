.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

getdomainname(2) — Linux manual page
====================================

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

   GETDOMAINNAME(2)        Linux Programmer's Manual       GETDOMAINNAME(2)

NAME
-------------------------------------------------

::

          getdomainname, setdomainname - get/set NIS domain name


---------------------------------------------------------

::

          #include <unistd.h>

          int getdomainname(char *name, size_t len);
          int setdomainname(const char *name, size_t len);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          getdomainname(), setdomainname():
              Since glibc 2.21:
                  _DEFAULT_SOURCE
              In glibc 2.19 and 2.20:
                  _DEFAULT_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)
              Up to and including glibc 2.19:
                  _BSD_SOURCE || (_XOPEN_SOURCE && _XOPEN_SOURCE < 500)


---------------------------------------------------------------

::

          These functions are used to access or to change the NIS domain
          name of the host system.  More precisely, they operate on the NIS
          domain name associated with the calling process's UTS namespace.

          setdomainname() sets the domain name to the value given in the
          character array name.  The len argument specifies the number of
          bytes in name.  (Thus, name does not require a terminating null
          byte.)

          getdomainname() returns the null-terminated domain name in the
          character array name, which has a length of len bytes.  If the
          null-terminated domain name requires more than len bytes,
          getdomainname() returns the first len bytes (glibc) or gives an
          error (libc).


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          setdomainname() can fail with the following errors:

          EFAULT name pointed outside of user address space.

          EINVAL len was negative or too large.

          EPERM  The caller did not have the CAP_SYS_ADMIN capability in
                 the user namespace associated with its UTS namespace (see
                 namespaces(7)).

          getdomainname() can fail with the following errors:

          EINVAL For getdomainname() under libc: name is NULL or name is
                 longer than len bytes.


-------------------------------------------------------------------

::

          POSIX does not specify these calls.


---------------------------------------------------

::

          Since Linux 1.0, the limit on the length of a domain name,
          including the terminating null byte, is 64 bytes.  In older
          kernels, it was 8 bytes.

          On most Linux architectures (including x86), there is no
          getdomainname() system call; instead, glibc implements
          getdomainname() as a library function that returns a copy of the
          domainname field returned from a call to uname(2).


---------------------------------------------------------

::

          gethostname(2), sethostname(2), uname(2), uts_namespaces(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22               GETDOMAINNAME(2)

--------------

Pages that refer to this page:
`hostname(1) <../man1/hostname.1.html>`__, 
`gethostname(2) <../man2/gethostname.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`uname(2) <../man2/uname.2.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`uts_namespaces(7) <../man7/uts_namespaces.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/getdomainname.2.license.html>`__

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
