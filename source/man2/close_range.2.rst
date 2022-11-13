.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

close_range(2) — Linux manual page
==================================

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
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   CLOSE_RANGE(2)          Linux Programmer's Manual         CLOSE_RANGE(2)

NAME
-------------------------------------------------

::

          close_range - close all file descriptors in a given range


---------------------------------------------------------

::

          #include <linux/close_range.h>

          int close_range(unsigned int first, unsigned int last,
                          unsigned int flags);


---------------------------------------------------------------

::

          The close_range() system call closes all open file descriptors
          from first to last (included).

          Errors closing a given file descriptor are currently ignored.

          flags is a bit mask containing 0 or more of the following:

          CLOSE_RANGE_CLOEXEC (since Linux 5.11)
                 Set the close-on-exec flag on the specified file
                 descriptors, rather than immediately closing them.

          CLOSE_RANGE_UNSHARE
                 Unshare the specified file descriptors from any other
                 processes before closing them, avoiding races with other
                 threads sharing the file descriptor table.


-----------------------------------------------------------------

::

          On success, close_range() returns 0.  On error, -1 is returned
          and errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL flags is not valid, or first is greater than last.

          The following can occur with CLOSE_RANGE_UNSHARE (when
          constructing the new descriptor table):

          EMFILE The number of open file descriptors exceeds the limit
                 specified in /proc/sys/fs/nr_open (see proc(5)).  This
                 error can occur in situations where that limit was lowered
                 before a call to close_range() where the
                 CLOSE_RANGE_UNSHARE flag is specified.

          ENOMEM Insufficient kernel memory was available.


---------------------------------------------------------

::

          close_range() first appeared in Linux 5.9.  Library support was
          added in glibc in version 2.34.


-------------------------------------------------------------------

::

          close_range() is a nonstandard function that is also present on
          FreeBSD.


---------------------------------------------------

::

      Closing all open file descriptors
          To avoid blindly closing file descriptors in the range of
          possible file descriptors, this is sometimes implemented (on
          Linux) by listing open file descriptors in /proc/self/fd/ and
          calling close(2) on each one.  close_range() can take care of
          this without requiring /proc and within a single system call,
          which provides significant performance benefits.

      Closing file descriptors before exec
          File descriptors can be closed safely using

              /* we don't want anything past stderr here */
              close_range(3, ~0U, CLOSE_RANGE_UNSHARE);
              execve(....);

          CLOSE_RANGE_UNSHARE is conceptually equivalent to

              unshare(CLONE_FILES);
              close_range(first, last, 0);

          but can be more efficient: if the unshared range extends past the
          current maximum number of file descriptors allocated in the
          caller's file descriptor table (the common case when last is
          ~0U), the kernel will unshare a new file descriptor table for the
          caller up to first, copying as few file descriptors as possible.
          This avoids subsequent close(2) calls entirely; the whole
          operation is complete once the table is unshared.

      Closing files on exec
          This is particularly useful in cases where multiple pre-exec
          setup steps risk conflicting with each other.  For example,
          setting up a seccomp(2) profile can conflict with a close_range()
          call: if the file descriptors are closed before the seccomp(2)
          profile is set up, the profile setup can't use them itself, or
          control their closure; if the file descriptors are closed
          afterwards, the seccomp profile can't block the close_range()
          call or any fallbacks.  Using CLOSE_RANGE_CLOEXEC avoids this:
          the descriptors can be marked before the seccomp(2) profile is
          set up, and the profile can control access to close_range()
          without affecting the calling process.


---------------------------------------------------------

::

          The program shown below opens the files named in its command-line
          arguments, displays the list of files that it has opened (by
          iterating through the entries in /proc/PID/fd), uses
          close_range() to close all file descriptors greater than or equal
          to 3, and then once more displays the process's list of open
          files.  The following example demonstrates the use of the
          program:

              $ touch /tmp/a /tmp/b /tmp/c
              $ ./a.out /tmp/a /tmp/b /tmp/c
              /tmp/a opened as FD 3
              /tmp/b opened as FD 4
              /tmp/c opened as FD 5
              /proc/self/fd/0 ==> /dev/pts/1
              /proc/self/fd/1 ==> /dev/pts/1
              /proc/self/fd/2 ==> /dev/pts/1
              /proc/self/fd/3 ==> /tmp/a
              /proc/self/fd/4 ==> /tmp/b
              /proc/self/fd/5 ==> /tmp/b
              /proc/self/fd/6 ==> /proc/9005/fd
              ========= About to call close_range() =======
              /proc/self/fd/0 ==> /dev/pts/1
              /proc/self/fd/1 ==> /dev/pts/1
              /proc/self/fd/2 ==> /dev/pts/1
              /proc/self/fd/3 ==> /proc/9005/fd

          Note that the lines showing the pathname /proc/9005/fd result
          from the calls to opendir(3).

      Program source

          #define _GNU_SOURCE
          #include <fcntl.h>
          #include <linux/close_range.h>
          #include <stdio.h>
          #include <stdlib.h>
          #include <sys/syscall.h>
          #include <string.h>
          #include <unistd.h>
          #include <dirent.h>

          /* Show the contents of the symbolic links in /proc/self/fd */

          static void
          show_fds(void)
          {
              DIR *dirp = opendir("/proc/self/fd");
              if (dirp  == NULL) {
                  perror("opendir");
                  exit(EXIT_FAILURE);
              }

              for (;;) {
                  struct dirent *dp = readdir(dirp);
                  if (dp == NULL)
                      break;

                  if (dp->d_type == DT_LNK) {
                      char path[PATH_MAX], target[PATH_MAX];
                      snprintf(path, sizeof(path), "/proc/self/fd/%s",
                               dp->d_name);

                      ssize_t len = readlink(path, target, sizeof(target));
                      printf("%s ==> %.*s\n", path, (int) len, target);
                  }
              }

              closedir(dirp);
          }

          int
          main(int argc, char *argv[])
          {
              for (int j = 1; j < argc; j++) {
                  int fd = open(argv[j], O_RDONLY);
                  if (fd == -1) {
                      perror(argv[j]);
                      exit(EXIT_FAILURE);
                  }
                  printf("%s opened as FD %d\n", argv[j], fd);
              }

              show_fds();

              printf("========= About to call close_range() =======\n");

              if (syscall(__NR_close_range, 3, ~0U, 0) == -1) {
                  perror("close_range");
                  exit(EXIT_FAILURE);
              }

              show_fds();
              exit(EXIT_FAILURE);
          }


---------------------------------------------------------

::

          close(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27                 CLOSE_RANGE(2)

--------------

Pages that refer to this page: `close(2) <../man2/close.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/close_range.2.license.html>`__

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
