.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

mlockall(3p) — Linux manual page
================================

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

   MLOCKALL(3P)            POSIX Programmer's Manual           MLOCKALL(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          mlockall, munlockall — lock/unlock the address space of a process
          (REALTIME)


---------------------------------------------------------

::

          #include <sys/mman.h>

          int mlockall(int flags);
          int munlockall(void);


---------------------------------------------------------------

::

          The mlockall() function shall cause all of the pages mapped by
          the address space of a process to be memory-resident until
          unlocked or until the process exits or execs another process
          image. The flags argument determines whether the pages to be
          locked are those currently mapped by the address space of the
          process, those that are mapped in the future, or both. The flags
          argument is constructed from the bitwise-inclusive OR of one or
          more of the following symbolic constants, defined in
          <sys/mman.h>:

          MCL_CURRENT Lock all of the pages currently mapped into the
                      address space of the process.

          MCL_FUTURE  Lock all of the pages that become mapped into the
                      address space of the process in the future, when
                      those mappings are established.

          If MCL_FUTURE is specified, and the automatic locking of future
          mappings eventually causes the amount of locked memory to exceed
          the amount of available physical memory or any other
          implementation-defined limit, the behavior is implementation-
          defined. The manner in which the implementation informs the
          application of these situations is also implementation-defined.

          The munlockall() function shall unlock all currently mapped pages
          of the address space of the process. Any pages that become mapped
          into the address space of the process after a call to
          munlockall() shall not be locked, unless there is an intervening
          call to mlockall() specifying MCL_FUTURE or a subsequent call to
          mlockall() specifying MCL_CURRENT. If pages mapped into the
          address space of the process are also mapped into the address
          spaces of other processes and are locked by those processes, the
          locks established by the other processes shall be unaffected by a
          call by this process to munlockall().

          Upon successful return from the mlockall() function that
          specifies MCL_CURRENT, all currently mapped pages of the address
          space of the process shall be memory-resident and locked.  Upon
          return from the munlockall() function, all currently mapped pages
          of the address space of the process shall be unlocked with
          respect to the address space of the process.  The memory
          residency of unlocked pages is unspecified.

          Appropriate privileges are required to lock process memory with
          mlockall().


-----------------------------------------------------------------

::

          Upon successful completion, the mlockall() function shall return
          a value of zero. Otherwise, no additional memory shall be locked,
          and the function shall return a value of -1 and set errno to
          indicate the error. The effect of failure of mlockall() on
          previously existing locks in the address space is unspecified.

          If it is supported by the implementation, the munlockall()
          function shall always return a value of zero. Otherwise, the
          function shall return a value of -1 and set errno to indicate the
          error.


-----------------------------------------------------

::

          The mlockall() function shall fail if:

          EAGAIN Some or all of the memory identified by the operation
                 could not be locked when the call was made.

          EINVAL The flags argument is zero, or includes unimplemented
                 flags.

          The mlockall() function may fail if:

          ENOMEM Locking all of the pages currently mapped into the address
                 space of the process would exceed an implementation-
                 defined limit on the amount of memory that the process may
                 lock.

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

          exec(1p), exit(3p), fork(3p), mlock(3p), munmap(3p)

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

   IEEE/The Open Group               2017                      MLOCKALL(3P)

--------------

Pages that refer to this page:
`sys_mman.h(0p) <../man0/sys_mman.h.0p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`mlock(3p) <../man3/mlock.3p.html>`__, 
`munlockall(3p) <../man3/munlockall.3p.html>`__, 
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
