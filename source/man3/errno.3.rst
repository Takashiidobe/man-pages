.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

errno(3) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `NOTES <#NOTES>`__ \|             |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   ERRNO(3)                Linux Programmer's Manual               ERRNO(3)

NAME
-------------------------------------------------

::

          errno - number of last error


---------------------------------------------------------

::

          #include <errno.h>


---------------------------------------------------------------

::

          The <errno.h> header file defines the integer variable errno,
          which is set by system calls and some library functions in the
          event of an error to indicate what went wrong.

      errno
          The value in errno is significant only when the return value of
          the call indicated an error (i.e., -1 from most system calls; -1
          or NULL from most library functions); a function that succeeds is
          allowed to change errno.  The value of errno is never set to zero
          by any system call or library function.

          For some system calls and library functions (e.g.,
          getpriority(2)), -1 is a valid return on success.  In such cases,
          a successful return can be distinguished from an error return by
          setting errno to zero before the call, and then, if the call
          returns a status that indicates that an error may have occurred,
          checking to see if errno has a nonzero value.

          errno is defined by the ISO C standard to be a modifiable lvalue
          of type int, and must not be explicitly declared; errno may be a
          macro.  errno is thread-local; setting it in one thread does not
          affect its value in any other thread.

      Error numbers and names
          Valid error numbers are all positive numbers.  The <errno.h>
          header file defines symbolic names for each of the possible error
          numbers that may appear in errno.

          All the error names specified by POSIX.1 must have distinct
          values, with the exception of EAGAIN and EWOULDBLOCK, which may
          be the same.  On Linux, these two have the same value on all
          architectures.

          The error numbers that correspond to each symbolic name vary
          across UNIX systems, and even across different architectures on
          Linux.  Therefore, numeric values are not included as part of the
          list of error names below.  The perror(3) and strerror(3)
          functions can be used to convert these names to corresponding
          textual error messages.

          On any particular Linux system, one can obtain a list of all
          symbolic error names and the corresponding error numbers using
          the errno(1) command (part of the moreutils package):

              $ errno -l
              EPERM 1 Operation not permitted
              ENOENT 2 No such file or directory
              ESRCH 3 No such process
              EINTR 4 Interrupted system call
              EIO 5 Input/output error
              ...

          The errno(1) command can also be used to look up individual error
          numbers and names, and to search for errors using strings from
          the error description, as in the following examples:

              $ errno 2
              ENOENT 2 No such file or directory
              $ errno ESRCH
              ESRCH 3 No such process
              $ errno -s permission
              EACCES 13 Permission denied

      List of error names
          In the list of the symbolic error names below, various names are
          marked as follows:

          *  POSIX.1-2001: The name is defined by POSIX.1-2001, and is
             defined in later POSIX.1 versions, unless otherwise indicated.

          *  POSIX.1-2008: The name is defined in POSIX.1-2008, but was not
             present in earlier POSIX.1 standards.

          *  C99: The name is defined by C99.

          Below is a list of the symbolic error names that are defined on
          Linux:

          E2BIG  Argument list too long (POSIX.1-2001).

          EACCES Permission denied (POSIX.1-2001).

          EADDRINUSE
                 Address already in use (POSIX.1-2001).

          EADDRNOTAVAIL
                 Address not available (POSIX.1-2001).

          EAFNOSUPPORT
                 Address family not supported (POSIX.1-2001).

          EAGAIN Resource temporarily unavailable (may be the same value as
                 EWOULDBLOCK) (POSIX.1-2001).

          EALREADY
                 Connection already in progress (POSIX.1-2001).

          EBADE  Invalid exchange.

          EBADF  Bad file descriptor (POSIX.1-2001).

          EBADFD File descriptor in bad state.

          EBADMSG
                 Bad message (POSIX.1-2001).

          EBADR  Invalid request descriptor.

          EBADRQC
                 Invalid request code.

          EBADSLT
                 Invalid slot.

          EBUSY  Device or resource busy (POSIX.1-2001).

          ECANCELED
                 Operation canceled (POSIX.1-2001).

          ECHILD No child processes (POSIX.1-2001).

          ECHRNG Channel number out of range.

          ECOMM  Communication error on send.

          ECONNABORTED
                 Connection aborted (POSIX.1-2001).

          ECONNREFUSED
                 Connection refused (POSIX.1-2001).

          ECONNRESET
                 Connection reset (POSIX.1-2001).

          EDEADLK
                 Resource deadlock avoided (POSIX.1-2001).

          EDEADLOCK
                 On most architectures, a synonym for EDEADLK.  On some
                 architectures (e.g., Linux MIPS, PowerPC, SPARC), it is a
                 separate error code "File locking deadlock error".

          EDESTADDRREQ
                 Destination address required (POSIX.1-2001).

          EDOM   Mathematics argument out of domain of function (POSIX.1,
                 C99).

          EDQUOT Disk quota exceeded (POSIX.1-2001).

          EEXIST File exists (POSIX.1-2001).

          EFAULT Bad address (POSIX.1-2001).

          EFBIG  File too large (POSIX.1-2001).

          EHOSTDOWN
                 Host is down.

          EHOSTUNREACH
                 Host is unreachable (POSIX.1-2001).

          EHWPOISON
                 Memory page has hardware error.

          EIDRM  Identifier removed (POSIX.1-2001).

          EILSEQ Invalid or incomplete multibyte or wide character
                 (POSIX.1, C99).

                 The text shown here is the glibc error description; in
                 POSIX.1, this error is described as "Illegal byte
                 sequence".

          EINPROGRESS
                 Operation in progress (POSIX.1-2001).

          EINTR  Interrupted function call (POSIX.1-2001); see signal(7).

          EINVAL Invalid argument (POSIX.1-2001).

          EIO    Input/output error (POSIX.1-2001).

          EISCONN
                 Socket is connected (POSIX.1-2001).

          EISDIR Is a directory (POSIX.1-2001).

          EISNAM Is a named type file.

          EKEYEXPIRED
                 Key has expired.

          EKEYREJECTED
                 Key was rejected by service.

          EKEYREVOKED
                 Key has been revoked.

          EL2HLT Level 2 halted.

          EL2NSYNC
                 Level 2 not synchronized.

          EL3HLT Level 3 halted.

          EL3RST Level 3 reset.

          ELIBACC
                 Cannot access a needed shared library.

          ELIBBAD
                 Accessing a corrupted shared library.

          ELIBMAX
                 Attempting to link in too many shared libraries.

          ELIBSCN
                 .lib section in a.out corrupted

          ELIBEXEC
                 Cannot exec a shared library directly.

          ELNRANGE
                 Link number out of range.

          ELOOP  Too many levels of symbolic links (POSIX.1-2001).

          EMEDIUMTYPE
                 Wrong medium type.

          EMFILE Too many open files (POSIX.1-2001).  Commonly caused by
                 exceeding the RLIMIT_NOFILE resource limit described in
                 getrlimit(2).  Can also be caused by exceeding the limit
                 specified in /proc/sys/fs/nr_open.

          EMLINK Too many links (POSIX.1-2001).

          EMSGSIZE
                 Message too long (POSIX.1-2001).

          EMULTIHOP
                 Multihop attempted (POSIX.1-2001).

          ENAMETOOLONG
                 Filename too long (POSIX.1-2001).

          ENETDOWN
                 Network is down (POSIX.1-2001).

          ENETRESET
                 Connection aborted by network (POSIX.1-2001).

          ENETUNREACH
                 Network unreachable (POSIX.1-2001).

          ENFILE Too many open files in system (POSIX.1-2001).  On Linux,
                 this is probably a result of encountering the
                 /proc/sys/fs/file-max limit (see proc(5)).

          ENOANO No anode.

          ENOBUFS
                 No buffer space available (POSIX.1 (XSI STREAMS option)).

          ENODATA
                 The named attribute does not exist, or the process has no
                 access to this attribute; see xattr(7).

                 In POSIX.1-2001 (XSI STREAMS option), this error was
                 described as "No message is available on the STREAM head
                 read queue".

          ENODEV No such device (POSIX.1-2001).

          ENOENT No such file or directory (POSIX.1-2001).

                 Typically, this error results when a specified pathname
                 does not exist, or one of the components in the directory
                 prefix of a pathname does not exist, or the specified
                 pathname is a dangling symbolic link.

          ENOEXEC
                 Exec format error (POSIX.1-2001).

          ENOKEY Required key not available.

          ENOLCK No locks available (POSIX.1-2001).

          ENOLINK
                 Link has been severed (POSIX.1-2001).

          ENOMEDIUM
                 No medium found.

          ENOMEM Not enough space/cannot allocate memory (POSIX.1-2001).

          ENOMSG No message of the desired type (POSIX.1-2001).

          ENONET Machine is not on the network.

          ENOPKG Package not installed.

          ENOPROTOOPT
                 Protocol not available (POSIX.1-2001).

          ENOSPC No space left on device (POSIX.1-2001).

          ENOSR  No STREAM resources (POSIX.1 (XSI STREAMS option)).

          ENOSTR Not a STREAM (POSIX.1 (XSI STREAMS option)).

          ENOSYS Function not implemented (POSIX.1-2001).

          ENOTBLK
                 Block device required.

          ENOTCONN
                 The socket is not connected (POSIX.1-2001).

          ENOTDIR
                 Not a directory (POSIX.1-2001).

          ENOTEMPTY
                 Directory not empty (POSIX.1-2001).

          ENOTRECOVERABLE
                 State not recoverable (POSIX.1-2008).

          ENOTSOCK
                 Not a socket (POSIX.1-2001).

          ENOTSUP
                 Operation not supported (POSIX.1-2001).

          ENOTTY Inappropriate I/O control operation (POSIX.1-2001).

          ENOTUNIQ
                 Name not unique on network.

          ENXIO  No such device or address (POSIX.1-2001).

          EOPNOTSUPP
                 Operation not supported on socket (POSIX.1-2001).

                 (ENOTSUP and EOPNOTSUPP have the same value on Linux, but
                 according to POSIX.1 these error values should be
                 distinct.)

          EOVERFLOW
                 Value too large to be stored in data type (POSIX.1-2001).

          EOWNERDEAD
                 Owner died (POSIX.1-2008).

          EPERM  Operation not permitted (POSIX.1-2001).

          EPFNOSUPPORT
                 Protocol family not supported.

          EPIPE  Broken pipe (POSIX.1-2001).

          EPROTO Protocol error (POSIX.1-2001).

          EPROTONOSUPPORT
                 Protocol not supported (POSIX.1-2001).

          EPROTOTYPE
                 Protocol wrong type for socket (POSIX.1-2001).

          ERANGE Result too large (POSIX.1, C99).

          EREMCHG
                 Remote address changed.

          EREMOTE
                 Object is remote.

          EREMOTEIO
                 Remote I/O error.

          ERESTART
                 Interrupted system call should be restarted.

          ERFKILL
                 Operation not possible due to RF-kill.

          EROFS  Read-only filesystem (POSIX.1-2001).

          ESHUTDOWN
                 Cannot send after transport endpoint shutdown.

          ESPIPE Invalid seek (POSIX.1-2001).

          ESOCKTNOSUPPORT
                 Socket type not supported.

          ESRCH  No such process (POSIX.1-2001).

          ESTALE Stale file handle (POSIX.1-2001).

                 This error can occur for NFS and for other filesystems.

          ESTRPIPE
                 Streams pipe error.

          ETIME  Timer expired (POSIX.1 (XSI STREAMS option)).

                 (POSIX.1 says "STREAM ioctl(2) timeout".)

          ETIMEDOUT
                 Connection timed out (POSIX.1-2001).

          ETOOMANYREFS
                 Too many references: cannot splice.

          ETXTBSY
                 Text file busy (POSIX.1-2001).

          EUCLEAN
                 Structure needs cleaning.

          EUNATCH
                 Protocol driver not attached.

          EUSERS Too many users.

          EWOULDBLOCK
                 Operation would block (may be same value as EAGAIN)
                 (POSIX.1-2001).

          EXDEV  Improper link (POSIX.1-2001).

          EXFULL Exchange full.


