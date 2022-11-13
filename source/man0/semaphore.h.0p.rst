.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

semaphore.h(0p) — Linux manual page
===================================

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

   semaphore.h(0P)         POSIX Programmer's Manual        semaphore.h(0P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          semaphore.h — semaphores


---------------------------------------------------------

::

          #include <semaphore.h>


---------------------------------------------------------------

::

          The <semaphore.h> header shall define the sem_t type, used in
          performing semaphore operations. The semaphore may be implemented
          using a file descriptor, in which case applications are able to
          open up at least a total of {OPEN_MAX} files and semaphores.

          The <semaphore.h> header shall define the symbolic constant
          SEM_FAILED which shall have type sem_t *.

          The following shall be declared as functions and may also be
          defined as macros. Function prototypes shall be provided.

              int    sem_close(sem_t *);
              int    sem_destroy(sem_t *);
              int    sem_getvalue(sem_t *restrict, int *restrict);
              int    sem_init(sem_t *, int, unsigned);
              sem_t *sem_open(const char *, int, ...);
              int    sem_post(sem_t *);
              int    sem_timedwait(sem_t *restrict, const struct timespec *restrict);
              int    sem_trywait(sem_t *);
              int    sem_unlink(const char *);
              int    sem_wait(sem_t *);

          Inclusion of the <semaphore.h> header may make visible symbols
          defined in the <fcntl.h> and <time.h> headers.

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

          fcntl.h(0p), sys_types.h(0p), time.h(0p)

          The System Interfaces volume of POSIX.1‐2017, sem_close(3p),
          sem_destroy(3p), sem_getvalue(3p), sem_init(3p), sem_open(3p),
          sem_post(3p), sem_timedwait(3p), sem_trywait(3p), sem_unlink(3p)


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

   IEEE/The Open Group               2017                   semaphore.h(0P)

--------------

Pages that refer to this page:
`spawn.h(0p) <../man0/spawn.h.0p.html>`__, 
`sem_close(3p) <../man3/sem_close.3p.html>`__, 
`sem_destroy(3p) <../man3/sem_destroy.3p.html>`__, 
`sem_getvalue(3p) <../man3/sem_getvalue.3p.html>`__, 
`sem_init(3p) <../man3/sem_init.3p.html>`__, 
`sem_open(3p) <../man3/sem_open.3p.html>`__, 
`sem_post(3p) <../man3/sem_post.3p.html>`__, 
`sem_timedwait(3p) <../man3/sem_timedwait.3p.html>`__, 
`sem_trywait(3p) <../man3/sem_trywait.3p.html>`__, 
`sem_unlink(3p) <../man3/sem_unlink.3p.html>`__

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
