.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

readdir(2) — Linux manual page
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

   READDIR(2)              Linux Programmer's Manual             READDIR(2)

NAME
-------------------------------------------------

::

          readdir - read directory entry


---------------------------------------------------------

::

          #include <sys/syscall.h>      /* Definition of SYS_* constants */
          #include <unistd.h>

          int syscall(SYS_readdir, unsigned int fd,
                      struct old_linux_dirent *dirp, unsigned int count);

          Note: There is no definition of struct old_linux_dirent; see
          NOTES.


---------------------------------------------------------------

::

          This is not the function you are interested in.  Look at
          readdir(3) for the POSIX conforming C library interface.  This
          page documents the bare kernel system call interface, which is
          superseded by getdents(2).

          readdir() reads one old_linux_dirent structure from the directory
          referred to by the file descriptor fd into the buffer pointed to
          by dirp.  The argument count is ignored; at most one
          old_linux_dirent structure is read.

          The old_linux_dirent structure is declared (privately in Linux
          kernel file fs/readdir.c) as follows:

              struct old_linux_dirent {
                  unsigned long d_ino;     /* inode number */
                  unsigned long d_offset;  /* offset to this old_linux_dirent */
                  unsigned short d_namlen; /* length of this d_name */
                  char  d_name[1];         /* filename (null-terminated) */
              }

          d_ino is an inode number.  d_offset is the distance from the
          start of the directory to this old_linux_dirent.  d_reclen is the
          size of d_name, not counting the terminating null byte ('\0').
          d_name is a null-terminated filename.


-----------------------------------------------------------------

::

          On success, 1 is returned.  On end of directory, 0 is returned.
          On error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  Invalid file descriptor fd.

          EFAULT Argument points outside the calling process's address
                 space.

          EINVAL Result buffer is too small.

          ENOENT No such directory.

          ENOTDIR
                 File descriptor does not refer to a directory.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------

::

          You will need to define the old_linux_dirent structure yourself.
          However, probably you should use readdir(3) instead.

          This system call does not exist on x86-64.


---------------------------------------------------------

::

          getdents(2), readdir(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     READDIR(2)

--------------

Pages that refer to this page:
`fanotify_mark(2) <../man2/fanotify_mark.2.html>`__, 
`getdents(2) <../man2/getdents.2.html>`__, 
`read(2) <../man2/read.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`seekdir(3) <../man3/seekdir.3.html>`__, 
`fanotify(7) <../man7/fanotify.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/readdir.2.license.html>`__

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
