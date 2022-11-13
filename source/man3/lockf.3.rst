.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

lockf(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   LOCKF(3)                Linux Programmer's Manual               LOCKF(3)

NAME
-------------------------------------------------

::

          lockf - apply, test or remove a POSIX lock on an open file


---------------------------------------------------------

::

          #include <unistd.h>

          int lockf(int fd, int cmd, off_t len);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          lockf():
              _XOPEN_SOURCE >= 500
                  || /* Glibc since 2.19: */ _DEFAULT_SOURCE
                  || /* Glibc <= 2.19: */ _BSD_SOURCE || _SVID_SOURCE


---------------------------------------------------------------

::

          Apply, test, or remove a POSIX lock on a section of an open file.
          The file is specified by fd, a file descriptor open for writing,
          the action by cmd, and the section consists of byte positions
          pos..pos+len-1 if len is positive, and pos-len..pos-1 if len is
          negative, where pos is the current file position, and if len is
          zero, the section extends from the current file position to
          infinity, encompassing the present and future end-of-file
          positions.  In all cases, the section may extend past current
          end-of-file.

          On Linux, lockf() is just an interface on top of fcntl(2)
          locking.  Many other systems implement lockf() in this way, but
          note that POSIX.1 leaves the relationship between lockf() and
          fcntl(2) locks unspecified.  A portable application should
          probably avoid mixing calls to these interfaces.

          Valid operations are given below:

          F_LOCK Set an exclusive lock on the specified section of the
                 file.  If (part of) this section is already locked, the
                 call blocks until the previous lock is released.  If this
                 section overlaps an earlier locked section, both are
                 merged.  File locks are released as soon as the process
                 holding the locks closes some file descriptor for the
                 file.  A child process does not inherit these locks.

          F_TLOCK
                 Same as F_LOCK but the call never blocks and returns an
                 error instead if the file is already locked.

          F_ULOCK
                 Unlock the indicated section of the file.  This may cause
                 a locked section to be split into two locked sections.

          F_TEST Test the lock: return 0 if the specified section is
                 unlocked or locked by this process; return -1, set errno
                 to EAGAIN (EACCES on some other systems), if another
                 process holds a lock.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          EACCES or EAGAIN
                 The file is locked and F_TLOCK or F_TEST was specified, or
                 the operation is prohibited because the file has been
                 memory-mapped by another process.

          EBADF  fd is not an open file descriptor; or cmd is F_LOCK or
                 F_TLOCK and fd is not a writable file descriptor.

          EDEADLK
                 The command was F_LOCK and this lock operation would cause
                 a deadlock.

          EINTR  While waiting to acquire a lock, the call was interrupted
                 by delivery of a signal caught by a handler; see
                 signal(7).

          EINVAL An invalid operation was specified in cmd.

          ENOLCK Too many segment locks open, lock table is full.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │lockf()                               │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4.


---------------------------------------------------------

::

          fcntl(2), flock(2)

          locks.txt and mandatory-locking.txt in the Linux kernel source
          directory Documentation/filesystems (on older kernels, these
          files are directly under the Documentation directory, and
          mandatory-locking.txt is called mandatory.txt)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   GNU                            2021-03-22                       LOCKF(3)

--------------

Pages that refer to this page: `fcntl(2) <../man2/fcntl.2.html>`__, 
`flock(2) <../man2/flock.2.html>`__, 
`flockfile(3) <../man3/flockfile.3.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`lslocks(8) <../man8/lslocks.8.html>`__

--------------

`Copyright and license for this manual
page <../man3/lockf.3.license.html>`__

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
