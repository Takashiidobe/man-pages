.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pkey_alloc(2) — Linux manual page
=================================

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

   PKEY_ALLOC(2)           Linux Programmer's Manual          PKEY_ALLOC(2)

NAME
-------------------------------------------------

::

          pkey_alloc, pkey_free - allocate or free a protection key


---------------------------------------------------------

::

          #define _GNU_SOURCE             /* See feature_test_macros(7) */
          #include <sys/mman.h>

          int pkey_alloc(unsigned int flags, unsigned int access_rights);
          int pkey_free(int pkey);


---------------------------------------------------------------

::

          pkey_alloc() allocates a protection key (pkey) and allows it to
          be passed to pkey_mprotect(2).

          The pkey_alloc() flags is reserved for future use and currently
          must always be specified as 0.

          The pkey_alloc() access_rights argument may contain zero or more
          disable operations:

          PKEY_DISABLE_ACCESS
                 Disable all data access to memory covered by the returned
                 protection key.

          PKEY_DISABLE_WRITE
                 Disable write access to memory covered by the returned
                 protection key.

          pkey_free() frees a protection key and makes it available for
          later allocations.  After a protection key has been freed, it may
          no longer be used in any protection-key-related operations.

          An application should not call pkey_free() on any protection key
          which has been assigned to an address range by pkey_mprotect(2)
          and which is still in use.  The behavior in this case is
          undefined and may result in an error.


-----------------------------------------------------------------

::

          On success, pkey_alloc() returns a positive protection key value.
          On success, pkey_free() returns zero.  On error, -1 is returned,
          and errno is set to indicate the error.


-----------------------------------------------------

::

          EINVAL pkey, flags, or access_rights is invalid.

          ENOSPC (pkey_alloc()) All protection keys available for the
                 current process have been allocated.  The number of keys
                 available is architecture-specific and implementation-
                 specific and may be reduced by kernel-internal use of
                 certain keys.  There are currently 15 keys available to
                 user programs on x86.

                 This error will also be returned if the processor or
                 operating system does not support protection keys.
                 Applications should always be prepared to handle this
                 error, since factors outside of the application's control
                 can reduce the number of available pkeys.


---------------------------------------------------------

::

          pkey_alloc() and pkey_free() were added to Linux in kernel 4.9;
          library support was added in glibc 2.27.


-------------------------------------------------------------------

::

          The pkey_alloc() and pkey_free() system calls are Linux-specific.


---------------------------------------------------

::

          pkey_alloc() is always safe to call regardless of whether or not
          the operating system supports protection keys.  It can be used in
          lieu of any other mechanism for detecting pkey support and will
          simply fail with the error ENOSPC if the operating system has no
          pkey support.

          The kernel guarantees that the contents of the hardware rights
          register (PKRU) will be preserved only for allocated protection
          keys.  Any time a key is unallocated (either before the first
          call returning that key from pkey_alloc() or after it is freed
          via pkey_free()), the kernel may make arbitrary changes to the
          parts of the rights register affecting access to that key.


---------------------------------------------------------

::

          See pkeys(7).


---------------------------------------------------------

::

          pkey_mprotect(2), pkeys(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22                  PKEY_ALLOC(2)

--------------

Pages that refer to this page:
`mprotect(2) <../man2/mprotect.2.html>`__, 
`syscalls(2) <../man2/syscalls.2.html>`__, 
`pkeys(7) <../man7/pkeys.7.html>`__

--------------

`Copyright and license for this manual
page <../man2/pkey_alloc.2.license.html>`__

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
