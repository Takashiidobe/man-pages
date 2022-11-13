.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

chroot(2) — Linux manual page
=============================

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

   CHROOT(2)               Linux Programmer's Manual              CHROOT(2)

NAME
-------------------------------------------------

::

          chroot - change root directory


---------------------------------------------------------

::

          #include <unistd.h>

          int chroot(const char *path);

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          chroot():
              Since glibc 2.2.2:
                  _XOPEN_SOURCE && ! (_POSIX_C_SOURCE >= 200112L)
                      || /* Since glibc 2.20: */ _DEFAULT_SOURCE
                      || /* Glibc <= 2.19: */ _BSD_SOURCE
              Before glibc 2.2.2:
                  none


---------------------------------------------------------------

::

          chroot() changes the root directory of the calling process to
          that specified in path.  This directory will be used for
          pathnames beginning with /.  The root directory is inherited by
          all children of the calling process.

          Only a privileged process (Linux: one with the CAP_SYS_CHROOT
          capability in its user namespace) may call chroot().

          This call changes an ingredient in the pathname resolution
          process and does nothing else.  In particular, it is not intended
          to be used for any kind of security purpose, neither to fully
          sandbox a process nor to restrict filesystem system calls.  In
          the past, chroot() has been used by daemons to restrict
          themselves prior to passing paths supplied by untrusted users to
          system calls such as open(2).  However, if a folder is moved out
          of the chroot directory, an attacker can exploit that to get out
          of the chroot directory as well.  The easiest way to do that is
          to chdir(2) to the to-be-moved directory, wait for it to be moved
          out, then open a path like ../../../etc/passwd.

          A slightly trickier variation also works under some circumstances
          if chdir(2) is not permitted.  If a daemon allows a "chroot
          directory" to be specified, that usually means that if you want
          to prevent remote users from accessing files outside the chroot
          directory, you must ensure that folders are never moved out of
          it.

          This call does not change the current working directory, so that
          after the call '.' can be outside the tree rooted at '/'.  In
          particular, the superuser can escape from a "chroot jail" by
          doing:

              mkdir foo; chroot foo; cd ..

          This call does not close open file descriptors, and such file
          descriptors may allow access to files outside the chroot tree.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned, and
          errno is set to indicate the error.


-----------------------------------------------------

::

          Depending on the filesystem, other errors can be returned.  The
          more general errors are listed below:

          EACCES Search permission is denied on a component of the path
                 prefix.  (See also path_resolution(7).)

          EFAULT path points outside your accessible address space.

          EIO    An I/O error occurred.

          ELOOP  Too many symbolic links were encountered in resolving
                 path.

          ENAMETOOLONG
                 path is too long.

          ENOENT The file does not exist.

          ENOMEM Insufficient kernel memory was available.

          ENOTDIR
                 A component of path is not a directory.

          EPERM  The caller has insufficient privilege.


-------------------------------------------------------------------

::

          SVr4, 4.4BSD, SUSv2 (marked LEGACY).  This function is not part
          of POSIX.1-2001.


---------------------------------------------------

::

          A child process created via fork(2) inherits its parent's root
          directory.  The root directory is left unchanged by execve(2).

          The magic symbolic link, /proc/[pid]/root, can be used to
          discover a process's root directory; see proc(5) for details.

          FreeBSD has a stronger jail() system call.


---------------------------------------------------------

::

          chroot(1), chdir(2), pivot_root(2), path_resolution(7),
          switch_root(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                      CHROOT(2)

--------------

Pages that refer to this page: `capsh(1) <../man1/capsh.1.html>`__, 
`chroot(1) <../man1/chroot.1.html>`__, 
`dpkg(1) <../man1/dpkg.1.html>`__, 
`systemd-detect-virt(1) <../man1/systemd-detect-virt.1.html>`__, 
`chdir(2) <../man2/chdir.2.html>`__, 
`clone(2) <../man2/clone.2.html>`__, 
`getrandom(2) <../man2/getrandom.2.html>`__, 
`mount(2) <../man2/mount.2.html>`__, 
`openat2(2) <../man2/openat2.2.html>`__, 
`pivot_root(2) <../man2/pivot_root.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unshare(2) <../man2/unshare.2.html>`__, 
`cap_launch(3) <../man3/cap_launch.3.html>`__, 
`getcwd(3) <../man3/getcwd.3.html>`__, 
`syslog(3) <../man3/syslog.3.html>`__, 
`system(3) <../man3/system.3.html>`__, 
`core(5) <../man5/core.5.html>`__,  `proc(5) <../man5/proc.5.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__, 
`capabilities(7) <../man7/capabilities.7.html>`__, 
`path_resolution(7) <../man7/path_resolution.7.html>`__, 
`pthreads(7) <../man7/pthreads.7.html>`__, 
`lloadd(8) <../man8/lloadd.8.html>`__, 
`slapd(8) <../man8/slapd.8.html>`__, 
`switch_root(8) <../man8/switch_root.8.html>`__

--------------

`Copyright and license for this manual
page <../man2/chroot.2.license.html>`__

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