---------------------------------------------------

::

          A common mistake is to do

              if (somecall() == -1) {
                  printf("somecall() failed\n");
                  if (errno == ...) { ... }
              }

          where errno no longer needs to have the value it had upon return
          from somecall() (i.e., it may have been changed by the
          printf(3)).  If the value of errno should be preserved across a
          library call, it must be saved:

              if (somecall() == -1) {
                  int errsv = errno;
                  printf("somecall() failed\n");
                  if (errsv == ...) { ... }
              }

          Note that the POSIX threads APIs do not set errno on error.
          Instead, on failure they return an error number as the function
          result.  These error numbers have the same meanings as the error
          numbers returned in errno by other APIs.

          On some ancient systems, <errno.h> was not present or did not
          declare errno, so that it was necessary to declare errno manually
          (i.e., extern int errno).  Do not do this.  It long ago ceased to
          be necessary, and it will cause problems with modern versions of
          the C library.


---------------------------------------------------------

::

          errno(1), err(3), error(3), perror(3), strerror(3)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

                                  2021-03-22                       ERRNO(3)

--------------

Pages that refer to this page:
`errno.h(0p) <../man0/errno.h.0p.html>`__, 
`netdb.h(0p) <../man0/netdb.h.0p.html>`__, 
`signal.h(0p) <../man0/signal.h.0p.html>`__, 
`gawk(1) <../man1/gawk.1.html>`__,  `mv(1p) <../man1/mv.1p.html>`__, 
`strace(1) <../man1/strace.1.html>`__, 
`accept(2) <../man2/accept.2.html>`__, 
`access(2) <../man2/access.2.html>`__, 
`acct(2) <../man2/acct.2.html>`__, 
`add_key(2) <../man2/add_key.2.html>`__, 
`adjtimex(2) <../man2/adjtimex.2.html>`__, 
`alloc_hugepages(2) <../man2/alloc_hugepages.2.html>`__, 
`arch_prctl(2) <../man2/arch_prctl.2.html>`__, 
`bdflush(2) <../man2/bdflush.2.html>`__, 
`bind(2) <../man2/bind.2.html>`__,  `bpf(2) <../man2/bpf.2.html>`__, 
`brk(2) <../man2/brk.2.html>`__, 
`cacheflush(2) <../man2/cacheflush.2.html>`__, 
`capget(2) <../man2/capget.2.html>`__, 
`chdir(2) <../man2/chdir.2.html>`__, 
`chmod(2) <../man2/chmod.2.html>`__, 
`chown(2) <../man2/chown.2.html>`__, 
`chroot(2) <../man2/chroot.2.html>`__, 
`clock_getres(2) <../man2/clock_getres.2.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`close(2) <../man2/close.2.html>`__, 
`close_range(2) <../man2/close_range.2.html>`__, 
`connect(2) <../man2/connect.2.html>`__, 
`copy_file_range(2) <../man2/copy_file_range.2.html>`__, 
`create_module(2) <../man2/create_module.2.html>`__, 
`delete_module(2) <../man2/delete_module.2.html>`__, 
`dup(2) <../man2/dup.2.html>`__, 
`epoll_create(2) <../man2/epoll_create.2.html>`__, 
`epoll_ctl(2) <../man2/epoll_ctl.2.html>`__, 
`epoll_wait(2) <../man2/epoll_wait.2.html>`__, 
`eventfd(2) <../man2/eventfd.2.html>`__, 
`execve(2) <../man2/execve.2.html>`__, 
`execveat(2) <../man2/execveat.2.html>`__, 
`fallocate(2) <../man2/fallocate.2.html>`__, 
`fanotify_init(2) <../man2/fanotify_init.2.html>`__, 
`fanotify_mark(2) <../man2/fanotify_mark.2.html>`__, 
`fcntl(2) <../man2/fcntl.2.html>`__, 
`flock(2) <../man2/flock.2.html>`__, 
`fork(2) <../man2/fork.2.html>`__, 
`fsync(2) <../man2/fsync.2.html>`__, 
`futex(2) <../man2/futex.2.html>`__, 
`futimesat(2) <../man2/futimesat.2.html>`__, 
`getcpu(2) <../man2/getcpu.2.html>`__, 
`getdents(2) <../man2/getdents.2.html>`__, 
`getdomainname(2) <../man2/getdomainname.2.html>`__, 
`getgid(2) <../man2/getgid.2.html>`__, 
`getgroups(2) <../man2/getgroups.2.html>`__, 
`gethostname(2) <../man2/gethostname.2.html>`__, 
`getitimer(2) <../man2/getitimer.2.html>`__, 
`get_kernel_syms(2) <../man2/get_kernel_syms.2.html>`__, 
`get_mempolicy(2) <../man2/get_mempolicy.2.html>`__, 
`getpeername(2) <../man2/getpeername.2.html>`__, 
`getpriority(2) <../man2/getpriority.2.html>`__, 
`getrandom(2) <../man2/getrandom.2.html>`__, 
`getresuid(2) <../man2/getresuid.2.html>`__, 
`getrlimit(2) <../man2/getrlimit.2.html>`__, 
`getrusage(2) <../man2/getrusage.2.html>`__, 
`getsid(2) <../man2/getsid.2.html>`__, 
`getsockname(2) <../man2/getsockname.2.html>`__, 
`getsockopt(2) <../man2/getsockopt.2.html>`__, 
`gettimeofday(2) <../man2/gettimeofday.2.html>`__, 
`getuid(2) <../man2/getuid.2.html>`__, 
`getunwind(2) <../man2/getunwind.2.html>`__, 
`getxattr(2) <../man2/getxattr.2.html>`__, 
`init_module(2) <../man2/init_module.2.html>`__, 
`inotify_add_watch(2) <../man2/inotify_add_watch.2.html>`__, 
`inotify_init(2) <../man2/inotify_init.2.html>`__, 
`inotify_rm_watch(2) <../man2/inotify_rm_watch.2.html>`__, 
`intro(2) <../man2/intro.2.html>`__, 
`io_cancel(2) <../man2/io_cancel.2.html>`__, 
`ioctl(2) <../man2/ioctl.2.html>`__, 
`ioctl_console(2) <../man2/ioctl_console.2.html>`__, 
`ioctl_fat(2) <../man2/ioctl_fat.2.html>`__, 
`ioctl_ficlonerange(2) <../man2/ioctl_ficlonerange.2.html>`__, 
`ioctl_fideduperange(2) <../man2/ioctl_fideduperange.2.html>`__, 
`ioctl_fslabel(2) <../man2/ioctl_fslabel.2.html>`__, 
`ioctl_getfsmap(2) <../man2/ioctl_getfsmap.2.html>`__, 
`ioctl_tty(2) <../man2/ioctl_tty.2.html>`__, 
`ioctl_userfaultfd(2) <../man2/ioctl_userfaultfd.2.html>`__, 
`ioctl_xfs_ag_geometry(2) <../man2/ioctl_xfs_ag_geometry.2.html>`__, 
`ioctl_xfs_bulkstat(2) <../man2/ioctl_xfs_bulkstat.2.html>`__, 
`ioctl_xfs_fsbulkstat(2) <../man2/ioctl_xfs_fsbulkstat.2.html>`__, 
`ioctl_xfs_fscounts(2) <../man2/ioctl_xfs_fscounts.2.html>`__, 
`ioctl_xfs_fsgeometry(2) <../man2/ioctl_xfs_fsgeometry.2.html>`__, 
`ioctl_xfs_fsgetxattr(2) <../man2/ioctl_xfs_fsgetxattr.2.html>`__, 
`ioctl_xfs_fsinumbers(2) <../man2/ioctl_xfs_fsinumbers.2.html>`__, 
`ioctl_xfs_getbmapx(2) <../man2/ioctl_xfs_getbmapx.2.html>`__, 
`ioctl_xfs_getresblks(2) <../man2/ioctl_xfs_getresblks.2.html>`__, 
`ioctl_xfs_goingdown(2) <../man2/ioctl_xfs_goingdown.2.html>`__, 
`ioctl_xfs_inumbers(2) <../man2/ioctl_xfs_inumbers.2.html>`__, 
`ioctl_xfs_scrub_metadata(2) <../man2/ioctl_xfs_scrub_metadata.2.html>`__, 
`io_destroy(2) <../man2/io_destroy.2.html>`__, 
`io_getevents(2) <../man2/io_getevents.2.html>`__, 
`ioperm(2) <../man2/ioperm.2.html>`__, 
`iopl(2) <../man2/iopl.2.html>`__, 
`ioprio_set(2) <../man2/ioprio_set.2.html>`__, 
`io_setup(2) <../man2/io_setup.2.html>`__, 
`io_submit(2) <../man2/io_submit.2.html>`__, 
`kcmp(2) <../man2/kcmp.2.html>`__, 
`kexec_load(2) <../man2/kexec_load.2.html>`__, 
`keyctl(2) <../man2/keyctl.2.html>`__, 
`kill(2) <../man2/kill.2.html>`__,  `link(2) <../man2/link.2.html>`__, 
`listen(2) <../man2/listen.2.html>`__, 
`listxattr(2) <../man2/listxattr.2.html>`__, 
`llseek(2) <../man2/llseek.2.html>`__, 
`lookup_dcookie(2) <../man2/lookup_dcookie.2.html>`__, 
`lseek(2) <../man2/lseek.2.html>`__, 
`madvise(2) <../man2/madvise.2.html>`__, 
`mbind(2) <../man2/mbind.2.html>`__, 
`membarrier(2) <../man2/membarrier.2.html>`__, 
`memfd_create(2) <../man2/memfd_create.2.html>`__, 
`migrate_pages(2) <../man2/migrate_pages.2.html>`__, 
`mincore(2) <../man2/mincore.2.html>`__, 
`mkdir(2) <../man2/mkdir.2.html>`__, 
`mknod(2) <../man2/mknod.2.html>`__, 
`mlock(2) <../man2/mlock.2.html>`__, 
`mmap2(2) <../man2/mmap2.2.html>`__, 
`mmap(2) <../man2/mmap.2.html>`__, 
`modify_ldt(2) <../man2/modify_ldt.2.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`mount_setattr(2) <../man2/mount_setattr.2.html>`__, 
`move_pages(2) <../man2/move_pages.2.html>`__, 
`mprotect(2) <../man2/mprotect.2.html>`__, 
`mremap(2) <../man2/mremap.2.html>`__, 
`msgctl(2) <../man2/msgctl.2.html>`__, 
`msgget(2) <../man2/msgget.2.html>`__, 
`msgop(2) <../man2/msgop.2.html>`__, 
`msync(2) <../man2/msync.2.html>`__, 
`nanosleep(2) <../man2/nanosleep.2.html>`__, 
`nfsservctl(2) <../man2/nfsservctl.2.html>`__, 
`nice(2) <../man2/nice.2.html>`__,  `open(2) <../man2/open.2.html>`__, 
`openat2(2) <../man2/openat2.2.html>`__, 
`open_by_handle_at(2) <../man2/open_by_handle_at.2.html>`__, 
`pause(2) <../man2/pause.2.html>`__, 
`pciconfig_read(2) <../man2/pciconfig_read.2.html>`__, 
`perf_event_open(2) <../man2/perf_event_open.2.html>`__, 
`perfmonctl(2) <../man2/perfmonctl.2.html>`__, 
`personality(2) <../man2/personality.2.html>`__, 
`pidfd_getfd(2) <../man2/pidfd_getfd.2.html>`__, 
`pidfd_open(2) <../man2/pidfd_open.2.html>`__, 
`pidfd_send_signal(2) <../man2/pidfd_send_signal.2.html>`__, 
`pipe(2) <../man2/pipe.2.html>`__, 
`pivot_root(2) <../man2/pivot_root.2.html>`__, 
`pkey_alloc(2) <../man2/pkey_alloc.2.html>`__, 
`poll(2) <../man2/poll.2.html>`__, 
`prctl(2) <../man2/prctl.2.html>`__, 
`pread(2) <../man2/pread.2.html>`__, 
`process_madvise(2) <../man2/process_madvise.2.html>`__, 
`process_vm_readv(2) <../man2/process_vm_readv.2.html>`__, 
`ptrace(2) <../man2/ptrace.2.html>`__, 
`query_module(2) <../man2/query_module.2.html>`__, 
`quotactl(2) <../man2/quotactl.2.html>`__, 
`read(2) <../man2/read.2.html>`__, 
`readahead(2) <../man2/readahead.2.html>`__, 
`readdir(2) <../man2/readdir.2.html>`__, 
`readlink(2) <../man2/readlink.2.html>`__, 
`readv(2) <../man2/readv.2.html>`__, 
`reboot(2) <../man2/reboot.2.html>`__, 
`recv(2) <../man2/recv.2.html>`__, 
`recvmmsg(2) <../man2/recvmmsg.2.html>`__, 
`remap_file_pages(2) <../man2/remap_file_pages.2.html>`__, 
`removexattr(2) <../man2/removexattr.2.html>`__, 
`rename(2) <../man2/rename.2.html>`__, 
`request_key(2) <../man2/request_key.2.html>`__, 
`restart_syscall(2) <../man2/restart_syscall.2.html>`__, 
`rmdir(2) <../man2/rmdir.2.html>`__, 
`rt_sigqueueinfo(2) <../man2/rt_sigqueueinfo.2.html>`__, 
`s390_guarded_storage(2) <../man2/s390_guarded_storage.2.html>`__, 
`s390_pci_mmio_write(2) <../man2/s390_pci_mmio_write.2.html>`__, 
`s390_runtime_instr(2) <../man2/s390_runtime_instr.2.html>`__, 
`s390_sthyi(2) <../man2/s390_sthyi.2.html>`__, 
`sched_get_priority_max(2) <../man2/sched_get_priority_max.2.html>`__, 
`sched_rr_get_interval(2) <../man2/sched_rr_get_interval.2.html>`__, 
`sched_setaffinity(2) <../man2/sched_setaffinity.2.html>`__, 
`sched_setattr(2) <../man2/sched_setattr.2.html>`__, 
`sched_setparam(2) <../man2/sched_setparam.2.html>`__, 
`sched_setscheduler(2) <../man2/sched_setscheduler.2.html>`__, 
`sched_yield(2) <../man2/sched_yield.2.html>`__, 
`seccomp(2) <../man2/seccomp.2.html>`__, 
`seccomp_unotify(2) <../man2/seccomp_unotify.2.html>`__, 
`select(2) <../man2/select.2.html>`__, 
`select_tut(2) <../man2/select_tut.2.html>`__, 
`semctl(2) <../man2/semctl.2.html>`__, 
`semget(2) <../man2/semget.2.html>`__, 
`semop(2) <../man2/semop.2.html>`__, 
`send(2) <../man2/send.2.html>`__, 
`sendfile(2) <../man2/sendfile.2.html>`__, 
`sendmmsg(2) <../man2/sendmmsg.2.html>`__, 
`seteuid(2) <../man2/seteuid.2.html>`__, 
`setfsgid(2) <../man2/setfsgid.2.html>`__, 
`setfsuid(2) <../man2/setfsuid.2.html>`__, 
`setgid(2) <../man2/setgid.2.html>`__, 
`set_mempolicy(2) <../man2/set_mempolicy.2.html>`__, 
`setns(2) <../man2/setns.2.html>`__, 
`setpgid(2) <../man2/setpgid.2.html>`__, 
`setresuid(2) <../man2/setresuid.2.html>`__, 
`setreuid(2) <../man2/setreuid.2.html>`__, 
`setsid(2) <../man2/setsid.2.html>`__, 
`set_thread_area(2) <../man2/set_thread_area.2.html>`__, 
`setuid(2) <../man2/setuid.2.html>`__, 
`setxattr(2) <../man2/setxattr.2.html>`__, 
`shmctl(2) <../man2/shmctl.2.html>`__, 
`shmget(2) <../man2/shmget.2.html>`__, 
`shmop(2) <../man2/shmop.2.html>`__, 
`shutdown(2) <../man2/shutdown.2.html>`__, 
`sigaction(2) <../man2/sigaction.2.html>`__, 
`sigaltstack(2) <../man2/sigaltstack.2.html>`__, 
`signal(2) <../man2/signal.2.html>`__, 
`signalfd(2) <../man2/signalfd.2.html>`__, 
`sigpending(2) <../man2/sigpending.2.html>`__, 
`sigprocmask(2) <../man2/sigprocmask.2.html>`__, 
`sigreturn(2) <../man2/sigreturn.2.html>`__, 
`sigsuspend(2) <../man2/sigsuspend.2.html>`__, 
`sigwaitinfo(2) <../man2/sigwaitinfo.2.html>`__, 
`socket(2) <../man2/socket.2.html>`__, 
`socketpair(2) <../man2/socketpair.2.html>`__, 
`splice(2) <../man2/splice.2.html>`__, 
`spu_create(2) <../man2/spu_create.2.html>`__, 
`spu_run(2) <../man2/spu_run.2.html>`__, 
`stat(2) <../man2/stat.2.html>`__, 
`statfs(2) <../man2/statfs.2.html>`__, 
`statx(2) <../man2/statx.2.html>`__, 
`stime(2) <../man2/stime.2.html>`__, 
`swapon(2) <../man2/swapon.2.html>`__, 
`symlink(2) <../man2/symlink.2.html>`__, 
`sync(2) <../man2/sync.2.html>`__, 
`sync_file_range(2) <../man2/sync_file_range.2.html>`__, 
`syscall(2) <../man2/syscall.2.html>`__, 
`\_syscall(2) <../man2/_syscall.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`sysctl(2) <../man2/sysctl.2.html>`__, 
`sysfs(2) <../man2/sysfs.2.html>`__, 
`sysinfo(2) <../man2/sysinfo.2.html>`__, 
`syslog(2) <../man2/syslog.2.html>`__, 
`tee(2) <../man2/tee.2.html>`__,  `time(2) <../man2/time.2.html>`__, 
`timer_create(2) <../man2/timer_create.2.html>`__, 
`timer_delete(2) <../man2/timer_delete.2.html>`__, 
`timerfd_create(2) <../man2/timerfd_create.2.html>`__, 
`timer_getoverrun(2) <../man2/timer_getoverrun.2.html>`__, 
`timer_settime(2) <../man2/timer_settime.2.html>`__, 
`times(2) <../man2/times.2.html>`__, 
`tkill(2) <../man2/tkill.2.html>`__, 
`truncate(2) <../man2/truncate.2.html>`__, 
`umount(2) <../man2/umount.2.html>`__, 
`uname(2) <../man2/uname.2.html>`__, 
`unimplemented(2) <../man2/unimplemented.2.html>`__, 
`unlink(2) <../man2/unlink.2.html>`__, 
`unshare(2) <../man2/unshare.2.html>`__, 
`uselib(2) <../man2/uselib.2.html>`__, 
`userfaultfd(2) <../man2/userfaultfd.2.html>`__, 
`ustat(2) <../man2/ustat.2.html>`__, 
`utime(2) <../man2/utime.2.html>`__, 
`utimensat(2) <../man2/utimensat.2.html>`__, 
`vhangup(2) <../man2/vhangup.2.html>`__, 
`vm86(2) <../man2/vm86.2.html>`__, 
`vmsplice(2) <../man2/vmsplice.2.html>`__, 
`wait(2) <../man2/wait.2.html>`__, 
`write(2) <../man2/write.2.html>`__, 
`accept(3p) <../man3/accept.3p.html>`__, 
`access(3p) <../man3/access.3p.html>`__, 
`acl_add_perm(3) <../man3/acl_add_perm.3.html>`__, 
`acl_calc_mask(3) <../man3/acl_calc_mask.3.html>`__, 
`acl_check(3) <../man3/acl_check.3.html>`__, 
`acl_clear_perms(3) <../man3/acl_clear_perms.3.html>`__, 
`acl_cmp(3) <../man3/acl_cmp.3.html>`__, 
`acl_copy_entry(3) <../man3/acl_copy_entry.3.html>`__, 
`acl_copy_ext(3) <../man3/acl_copy_ext.3.html>`__, 
`acl_copy_int(3) <../man3/acl_copy_int.3.html>`__, 
`acl_create_entry(3) <../man3/acl_create_entry.3.html>`__, 
`acl_delete_def_file(3) <../man3/acl_delete_def_file.3.html>`__, 
`acl_delete_entry(3) <../man3/acl_delete_entry.3.html>`__, 
`acl_delete_perm(3) <../man3/acl_delete_perm.3.html>`__, 
`acl_dup(3) <../man3/acl_dup.3.html>`__, 
`acl_entries(3) <../man3/acl_entries.3.html>`__, 
`acl_equiv_mode(3) <../man3/acl_equiv_mode.3.html>`__, 
`acl_extended_fd(3) <../man3/acl_extended_fd.3.html>`__, 
`acl_extended_file(3) <../man3/acl_extended_file.3.html>`__, 
`acl_free(3) <../man3/acl_free.3.html>`__, 
`acl_from_mode(3) <../man3/acl_from_mode.3.html>`__, 
`acl_from_text(3) <../man3/acl_from_text.3.html>`__, 
`acl_get_entry(3) <../man3/acl_get_entry.3.html>`__, 
`acl_get_fd(3) <../man3/acl_get_fd.3.html>`__, 
`acl_get_file(3) <../man3/acl_get_file.3.html>`__, 
`acl_get_perm(3) <../man3/acl_get_perm.3.html>`__, 
`acl_get_permset(3) <../man3/acl_get_permset.3.html>`__, 
`acl_get_qualifier(3) <../man3/acl_get_qualifier.3.html>`__, 
`acl_get_tag_type(3) <../man3/acl_get_tag_type.3.html>`__, 
`acl_init(3) <../man3/acl_init.3.html>`__, 
`acl_set_fd(3) <../man3/acl_set_fd.3.html>`__, 
`acl_set_file(3) <../man3/acl_set_file.3.html>`__, 
`acl_set_permset(3) <../man3/acl_set_permset.3.html>`__, 
`acl_set_qualifier(3) <../man3/acl_set_qualifier.3.html>`__, 
`acl_set_tag_type(3) <../man3/acl_set_tag_type.3.html>`__, 
`acl_size(3) <../man3/acl_size.3.html>`__, 
`acl_to_any_text(3) <../man3/acl_to_any_text.3.html>`__, 
`acl_to_text(3) <../man3/acl_to_text.3.html>`__, 
`acl_valid(3) <../man3/acl_valid.3.html>`__, 
`acos(3) <../man3/acos.3.html>`__, 
`acos(3p) <../man3/acos.3p.html>`__, 
`acosh(3) <../man3/acosh.3.html>`__, 
`acosh(3p) <../man3/acosh.3p.html>`__, 
`adjtime(3) <../man3/adjtime.3.html>`__, 
`aio_cancel(3) <../man3/aio_cancel.3.html>`__, 
`aio_cancel(3p) <../man3/aio_cancel.3p.html>`__, 
`aio_error(3) <../man3/aio_error.3.html>`__, 
`aio_error(3p) <../man3/aio_error.3p.html>`__, 
`aio_fsync(3) <../man3/aio_fsync.3.html>`__, 
`aio_fsync(3p) <../man3/aio_fsync.3p.html>`__, 
`aio_read(3) <../man3/aio_read.3.html>`__, 
`aio_read(3p) <../man3/aio_read.3p.html>`__, 
`aio_return(3) <../man3/aio_return.3.html>`__, 
`aio_return(3p) <../man3/aio_return.3p.html>`__, 
`aio_suspend(3) <../man3/aio_suspend.3.html>`__, 
`aio_suspend(3p) <../man3/aio_suspend.3p.html>`__, 
`aio_write(3) <../man3/aio_write.3.html>`__, 
`aio_write(3p) <../man3/aio_write.3p.html>`__, 
`alphasort(3p) <../man3/alphasort.3p.html>`__, 
`asin(3) <../man3/asin.3.html>`__, 
`asin(3p) <../man3/asin.3p.html>`__, 
`asinh(3p) <../man3/asinh.3p.html>`__, 
`atan2(3p) <../man3/atan2.3p.html>`__, 
`atan(3p) <../man3/atan.3p.html>`__, 
`atanh(3) <../man3/atanh.3.html>`__, 
`atanh(3p) <../man3/atanh.3p.html>`__, 
`atoi(3) <../man3/atoi.3.html>`__, 
`attr_get(3) <../man3/attr_get.3.html>`__, 
`attr_list(3) <../man3/attr_list.3.html>`__, 
`attr_multi(3) <../man3/attr_multi.3.html>`__, 
`attr_remove(3) <../man3/attr_remove.3.html>`__, 
`attr_set(3) <../man3/attr_set.3.html>`__, 
`audit_open(3) <../man3/audit_open.3.html>`__, 
`avc_add_callback(3) <../man3/avc_add_callback.3.html>`__, 
`avc_compute_create(3) <../man3/avc_compute_create.3.html>`__, 
`avc_context_to_sid(3) <../man3/avc_context_to_sid.3.html>`__, 
`avc_has_perm(3) <../man3/avc_has_perm.3.html>`__, 
`avc_init(3) <../man3/avc_init.3.html>`__, 
`avc_netlink_loop(3) <../man3/avc_netlink_loop.3.html>`__, 
`avc_open(3) <../man3/avc_open.3.html>`__, 
`bind(3p) <../man3/bind.3p.html>`__, 
`bindresvport(3) <../man3/bindresvport.3.html>`__, 
`btree(3) <../man3/btree.3.html>`__, 
`calloc(3p) <../man3/calloc.3p.html>`__, 
`canonicalize_file_name(3) <../man3/canonicalize_file_name.3.html>`__, 
`cap_clear(3) <../man3/cap_clear.3.html>`__, 
`cap_from_text(3) <../man3/cap_from_text.3.html>`__, 
`cap_get_file(3) <../man3/cap_get_file.3.html>`__, 
`cap_get_proc(3) <../man3/cap_get_proc.3.html>`__, 
`cap_iab(3) <../man3/cap_iab.3.html>`__, 
`cap_init(3) <../man3/cap_init.3.html>`__, 
`cap_launch(3) <../man3/cap_launch.3.html>`__, 
`catclose(3p) <../man3/catclose.3p.html>`__, 
`catgets(3p) <../man3/catgets.3p.html>`__, 
`catopen(3) <../man3/catopen.3.html>`__, 
`catopen(3p) <../man3/catopen.3p.html>`__, 
`ceil(3) <../man3/ceil.3.html>`__, 
`cfree(3) <../man3/cfree.3.html>`__, 
`cfsetispeed(3p) <../man3/cfsetispeed.3p.html>`__, 
`cfsetospeed(3p) <../man3/cfsetospeed.3p.html>`__, 
`chdir(3p) <../man3/chdir.3p.html>`__, 
`chmod(3p) <../man3/chmod.3p.html>`__, 
`chown(3p) <../man3/chown.3p.html>`__, 
`clearerr(3p) <../man3/clearerr.3p.html>`__, 
`clock_getres(3p) <../man3/clock_getres.3p.html>`__, 
`close(3p) <../man3/close.3p.html>`__, 
`closedir(3) <../man3/closedir.3.html>`__, 
`closedir(3p) <../man3/closedir.3p.html>`__, 
`closelog(3p) <../man3/closelog.3p.html>`__, 
`confstr(3) <../man3/confstr.3.html>`__, 
`confstr(3p) <../man3/confstr.3p.html>`__, 
`connect(3p) <../man3/connect.3p.html>`__, 
`context_new(3) <../man3/context_new.3.html>`__, 
`cos(3) <../man3/cos.3.html>`__,  `cos(3p) <../man3/cos.3p.html>`__, 
`cosh(3) <../man3/cosh.3.html>`__, 
`cosh(3p) <../man3/cosh.3p.html>`__, 
`crypt(3p) <../man3/crypt.3p.html>`__, 
`ctime(3) <../man3/ctime.3.html>`__, 
`daemon(3) <../man3/daemon.3.html>`__, 
`dbopen(3) <../man3/dbopen.3.html>`__, 
`dirfd(3) <../man3/dirfd.3.html>`__, 
`dirfd(3p) <../man3/dirfd.3p.html>`__, 
`dup(3p) <../man3/dup.3p.html>`__, 
`duplocale(3) <../man3/duplocale.3.html>`__, 
`duplocale(3p) <../man3/duplocale.3p.html>`__, 
`encrypt(3) <../man3/encrypt.3.html>`__, 
`encrypt(3p) <../man3/encrypt.3p.html>`__, 
`endgrent(3p) <../man3/endgrent.3p.html>`__, 
`endpwent(3p) <../man3/endpwent.3p.html>`__, 
`erf(3) <../man3/erf.3.html>`__,  `erf(3p) <../man3/erf.3p.html>`__, 
`erfc(3) <../man3/erfc.3.html>`__, 
`erfc(3p) <../man3/erfc.3p.html>`__,  `err(3) <../man3/err.3.html>`__, 
`errno(3p) <../man3/errno.3p.html>`__, 
`error(3) <../man3/error.3.html>`__, 
`euidaccess(3) <../man3/euidaccess.3.html>`__, 
`exec(3) <../man3/exec.3.html>`__, 
`exec(3p) <../man3/exec.3p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`exp10(3) <../man3/exp10.3.html>`__, 
`exp2(3p) <../man3/exp2.3p.html>`__,  `exp(3) <../man3/exp.3.html>`__, 
`exp(3p) <../man3/exp.3p.html>`__, 
`expm1(3) <../man3/expm1.3.html>`__, 
`expm1(3p) <../man3/expm1.3p.html>`__, 
`fattach(3p) <../man3/fattach.3p.html>`__, 
`fchdir(3p) <../man3/fchdir.3p.html>`__, 
`fchmod(3p) <../man3/fchmod.3p.html>`__, 
`fchown(3p) <../man3/fchown.3p.html>`__, 
`fclose(3) <../man3/fclose.3.html>`__, 
`fclose(3p) <../man3/fclose.3p.html>`__, 
`fcntl(3p) <../man3/fcntl.3p.html>`__, 
`fdatasync(3p) <../man3/fdatasync.3p.html>`__, 
`fdetach(3p) <../man3/fdetach.3p.html>`__, 
`fdim(3) <../man3/fdim.3.html>`__, 
`fdim(3p) <../man3/fdim.3p.html>`__, 
`fdopen(3p) <../man3/fdopen.3p.html>`__, 
`fdopendir(3p) <../man3/fdopendir.3p.html>`__, 
`feof(3p) <../man3/feof.3p.html>`__, 
`ferror(3) <../man3/ferror.3.html>`__, 
`ferror(3p) <../man3/ferror.3p.html>`__, 
`fexecve(3) <../man3/fexecve.3.html>`__, 
`fflush(3) <../man3/fflush.3.html>`__, 
`fflush(3p) <../man3/fflush.3p.html>`__, 
`fgetc(3p) <../man3/fgetc.3p.html>`__, 
`fgetgrent(3) <../man3/fgetgrent.3.html>`__, 
`fgetpos(3p) <../man3/fgetpos.3p.html>`__, 
`fgetpwent(3) <../man3/fgetpwent.3.html>`__, 
`fgets(3p) <../man3/fgets.3p.html>`__, 
`fgetwc(3) <../man3/fgetwc.3.html>`__, 
`fgetwc(3p) <../man3/fgetwc.3p.html>`__, 
`fgetws(3p) <../man3/fgetws.3p.html>`__, 
`fileno(3) <../man3/fileno.3.html>`__, 
`fileno(3p) <../man3/fileno.3p.html>`__, 
`floor(3) <../man3/floor.3.html>`__,  `fma(3) <../man3/fma.3.html>`__, 
`fma(3p) <../man3/fma.3p.html>`__, 
`fmemopen(3) <../man3/fmemopen.3.html>`__, 
`fmemopen(3p) <../man3/fmemopen.3p.html>`__, 
`fmod(3) <../man3/fmod.3.html>`__, 
`fmod(3p) <../man3/fmod.3p.html>`__, 
`fopen(3) <../man3/fopen.3.html>`__, 
`fopen(3p) <../man3/fopen.3p.html>`__, 
`fork(3p) <../man3/fork.3p.html>`__, 
`form(3x) <../man3/form.3x.html>`__, 
`form_cursor(3x) <../man3/form_cursor.3x.html>`__, 
`form_driver(3x) <../man3/form_driver.3x.html>`__, 
`form_field(3x) <../man3/form_field.3x.html>`__, 
`form_field_attributes(3x) <../man3/form_field_attributes.3x.html>`__, 
`form_field_buffer(3x) <../man3/form_field_buffer.3x.html>`__, 
`form_field_info(3x) <../man3/form_field_info.3x.html>`__, 
`form_field_just(3x) <../man3/form_field_just.3x.html>`__, 
`form_field_opts(3x) <../man3/form_field_opts.3x.html>`__, 
`form_fieldtype(3x) <../man3/form_fieldtype.3x.html>`__, 
`form_field_validation(3x) <../man3/form_field_validation.3x.html>`__, 
`form_hook(3x) <../man3/form_hook.3x.html>`__, 
`form_opts(3x) <../man3/form_opts.3x.html>`__, 
`form_page(3x) <../man3/form_page.3x.html>`__, 
`form_post(3x) <../man3/form_post.3x.html>`__, 
`form_win(3x) <../man3/form_win.3x.html>`__, 
`fpathconf(3) <../man3/fpathconf.3.html>`__, 
`fpathconf(3p) <../man3/fpathconf.3p.html>`__, 
`fprintf(3p) <../man3/fprintf.3p.html>`__, 
`fpurge(3) <../man3/fpurge.3.html>`__, 
`fputc(3p) <../man3/fputc.3p.html>`__, 
`fputs(3p) <../man3/fputs.3p.html>`__, 
`fputwc(3) <../man3/fputwc.3.html>`__, 
`fputwc(3p) <../man3/fputwc.3p.html>`__, 
`fputws(3p) <../man3/fputws.3p.html>`__, 
`fread(3p) <../man3/fread.3p.html>`__, 
`freeaddrinfo(3p) <../man3/freeaddrinfo.3p.html>`__, 
`freopen(3p) <../man3/freopen.3p.html>`__, 
`fscanf(3p) <../man3/fscanf.3p.html>`__, 
`fseek(3) <../man3/fseek.3.html>`__, 
`fseek(3p) <../man3/fseek.3p.html>`__, 
`fseeko(3) <../man3/fseeko.3.html>`__, 
`fsetpos(3p) <../man3/fsetpos.3p.html>`__, 
`fstat(3p) <../man3/fstat.3p.html>`__, 
`fstatat(3p) <../man3/fstatat.3p.html>`__, 
`fstatvfs(3p) <../man3/fstatvfs.3p.html>`__, 
`fsync(3p) <../man3/fsync.3p.html>`__, 
`ftell(3p) <../man3/ftell.3p.html>`__, 
`ftok(3) <../man3/ftok.3.html>`__, 
`ftok(3p) <../man3/ftok.3p.html>`__, 
`ftruncate(3p) <../man3/ftruncate.3p.html>`__, 
`fts(3) <../man3/fts.3.html>`__,  `ftw(3p) <../man3/ftw.3p.html>`__, 
`futimens(3p) <../man3/futimens.3p.html>`__, 
`futimes(3) <../man3/futimes.3.html>`__, 
`fwide(3p) <../man3/fwide.3p.html>`__, 
`fwprintf(3p) <../man3/fwprintf.3p.html>`__, 
`fwrite(3p) <../man3/fwrite.3p.html>`__, 
`fwscanf(3p) <../man3/fwscanf.3p.html>`__, 
`getaddrinfo(3) <../man3/getaddrinfo.3.html>`__, 
`getcontext(3) <../man3/getcontext.3.html>`__, 
`getcwd(3) <../man3/getcwd.3.html>`__, 
`getcwd(3p) <../man3/getcwd.3p.html>`__, 
`getdate(3) <../man3/getdate.3.html>`__, 
`getdate(3p) <../man3/getdate.3p.html>`__, 
`getdelim(3p) <../man3/getdelim.3p.html>`__, 
`getdirentries(3) <../man3/getdirentries.3.html>`__, 
`getegid(3p) <../man3/getegid.3p.html>`__, 
`getentropy(3) <../man3/getentropy.3.html>`__, 
`geteuid(3p) <../man3/geteuid.3p.html>`__, 
`getfilecon(3) <../man3/getfilecon.3.html>`__, 
`getgid(3p) <../man3/getgid.3p.html>`__, 
`getgrent(3) <../man3/getgrent.3.html>`__, 
`getgrgid(3p) <../man3/getgrgid.3p.html>`__, 
`getgrnam(3) <../man3/getgrnam.3.html>`__, 
`getgrnam(3p) <../man3/getgrnam.3p.html>`__, 
`getgroups(3p) <../man3/getgroups.3p.html>`__, 
`gethostid(3) <../man3/gethostid.3.html>`__, 
`getifaddrs(3) <../man3/getifaddrs.3.html>`__, 
`getitimer(3p) <../man3/getitimer.3p.html>`__, 
`getline(3) <../man3/getline.3.html>`__, 
`getlogin(3) <../man3/getlogin.3.html>`__, 
`getlogin(3p) <../man3/getlogin.3p.html>`__, 
`getmsg(3p) <../man3/getmsg.3p.html>`__, 
`getnameinfo(3) <../man3/getnameinfo.3.html>`__, 
`getnameinfo(3p) <../man3/getnameinfo.3p.html>`__, 
`getopt(3p) <../man3/getopt.3p.html>`__, 
`getpass(3) <../man3/getpass.3.html>`__, 
`getpeername(3p) <../man3/getpeername.3p.html>`__, 
`getpgid(3p) <../man3/getpgid.3p.html>`__, 
`get_phys_pages(3) <../man3/get_phys_pages.3.html>`__, 
`getpriority(3p) <../man3/getpriority.3p.html>`__, 
`getpt(3) <../man3/getpt.3.html>`__, 
`getpw(3) <../man3/getpw.3.html>`__, 
`getpwent(3) <../man3/getpwent.3.html>`__, 
`getpwnam(3) <../man3/getpwnam.3.html>`__, 
`getpwnam(3p) <../man3/getpwnam.3p.html>`__, 
`getpwuid(3p) <../man3/getpwuid.3p.html>`__, 
`getrlimit(3p) <../man3/getrlimit.3p.html>`__, 
`getrusage(3p) <../man3/getrusage.3p.html>`__, 
`gets(3p) <../man3/gets.3p.html>`__, 
`getseuserbyname(3) <../man3/getseuserbyname.3.html>`__, 
`getsid(3p) <../man3/getsid.3p.html>`__, 
`getsockname(3p) <../man3/getsockname.3p.html>`__, 
`getsockopt(3p) <../man3/getsockopt.3p.html>`__, 
`getspnam(3) <../man3/getspnam.3.html>`__, 
`getuid(3p) <../man3/getuid.3p.html>`__, 
`getutent(3) <../man3/getutent.3.html>`__, 
`getwchar(3) <../man3/getwchar.3.html>`__, 
`glob(3) <../man3/glob.3.html>`__, 
`glob(3p) <../man3/glob.3p.html>`__, 
`gmtime(3p) <../man3/gmtime.3p.html>`__, 
`gnutls_transport_set_errno(3) <../man3/gnutls_transport_set_errno.3.html>`__, 
`grantpt(3) <../man3/grantpt.3.html>`__, 
`grantpt(3p) <../man3/grantpt.3p.html>`__, 
`handle(3) <../man3/handle.3.html>`__, 
`hash(3) <../man3/hash.3.html>`__, 
`hsearch(3) <../man3/hsearch.3.html>`__, 
`hypot(3) <../man3/hypot.3.html>`__, 
`hypot(3p) <../man3/hypot.3p.html>`__, 
`iconv(3) <../man3/iconv.3.html>`__, 
`iconv(3p) <../man3/iconv.3p.html>`__, 
`iconv_close(3) <../man3/iconv_close.3.html>`__, 
`iconv_close(3p) <../man3/iconv_close.3p.html>`__, 
`iconv_open(3) <../man3/iconv_open.3.html>`__, 
`iconv_open(3p) <../man3/iconv_open.3p.html>`__, 
`if_indextoname(3p) <../man3/if_indextoname.3p.html>`__, 
`if_nameindex(3) <../man3/if_nameindex.3.html>`__, 
`if_nameindex(3p) <../man3/if_nameindex.3p.html>`__, 
`if_nametoindex(3) <../man3/if_nametoindex.3.html>`__, 
`ilogb(3) <../man3/ilogb.3.html>`__, 
`ilogb(3p) <../man3/ilogb.3p.html>`__, 
`inet_net_pton(3) <../man3/inet_net_pton.3.html>`__, 
`inet_ntop(3) <../man3/inet_ntop.3.html>`__, 
`inet_ntop(3p) <../man3/inet_ntop.3p.html>`__, 
`inet_pton(3) <../man3/inet_pton.3.html>`__, 
`initgroups(3) <../man3/initgroups.3.html>`__, 
`intro(3) <../man3/intro.3.html>`__, 
`ioctl(3p) <../man3/ioctl.3p.html>`__, 
`isastream(3p) <../man3/isastream.3p.html>`__, 
`isatty(3) <../man3/isatty.3.html>`__, 
`isatty(3p) <../man3/isatty.3p.html>`__, 
`isfdtype(3) <../man3/isfdtype.3.html>`__, 
`j0(3) <../man3/j0.3.html>`__,  `j0(3p) <../man3/j0.3p.html>`__, 
`keyctl_capabilities(3) <../man3/keyctl_capabilities.3.html>`__, 
`keyctl_chown(3) <../man3/keyctl_chown.3.html>`__, 
`keyctl_clear(3) <../man3/keyctl_clear.3.html>`__, 
`keyctl_describe(3) <../man3/keyctl_describe.3.html>`__, 
`keyctl_get_keyring_ID(3) <../man3/keyctl_get_keyring_ID.3.html>`__, 
`keyctl_get_persistent(3) <../man3/keyctl_get_persistent.3.html>`__, 
`keyctl_get_security(3) <../man3/keyctl_get_security.3.html>`__, 
`keyctl_instantiate(3) <../man3/keyctl_instantiate.3.html>`__, 
`keyctl_invalidate(3) <../man3/keyctl_invalidate.3.html>`__, 
`keyctl_join_session_keyring(3) <../man3/keyctl_join_session_keyring.3.html>`__, 
`keyctl_link(3) <../man3/keyctl_link.3.html>`__, 
`keyctl_move(3) <../man3/keyctl_move.3.html>`__, 
`keyctl_pkey_encrypt(3) <../man3/keyctl_pkey_encrypt.3.html>`__, 
`keyctl_pkey_query(3) <../man3/keyctl_pkey_query.3.html>`__, 
`keyctl_pkey_sign(3) <../man3/keyctl_pkey_sign.3.html>`__, 
`keyctl_read(3) <../man3/keyctl_read.3.html>`__, 
`keyctl_restrict_keyring(3) <../man3/keyctl_restrict_keyring.3.html>`__, 
`keyctl_revoke(3) <../man3/keyctl_revoke.3.html>`__, 
`keyctl_search(3) <../man3/keyctl_search.3.html>`__, 
`keyctl_session_to_parent(3) <../man3/keyctl_session_to_parent.3.html>`__, 
`keyctl_setperm(3) <../man3/keyctl_setperm.3.html>`__, 
`keyctl_set_reqkey_keyring(3) <../man3/keyctl_set_reqkey_keyring.3.html>`__, 
`keyctl_set_timeout(3) <../man3/keyctl_set_timeout.3.html>`__, 
`keyctl_update(3) <../man3/keyctl_update.3.html>`__, 
`keyctl_watch_key(3) <../man3/keyctl_watch_key.3.html>`__, 
`kill(3p) <../man3/kill.3p.html>`__, 
`killpg(3) <../man3/killpg.3.html>`__, 
`lchown(3p) <../man3/lchown.3p.html>`__, 
`ldap_dup(3) <../man3/ldap_dup.3.html>`__, 
`ldap_get_dn(3) <../man3/ldap_get_dn.3.html>`__, 
`ldap_open(3) <../man3/ldap_open.3.html>`__, 
`ldexp(3) <../man3/ldexp.3.html>`__, 
`ldexp(3p) <../man3/ldexp.3p.html>`__, 
`lgamma(3) <../man3/lgamma.3.html>`__, 
`lgamma(3p) <../man3/lgamma.3p.html>`__, 
`libcap(3) <../man3/libcap.3.html>`__, 
`libpsx(3) <../man3/libpsx.3.html>`__, 
`link(3p) <../man3/link.3p.html>`__, 
`lio_listio(3) <../man3/lio_listio.3.html>`__, 
`lio_listio(3p) <../man3/lio_listio.3p.html>`__, 
`listen(3p) <../man3/listen.3p.html>`__, 
`llrint(3p) <../man3/llrint.3p.html>`__, 
`llround(3p) <../man3/llround.3p.html>`__, 
`localtime(3p) <../man3/localtime.3p.html>`__, 
`lockf(3) <../man3/lockf.3.html>`__, 
`lockf(3p) <../man3/lockf.3p.html>`__, 
`log10(3p) <../man3/log10.3p.html>`__, 
`log1p(3) <../man3/log1p.3.html>`__, 
`log1p(3p) <../man3/log1p.3p.html>`__, 
`log2(3p) <../man3/log2.3p.html>`__,  `log(3) <../man3/log.3.html>`__, 
`log(3p) <../man3/log.3p.html>`__,  `logb(3) <../man3/logb.3.html>`__, 
`logb(3p) <../man3/logb.3p.html>`__, 
`lrint(3) <../man3/lrint.3.html>`__, 
`lrint(3p) <../man3/lrint.3p.html>`__, 
`lround(3) <../man3/lround.3.html>`__, 
`lround(3p) <../man3/lround.3p.html>`__, 
`lseek(3p) <../man3/lseek.3p.html>`__, 
`makecontext(3) <../man3/makecontext.3.html>`__, 
`malloc(3) <../man3/malloc.3.html>`__, 
`malloc(3p) <../man3/malloc.3p.html>`__, 
`malloc_info(3) <../man3/malloc_info.3.html>`__, 
`mallopt(3) <../man3/mallopt.3.html>`__, 
`matherr(3) <../man3/matherr.3.html>`__, 
`mblen(3p) <../man3/mblen.3p.html>`__, 
`mbrlen(3) <../man3/mbrlen.3.html>`__, 
`mbrlen(3p) <../man3/mbrlen.3p.html>`__, 
`mbrtowc(3) <../man3/mbrtowc.3.html>`__, 
`mbrtowc(3p) <../man3/mbrtowc.3p.html>`__, 
`mbsnrtowcs(3) <../man3/mbsnrtowcs.3.html>`__, 
`mbsrtowcs(3) <../man3/mbsrtowcs.3.html>`__, 
`mbsrtowcs(3p) <../man3/mbsrtowcs.3p.html>`__, 
`mbstowcs(3p) <../man3/mbstowcs.3p.html>`__, 
`mbtowc(3p) <../man3/mbtowc.3p.html>`__, 
`menu(3x) <../man3/menu.3x.html>`__, 
`menu_attributes(3x) <../man3/menu_attributes.3x.html>`__, 
`menu_cursor(3x) <../man3/menu_cursor.3x.html>`__, 
`menu_driver(3x) <../man3/menu_driver.3x.html>`__, 
`menu_format(3x) <../man3/menu_format.3x.html>`__, 
`menu_hook(3x) <../man3/menu_hook.3x.html>`__, 
`menu_items(3x) <../man3/menu_items.3x.html>`__, 
`menu_mark(3x) <../man3/menu_mark.3x.html>`__, 
`menu_new(3x) <../man3/menu_new.3x.html>`__, 
`menu_opts(3x) <../man3/menu_opts.3x.html>`__, 
`menu_pattern(3x) <../man3/menu_pattern.3x.html>`__, 
`menu_post(3x) <../man3/menu_post.3x.html>`__, 
`menu_win(3x) <../man3/menu_win.3x.html>`__, 
`mitem_current(3x) <../man3/mitem_current.3x.html>`__, 
`mitem_new(3x) <../man3/mitem_new.3x.html>`__, 
`mitem_opts(3x) <../man3/mitem_opts.3x.html>`__, 
`mitem_value(3x) <../man3/mitem_value.3x.html>`__, 
`mkdir(3p) <../man3/mkdir.3p.html>`__, 
`mkdtemp(3) <../man3/mkdtemp.3.html>`__, 
`mkdtemp(3p) <../man3/mkdtemp.3p.html>`__, 
`mkfifo(3) <../man3/mkfifo.3.html>`__, 
`mkfifo(3p) <../man3/mkfifo.3p.html>`__, 
`mknod(3p) <../man3/mknod.3p.html>`__, 
`mkstemp(3) <../man3/mkstemp.3.html>`__, 
`mktemp(3) <../man3/mktemp.3.html>`__, 
`mktime(3p) <../man3/mktime.3p.html>`__, 
`mlock(3p) <../man3/mlock.3p.html>`__, 
`mlockall(3p) <../man3/mlockall.3p.html>`__, 
`mmap(3p) <../man3/mmap.3p.html>`__, 
`mmv_stats_init(3) <../man3/mmv_stats_init.3.html>`__, 
`mmv_stats_registry(3) <../man3/mmv_stats_registry.3.html>`__, 
`mpool(3) <../man3/mpool.3.html>`__, 
`mprotect(3p) <../man3/mprotect.3p.html>`__, 
`mq_close(3) <../man3/mq_close.3.html>`__, 
`mq_close(3p) <../man3/mq_close.3p.html>`__, 
`mq_getattr(3) <../man3/mq_getattr.3.html>`__, 
`mq_getattr(3p) <../man3/mq_getattr.3p.html>`__, 
`mq_notify(3) <../man3/mq_notify.3.html>`__, 
`mq_notify(3p) <../man3/mq_notify.3p.html>`__, 
`mq_open(3) <../man3/mq_open.3.html>`__, 
`mq_open(3p) <../man3/mq_open.3p.html>`__, 
`mq_receive(3) <../man3/mq_receive.3.html>`__, 
`mq_receive(3p) <../man3/mq_receive.3p.html>`__, 
`mq_send(3) <../man3/mq_send.3.html>`__, 
`mq_send(3p) <../man3/mq_send.3p.html>`__, 
`mq_setattr(3p) <../man3/mq_setattr.3p.html>`__, 
`mq_unlink(3) <../man3/mq_unlink.3.html>`__, 
`mq_unlink(3p) <../man3/mq_unlink.3p.html>`__, 
`msgctl(3p) <../man3/msgctl.3p.html>`__, 
`msgget(3p) <../man3/msgget.3p.html>`__, 
`msgrcv(3p) <../man3/msgrcv.3p.html>`__, 
`msgsnd(3p) <../man3/msgsnd.3p.html>`__, 
`msync(3p) <../man3/msync.3p.html>`__, 
`munmap(3p) <../man3/munmap.3p.html>`__, 
`nanosleep(3p) <../man3/nanosleep.3p.html>`__, 
`newlocale(3) <../man3/newlocale.3.html>`__, 
`newlocale(3p) <../man3/newlocale.3p.html>`__, 
`nextafter(3) <../man3/nextafter.3.html>`__, 
`nextafter(3p) <../man3/nextafter.3p.html>`__, 
`nftw(3p) <../man3/nftw.3p.html>`__, 
`nice(3p) <../man3/nice.3p.html>`__, 
`numa(3) <../man3/numa.3.html>`__, 
`open(3p) <../man3/open.3p.html>`__, 
`opendir(3) <../man3/opendir.3.html>`__, 
`open_memstream(3) <../man3/open_memstream.3.html>`__, 
`open_memstream(3p) <../man3/open_memstream.3p.html>`__, 
`openpty(3) <../man3/openpty.3.html>`__, 
`pause(3p) <../man3/pause.3p.html>`__, 
`pclose(3p) <../man3/pclose.3p.html>`__, 
`pcpintro(3) <../man3/pcpintro.3.html>`__, 
`perror(3) <../man3/perror.3.html>`__, 
`perror(3p) <../man3/perror.3p.html>`__, 
`pipe(3p) <../man3/pipe.3p.html>`__, 
`pmfault(3) <../man3/pmfault.3.html>`__, 
`pmfstring(3) <../man3/pmfstring.3.html>`__, 
`pmrecord(3) <../man3/pmrecord.3.html>`__, 
`poll(3p) <../man3/poll.3p.html>`__, 
`popen(3) <../man3/popen.3.html>`__, 
`popen(3p) <../man3/popen.3p.html>`__, 
`posix_fallocate(3) <../man3/posix_fallocate.3.html>`__, 
`posix_memalign(3) <../man3/posix_memalign.3.html>`__, 
`posix_openpt(3) <../man3/posix_openpt.3.html>`__, 
`posix_openpt(3p) <../man3/posix_openpt.3p.html>`__, 
`posix_typed_mem_open(3p) <../man3/posix_typed_mem_open.3p.html>`__, 
`pow(3) <../man3/pow.3.html>`__,  `pow(3p) <../man3/pow.3p.html>`__, 
`pselect(3p) <../man3/pselect.3p.html>`__, 
`psiginfo(3p) <../man3/psiginfo.3p.html>`__, 
`pthread_sigmask(3p) <../man3/pthread_sigmask.3p.html>`__, 
`ptsname(3) <../man3/ptsname.3.html>`__, 
`ptsname(3p) <../man3/ptsname.3p.html>`__, 
`putenv(3) <../man3/putenv.3.html>`__, 
`putenv(3p) <../man3/putenv.3p.html>`__, 
`putmsg(3p) <../man3/putmsg.3p.html>`__, 
`putpwent(3) <../man3/putpwent.3.html>`__, 
`puts(3p) <../man3/puts.3p.html>`__, 
`putwchar(3) <../man3/putwchar.3.html>`__, 
`raise(3p) <../man3/raise.3p.html>`__, 
`random(3) <../man3/random.3.html>`__, 
`random_r(3) <../man3/random_r.3.html>`__, 
`rcmd(3) <../man3/rcmd.3.html>`__, 
`read(3p) <../man3/read.3p.html>`__, 
`readdir(3) <../man3/readdir.3.html>`__, 
`readdir(3p) <../man3/readdir.3p.html>`__, 
`readlink(3p) <../man3/readlink.3p.html>`__, 
`realloc(3p) <../man3/realloc.3p.html>`__, 
`realpath(3) <../man3/realpath.3.html>`__, 
`realpath(3p) <../man3/realpath.3p.html>`__, 
`recno(3) <../man3/recno.3.html>`__, 
`recursive_key_scan(3) <../man3/recursive_key_scan.3.html>`__, 
`recv(3p) <../man3/recv.3p.html>`__, 
`recvfrom(3p) <../man3/recvfrom.3p.html>`__, 
`recvmsg(3p) <../man3/recvmsg.3p.html>`__, 
`regcomp(3p) <../man3/regcomp.3p.html>`__, 
`remainder(3) <../man3/remainder.3.html>`__, 
`remainder(3p) <../man3/remainder.3p.html>`__, 
`remove(3) <../man3/remove.3.html>`__, 
`remquo(3) <../man3/remquo.3.html>`__, 
`remquo(3p) <../man3/remquo.3p.html>`__, 
`rename(3p) <../man3/rename.3p.html>`__, 
`rewind(3p) <../man3/rewind.3p.html>`__, 
`rint(3) <../man3/rint.3.html>`__, 
`rint(3p) <../man3/rint.3p.html>`__, 
`rmdir(3p) <../man3/rmdir.3p.html>`__, 
`round(3) <../man3/round.3.html>`__, 
`rpmatch(3) <../man3/rpmatch.3.html>`__, 
`rtime(3) <../man3/rtime.3.html>`__, 
`scalb(3) <../man3/scalb.3.html>`__, 
`scalbln(3) <../man3/scalbln.3.html>`__, 
`scalbln(3p) <../man3/scalbln.3p.html>`__, 
`scandir(3) <../man3/scandir.3.html>`__, 
`scanf(3) <../man3/scanf.3.html>`__, 
`sched_getcpu(3) <../man3/sched_getcpu.3.html>`__, 
`sched_getparam(3p) <../man3/sched_getparam.3p.html>`__, 
`sched_get_priority_max(3p) <../man3/sched_get_priority_max.3p.html>`__, 
`sched_getscheduler(3p) <../man3/sched_getscheduler.3p.html>`__, 
`sched_rr_get_interval(3p) <../man3/sched_rr_get_interval.3p.html>`__, 
`sched_setparam(3p) <../man3/sched_setparam.3p.html>`__, 
`sched_setscheduler(3p) <../man3/sched_setscheduler.3p.html>`__, 
`sched_yield(3p) <../man3/sched_yield.3p.html>`__, 
`sctp_bindx(3) <../man3/sctp_bindx.3.html>`__, 
`sctp_connectx(3) <../man3/sctp_connectx.3.html>`__, 
`sctp_peeloff(3) <../man3/sctp_peeloff.3.html>`__, 
`sd_bus_error(3) <../man3/sd_bus_error.3.html>`__, 
`sd_bus_error_add_map(3) <../man3/sd_bus_error_add_map.3.html>`__, 
`sd-bus-errors(3) <../man3/sd-bus-errors.3.html>`__, 
`sd_bus_message_new_method_error(3) <../man3/sd_bus_message_new_method_error.3.html>`__, 
`sd_bus_process(3) <../man3/sd_bus_process.3.html>`__, 
`sd_bus_wait(3) <../man3/sd_bus_wait.3.html>`__, 
`sd_journal_print(3) <../man3/sd_journal_print.3.html>`__, 
`seccomp_export_bpf(3) <../man3/seccomp_export_bpf.3.html>`__, 
`seccomp_init(3) <../man3/seccomp_init.3.html>`__, 
`seccomp_load(3) <../man3/seccomp_load.3.html>`__, 
`seccomp_notify_alloc(3) <../man3/seccomp_notify_alloc.3.html>`__, 
`seccomp_rule_add(3) <../man3/seccomp_rule_add.3.html>`__, 
`security_class_to_string(3) <../man3/security_class_to_string.3.html>`__, 
`selabel_digest(3) <../man3/selabel_digest.3.html>`__, 
`selabel_lookup(3) <../man3/selabel_lookup.3.html>`__, 
`selabel_lookup_best_match(3) <../man3/selabel_lookup_best_match.3.html>`__, 
`selabel_open(3) <../man3/selabel_open.3.html>`__, 
`selinux_file_context_verify(3) <../man3/selinux_file_context_verify.3.html>`__, 
`selinux_raw_context_to_color(3) <../man3/selinux_raw_context_to_color.3.html>`__, 
`selinux_restorecon(3) <../man3/selinux_restorecon.3.html>`__, 
`selinux_restorecon_default_handle(3) <../man3/selinux_restorecon_default_handle.3.html>`__, 
`selinux_restorecon_set_alt_rootpath(3) <../man3/selinux_restorecon_set_alt_rootpath.3.html>`__, 
`selinux_restorecon_xattr(3) <../man3/selinux_restorecon_xattr.3.html>`__, 
`selinux_set_callback(3) <../man3/selinux_set_callback.3.html>`__, 
`selinux_set_mapping(3) <../man3/selinux_set_mapping.3.html>`__, 
`sem_close(3) <../man3/sem_close.3.html>`__, 
`sem_close(3p) <../man3/sem_close.3p.html>`__, 
`semctl(3p) <../man3/semctl.3p.html>`__, 
`sem_destroy(3) <../man3/sem_destroy.3.html>`__, 
`sem_destroy(3p) <../man3/sem_destroy.3p.html>`__, 
`semget(3p) <../man3/semget.3p.html>`__, 
`sem_getvalue(3) <../man3/sem_getvalue.3.html>`__, 
`sem_getvalue(3p) <../man3/sem_getvalue.3p.html>`__, 
`sem_init(3) <../man3/sem_init.3.html>`__, 
`sem_init(3p) <../man3/sem_init.3p.html>`__, 
`semop(3p) <../man3/semop.3p.html>`__, 
`sem_open(3) <../man3/sem_open.3.html>`__, 
`sem_open(3p) <../man3/sem_open.3p.html>`__, 
`sem_post(3) <../man3/sem_post.3.html>`__, 
`sem_post(3p) <../man3/sem_post.3p.html>`__, 
`sem_timedwait(3p) <../man3/sem_timedwait.3p.html>`__, 
`sem_trywait(3p) <../man3/sem_trywait.3p.html>`__, 
`sem_unlink(3) <../man3/sem_unlink.3.html>`__, 
`sem_unlink(3p) <../man3/sem_unlink.3p.html>`__, 
`sem_wait(3) <../man3/sem_wait.3.html>`__, 
`send(3p) <../man3/send.3p.html>`__, 
`sendmsg(3p) <../man3/sendmsg.3p.html>`__, 
`sendto(3p) <../man3/sendto.3p.html>`__, 
`setbuf(3) <../man3/setbuf.3.html>`__, 
`setbuf(3p) <../man3/setbuf.3p.html>`__, 
`setegid(3p) <../man3/setegid.3p.html>`__, 
`setenv(3) <../man3/setenv.3.html>`__, 
`setenv(3p) <../man3/setenv.3p.html>`__, 
`seteuid(3p) <../man3/seteuid.3p.html>`__, 
`setfilecon(3) <../man3/setfilecon.3.html>`__, 
`setgid(3p) <../man3/setgid.3p.html>`__, 
`setkey(3p) <../man3/setkey.3p.html>`__, 
`setpgid(3p) <../man3/setpgid.3p.html>`__, 
`setregid(3p) <../man3/setregid.3p.html>`__, 
`setreuid(3p) <../man3/setreuid.3p.html>`__, 
`setsid(3p) <../man3/setsid.3p.html>`__, 
`setsockopt(3p) <../man3/setsockopt.3p.html>`__, 
`setuid(3p) <../man3/setuid.3p.html>`__, 
`setvbuf(3p) <../man3/setvbuf.3p.html>`__, 
`shmat(3p) <../man3/shmat.3p.html>`__, 
`shmctl(3p) <../man3/shmctl.3p.html>`__, 
`shmdt(3p) <../man3/shmdt.3p.html>`__, 
`shmget(3p) <../man3/shmget.3p.html>`__, 
`shm_open(3) <../man3/shm_open.3.html>`__, 
`shm_open(3p) <../man3/shm_open.3p.html>`__, 
`shm_unlink(3p) <../man3/shm_unlink.3p.html>`__, 
`shutdown(3p) <../man3/shutdown.3p.html>`__, 
`sigaction(3p) <../man3/sigaction.3p.html>`__, 
`sigaddset(3p) <../man3/sigaddset.3p.html>`__, 
`sigaltstack(3p) <../man3/sigaltstack.3p.html>`__, 
`sigdelset(3p) <../man3/sigdelset.3p.html>`__, 
`sigemptyset(3p) <../man3/sigemptyset.3p.html>`__, 
`sigfillset(3p) <../man3/sigfillset.3p.html>`__, 
`sighold(3p) <../man3/sighold.3p.html>`__, 
`siginterrupt(3) <../man3/siginterrupt.3.html>`__, 
`siginterrupt(3p) <../man3/siginterrupt.3p.html>`__, 
`sigismember(3p) <../man3/sigismember.3p.html>`__, 
`signal(3p) <../man3/signal.3p.html>`__, 
`sigpause(3) <../man3/sigpause.3.html>`__, 
`sigpending(3p) <../man3/sigpending.3p.html>`__, 
`sigqueue(3) <../man3/sigqueue.3.html>`__, 
`sigqueue(3p) <../man3/sigqueue.3p.html>`__, 
`sigset(3) <../man3/sigset.3.html>`__, 
`sigsetops(3) <../man3/sigsetops.3.html>`__, 
`sigsuspend(3p) <../man3/sigsuspend.3p.html>`__, 
`sigtimedwait(3p) <../man3/sigtimedwait.3p.html>`__, 
`sigvec(3) <../man3/sigvec.3.html>`__, 
`sin(3) <../man3/sin.3.html>`__,  `sin(3p) <../man3/sin.3p.html>`__, 
`sincos(3) <../man3/sincos.3.html>`__, 
`sinh(3) <../man3/sinh.3.html>`__, 
`sinh(3p) <../man3/sinh.3p.html>`__, 
`sockatmark(3) <../man3/sockatmark.3.html>`__, 
`sockatmark(3p) <../man3/sockatmark.3p.html>`__, 
`socket(3p) <../man3/socket.3p.html>`__, 
`socketpair(3p) <../man3/socketpair.3p.html>`__, 
`sqrt(3) <../man3/sqrt.3.html>`__, 
`sqrt(3p) <../man3/sqrt.3p.html>`__, 
`statvfs(3) <../man3/statvfs.3.html>`__, 
`strcoll(3p) <../man3/strcoll.3p.html>`__, 
`strdup(3) <../man3/strdup.3.html>`__, 
`strdup(3p) <../man3/strdup.3p.html>`__, 
`strerror(3) <../man3/strerror.3.html>`__, 
`strerror(3p) <../man3/strerror.3p.html>`__, 
`strfmon(3) <../man3/strfmon.3.html>`__, 
`strfmon(3p) <../man3/strfmon.3p.html>`__, 
`strftime(3) <../man3/strftime.3.html>`__, 
`strsignal(3p) <../man3/strsignal.3p.html>`__, 
`strtod(3) <../man3/strtod.3.html>`__, 
`strtod(3p) <../man3/strtod.3p.html>`__, 
`strtoimax(3) <../man3/strtoimax.3.html>`__, 
`strtoimax(3p) <../man3/strtoimax.3p.html>`__, 
`strtol(3) <../man3/strtol.3.html>`__, 
`strtol(3p) <../man3/strtol.3p.html>`__, 
`strtoul(3) <../man3/strtoul.3.html>`__, 
`strtoul(3p) <../man3/strtoul.3p.html>`__, 
`strxfrm(3p) <../man3/strxfrm.3p.html>`__, 
`symlink(3p) <../man3/symlink.3p.html>`__, 
`sysconf(3) <../man3/sysconf.3.html>`__, 
`sysconf(3p) <../man3/sysconf.3p.html>`__, 
`syslog(3) <../man3/syslog.3.html>`__, 
`system(3) <../man3/system.3.html>`__, 
`system(3p) <../man3/system.3p.html>`__, 
`tan(3) <../man3/tan.3.html>`__,  `tan(3p) <../man3/tan.3p.html>`__, 
`tanh(3p) <../man3/tanh.3p.html>`__, 
`tcdrain(3p) <../man3/tcdrain.3p.html>`__, 
`tcflow(3p) <../man3/tcflow.3p.html>`__, 
`tcflush(3p) <../man3/tcflush.3p.html>`__, 
`tcgetattr(3p) <../man3/tcgetattr.3p.html>`__, 
`tcgetpgrp(3) <../man3/tcgetpgrp.3.html>`__, 
`tcgetpgrp(3p) <../man3/tcgetpgrp.3p.html>`__, 
`tcgetsid(3) <../man3/tcgetsid.3.html>`__, 
`tcgetsid(3p) <../man3/tcgetsid.3p.html>`__, 
`tcsendbreak(3p) <../man3/tcsendbreak.3p.html>`__, 
`tcsetattr(3p) <../man3/tcsetattr.3p.html>`__, 
`tcsetpgrp(3p) <../man3/tcsetpgrp.3p.html>`__, 
`telldir(3) <../man3/telldir.3.html>`__, 
`tempnam(3) <../man3/tempnam.3.html>`__, 
`tempnam(3p) <../man3/tempnam.3p.html>`__, 
`termios(3) <../man3/termios.3.html>`__, 
`tgamma(3) <../man3/tgamma.3.html>`__, 
`tgamma(3p) <../man3/tgamma.3p.html>`__, 
`timegm(3) <../man3/timegm.3.html>`__, 
`timer_create(3p) <../man3/timer_create.3p.html>`__, 
`timer_delete(3p) <../man3/timer_delete.3p.html>`__, 
`timer_getoverrun(3p) <../man3/timer_getoverrun.3p.html>`__, 
`times(3p) <../man3/times.3p.html>`__, 
`tmpfile(3) <../man3/tmpfile.3.html>`__, 
`tmpfile(3p) <../man3/tmpfile.3p.html>`__, 
`towctrans(3p) <../man3/towctrans.3p.html>`__, 
`truncate(3p) <../man3/truncate.3p.html>`__, 
`ttyname(3) <../man3/ttyname.3.html>`__, 
`ttyname(3p) <../man3/ttyname.3p.html>`__, 
`udev_device_new_from_syspath(3) <../man3/udev_device_new_from_syspath.3.html>`__, 
`ulimit(3) <../man3/ulimit.3.html>`__, 
`ulimit(3p) <../man3/ulimit.3p.html>`__, 
`uname(3p) <../man3/uname.3p.html>`__, 
`ungetwc(3) <../man3/ungetwc.3.html>`__, 
`unlink(3p) <../man3/unlink.3p.html>`__, 
`unlockpt(3) <../man3/unlockpt.3.html>`__, 
`unlockpt(3p) <../man3/unlockpt.3p.html>`__, 
`unsetenv(3p) <../man3/unsetenv.3p.html>`__, 
`uselocale(3) <../man3/uselocale.3.html>`__, 
`uselocale(3p) <../man3/uselocale.3p.html>`__, 
`usleep(3) <../man3/usleep.3.html>`__, 
`utime(3p) <../man3/utime.3p.html>`__, 
`wait(3p) <../man3/wait.3p.html>`__, 
`waitid(3p) <../man3/waitid.3p.html>`__, 
`wcrtomb(3) <../man3/wcrtomb.3.html>`__, 
`wcrtomb(3p) <../man3/wcrtomb.3p.html>`__, 
`wcscoll(3p) <../man3/wcscoll.3p.html>`__, 
`wcsdup(3) <../man3/wcsdup.3.html>`__, 
`wcsdup(3p) <../man3/wcsdup.3p.html>`__, 
`wcsnrtombs(3) <../man3/wcsnrtombs.3.html>`__, 
`wcsrtombs(3) <../man3/wcsrtombs.3.html>`__, 
`wcsrtombs(3p) <../man3/wcsrtombs.3p.html>`__, 
`wcstod(3p) <../man3/wcstod.3p.html>`__, 
`wcstoimax(3p) <../man3/wcstoimax.3p.html>`__, 
`wcstol(3p) <../man3/wcstol.3p.html>`__, 
`wcstoul(3p) <../man3/wcstoul.3p.html>`__, 
`wcsxfrm(3p) <../man3/wcsxfrm.3p.html>`__, 
`wctrans(3p) <../man3/wctrans.3p.html>`__, 
`wordexp(3p) <../man3/wordexp.3p.html>`__, 
`write(3p) <../man3/write.3p.html>`__, 
`writev(3p) <../man3/writev.3p.html>`__, 
`y0(3) <../man3/y0.3.html>`__,  `y0(3p) <../man3/y0.3p.html>`__, 
`random(4) <../man4/random.4.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`selabel_file(5) <../man5/selabel_file.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`cpuset(7) <../man7/cpuset.7.html>`__, 
`fanotify(7) <../man7/fanotify.7.html>`__, 
`ip(7) <../man7/ip.7.html>`__, 
`man-pages(7) <../man7/man-pages.7.html>`__, 
`math_error(7) <../man7/math_error.7.html>`__, 
`pipe(7) <../man7/pipe.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`socket(7) <../man7/socket.7.html>`__, 
`spufs(7) <../man7/spufs.7.html>`__, 
`systemd.journal-fields(7) <../man7/systemd.journal-fields.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/errno.3.license.html>`__

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
