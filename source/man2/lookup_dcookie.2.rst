.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lookup_dcookie(2) — Linux manual page
=====================================

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

   LOOKUP_DCOOKIE(2)       Linux Programmer's Manual      LOOKUP_DCOOKIE(2)

NAME
-------------------------------------------------

::

          lookup_dcookie - return a directory entry's path


---------------------------------------------------------

::

          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_lookup_dcookie, uint64_t cookie, char *buffer,
                      size_t len);

          Note: glibc provides no wrapper for lookup_dcookie(),
          necessitating the use of syscall(2).


---------------------------------------------------------------

::

          Look up the full path of the directory entry specified by the
          value cookie.  The cookie is an opaque identifier uniquely
          identifying a particular directory entry.  The buffer given is
          filled in with the full path of the directory entry.

          For lookup_dcookie() to return successfully, the kernel must
          still hold a cookie reference to the directory entry.


-----------------------------------------------------------------

::

          On success, lookup_dcookie() returns the length of the path
          string copied into the buffer.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EFAULT The buffer was not valid.

          EINVAL The kernel has no registered cookie/directory entry
                 mappings at the time of lookup, or the cookie does not
                 refer to a valid directory entry.

          ENAMETOOLONG
                 The name could not fit in the buffer.

          ENOMEM The kernel could not allocate memory for the temporary
                 buffer holding the path.

          EPERM  The process does not have the capability CAP_SYS_ADMIN
                 required to look up cookie values.

          ERANGE The buffer was not large enough to hold the path of the
                 directory entry.


---------------------------------------------------------

::

          Available since Linux 2.5.43.  The ENAMETOOLONG error return was
          added in 2.5.70.


-------------------------------------------------------------------

::

          lookup_dcookie() is Linux-specific.


---------------------------------------------------

::

          lookup_dcookie() is a special-purpose system call, currently used
          only by the oprofile(1) profiler.  It relies on a kernel driver
          to register cookies for directory entries.

          The path returned may be suffixed by the string " (deleted)" if
          the directory entry has been removed.


---------------------------------------------------------

::

          oprofile(1)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22              LOOKUP_DCOOKIE(2)

--------------

Pages that refer to this page:
`syscalls(2) <../man2/syscalls.2.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/lookup_dcookie.2.license.html>`__

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
