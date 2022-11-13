.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mlock(3p) — Linux manual page
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

   MLOCK(3P)               POSIX Programmer's Manual              MLOCK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mlock, munlock — lock or unlock a range of process address space
          (REALTIME)


---------------------------------------------------------

::

          #include <sys/mman.h>

          int mlock(const void *addr, size_t len);
          int munlock(const void *addr, size_t len);


---------------------------------------------------------------

::

          The mlock() function shall cause those whole pages containing any
          part of the address space of the process starting at address addr
          and continuing for len bytes to be memory-resident until unlocked
          or until the process exits or execs another process image. The
          implementation may require that addr be a multiple of {PAGESIZE}.

          The munlock() function shall unlock those whole pages containing
          any part of the address space of the process starting at address
          addr and continuing for len bytes, regardless of how many times
          mlock() has been called by the process for any of the pages in
          the specified range. The implementation may require that addr be
          a multiple of {PAGESIZE}.

          If any of the pages in the range specified to a call to munlock()
          are also mapped into the address spaces of other processes, any
          locks established on those pages by another process are
          unaffected by the call of this process to munlock().  If any of
          the pages in the range specified by a call to munlock() are also
          mapped into other portions of the address space of the calling
          process outside the range specified, any locks established on
          those pages via the other mappings are also unaffected by this
          call.

          Upon successful return from mlock(), pages in the specified range
          shall be locked and memory-resident. Upon successful return from
          munlock(), pages in the specified range shall be unlocked with
          respect to the address space of the process. Memory residency of
          unlocked pages is unspecified.

          Appropriate privileges are required to lock process memory with
          mlock().


-----------------------------------------------------------------

::

          Upon successful completion, the mlock() and munlock() functions
          shall return a value of zero. Otherwise, no change is made to any
          locks in the address space of the process, and the function shall
          return a value of -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The mlock() and munlock() functions shall fail if:

          ENOMEM Some or all of the address range specified by the addr and
                 len arguments does not correspond to valid mapped pages in
                 the address space of the process.

          The mlock() function shall fail if:

          EAGAIN Some or all of the memory identified by the operation
                 could not be locked when the call was made.

          The mlock() and munlock() functions may fail if:

          EINVAL The addr argument is not a multiple of {PAGESIZE}.

          The mlock() function may fail if:

          ENOMEM Locking the pages mapped by the specified range would
                 exceed an implementation-defined limit on the amount of
                 memory that the process may lock.

          EPERM  The calling process does not have appropriate privileges
                 to perform the requested operation.

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

          exec(1p), exit(3p), fork(3p), mlockall(3p), munmap(3p)

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

   IEEE/The Open Group               2017                         MLOCK(3P)

--------------

Pages that refer to this page:
`sys_mman.h(0p) <../man0/sys_mman.h.0p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`mlockall(3p) <../man3/mlockall.3p.html>`__, 
`munlock(3p) <../man3/munlock.3p.html>`__, 
`munmap(3p) <../man3/munmap.3p.html>`__

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
