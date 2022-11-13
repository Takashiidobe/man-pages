.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

posix_typed_mem_open(3p) — Linux manual page
============================================

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

   POSIX_TYPED_MEM_OPEN(3P)POSIX Programmer's ManualOSIX_TYPED_MEM_OPEN(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          posix_typed_mem_open — open a typed memory object (ADVANCED
          REALTIME)


---------------------------------------------------------

::

          #include <sys/mman.h>

          int posix_typed_mem_open(const char *name, int oflag, int tflag);


---------------------------------------------------------------

::

          The posix_typed_mem_open() function shall establish a connection
          between the typed memory object specified by the string pointed
          to by name and a file descriptor. It shall create an open file
          description that refers to the typed memory object and a file
          descriptor that refers to that open file description. The file
          descriptor shall be allocated as described in Section 2.14, File
          Descriptor Allocation and can be used by other functions to refer
          to that typed memory object. It is unspecified whether the name
          appears in the file system and is visible to other functions that
          take pathnames as arguments. The name argument conforms to the
          construction rules for a pathname, except that the interpretation
          of <slash> characters other than the leading <slash> character in
          name is implementation-defined, and that the length limits for
          the name argument are implementation-defined and need not be the
          same as the pathname limits {PATH_MAX} and {NAME_MAX}.  If name
          begins with the <slash> character, then processes calling
          posix_typed_mem_open() with the same value of name shall refer to
          the same typed memory object. If name does not begin with the
          <slash> character, the effect is implementation-defined.

          Each typed memory object supported in a system shall be
          identified by a name which specifies not only its associated
          typed memory pool, but also the path or port by which it is
          accessed. That is, the same typed memory pool accessed via
          several different ports shall have several different
          corresponding names. The binding between names and typed memory
          objects is established in an implementation-defined manner.
          Unlike shared memory objects, there is no way within POSIX.1‐2008
          for a program to create a typed memory object.

          The value of tflag shall determine how the typed memory object
          behaves when subsequently mapped by calls to mmap().  At most,
          one of the following flags defined in <sys/mman.h> may be
          specified:

          POSIX_TYPED_MEM_ALLOCATE
                Allocate on mmap().

          POSIX_TYPED_MEM_ALLOCATE_CONTIG
                Allocate contiguously on mmap().

          POSIX_TYPED_MEM_MAP_ALLOCATABLE
                Map on mmap(), without affecting allocatability.

          If tflag has the flag POSIX_TYPED_MEM_ALLOCATE specified, any
          subsequent call to mmap() using the returned file descriptor
          shall result in allocation and mapping of typed memory from the
          specified typed memory pool. The allocated memory may be a
          contiguous previously unallocated area of the typed memory pool
          or several non-contiguous previously unallocated areas (mapped to
          a contiguous portion of the process address space). If tflag has
          the flag POSIX_TYPED_MEM_ALLOCATE_CONTIG specified, any
          subsequent call to mmap() using the returned file descriptor
          shall result in allocation and mapping of a single contiguous
          previously unallocated area of the typed memory pool (also mapped
          to a contiguous portion of the process address space). If tflag
          has none of the flags POSIX_TYPED_MEM_ALLOCATE or
          POSIX_TYPED_MEM_ALLOCATE_CONTIG specified, any subsequent call to
          mmap() using the returned file descriptor shall map an
          application-chosen area from the specified typed memory pool such
          that this mapped area becomes unavailable for allocation until
          unmapped by all processes. If tflag has the flag
          POSIX_TYPED_MEM_MAP_ALLOCATABLE specified, any subsequent call to
          mmap() using the returned file descriptor shall map an
          application-chosen area from the specified typed memory pool
          without an effect on the availability of that area for
          allocation; that is, mapping such an object leaves each byte of
          the mapped area unallocated if it was unallocated prior to the
          mapping or allocated if it was allocated prior to the mapping.
          Appropriate privileges to specify the
          POSIX_TYPED_MEM_MAP_ALLOCATABLE flag are implementation-defined.

          If successful, posix_typed_mem_open() shall return a file
          descriptor for the typed memory object.  The open file
          description is new, and therefore the file descriptor shall not
          share it with any other processes. It is unspecified whether the
          file offset is set. The FD_CLOEXEC file descriptor flag
          associated with the new file descriptor shall be cleared.

          The behavior of msync(), ftruncate(), and all file operations
          other than mmap(), posix_mem_offset(),
          posix_typed_mem_get_info(), fstat(), dup(), dup2(), and close(),
          is unspecified when passed a file descriptor connected to a typed
          memory object by this function.

          The file status flags of the open file description shall be set
          according to the value of oflag.  Applications shall specify
          exactly one of the three access mode values described below and
          defined in the <fcntl.h> header, as the value of oflag.

          O_RDONLY    Open for read access only.

          O_WRONLY    Open for write access only.

          O_RDWR      Open for read or write access.


-----------------------------------------------------------------

::

          Upon successful completion, the posix_typed_mem_open() function
          shall return a non-negative integer representing the file
          descriptor. Otherwise, it shall return -1 and set errno to
          indicate the error.


-----------------------------------------------------

::

          The posix_typed_mem_open() function shall fail if:

          EACCES The typed memory object exists and the permissions
                 specified by oflag are denied.

          EINTR  The posix_typed_mem_open() operation was interrupted by a
                 signal.

          EINVAL The flags specified in tflag are invalid (more than one of
                 POSIX_TYPED_MEM_ALLOCATE, POSIX_TYPED_MEM_ALLOCATE_CONTIG,
                 or POSIX_TYPED_MEM_MAP_ALLOCATABLE is specified).

          EMFILE All file descriptors available to the process are
                 currently open.

          ENFILE Too many file descriptors are currently open in the
                 system.

          ENOENT The named typed memory object does not exist.

          EPERM  The caller lacks appropriate privileges to specify the
                 POSIX_TYPED_MEM_MAP_ALLOCATABLE flag in the tflag
                 argument.

          The posix_typed_mem_open() function may fail if:

          ENAMETOOLONG
                 The length of the name argument exceeds {_POSIX_PATH_MAX}
                 on systems that do not support the XSI option or exceeds
                 {_XOPEN_PATH_MAX} on XSI systems, or has a pathname
                 component that is longer than {_POSIX_NAME_MAX} on systems
                 that do not support the XSI option or longer than
                 {_XOPEN_NAME_MAX} on XSI systems.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.14, File Descriptor Allocation, close(3p), dup(3p),
          exec(1p), fcntl(3p), fstat(3p), ftruncate(3p), mmap(3p),
          msync(3p), posix_mem_offset(3p), posix_typed_mem_get_info(3p),
          umask(3p)

          The Base Definitions volume of POSIX.1‐2017, fcntl.h(0p),
          sys_mman.h(0p)


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

   IEEE/The Open Group               2017          POSIX_TYPED_MEM_OPEN(3P)

--------------

Pages that refer to this page:
`sys_mman.h(0p) <../man0/sys_mman.h.0p.html>`__, 
`mmap(3p) <../man3/mmap.3p.html>`__, 
`munmap(3p) <../man3/munmap.3p.html>`__, 
`posix_mem_offset(3p) <../man3/posix_mem_offset.3p.html>`__, 
`posix_typed_mem_get_info(3p) <../man3/posix_typed_mem_get_info.3p.html>`__

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
