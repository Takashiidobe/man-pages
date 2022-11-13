.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

epoll_create(2) — Linux manual page
===================================

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
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   EPOLL_CREATE(2)         Linux Programmer's Manual        EPOLL_CREATE(2)

NAME
-------------------------------------------------

::

          epoll_create, epoll_create1 - open an epoll file descriptor


---------------------------------------------------------

::

          #include <sys/epoll.h>

          int epoll_create(int size);
          int epoll_create1(int flags);


---------------------------------------------------------------

::

          epoll_create() creates a new epoll(7) instance.  Since Linux
          2.6.8, the size argument is ignored, but must be greater than
          zero; see NOTES.

          epoll_create() returns a file descriptor referring to the new
          epoll instance.  This file descriptor is used for all the
          subsequent calls to the epoll interface.  When no longer
          required, the file descriptor returned by epoll_create() should
          be closed by using close(2).  When all file descriptors referring
          to an epoll instance have been closed, the kernel destroys the
          instance and releases the associated resources for reuse.

      epoll_create1()
          If flags is 0, then, other than the fact that the obsolete size
          argument is dropped, epoll_create1() is the same as
          epoll_create().  The following value can be included in flags to
          obtain different behavior:

          EPOLL_CLOEXEC
                 Set the close-on-exec (FD_CLOEXEC) flag on the new file
                 descriptor.  See the description of the O_CLOEXEC flag in
                 open(2) for reasons why this may be useful.


-----------------------------------------------------------------

::

          On success, these system calls return a file descriptor (a
          nonnegative integer).  On error, -1 is returned, and errno is set
          to indicate the error.


-----------------------------------------------------

::

          EINVAL size is not positive.

          EINVAL (epoll_create1()) Invalid value specified in flags.

          EMFILE The per-user limit on the number of epoll instances
                 imposed by /proc/sys/fs/epoll/max_user_instances was
                 encountered.  See epoll(7) for further details.

          EMFILE The per-process limit on the number of open file
                 descriptors has been reached.

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          ENOMEM There was insufficient memory to create the kernel object.


---------------------------------------------------------

::

          epoll_create() was added to the kernel in version 2.6.  Library
          support is provided in glibc starting with version 2.3.2.

          epoll_create1() was added to the kernel in version 2.6.27.
          Library support is provided in glibc starting with version 2.9.


-------------------------------------------------------------------

::

          epoll_create() and epoll_create1() are Linux-specific.


---------------------------------------------------

::

          In the initial epoll_create() implementation, the size argument
          informed the kernel of the number of file descriptors that the
          caller expected to add to the epoll instance.  The kernel used
          this information as a hint for the amount of space to initially
          allocate in internal data structures describing events.  (If
          necessary, the kernel would allocate more space if the caller's
          usage exceeded the hint given in size.)  Nowadays, this hint is
          no longer required (the kernel dynamically sizes the required
          data structures without needing the hint), but size must still be
          greater than zero, in order to ensure backward compatibility when
          new epoll applications are run on older kernels.


---------------------------------------------------------

::

          close(2), epoll_ctl(2), epoll_wait(2), epoll(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                EPOLL_CREATE(2)

--------------

Pages that refer to this page:
`epoll_ctl(2) <../man2/epoll_ctl.2.html>`__, 
`epoll_wait(2) <../man2/epoll_wait.2.html>`__, 
`kcmp(2) <../man2/kcmp.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__,  `epoll(7) <../man7/epoll.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/epoll_create.2.license.html>`__

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
