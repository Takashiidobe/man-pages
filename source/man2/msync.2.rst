.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

msync(2) — Linux manual page
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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MSYNC(2)                Linux Programmer's Manual               MSYNC(2)

NAME
-------------------------------------------------

::

          msync - synchronize a file with a memory map


---------------------------------------------------------

::

          #include <sys/mman.h>

          int msync(void *addr, size_t length, int flags);


---------------------------------------------------------------

::

          msync() flushes changes made to the in-core copy of a file that
          was mapped into memory using mmap(2) back to the filesystem.
          Without use of this call, there is no guarantee that changes are
          written back before munmap(2) is called.  To be more precise, the
          part of the file that corresponds to the memory area starting at
          addr and having length length is updated.

          The flags argument should specify exactly one of MS_ASYNC and
          MS_SYNC, and may additionally include the MS_INVALIDATE bit.
          These bits have the following meanings:

          MS_ASYNC
                 Specifies that an update be scheduled, but the call
                 returns immediately.

          MS_SYNC
                 Requests an update and waits for it to complete.

          MS_INVALIDATE
                 Asks to invalidate other mappings of the same file (so
                 that they can be updated with the fresh values just
                 written).


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EBUSY  MS_INVALIDATE was specified in flags, and a memory lock
                 exists for the specified address range.

          EINVAL addr is not a multiple of PAGESIZE; or any bit other than
                 MS_ASYNC | MS_INVALIDATE | MS_SYNC is set in flags; or
                 both MS_SYNC and MS_ASYNC are set in flags.

          ENOMEM The indicated memory (or part of it) was not mapped.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.

          This call was introduced in Linux 1.3.21, and then used EFAULT
          instead of ENOMEM.  In Linux 2.4.19, this was changed to the
          POSIX value ENOMEM.

          On POSIX systems on which msync() is available, both
          _POSIX_MAPPED_FILES and _POSIX_SYNCHRONIZED_IO are defined in
          <unistd.h> to a value greater than 0.  (See also sysconf(3).)


---------------------------------------------------

::

          According to POSIX, either MS_SYNC or MS_ASYNC must be specified
          in flags, and indeed failure to include one of these flags will
          cause msync() to fail on some systems.  However, Linux permits a
          call to msync() that specifies neither of these flags, with
          semantics that are (currently) equivalent to specifying MS_ASYNC.
          (Since Linux 2.6.19, MS_ASYNC is in fact a no-op, since the
          kernel properly tracks dirty pages and flushes them to storage as
          necessary.)  Notwithstanding the Linux behavior, portable,
          future-proof applications should ensure that they specify either
          MS_SYNC or MS_ASYNC in flags.


---------------------------------------------------------

::

          mmap(2)

          B.O. Gallmeister, POSIX.4, O'Reilly, pp. 128–129 and 389–391.

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       MSYNC(2)

--------------

Pages that refer to this page: `madvise(2) <../man2/madvise.2.html>`__, 
`mmap2(2) <../man2/mmap2.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`remap_file_pages(2) <../man2/remap_file_pages.2.html>`__, 
`sync_file_range(2) <../man2/sync_file_range.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`nfs(5) <../man5/nfs.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`fanotify(7) <../man7/fanotify.7.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`xfs_io(8) <../man8/xfs_io.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/msync.2.license.html>`__

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
