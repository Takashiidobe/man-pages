.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_getstacksize(3p) — Linux manual page
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

   PTHREAD_ATTR_GETSTACKSIZE(3P) Programmer's ManualD_ATTR_GETSTACKSIZE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_attr_getstacksize, pthread_attr_setstacksize — get and
          set the stacksize attribute


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_getstacksize(const pthread_attr_t *restrict attr,
              size_t *restrict stacksize);
          int pthread_attr_setstacksize(pthread_attr_t *attr, size_t stacksize);


---------------------------------------------------------------

::

          The pthread_attr_getstacksize() and pthread_attr_setstacksize()
          functions, respectively, shall get and set the thread creation
          stacksize attribute in the attr object.

          The stacksize attribute shall define the minimum stack size (in
          bytes) allocated for the created threads stack.

          The behavior is undefined if the value specified by the attr
          argument to pthread_attr_getstacksize() or
          pthread_attr_setstacksize() does not refer to an initialized
          thread attributes object.


-----------------------------------------------------------------

::

          Upon successful completion, pthread_attr_getstacksize() and
          pthread_attr_setstacksize() shall return a value of 0; otherwise,
          an error number shall be returned to indicate the error.

          The pthread_attr_getstacksize() function stores the stacksize
          attribute value in stacksize if successful.


-----------------------------------------------------

::

          The pthread_attr_setstacksize() function shall fail if:

          EINVAL The value of stacksize is less than {PTHREAD_STACK_MIN} or
                 exceeds a system-imposed limit.

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
          argument to pthread_attr_getstacksize() or
          pthread_attr_setstacksize() does not refer to an initialized
          thread attributes object, it is recommended that the function
          should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_attr_destroy(3p), pthread_attr_getdetachstate(3p),
          pthread_create(3p)

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

   IEEE/The Open Group               2017     PTHREAD_ATTR_GETSTACKSIZE(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_attr_destroy(3p) <../man3/pthread_attr_destroy.3p.html>`__, 
`pthread_attr_getdetachstate(3p) <../man3/pthread_attr_getdetachstate.3p.html>`__, 
`pthread_attr_getstack(3p) <../man3/pthread_attr_getstack.3p.html>`__, 
`pthread_attr_setstacksize(3p) <../man3/pthread_attr_setstacksize.3p.html>`__

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
