.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

inotify_init(2) — Linux manual page
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
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   INOTIFY_INIT(2)         Linux Programmer's Manual        INOTIFY_INIT(2)

NAME
-------------------------------------------------

::

          inotify_init, inotify_init1 - initialize an inotify instance


---------------------------------------------------------

::

          #include <sys/inotify.h>

          int inotify_init(void);
          int inotify_init1(int flags);


---------------------------------------------------------------

::

          For an overview of the inotify API, see inotify(7).

          inotify_init() initializes a new inotify instance and returns a
          file descriptor associated with a new inotify event queue.

          If flags is 0, then inotify_init1() is the same as
          inotify_init().  The following values can be bitwise ORed in
          flags to obtain different behavior:

          IN_NONBLOCK
                 Set the O_NONBLOCK file status flag on the open file
                 description (see open(2)) referred to by the new file
                 descriptor.  Using this flag saves extra calls to fcntl(2)
                 to achieve the same result.

          IN_CLOEXEC
                 Set the close-on-exec (FD_CLOEXEC) flag on the new file
                 descriptor.  See the description of the O_CLOEXEC flag in
                 open(2) for reasons why this may be useful.


-----------------------------------------------------------------

::

          On success, these system calls return a new file descriptor.  On
          error, -1 is returned, and errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL (inotify_init1()) An invalid value was specified in flags.

          EMFILE The user limit on the total number of inotify instances
                 has been reached.

          EMFILE The per-process limit on the number of open file
                 descriptors has been reached.

          ENFILE The system-wide limit on the total number of open files
                 has been reached.

          ENOMEM Insufficient kernel memory is available.


---------------------------------------------------------

::

          inotify_init() first appeared in Linux 2.6.13; library support
          was added to glibc in version 2.4.  inotify_init1() was added in
          Linux 2.6.27; library support was added to glibc in version 2.9.


-------------------------------------------------------------------

::

          These system calls are Linux-specific.


---------------------------------------------------------

::

          inotify_add_watch(2), inotify_rm_watch(2), inotify(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2020-04-11                INOTIFY_INIT(2)

--------------

Pages that refer to this page:
`inotify_add_watch(2) <../man2/inotify_add_watch.2.html>`__, 
`inotify_rm_watch(2) <../man2/inotify_rm_watch.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`proc(5) <../man5/proc.5.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/inotify_init.2.license.html>`__

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
