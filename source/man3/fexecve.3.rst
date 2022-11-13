.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

fexecve(3) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
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

   FEXECVE(3)              Linux Programmer's Manual             FEXECVE(3)

NAME
-------------------------------------------------

::

          fexecve - execute program specified via file descriptor


---------------------------------------------------------

::

          #include <unistd.h>

          int fexecve(int fd, char *const argv[], char *const envp[]);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          fexecve():
              Since glibc 2.10:
                  _POSIX_C_SOURCE >= 200809L
              Before glibc 2.10:
                  _GNU_SOURCE


---------------------------------------------------------------

::

          fexecve() performs the same task as execve(2), with the
          difference that the file to be executed is specified via a file
          descriptor, fd, rather than via a pathname.  The file descriptor
          fd must be opened read-only (O_RDONLY) or with the O_PATH flag
          and the caller must have permission to execute the file that it
          refers to.


-----------------------------------------------------------------

::

          A successful call to fexecve() never returns.  On error, the
          function does return, with a result value of -1, and errno is set
          to indicate the error.


-----------------------------------------------------

::

          Errors are as for execve(2), with the following additions:

          EINVAL fd is not a valid file descriptor, or argv is NULL, or
                 envp is NULL.

          ENOENT The close-on-exec flag is set on fd, and fd refers to a
                 script.  See BUGS.

          ENOSYS The kernel does not provide the execveat(2) system call,
                 and the /proc filesystem could not be accessed.


---------------------------------------------------------

::

          fexecve() is implemented since glibc 2.3.2.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │fexecve()                             │ Thread safety │ MT-Safe │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2008.  This function is not specified in POSIX.1-2001,
          and is not widely available on other systems.  It is specified in
          POSIX.1-2008.


---------------------------------------------------

::

          On Linux with glibc versions 2.26 and earlier, fexecve() is
          implemented using the proc(5) filesystem, so /proc needs to be
          mounted and available at the time of the call.  Since glibc 2.27,
          if the underlying kernel supports the execveat(2) system call,
          then fexecve() is implemented using that system call, with the
          benefit that /proc does not need to be mounted.

          The idea behind fexecve() is to allow the caller to verify
          (checksum) the contents of an executable before executing it.
          Simply opening the file, checksumming the contents, and then
          doing an execve(2) would not suffice, since, between the two
          steps, the filename, or a directory prefix of the pathname, could
          have been exchanged (by, for example, modifying the target of a
          symbolic link).  fexecve() does not mitigate the problem that the
          contents of a file could be changed between the checksumming and
          the call to fexecve(); for that, the solution is to ensure that
          the permissions on the file prevent it from being modified by
          malicious users.

          The natural idiom when using fexecve() is to set the close-on-
          exec flag on fd, so that the file descriptor does not leak
          through to the program that is executed.  This approach is
          natural for two reasons.  First, it prevents file descriptors
          being consumed unnecessarily.  (The executed program normally has
          no need of a file descriptor that refers to the program itself.)
          Second, if fexecve() is used recursively, employing the close-on-
          exec flag prevents the file descriptor exhaustion that would
          result from the fact that each step in the recursion would cause
          one more file descriptor to be passed to the new program.  (But
          see BUGS.)


-------------------------------------------------

::

          If fd refers to a script (i.e., it is an executable text file
          that names a script interpreter with a first line that begins
          with the characters #!)  and the close-on-exec flag has been set
          for fd, then fexecve() fails with the error ENOENT.  This error
          occurs because, by the time the script interpreter is executed,
          fd has already been closed because of the close-on-exec flag.
          Thus, the close-on-exec flag can't be set on fd if it refers to a
          script, leading to the problems described in NOTES.


---------------------------------------------------------

::

          execve(2), execveat(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                     FEXECVE(3)

--------------

Pages that refer to this page: `execve(2) <../man2/execve.2.html>`__, 
`execveat(2) <../man2/execveat.2.html>`__, 
`open(2) <../man2/open.2.html>`__,  `exec(3) <../man3/exec.3.html>`__, 
`posix_spawn(3) <../man3/posix_spawn.3.html>`__, 
`signal-safety(7) <../man7/signal-safety.7.html>`__

--------------

`Copyright and license for this manual
page <../man3/fexecve.3.license.html>`__

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
