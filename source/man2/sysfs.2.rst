.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sysfs(2) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   SYSFS(2)                Linux Programmer's Manual               SYSFS(2)

NAME
-------------------------------------------------

::

          sysfs - get filesystem type information


---------------------------------------------------------

::

          int sysfs(int option, const char *fsname);
          int sysfs(int option, unsigned int fs_index, char *buf);
          int sysfs(int option);


---------------------------------------------------------------

::

          Note: if you are looking for information about the sysfs
          filesystem that is normally mounted at /sys, see sysfs(5).

          The (obsolete) sysfs() system call returns information about the
          filesystem types currently present in the kernel.  The specific
          form of the sysfs() call and the information returned depends on
          the option in effect:

          1  Translate the filesystem identifier string fsname into a
             filesystem type index.

          2  Translate the filesystem type index fs_index into a null-
             terminated filesystem identifier string.  This string will be
             written to the buffer pointed to by buf.  Make sure that buf
             has enough space to accept the string.

          3  Return the total number of filesystem types currently present
             in the kernel.

          The numbering of the filesystem type indexes begins with zero.


-----------------------------------------------------------------

::

          On success, sysfs() returns the filesystem index for option 1,
          zero for option 2, and the number of currently configured
          filesystems for option 3.  On error, -1 is returned, and errno is
          set to indicate the error.


-----------------------------------------------------

::

          EFAULT Either fsname or buf is outside your accessible address
                 space.

          EINVAL fsname is not a valid filesystem type identifier; fs_index
                 is out-of-bounds; option is invalid.


-------------------------------------------------------------------

::

          SVr4.


---------------------------------------------------

::

          This System-V derived system call is obsolete; don't use it.  On
          systems with /proc, the same information can be obtained via
          /proc; use that interface instead.


-------------------------------------------------

::

          There is no libc or glibc support.  There is no way to guess how
          large buf should be.


---------------------------------------------------------

::

          proc(5), sysfs(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       SYSFS(2)

--------------

Pages that refer to this page: `statfs(2) <../man2/statfs.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`filesystems(5) <../man5/filesystems.5.html>`__

--------------

`Copyright and license for this manual
page <../man2/sysfs.2.license.html>`__

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
