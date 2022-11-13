.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

umask(2) — Linux manual page
============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \|                                |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   UMASK(2)                Linux Programmer's Manual               UMASK(2)

NAME
-------------------------------------------------

::

          umask - set file mode creation mask


---------------------------------------------------------

::

          #include <sys/stat.h>

          mode_t umask(mode_t mask);


---------------------------------------------------------------

::

          umask() sets the calling process's file mode creation mask
          (umask) to mask & 0777 (i.e., only the file permission bits of
          mask are used), and returns the previous value of the mask.

          The umask is used by open(2), mkdir(2), and other system calls
          that create files to modify the permissions placed on newly
          created files or directories.  Specifically, permissions in the
          umask are turned off from the mode argument to open(2) and
          mkdir(2).

          Alternatively, if the parent directory has a default ACL (see
          acl(5)), the umask is ignored, the default ACL is inherited, the
          permission bits are set based on the inherited ACL, and
          permission bits absent in the mode argument are turned off.  For
          example, the following default ACL is equivalent to a umask of
          022:

              u::rwx,g::r-x,o::r-x

          Combining the effect of this default ACL with a mode argument of
          0666 (rw-rw-rw-), the resulting file permissions would be 0644
          (rw-r--r--).

          The constants that should be used to specify mask are described
          in inode(7).

          The typical default value for the process umask is
          S_IWGRP | S_IWOTH (octal 022).  In the usual case where the mode
          argument to open(2) is specified as:

              S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH | S_IWOTH

          (octal 0666) when creating a new file, the permissions on the
          resulting file will be:

              S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH

          (because 0666 & ~022 = 0644; i.e., rw-r--r--).


-----------------------------------------------------------------

::

          This system call always succeeds and the previous value of the
          mask is returned.


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.


---------------------------------------------------

::

          A child process created via fork(2) inherits its parent's umask.
          The umask is left unchanged by execve(2).

          It is impossible to use umask() to fetch a process's umask
          without at the same time changing it.  A second call to umask()
          would then be needed to restore the umask.  The nonatomicity of
          these two steps provides the potential for races in multithreaded
          programs.

          Since Linux 4.7, the umask of any process can be viewed via the
          Umask field of /proc/[pid]/status.  Inspecting this field in
          /proc/self/status allows a process to retrieve its umask without
          at the same time changing it.

          The umask setting also affects the permissions assigned to POSIX
          IPC objects (mq_open(3), sem_open(3), shm_open(3)), FIFOs
          (mkfifo(3)), and UNIX domain sockets (unix(7)) created by the
          process.  The umask does not affect the permissions assigned to
          System V IPC objects created by the process (using msgget(2),
          semget(2), shmget(2)).


---------------------------------------------------------

::

          chmod(2), mkdir(2), open(2), stat(2), acl(5)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                       UMASK(2)

--------------

Pages that refer to this page: `clone(2) <../man2/clone.2.html>`__, 
`mkdir(2) <../man2/mkdir.2.html>`__, 
`mknod(2) <../man2/mknod.2.html>`__, 
`open(2) <../man2/open.2.html>`__, 
`spu_create(2) <../man2/spu_create.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unshare(2) <../man2/unshare.2.html>`__, 
`fopen(3) <../man3/fopen.3.html>`__, 
`mkfifo(3) <../man3/mkfifo.3.html>`__, 
`mkstemp(3) <../man3/mkstemp.3.html>`__, 
`shm_open(3) <../man3/shm_open.3.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__, 
`system_data_types(7) <../man7/system_data_types.7.html>`__, 
`unix(7) <../man7/unix.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/umask.2.license.html>`__

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
