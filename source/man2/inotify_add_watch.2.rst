.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

inotify_add_watch(2) — Linux manual page
========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `EXAMPLES <#EXAMPLES>`__ \|    |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   INOTIFY_ADD_WATCH(2)    Linux Programmer's Manual   INOTIFY_ADD_WATCH(2)

NAME
-------------------------------------------------

::

          inotify_add_watch - add a watch to an initialized inotify
          instance


---------------------------------------------------------

::

          #include <sys/inotify.h>

          int inotify_add_watch(int fd, const char *pathname, uint32_t mask);


---------------------------------------------------------------

::

          inotify_add_watch() adds a new watch, or modifies an existing
          watch, for the file whose location is specified in pathname; the
          caller must have read permission for this file.  The fd argument
          is a file descriptor referring to the inotify instance whose
          watch list is to be modified.  The events to be monitored for
          pathname are specified in the mask bit-mask argument.  See
          inotify(7) for a description of the bits that can be set in mask.

          A successful call to inotify_add_watch() returns a unique watch
          descriptor for this inotify instance, for the filesystem object
          (inode) that corresponds to pathname.  If the filesystem object
          was not previously being watched by this inotify instance, then
          the watch descriptor is newly allocated.  If the filesystem
          object was already being watched (perhaps via a different link to
          the same object), then the descriptor for the existing watch is
          returned.

          The watch descriptor is returned by later read(2)s from the
          inotify file descriptor.  These reads fetch inotify_event
          structures (see inotify(7)) indicating filesystem events; the
          watch descriptor inside this structure identifies the object for
          which the event occurred.


-----------------------------------------------------------------

::

          On success, inotify_add_watch() returns a watch descriptor (a
          nonnegative integer).  On error, -1 is returned and errno is set
          to indicate the error.


-----------------------------------------------------

::

          EACCES Read access to the given file is not permitted.

          EBADF  The given file descriptor is not valid.

          EEXIST mask contains IN_MASK_CREATE and pathname refers to a file
                 already being watched by the same fd.

          EFAULT pathname points outside of the process's accessible
                 address space.

          EINVAL The given event mask contains no valid events; or mask
                 contains both IN_MASK_ADD and IN_MASK_CREATE; or fd is not
                 an inotify file descriptor.

          ENAMETOOLONG
                 pathname is too long.

          ENOENT A directory component in pathname does not exist or is a
                 dangling symbolic link.

          ENOMEM Insufficient kernel memory was available.

          ENOSPC The user limit on the total number of inotify watches was
                 reached or the kernel failed to allocate a needed
                 resource.

          ENOTDIR
                 mask contains IN_ONLYDIR and pathname is not a directory.


---------------------------------------------------------

::

          Inotify was merged into the 2.6.13 Linux kernel.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------------

::

          See inotify(7).


---------------------------------------------------------

::

          inotify_init(2), inotify_rm_watch(2), inotify(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22           INOTIFY_ADD_WATCH(2)

--------------

Pages that refer to this page:
`inotify_init(2) <../man2/inotify_init.2.html>`__, 
`inotify_rm_watch(2) <../man2/inotify_rm_watch.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/inotify_add_watch.2.license.html>`__

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
