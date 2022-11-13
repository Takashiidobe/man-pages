.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pread(2) — Linux manual page
============================

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
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PREAD(2)                Linux Programmer's Manual               PREAD(2)

NAME
-------------------------------------------------

::

          pread, pwrite - read from or write to a file descriptor at a
          given offset


---------------------------------------------------------

::

          #include <unistd.h>

          ssize_t pread(int fd, void *buf, size_t count, off_t offset);
          ssize_t pwrite(int fd, const void *buf, size_t count, off_t offset);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          pread(), pwrite():
              _XOPEN_SOURCE >= 500
                  || /* Since glibc 2.12: */ _POSIX_C_SOURCE >= 200809L


---------------------------------------------------------------

::

          pread() reads up to count bytes from file descriptor fd at offset
          offset (from the start of the file) into the buffer starting at
          buf.  The file offset is not changed.

          pwrite() writes up to count bytes from the buffer starting at buf
          to the file descriptor fd at offset offset.  The file offset is
          not changed.

          The file referenced by fd must be capable of seeking.


-----------------------------------------------------------------

::

          On success, pread() returns the number of bytes read (a return of
          zero indicates end of file) and pwrite() returns the number of
          bytes written.

          Note that it is not an error for a successful call to transfer
          fewer bytes than requested (see read(2) and write(2)).

          On error, -1 is returned and errno is set to indicate the error.


-----------------------------------------------------

::

          pread() can fail and set errno to any error specified for read(2)
          or lseek(2).  pwrite() can fail and set errno to any error
          specified for write(2) or lseek(2).


---------------------------------------------------------

::

          The pread() and pwrite() system calls were added to Linux in
          version 2.1.60; the entries in the i386 system call table were
          added in 2.1.69.  C library support (including emulation using
          lseek(2) on older kernels without the system calls) was added in
          glibc 2.1.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          The pread() and pwrite() system calls are especially useful in
          multithreaded applications.  They allow multiple threads to
          perform I/O on the same file descriptor without being affected by
          changes to the file offset by other threads.

      C library/kernel differences
          On Linux, the underlying system calls were renamed in kernel 2.6:
          pread() became pread64(), and pwrite() became pwrite64().  The
          system call numbers remained the same.  The glibc pread() and
          pwrite() wrapper functions transparently deal with the change.

          On some 32-bit architectures, the calling signature for these
          system calls differ, for the reasons described in syscall(2).


-------------------------------------------------

::

          POSIX requires that opening a file with the O_APPEND flag should
          have no effect on the location at which pwrite() writes data.
          However, on Linux, if a file is opened with O_APPEND, pwrite()
          appends data to the end of the file, regardless of the value of
          offset.


---------------------------------------------------------

::

          lseek(2), read(2), readv(2), write(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       PREAD(2)

--------------

Pages that refer to this page: `fcntl(2) <../man2/fcntl.2.html>`__, 
`read(2) <../man2/read.2.html>`__, 
`readv(2) <../man2/readv.2.html>`__, 
`syscall(2) <../man2/syscall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`write(2) <../man2/write.2.html>`__, 
`cpuid(4) <../man4/cpuid.4.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`spufs(7) <../man7/spufs.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`user_namespaces(7) <../man7/user_namespaces.7.html>`__, 
`xfs_io(8) <../man8/xfs_io.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/pread.2.license.html>`__

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
