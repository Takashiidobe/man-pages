.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

create_module(2) — Linux manual page
====================================

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

   CREATE_MODULE(2)        Linux Programmer's Manual       CREATE_MODULE(2)

NAME
-------------------------------------------------

::

          create_module - create a loadable module entry


---------------------------------------------------------

::

          #include <linux/module.h>

          caddr_t create_module(const char *name, size_t size);

          Note: No declaration of this system call is provided in glibc
          headers; see NOTES.


---------------------------------------------------------------

::

          Note: This system call is present only in kernels before Linux
          2.6.

          create_module() attempts to create a loadable module entry and
          reserve the kernel memory that will be needed to hold the module.
          This system call requires privilege.


-----------------------------------------------------------------

::

          On success, returns the kernel address at which the module will
          reside.  On error, -1 is returned and errno is set to indicate
          the error.


-----------------------------------------------------

::

          EEXIST A module by that name already exists.

          EFAULT name is outside the program's accessible address space.

          EINVAL The requested size is too small even for the module header
                 information.

          ENOMEM The kernel could not allocate a contiguous block of memory
                 large enough for the module.

          ENOSYS create_module() is not supported in this version of the
                 kernel (e.g., the kernel is version 2.6 or later).

          EPERM  The caller was not privileged (did not have the
                 CAP_SYS_MODULE capability).


---------------------------------------------------------

::

          This system call is present on Linux only up until kernel 2.4; it
          was removed in Linux 2.6.


-------------------------------------------------------------------

::

          create_module() is Linux-specific.


---------------------------------------------------

::

          This obsolete system call is not supported by glibc.  No
          declaration is provided in glibc headers, but, through a quirk of
          history, glibc versions before 2.23 did export an ABI for this
          system call.  Therefore, in order to employ this system call, it
          was sufficient to manually declare the interface in your code;
          alternatively, you could invoke the system call using syscall(2).


---------------------------------------------------------

::

          delete_module(2), init_module(2), query_module(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22               CREATE_MODULE(2)

--------------

Pages that refer to this page:
`delete_module(2) <../man2/delete_module.2.html>`__, 
`get_kernel_syms(2) <../man2/get_kernel_syms.2.html>`__, 
`init_module(2) <../man2/init_module.2.html>`__, 
`query_module(2) <../man2/query_module.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`unimplemented(2) <../man2/unimplemented.2.html>`__, 
`systemd.exec(5) <../man5/systemd.exec.5.html>`__

--------------

`Copyright and license for this manual
page <../man2/create_module.2.license.html>`__

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
