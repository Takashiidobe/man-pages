.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_condattr_getpshared(3p) — Linux manual page
===================================================

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

   PTHREAD_CONDATTR_GETPSHARED(3P)rogrammer'sTManualCONDATTR_GETPSHARED(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_condattr_getpshared, pthread_condattr_setpshared — get
          and set the process-shared condition variable attributes


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_condattr_getpshared(const pthread_condattr_t *restrict attr,
              int *restrict pshared);
          int pthread_condattr_setpshared(pthread_condattr_t *attr,
              int pshared);


---------------------------------------------------------------

::

          The pthread_condattr_getpshared() function shall obtain the value
          of the process-shared attribute from the attributes object
          referenced by attr.

          The pthread_condattr_setpshared() function shall set the process-
          shared attribute in an initialized attributes object referenced
          by attr.

          The process-shared attribute is set to PTHREAD_PROCESS_SHARED to
          permit a condition variable to be operated upon by any thread
          that has access to the memory where the condition variable is
          allocated, even if the condition variable is allocated in memory
          that is shared by multiple processes. See Section 2.9.9,
          Synchronization Object Copies and Alternative Mappings for
          further requirements. The default value of the attribute is
          PTHREAD_PROCESS_PRIVATE.

          The behavior is undefined if the value specified by the attr
          argument to pthread_condattr_getpshared() or
          pthread_condattr_setpshared() does not refer to an initialized
          condition variable attributes object.


-----------------------------------------------------------------

::

          If successful, the pthread_condattr_setpshared() function shall
          return zero; otherwise, an error number shall be returned to
          indicate the error.

          If successful, the pthread_condattr_getpshared() function shall
          return zero and store the value of the process-shared attribute
          of attr into the object referenced by the pshared parameter.
          Otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_condattr_setpshared() function may fail if:

          EINVAL The new value specified for the attribute is outside the
                 range of legal values for that attribute.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the attr
          argument to pthread_condattr_getpshared() or
          pthread_condattr_setpshared() does not refer to an initialized
          condition variable attributes object, it is recommended that the
          function should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_create(3p), pthread_cond_destroy(3p),
          pthread_condattr_destroy(3p), pthread_mutex_destroy(3p)

          The Base Definitions volume of POSIX.1‐2017, pthread.h(0p)


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

   IEEE/The Open Group               2017   PTHREAD_CONDATTR_GETPSHARED(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_condattr_destroy(3p) <../man3/pthread_condattr_destroy.3p.html>`__, 
`pthread_condattr_getclock(3p) <../man3/pthread_condattr_getclock.3p.html>`__, 
`pthread_condattr_setpshared(3p) <../man3/pthread_condattr_setpshared.3p.html>`__

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
