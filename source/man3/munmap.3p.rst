.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

munmap(3p) — Linux manual page
==============================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `APPLICAT                         |                                   |
| ION USAGE <#APPLICATION_USAGE>`__ |                                   |
| \| `RATIONALE <#RATIONALE>`__ \|  |                                   |
| `FUTURE D                         |                                   |
| IRECTIONS <#FUTURE_DIRECTIONS>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COPYRIGHT <#COPYRIGHT>`__        |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   MUNMAP(3P)              POSIX Programmer's Manual             MUNMAP(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          munmap — unmap pages of memory


---------------------------------------------------------

::

          #include <sys/mman.h>

          int munmap(void *addr, size_t len);


---------------------------------------------------------------

::

          The munmap() function shall remove any mappings for those entire
          pages containing any part of the address space of the process
          starting at addr and continuing for len bytes. Further references
          to these pages shall result in the generation of a SIGSEGV signal
          to the process.  If there are no mappings in the specified
          address range, then munmap() has no effect.

          The implementation may require that addr be a multiple of the
          page size as returned by sysconf().

          If a mapping to be removed was private, any modifications made in
          this address range shall be discarded.

          Any memory locks (see mlock(3p) and mlockall(3p)) associated with
          this address range shall be removed, as if by an appropriate call
          to munlock().

          If a mapping removed from a typed memory object causes the
          corresponding address range of the memory pool to be inaccessible
          by any process in the system except through allocatable mappings
          (that is, mappings of typed memory objects opened with the
          POSIX_TYPED_MEM_MAP_ALLOCATABLE flag), then that range of the
          memory pool shall become deallocated and may become available to
          satisfy future typed memory allocation requests.

          A mapping removed from a typed memory object opened with the
          POSIX_TYPED_MEM_MAP_ALLOCATABLE flag shall not affect in any way
          the availability of that typed memory for allocation.

          The behavior of this function is unspecified if the mapping was
          not established by a call to mmap().


-----------------------------------------------------------------

::

          Upon successful completion, munmap() shall return 0; otherwise,
          it shall return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The munmap() function shall fail if:

          EINVAL Addresses in the range [addr,addr+len) are outside the
                 valid range for the address space of a process.

          EINVAL The len argument is 0.

          The munmap() function may fail if:

          EINVAL The addr argument is not a multiple of the page size as
                 returned by sysconf().

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The munmap() function corresponds to SVR4, just as the mmap()
          function does.

          It is possible that an application has applied process memory
          locking to a region that contains shared memory. If this has
          occurred, the munmap() call ignores those locks and, if
          necessary, causes those locks to be removed.

          Most implementations require that addr is a multiple of the page
          size as returned by sysconf().


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          mlock(3p), mlockall(3p), mmap(3p), posix_typed_mem_open(3p),
          sysconf(3p)

          The Base Definitions volume of POSIX.1‐2017, sys_mman.h(0p)


-----------------------------------------------------------

::

          Portions of this text are reprinted and reproduced in electronic
          form from IEEE Std 1003.1-2017, Standard for Information
          Technology -- Portable Operating System Interface (POSIX), The
          Open Group Base Specifications Issue 7, 2018 Edition, Copyright
          (C) 2018 by the Institute of Electrical and Electronics
          Engineers, Inc and The Open Group.  In the event of any
          discrepancy between this version and the original IEEE and The
          Open Group Standard, the original IEEE and The Open Group
          Standard is the referee document. The original Standard can be
          obtained online at http://www.opengroup.org/unix/online.html .

          Any typographical or formatting errors that appear in this page
          are most likely to have been introduced during the conversion of
          the source files to man page format. To report such errors, see
          https://www.kernel.org/doc/man-pages/reporting_bugs.html .

   IEEE/The Open Group               2017                        MUNMAP(3P)

--------------

Pages that refer to this page:
`sys_mman.h(0p) <../man0/sys_mman.h.0p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`mlock(3p) <../man3/mlock.3p.html>`__, 
`mlockall(3p) <../man3/mlockall.3p.html>`__, 
`mmap(3p) <../man3/mmap.3p.html>`__, 
`shm_unlink(3p) <../man3/shm_unlink.3p.html>`__

--------------

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
