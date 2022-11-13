.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_typed_mem_get_info(3p) — Linux manual page
================================================

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

   POSIX_TYPED_MEM_GET_INFO(3P)X Programmer's Manual_TYPED_MEM_GET_INFO(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_typed_mem_get_info — query typed memory information
          (ADVANCED REALTIME)


---------------------------------------------------------

::

          #include <sys/mman.h>

          int posix_typed_mem_get_info(int fildes,
              struct posix_typed_mem_info *info);


---------------------------------------------------------------

::

          The posix_typed_mem_get_info() function shall return, in the
          posix_tmi_length field of the posix_typed_mem_info structure
          pointed to by info, the maximum length which may be successfully
          allocated by the typed memory object designated by fildes.  This
          maximum length shall take into account the flag
          POSIX_TYPED_MEM_ALLOCATE or POSIX_TYPED_MEM_ALLOCATE_CONTIG
          specified when the typed memory object represented by fildes was
          opened. The maximum length is dynamic; therefore, the value
          returned is valid only while the current mapping of the
          corresponding typed memory pool remains unchanged.

          If fildes represents a typed memory object opened with neither
          the POSIX_TYPED_MEM_ALLOCATE flag nor the
          POSIX_TYPED_MEM_ALLOCATE_CONTIG flag specified, the returned
          value of info->posix_tmi_length is unspecified.

          The posix_typed_mem_get_info() function may return additional
          implementation-defined information in other fields of the
          posix_typed_mem_info structure pointed to by info.

          If the memory object specified by fildes is not a typed memory
          object, then the behavior of this function is undefined.


-----------------------------------------------------------------

::

          Upon successful completion, the posix_typed_mem_get_info()
          function shall return zero; otherwise, the corresponding error
          status value shall be returned.


-----------------------------------------------------

::

          The posix_typed_mem_get_info() function shall fail if:

          EBADF  The fildes argument is not a valid open file descriptor.

          ENODEV The fildes argument is not connected to a memory object
                 supported by this function.

          This function shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          An application that needs to allocate a block of typed memory
          with length dependent upon the amount of memory currently
          available must either query the typed memory object to obtain the
          amount available, or repeatedly invoke mmap() attempting to guess
          an appropriate length. While the latter method is existing
          practice with malloc(), it is awkward and imprecise. The
          posix_typed_mem_get_info() function allows an application to
          immediately determine available memory. This is particularly
          important for typed memory objects that may in some cases be
          scarce resources. Note that when a typed memory pool is a shared
          resource, some form of mutual-exclusion or synchronization may be
          required while typed memory is being queried and allocated to
          prevent race conditions.

          The existing fstat() function is not suitable for this purpose.
          We realize that implementations may wish to provide other
          attributes of typed memory objects (for example, alignment
          requirements, page size, and so on).  The fstat() function
          returns a structure which is not extensible and, furthermore,
          contains substantial information that is inappropriate for typed
          memory objects.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          fstat(3p), mmap(3p), posix_typed_mem_open(3p)

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

   IEEE/The Open Group               2017      POSIX_TYPED_MEM_GET_INFO(3P)

--------------

Pages that refer to this page:
`sys_mman.h(0p) <../man0/sys_mman.h.0p.html>`__, 
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
