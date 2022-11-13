.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

query_module(2) — Linux manual page
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

   QUERY_MODULE(2)         Linux Programmer's Manual        QUERY_MODULE(2)

NAME
-------------------------------------------------

::

          query_module - query the kernel for various bits pertaining to
          modules


---------------------------------------------------------

::

          #include <linux/module.h>

          int query_module(const char *name, int which, void *buf,
                           size_t bufsize, size_t *ret);

          Note: No declaration of this system call is provided in glibc
          headers; see NOTES.


---------------------------------------------------------------

::

          Note: This system call is present only in kernels before Linux
          2.6.

          query_module() requests information from the kernel about
          loadable modules.  The returned information is placed in the
          buffer pointed to by buf.  The caller must specify the size of
          buf in bufsize.  The precise nature and format of the returned
          information depend on the operation specified by which.  Some
          operations require name to identify a currently loaded module,
          some allow name to be NULL, indicating the kernel proper.

          The following values can be specified for which:

          0      Returns success, if the kernel supports query_module().
                 Used to probe for availability of the system call.

          QM_MODULES
                 Returns the names of all loaded modules.  The returned
                 buffer consists of a sequence of null-terminated strings;
                 ret is set to the number of modules.

          QM_DEPS
                 Returns the names of all modules used by the indicated
                 module.  The returned buffer consists of a sequence of
                 null-terminated strings; ret is set to the number of
                 modules.

          QM_REFS
                 Returns the names of all modules using the indicated
                 module.  This is the inverse of QM_DEPS.  The returned
                 buffer consists of a sequence of null-terminated strings;
                 ret is set to the number of modules.

          QM_SYMBOLS
                 Returns the symbols and values exported by the kernel or
                 the indicated module.  The returned buffer is an array of
                 structures of the following form

                     struct module_symbol {
                         unsigned long value;
                         unsigned long name;
                     };

                 followed by null-terminated strings.  The value of name is
                 the character offset of the string relative to the start
                 of buf; ret is set to the number of symbols.

          QM_INFO
                 Returns miscellaneous information about the indicated
                 module.  The output buffer format is:

                     struct module_info {
                         unsigned long address;
                         unsigned long size;
                         unsigned long flags;
                     };

                 where address is the kernel address at which the module
                 resides, size is the size of the module in bytes, and
                 flags is a mask of MOD_RUNNING, MOD_AUTOCLEAN, and so on,
                 that indicates the current status of the module (see the
                 Linux kernel source file include/linux/module.h).  ret is
                 set to the size of the module_info structure.


-----------------------------------------------------------------

::

          On success, zero is returned.  On error, -1 is returned and errno
          is set to indicate the error.


-----------------------------------------------------

::

          EFAULT At least one of name, buf, or ret was outside the
                 program's accessible address space.

          EINVAL Invalid which; or name is NULL (indicating "the kernel"),
                 but this is not permitted with the specified value of
                 which.

          ENOENT No module by that name exists.

          ENOSPC The buffer size provided was too small.  ret is set to the
                 minimum size needed.

          ENOSYS query_module() is not supported in this version of the
                 kernel (e.g., the kernel is version 2.6 or later).


---------------------------------------------------------

::

          This system call is present on Linux only up until kernel 2.4; it
          was removed in Linux 2.6.


-------------------------------------------------------------------

::

          query_module() is Linux-specific.


---------------------------------------------------

::

          Some of the information that was formerly available via
          query_module() can be obtained from /proc/modules,
          /proc/kallsyms, and the files under the directory /sys/module.

          The query_module() system call is not supported by glibc.  No
          declaration is provided in glibc headers, but, through a quirk of
          history, glibc does export an ABI for this system call.
          Therefore, in order to employ this system call, it is sufficient
          to manually declare the interface in your code; alternatively,
          you can invoke the system call using syscall(2).


---------------------------------------------------------

::

          create_module(2), delete_module(2), get_kernel_syms(2),
          init_module(2), lsmod(8), modinfo(8)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                QUERY_MODULE(2)

--------------

Pages that refer to this page:
`create_module(2) <../man2/create_module.2.html>`__, 
`delete_module(2) <../man2/delete_module.2.html>`__, 
`get_kernel_syms(2) <../man2/get_kernel_syms.2.html>`__, 
`init_module(2) <../man2/init_module.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/query_module.2.license.html>`__

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
