.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_getguardsize(3p) — Linux manual page
=================================================

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

   PTHREAD_ATTR_GETGUARDSIZE(3P) Programmer's ManualD_ATTR_GETGUARDSIZE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_attr_getguardsize, pthread_attr_setguardsize — get and
          set the thread guardsize attribute


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_getguardsize(const pthread_attr_t *restrict attr,
              size_t *restrict guardsize);
          int pthread_attr_setguardsize(pthread_attr_t *attr,
              size_t guardsize);


---------------------------------------------------------------

::

          The pthread_attr_getguardsize() function shall get the guardsize
          attribute in the attr object. This attribute shall be returned in
          the guardsize parameter.

          The pthread_attr_setguardsize() function shall set the guardsize
          attribute in the attr object. The new value of this attribute
          shall be obtained from the guardsize parameter. If guardsize is
          zero, a guard area shall not be provided for threads created with
          attr.  If guardsize is greater than zero, a guard area of at
          least size guardsize bytes shall be provided for each thread
          created with attr.

          The guardsize attribute controls the size of the guard area for
          the created thread's stack. The guardsize attribute provides
          protection against overflow of the stack pointer. If a thread's
          stack is created with guard protection, the implementation
          allocates extra memory at the overflow end of the stack as a
          buffer against stack overflow of the stack pointer. If an
          application overflows into this buffer an error shall result
          (possibly in a SIGSEGV signal being delivered to the thread).

          A conforming implementation may round up the value contained in
          guardsize to a multiple of the configurable system variable
          {PAGESIZE} (see <sys/mman.h>).  If an implementation rounds up
          the value of guardsize to a multiple of {PAGESIZE}, a call to
          pthread_attr_getguardsize() specifying attr shall store in the
          guardsize parameter the guard size specified by the previous
          pthread_attr_setguardsize() function call.

          The default value of the guardsize attribute is implementation-
          defined.

          If the stackaddr attribute has been set (that is, the caller is
          allocating and managing its own thread stacks), the guardsize
          attribute shall be ignored and no protection shall be provided by
          the implementation. It is the responsibility of the application
          to manage stack overflow along with stack allocation and
          management in this case.

          The behavior is undefined if the value specified by the attr
          argument to pthread_attr_getguardsize() or
          pthread_attr_setguardsize() does not refer to an initialized
          thread attributes object.


-----------------------------------------------------------------

::

          If successful, the pthread_attr_getguardsize() and
          pthread_attr_setguardsize() functions shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          These functions shall fail if:

          EINVAL The parameter guardsize is invalid.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

      Retrieving the guardsize Attribute
          This example shows how to obtain the guardsize attribute of a
          thread attribute object.

              #include <pthread.h>

              pthread_attr_t thread_attr;
              size_t  guardsize;
              int     rc;

              /* code initializing thread_attr */
              ...

              rc = pthread_attr_getguardsize (&thread_attr, &guardsize);
              if (rc != 0)  {
                  /* handle error */
                  ...
              }
              else {
                  if (guardsize > 0) {
                  /* a guard area of at least guardsize bytes is provided */
                  ...
                  }
                  else {
                  /* no guard area provided */
                  ...
                  }
              }


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          The guardsize attribute is provided to the application for two
          reasons:

           1. Overflow protection can potentially result in wasted system
              resources.  An application that creates a large number of
              threads, and which knows its threads never overflow their
              stack, can save system resources by turning off guard areas.

           2. When threads allocate large data structures on the stack,
              large guard areas may be needed to detect stack overflow.

          The default size of the guard area is left implementation-defined
          since on systems supporting very large page sizes, the overhead
          might be substantial if at least one guard page is required by
          default.

          If an implementation detects that the value specified by the attr
          argument to pthread_attr_getguardsize() or
          pthread_attr_setguardsize() does not refer to an initialized
          thread attributes object, it is recommended that the function
          should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          The Base Definitions volume of POSIX.1‐2017, pthread.h(0p),
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

   IEEE/The Open Group               2017     PTHREAD_ATTR_GETGUARDSIZE(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_attr_setguardsize(3p) <../man3/pthread_attr_setguardsize.3p.html>`__

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
