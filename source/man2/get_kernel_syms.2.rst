.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

get_kernel_syms(2) — Linux manual page
======================================

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
| `BUGS <#BUGS>`__ \|               |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   GET_KERNEL_SYMS(2)      Linux Programmer's Manual     GET_KERNEL_SYMS(2)

NAME
-------------------------------------------------

::

          get_kernel_syms - retrieve exported kernel and module symbols


---------------------------------------------------------

::

          #include <linux/module.h>

          int get_kernel_syms(struct kernel_sym *table);

          Note: No declaration of this system call is provided in glibc
          headers; see NOTES.


---------------------------------------------------------------

::

          Note: This system call is present only in kernels before Linux
          2.6.

          If table is NULL, get_kernel_syms() returns the number of symbols
          available for query.  Otherwise, it fills in a table of
          structures:

              struct kernel_sym {
                  unsigned long value;
                  char          name[60];
              };

          The symbols are interspersed with magic symbols of the form
          #module-name with the kernel having an empty name.  The value
          associated with a symbol of this form is the address at which the
          module is loaded.

          The symbols exported from each module follow their magic module
          tag and the modules are returned in the reverse of the order in
          which they were loaded.


-----------------------------------------------------------------

::

          On success, returns the number of symbols copied to table.  On
          error, -1 is returned and errno is set to indicate the error.


-----------------------------------------------------

::

          There is only one possible error return:

          ENOSYS get_kernel_syms() is not supported in this version of the
                 kernel.


---------------------------------------------------------

::

          This system call is present on Linux only up until kernel 2.4; it
          was removed in Linux 2.6.


-------------------------------------------------------------------

::

          get_kernel_syms() is Linux-specific.


---------------------------------------------------

::

          This obsolete system call is not supported by glibc.  No
          declaration is provided in glibc headers, but, through a quirk of
          history, glibc versions before 2.23 did export an ABI for this
          system call.  Therefore, in order to employ this system call, it
          was sufficient to manually declare the interface in your code;
          alternatively, you could invoke the system call using syscall(2).


-------------------------------------------------

::

          There is no way to indicate the size of the buffer allocated for
          table.  If symbols have been added to the kernel since the
          program queried for the symbol table size, memory will be
          corrupted.

          The length of exported symbol names is limited to 59 characters.

          Because of these limitations, this system call is deprecated in
          favor of query_module(2) (which is itself nowadays deprecated in
          favor of other interfaces described on its manual page).


---------------------------------------------------------

::

          create_module(2), delete_module(2), init_module(2),
          query_module(2)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22             GET_KERNEL_SYMS(2)

--------------

Pages that refer to this page:
`query_module(2) <../man2/query_module.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__

--------------

`Copyright and license for this manual
page <../man2/get_kernel_syms.2.license.html>`__

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
