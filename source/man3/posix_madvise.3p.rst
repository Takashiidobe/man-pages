.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_madvise(3p) — Linux manual page
=====================================

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

   POSIX_MADVISE(3P)       POSIX Programmer's Manual      POSIX_MADVISE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_madvise — memory advisory information and alignment control
          (ADVANCED REALTIME)


---------------------------------------------------------

::

          #include <sys/mman.h>

          int posix_madvise(void *addr, size_t len, int advice);


---------------------------------------------------------------

::

          The posix_madvise() function shall advise the implementation on
          the expected behavior of the application with respect to the data
          in the memory starting at address addr, and continuing for len
          bytes. The implementation may use this information to optimize
          handling of the specified data. The posix_madvise() function
          shall have no effect on the semantics of access to memory in the
          specified range, although it may affect the performance of
          access.

          The implementation may require that addr be a multiple of the
          page size, which is the value returned by sysconf() when the name
          value _SC_PAGESIZE is used.

          The advice to be applied to the memory range is specified by the
          advice parameter and may be one of the following values:

          POSIX_MADV_NORMAL
                Specifies that the application has no advice to give on its
                behavior with respect to the specified range. It is the
                default characteristic if no advice is given for a range of
                memory.

          POSIX_MADV_SEQUENTIAL
                Specifies that the application expects to access the
                specified range sequentially from lower addresses to higher
                addresses.

          POSIX_MADV_RANDOM
                Specifies that the application expects to access the
                specified range in a random order.

          POSIX_MADV_WILLNEED
                Specifies that the application expects to access the
                specified range in the near future.

          POSIX_MADV_DONTNEED
                Specifies that the application expects that it will not
                access the specified range in the near future.

          These values are defined in the <sys/mman.h> header.


-----------------------------------------------------------------

::

          Upon successful completion, posix_madvise() shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The posix_madvise() function shall fail if:

          EINVAL The value of advice is invalid.

          ENOMEM Addresses in the range starting at addr and continuing for
                 len bytes are partly or completely outside the range
                 allowed for the address space of the calling process.

          The posix_madvise() function may fail if:

          EINVAL The value of addr is not a multiple of the value returned
                 by sysconf() when the name value _SC_PAGESIZE is used.

          EINVAL The value of len is zero.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The posix_madvise() function is part of the Advisory Information
          option and need not be provided on all implementations.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          mmap(3p), posix_fadvise(3p), sysconf(3p)

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

   IEEE/The Open Group               2017                 POSIX_MADVISE(3P)

--------------

Pages that refer to this page:
`fcntl.h(0p) <../man0/fcntl.h.0p.html>`__, 
`sys_mman.h(0p) <../man0/sys_mman.h.0p.html>`__, 
`posix_fadvise(3p) <../man3/posix_fadvise.3p.html>`__

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
