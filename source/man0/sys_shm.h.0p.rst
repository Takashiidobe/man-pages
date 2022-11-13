.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

sys_shm.h(0p) — Linux manual page
=================================

+-----------------------------------+-----------------------------------+
| `PROLOG <#PROLOG>`__ \|           |                                   |
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
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

   sys_shm.h(0P)           POSIX Programmer's Manual          sys_shm.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          sys/shm.h — XSI shared memory facility


---------------------------------------------------------

::

          #include <sys/shm.h>


---------------------------------------------------------------

::

          The <sys/shm.h> header shall define the following symbolic
          constants:

          SHM_RDONLY  Attach read-only (else read-write).

          SHM_RND     Round attach address to SHMLBA.

          SHMLBA      Segment low boundary address multiple.

          The <sys/shm.h> header shall define the following data types
          through typedef:

          shmatt_t    Unsigned integer used for the number of current
                      attaches that must be able to store values at least
                      as large as a type unsigned short.

          The <sys/shm.h> header shall define the shmid_ds structure, which
          shall include the following members:

              struct ipc_perm shm_perm   Operation permission structure.
              size_t          shm_segsz  Size of segment in bytes.
              pid_t           shm_lpid   Process ID of last shared memory operation.
              pid_t           shm_cpid   Process ID of creator.
              shmatt_t        shm_nattch Number of current attaches.
              time_t          shm_atime  Time of last shmat().
              time_t          shm_dtime  Time of last shmdt().
              time_t          shm_ctime  Time of last change by shmctl().

          The <sys/shm.h> header shall define the pid_t, size_t, and time_t
          types as described in <sys/types.h>.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              void *shmat(int, const void *, int);
              int   shmctl(int, int, struct shmid_ds *);
              int   shmdt(const void *);
              int   shmget(key_t, size_t, int);

          In addition, the <sys/shm.h> header shall include the <sys/ipc.h>
          header.

          The following sections are informative.


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

          sys_ipc.h(0p), sys_types.h(0p)

          The System Interfaces volume of POSIX.1‐2017, shmat(3p),
          shmctl(3p), shmdt(3p), shmget(3p)


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

   IEEE/The Open Group               2017                     sys_shm.h(0P)

--------------

Pages that refer to this page: `shmat(3p) <../man3/shmat.3p.html>`__, 
`shmctl(3p) <../man3/shmctl.3p.html>`__, 
`shmdt(3p) <../man3/shmdt.3p.html>`__, 
`shmget(3p) <../man3/shmget.3p.html>`__

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
