.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

read(2) — Linux manual page
===========================

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

   READ(2)                 Linux Programmer's Manual                READ(2)

NAME
-------------------------------------------------

::

          read - read from a file descriptor


---------------------------------------------------------

::

          #include <unistd.h>

          ssize_t read(int fd, void *buf, size_t count);


---------------------------------------------------------------

::

          read() attempts to read up to count bytes from file descriptor fd
          into the buffer starting at buf.

          On files that support seeking, the read operation commences at
          the file offset, and the file offset is incremented by the number
          of bytes read.  If the file offset is at or past the end of file,
          no bytes are read, and read() returns zero.

          If count is zero, read() may detect the errors described below.
          In the absence of any errors, or if read() does not check for
          errors, a read() with a count of 0 returns zero and has no other
          effects.

          According to POSIX.1, if count is greater than SSIZE_MAX, the
          result is implementation-defined; see NOTES for the upper limit
          on Linux.


-----------------------------------------------------------------

::

          On success, the number of bytes read is returned (zero indicates
          end of file), and the file position is advanced by this number.
          It is not an error if this number is smaller than the number of
          bytes requested; this may happen for example because fewer bytes
          are actually available right now (maybe because we were close to
          end-of-file, or because we are reading from a pipe, or from a
          terminal), or because read() was interrupted by a signal.  See
          also NOTES.

          On error, -1 is returned, and errno is set to indicate the error.
          In this case, it is left unspecified whether the file position
          (if any) changes.


-----------------------------------------------------

::

          EAGAIN The file descriptor fd refers to a file other than a
                 socket and has been marked nonblocking (O_NONBLOCK), and
                 the read would block.  See open(2) for further details on
                 the O_NONBLOCK flag.

          EAGAIN or EWOULDBLOCK
                 The file descriptor fd refers to a socket and has been
                 marked nonblocking (O_NONBLOCK), and the read would block.
                 POSIX.1-2001 allows either error to be returned for this
                 case, and does not require these constants to have the
                 same value, so a portable application should check for
                 both possibilities.

          EBADF  fd is not a valid file descriptor or is not open for
                 reading.

          EFAULT buf is outside your accessible address space.

          EINTR  The call was interrupted by a signal before any data was
                 read; see signal(7).

          EINVAL fd is attached to an object which is unsuitable for
                 reading; or the file was opened with the O_DIRECT flag,
                 and either the address specified in buf, the value
                 specified in count, or the file offset is not suitably
                 aligned.

          EINVAL fd was created via a call to timerfd_create(2) and the
                 wrong size buffer was given to read(); see
                 timerfd_create(2) for further information.

          EIO    I/O error.  This will happen for example when the process
                 is in a background process group, tries to read from its
                 controlling terminal, and either it is ignoring or
                 blocking SIGTTIN or its process group is orphaned.  It may
                 also occur when there is a low-level I/O error while
                 reading from a disk or tape.  A further possible cause of
                 EIO on networked filesystems is when an advisory lock had
                 been taken out on the file descriptor and this lock has
                 been lost.  See the Lost locks section of fcntl(2) for
                 further details.

          EISDIR fd refers to a directory.

          Other errors may occur, depending on the object connected to fd.


-------------------------------------------------------------------

::

          SVr4, 4.3BSD, POSIX.1-2001.


---------------------------------------------------

::

          The types size_t and ssize_t are, respectively, unsigned and
          signed integer data types specified by POSIX.1.

          On Linux, read() (and similar system calls) will transfer at most
          0x7ffff000 (2,147,479,552) bytes, returning the number of bytes
          actually transferred.  (This is true on both 32-bit and 64-bit
          systems.)

          On NFS filesystems, reading small amounts of data will update the
          timestamp only the first time, subsequent calls may not do so.
          This is caused by client side attribute caching, because most if
          not all NFS clients leave st_atime (last file access time)
          updates to the server, and client side reads satisfied from the
          client's cache will not cause st_atime updates on the server as
          there are no server-side reads.  UNIX semantics can be obtained
          by disabling client-side attribute caching, but in most
          situations this will substantially increase server load and
          decrease performance.


-------------------------------------------------

