.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

msync(3p) — Linux manual page
=============================

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

   MSYNC(3P)               POSIX Programmer's Manual              MSYNC(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          msync — synchronize memory with physical storage


---------------------------------------------------------

::

          #include <sys/mman.h>

          int msync(void *addr, size_t len, int flags);


---------------------------------------------------------------

::

          The msync() function shall write all modified data to permanent
          storage locations, if any, in those whole pages containing any
          part of the address space of the process starting at address addr
          and continuing for len bytes. If no such storage exists, msync()
          need not have any effect. If requested, the msync() function
          shall then invalidate cached copies of data.

          The implementation may require that addr be a multiple of the
          page size as returned by sysconf().

          For mappings to files, the msync() function shall ensure that all
          write operations are completed as defined for synchronized I/O
          data integrity completion. It is unspecified whether the
          implementation also writes out other file attributes. When the
          msync() function is called on MAP_PRIVATE mappings, any modified
          data shall not be written to the underlying object and shall not
          cause such data to be made visible to other processes. It is
          unspecified whether data in MAP_PRIVATE mappings has any
          permanent storage locations.  The effect of msync() on a shared
          memory object or a typed memory object is unspecified.  The
          behavior of this function is unspecified if the mapping was not
          established by a call to mmap().

          The flags argument is constructed from the bitwise-inclusive OR
          of one or more of the following flags defined in the <sys/mman.h>
          header:

                 ┌──────────────────┬──────────────────────────────┐
                 │Symbolic Constant │         Description          │
                 ├──────────────────┼──────────────────────────────┤
                 │MS_ASYNC          │ Perform asynchronous writes. │
                 │MS_SYNC           │ Perform synchronous writes.  │
                 │MS_INVALIDATE     │ Invalidate cached data.      │
                 └──────────────────┴──────────────────────────────┘
          When MS_ASYNC is specified, msync() shall return immediately once
          all the write operations are initiated or queued for servicing;
          when MS_SYNC is specified, msync() shall not return until all
          write operations are completed as defined for synchronized I/O
          data integrity completion. Either MS_ASYNC or MS_SYNC shall be
          specified, but not both.

          When MS_INVALIDATE is specified, msync() shall invalidate all
          cached copies of mapped data that are inconsistent with the
          permanent storage locations such that subsequent references shall
          obtain data that was consistent with the permanent storage
          locations sometime between the call to msync() and the first
          subsequent memory reference to the data.

          If msync() causes any write to a file, the file's last data
          modification and last file status change timestamps shall be
          marked for update.


-----------------------------------------------------------------

::

          Upon successful completion, msync() shall return 0; otherwise, it
          shall return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The msync() function shall fail if:

          EBUSY  Some or all of the addresses in the range starting at addr
                 and continuing for len bytes are locked, and MS_INVALIDATE
                 is specified.

          EINVAL The value of flags is invalid.

          ENOMEM The addresses in the range starting at addr and continuing
                 for len bytes are outside the range allowed for the
                 address space of a process or specify one or more pages
                 that are not mapped.

          The msync() function may fail if:

          EINVAL The value of addr is not a multiple of the page size as
                 returned by sysconf().

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The msync() function is only supported if the Synchronized Input
          and Output option is supported, and thus need not be available on
          all implementations.

          The msync() function should be used by programs that require a
          memory object to be in a known state; for example, in building
          transaction facilities.

          Normal system activity can cause pages to be written to disk.
          Therefore, there are no guarantees that msync() is the only
          control over when pages are or are not written to disk.


-----------------------------------------------------------

::

          The msync() function writes out data in a mapped region to the
          permanent storage for the underlying object. The call to msync()
          ensures data integrity of the file.

          After the data is written out, any cached data may be invalidated
          if the MS_INVALIDATE flag was specified. This is useful on
          systems that do not support read/write consistency.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          mmap(3p), sysconf(3p)

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

   IEEE/The Open Group               2017                         MSYNC(3P)

--------------

Pages that refer to this page:
`sys_mman.h(0p) <../man0/sys_mman.h.0p.html>`__, 
`mmap(3p) <../man3/mmap.3p.html>`__, 
`posix_typed_mem_open(3p) <../man3/posix_typed_mem_open.3p.html>`__

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
