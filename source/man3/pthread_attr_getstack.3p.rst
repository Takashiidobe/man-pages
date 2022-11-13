.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_getstack(3p) — Linux manual page
=============================================

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

   PTHREAD_ATTR_GETSTACK(3P)OSIX Programmer's ManualHREAD_ATTR_GETSTACK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_attr_getstack, pthread_attr_setstack — get and set stack
          attributes


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_getstack(const pthread_attr_t *restrict attr,
              void **restrict stackaddr, size_t *restrict stacksize);
          int pthread_attr_setstack(pthread_attr_t *attr, void *stackaddr,
              size_t stacksize);


---------------------------------------------------------------

::

          The pthread_attr_getstack() and pthread_attr_setstack()
          functions, respectively, shall get and set the thread creation
          stack attributes stackaddr and stacksize in the attr object.

          The stack attributes specify the area of storage to be used for
          the created thread's stack. The base (lowest addressable byte) of
          the storage shall be stackaddr, and the size of the storage shall
          be stacksize bytes. The stacksize shall be at least
          {PTHREAD_STACK_MIN}.  The pthread_attr_setstack() function may
          fail with [EINVAL] if stackaddr does not meet implementation-
          defined alignment requirements.  All pages within the stack
          described by stackaddr and stacksize shall be both readable and
          writable by the thread.

          If the pthread_attr_getstack() function is called before the
          stackaddr attribute has been set, the behavior is unspecified.

          The behavior is undefined if the value specified by the attr
          argument to pthread_attr_getstack() or pthread_attr_setstack()
          does not refer to an initialized thread attributes object.


-----------------------------------------------------------------

::

          Upon successful completion, these functions shall return a value
          of 0; otherwise, an error number shall be returned to indicate
          the error.

          The pthread_attr_getstack() function shall store the stack
          attribute values in stackaddr and stacksize if successful.


-----------------------------------------------------

::

          The pthread_attr_setstack() function shall fail if:

          EINVAL The value of stacksize is less than {PTHREAD_STACK_MIN} or
                 exceeds an implementation-defined limit.

          The pthread_attr_setstack() function may fail if:

          EINVAL The value of stackaddr does not have proper alignment to
                 be used as a stack, or ((char *)stackaddr + stacksize)
                 lacks proper alignment.

          EACCES The stack page(s) described by stackaddr and stacksize are
                 not both readable and writable by the thread.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          These functions are appropriate for use by applications in an
          environment where the stack for a thread must be placed in some
          particular region of memory.

          While it might seem that an application could detect stack
          overflow by providing a protected page outside the specified
          stack region, this cannot be done portably. Implementations are
          free to place the thread's initial stack pointer anywhere within
          the specified region to accommodate the machine's stack pointer
          behavior and allocation requirements. Furthermore, on some
          architectures, such as the IA‐64, ``overflow'' might mean that
          two separate stack pointers allocated within the region will
          overlap somewhere in the middle of the region.

          After a successful call to pthread_attr_setstack(), the storage
          area specified by the stackaddr parameter is under the control of
          the implementation, as described in Section 2.9.8, Use of
          Application-Managed Thread Stacks.

          The specification of the stackaddr attribute presents several
          ambiguities that make portable use of these functions impossible.
          For example, the standard allows implementations to impose
          arbitrary alignment requirements on stackaddr.  Applications
          cannot assume that a buffer obtained from malloc() is suitably
          aligned. Note that although the stacksize value passed to
          pthread_attr_setstack() must satisfy alignment requirements, the
          same is not true for pthread_attr_setstacksize() where the
          implementation must increase the specified size if necessary to
          achieve the proper alignment.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the attr
          argument to pthread_attr_getstack() or pthread_attr_setstack()
          does not refer to an initialized thread attributes object, it is
          recommended that the function should fail and report an [EINVAL]
          error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_attr_destroy(3p), pthread_attr_getdetachstate(3p),
          pthread_attr_getstacksize(3p), pthread_create(3p)

          The Base Definitions volume of POSIX.1‐2017, limits.h(0p),
          pthread.h(0p)


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

   IEEE/The Open Group               2017         PTHREAD_ATTR_GETSTACK(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_attr_setstack(3p) <../man3/pthread_attr_setstack.3p.html>`__

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
