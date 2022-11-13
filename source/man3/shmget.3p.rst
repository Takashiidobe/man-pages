.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

shmget(3p) — Linux manual page
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

   SHMGET(3P)              POSIX Programmer's Manual             SHMGET(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          shmget — get an XSI shared memory segment


---------------------------------------------------------

::

          #include <sys/shm.h>

          int shmget(key_t key, size_t size, int shmflg);


---------------------------------------------------------------

::

          The shmget() function operates on XSI shared memory (see the Base
          Definitions volume of POSIX.1‐2017, Section 3.346, Shared Memory
          Object).  It is unspecified whether this function interoperates
          with the realtime interprocess communication facilities defined
          in Section 2.8, Realtime.

          The shmget() function shall return the shared memory identifier
          associated with key.

          A shared memory identifier, associated data structure, and shared
          memory segment of at least size bytes (see <sys/shm.h>) are
          created for key if one of the following is true:

           *  The argument key is equal to IPC_PRIVATE.

           *  The argument key does not already have a shared memory
              identifier associated with it and (shmflg &IPC_CREAT) is non-
              zero.

          Upon creation, the data structure associated with the new shared
          memory identifier shall be initialized as follows:

           *  The values of shm_perm.cuid, shm_perm.uid, shm_perm.cgid, and
              shm_perm.gid are set to the effective user ID and effective
              group ID, respectively, of the calling process.

           *  The low-order nine bits of shm_perm.mode are set to the low-
              order nine bits of shmflg.

           *  The value of shm_segsz is set to the value of size.

           *  The values of shm_lpid, shm_nattch, shm_atime, and shm_dtime
              are set to 0.

           *  The value of shm_ctime is set to the current time, as
              described in Section 2.7.1, IPC General Description.

          When the shared memory segment is created, it shall be
          initialized with all zero values.


-----------------------------------------------------------------

::

          Upon successful completion, shmget() shall return a non-negative
          integer, namely a shared memory identifier; otherwise, it shall
          return -1 and set errno to indicate the error.


-----------------------------------------------------

::

          The shmget() function shall fail if:

          EACCES A shared memory identifier exists for key but operation
                 permission as specified by the low-order nine bits of
                 shmflg would not be granted; see Section 2.7, XSI
                 Interprocess Communication.

          EEXIST A shared memory identifier exists for the argument key but
                 (shmflg &IPC_CREAT) &&(shmflg &IPC_EXCL) is non-zero.

          EINVAL A shared memory segment is to be created and the value of
                 size is less than the system-imposed minimum or greater
                 than the system-imposed maximum.

          EINVAL No shared memory segment is to be created and a shared
                 memory segment exists for key but the size of the segment
                 associated with it is less than size.

          ENOENT A shared memory identifier does not exist for the argument
                 key and (shmflg &IPC_CREAT) is 0.

          ENOMEM A shared memory identifier and associated shared memory
                 segment are to be created, but the amount of available
                 physical memory is not sufficient to fill the request.

          ENOSPC A shared memory identifier is to be created, but the
                 system-imposed limit on the maximum number of allowed
                 shared memory identifiers system-wide would be exceeded.

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          The POSIX Realtime Extension defines alternative interfaces for
          interprocess communication. Application developers who need to
          use IPC should design their applications so that modules using
          the IPC routines described in Section 2.7, XSI Interprocess
          Communication can be easily modified to use the alternative
          interfaces.


-----------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          Section 2.7, XSI Interprocess Communication, Section 2.8,
          Realtime, ftok(3p), shmat(3p), shmctl(3p), shmdt(3p),
          shm_open(3p), shm_unlink(3p)

          The Base Definitions volume of POSIX.1‐2017, Section 3.346,
          Shared Memory Object, sys_shm.h(0p)


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

   IEEE/The Open Group               2017                        SHMGET(3P)

--------------

Pages that refer to this page:
`sys_shm.h(0p) <../man0/sys_shm.h.0p.html>`__, 
`ipcs(1p) <../man1/ipcs.1p.html>`__, 
`\_Exit(3p) <../man3/_Exit.3p.html>`__, 
`ftok(3p) <../man3/ftok.3p.html>`__, 
`shmat(3p) <../man3/shmat.3p.html>`__, 
`shmctl(3p) <../man3/shmctl.3p.html>`__, 
`shmdt(3p) <../man3/shmdt.3p.html>`__

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