::

          According to POSIX.1-2008/SUSv4 Section XSI 2.9.7 ("Thread
          Interactions with Regular File Operations"):

              All of the following functions shall be atomic with respect
              to each other in the effects specified in POSIX.1-2008 when
              they operate on regular files or symbolic links: ...

          Among the APIs subsequently listed are read() and readv(2).  And
          among the effects that should be atomic across threads (and
          processes) are updates of the file offset.  However, on Linux
          before version 3.14, this was not the case: if two processes that
          share an open file description (see open(2)) perform a read() (or
          readv(2)) at the same time, then the I/O operations were not
          atomic with respect updating the file offset, with the result
          that the reads in the two processes might (incorrectly) overlap
          in the blocks of data that they obtained.  This problem was fixed
          in Linux 3.14.


---------------------------------------------------------

::

          close(2), fcntl(2), ioctl(2), lseek(2), open(2), pread(2),
          readdir(2), readlink(2), readv(2), select(2), write(2), fread(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                        READ(2)

--------------

Pages that refer to this page: `grep(1) <../man1/grep.1.html>`__, 
`pv(1) <../man1/pv.1.html>`__,  `strace(1) <../man1/strace.1.html>`__, 
`telnet-probe(1) <../man1/telnet-probe.1.html>`__, 
`close(2) <../man2/close.2.html>`__, 
`epoll_ctl(2) <../man2/epoll_ctl.2.html>`__, 
`eventfd(2) <../man2/eventfd.2.html>`__, 
`fanotify_init(2) <../man2/fanotify_init.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`getrandom(2) <../man2/getrandom.2.html>`__, 
`inotify_add_watch(2) <../man2/inotify_add_watch.2.html>`__, 
`ioctl_tty(2) <../man2/ioctl_tty.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`perf_event_open(2) <../man2/perf_event_open.2.html>`__, 
`perfmonctl(2) <../man2/perfmonctl.2.html>`__, 
`pidfd_open(2) <../man2/pidfd_open.2.html>`__, 
`pipe(2) <../man2/pipe.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`pread(2) <../man2/pread.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`readahead(2) <../man2/readahead.2.html>`__, 
`readv(2) <../man2/readv.2.html>`__, 
`recv(2) <../man2/recv.2.html>`__, 
`seccomp(2) <../man2/seccomp.2.html>`__, 
`seccomp_unotify(2) <../man2/seccomp_unotify.2.html>`__, 
`select(2) <../man2/select.2.html>`__, 
`select_tut(2) <../man2/select_tut.2.html>`__, 
`sendfile(2) <../man2/sendfile.2.html>`__, 
`setpgid(2) <../man2/setpgid.2.html>`__, 
`signalfd(2) <../man2/signalfd.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`socketpair(2) <../man2/socketpair.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`timerfd_create(2) <../man2/timerfd_create.2.html>`__, 
`userfaultfd(2) <../man2/userfaultfd.2.html>`__, 
`write(2) <../man2/write.2.html>`__, 
`aio_error(3) <../man3/aio_error.3.html>`__, 
`aio_read(3) <../man3/aio_read.3.html>`__, 
`aio_return(3) <../man3/aio_return.3.html>`__, 
`curs_getch(3x) <../man3/curs_getch.3x.html>`__, 
`dbopen(3) <../man3/dbopen.3.html>`__, 
`fgetc(3) <../man3/fgetc.3.html>`__, 
`fopen(3) <../man3/fopen.3.html>`__, 
`fread(3) <../man3/fread.3.html>`__, 
`getline(3) <../man3/getline.3.html>`__, 
`gets(3) <../man3/gets.3.html>`__, 
`libexpect(3) <../man3/libexpect.3.html>`__, 
`mkfifo(3) <../man3/mkfifo.3.html>`__, 
`mpool(3) <../man3/mpool.3.html>`__, 
`readdir(3) <../man3/readdir.3.html>`__, 
`rtime(3) <../man3/rtime.3.html>`__, 
`stdin(3) <../man3/stdin.3.html>`__, 
`stdio(3) <../man3/stdio.3.html>`__, 
`termios(3) <../man3/termios.3.html>`__, 
`xdr(3) <../man3/xdr.3.html>`__, 
`xfsctl(3) <../man3/xfsctl.3.html>`__, 
`dsp56k(4) <../man4/dsp56k.4.html>`__, 
`fuse(4) <../man4/fuse.4.html>`__,  `lirc(4) <../man4/lirc.4.html>`__, 
`null(4) <../man4/null.4.html>`__, 
`random(4) <../man4/random.4.html>`__, 
`rtc(4) <../man4/rtc.4.html>`__,  `st(4) <../man4/st.4.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`aio(7) <../man7/aio.7.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`epoll(7) <../man7/epoll.7.html>`__, 
`fanotify(7) <../man7/fanotify.7.html>`__, 
`inode(7) <../man7/inode.7.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__, 
`pipe(7) <../man7/pipe.7.html>`__, 
`signal(7) <../man7/signal.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`spufs(7) <../man7/spufs.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`vsock(7) <../man7/vsock.7.html>`__,  `x25(7) <../man7/x25.7.html>`__, 
`mount.fuse3(8) <../man8/mount.fuse3.8.html>`__, 
`netsniff-ng(8) <../man8/netsniff-ng.8.html>`__, 
`xfs_io(8) <../man8/xfs_io.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/read.2.license.html>`__

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
