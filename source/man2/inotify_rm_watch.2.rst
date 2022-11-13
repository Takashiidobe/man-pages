.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

inotify_rm_watch(2) — Linux manual page
=======================================

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

   INOTIFY_RM_WATCH(2)     Linux Programmer's Manual    INOTIFY_RM_WATCH(2)

NAME
-------------------------------------------------

::

          inotify_rm_watch - remove an existing watch from an inotify
          instance


---------------------------------------------------------

::

          #include <sys/inotify.h>

          int inotify_rm_watch(int fd, int wd);


---------------------------------------------------------------

::

          inotify_rm_watch() removes the watch associated with the watch
          descriptor wd from the inotify instance associated with the file
          descriptor fd.

          Removing a watch causes an IN_IGNORED event to be generated for
          this watch descriptor.  (See inotify(7).)


-----------------------------------------------------------------

::

          On success, inotify_rm_watch() returns zero.  On error, -1 is
          returned and errno is set to indicate the error.


-----------------------------------------------------

::

          EBADF  fd is not a valid file descriptor.

          EINVAL The watch descriptor wd is not valid; or fd is not an
                 inotify file descriptor.


---------------------------------------------------------

::

          Inotify was merged into the 2.6.13 Linux kernel.


-------------------------------------------------------------------

::

          This system call is Linux-specific.


---------------------------------------------------------

::

          inotify_add_watch(2), inotify_init(2), inotify(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22            INOTIFY_RM_WATCH(2)

--------------

Pages that refer to this page:
`inotify_add_watch(2) <../man2/inotify_add_watch.2.html>`__, 
`inotify_init(2) <../man2/inotify_init.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`inotify(7) <../man7/inotify.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/inotify_rm_watch.2.license.html>`__

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
