.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_getschedparam(3p) — Linux manual page
==================================================

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

   PTHREAD_ATTR_GETSCHEDPARAM(3P)Programmer'sPManual_ATTR_GETSCHEDPARAM(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_attr_getschedparam, pthread_attr_setschedparam — get and
          set the schedparam attribute


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_getschedparam(const pthread_attr_t *restrict attr,
              struct sched_param *restrict param);
          int pthread_attr_setschedparam(pthread_attr_t *restrict attr,
              const struct sched_param *restrict param);


---------------------------------------------------------------

::

          The pthread_attr_getschedparam() and pthread_attr_setschedparam()
          functions, respectively, shall get and set the scheduling
          parameter attributes in the attr argument. The contents of the
          param structure are defined in the <sched.h> header. For the
          SCHED_FIFO and SCHED_RR policies, the only required member of
          param is sched_priority.

          For the SCHED_SPORADIC policy, the required members of the param
          structure are sched_priority, sched_ss_low_priority,
          sched_ss_repl_period, sched_ss_init_budget, and
          sched_ss_max_repl.  The specified sched_ss_repl_period must be
          greater than or equal to the specified sched_ss_init_budget for
          the function to succeed; if it is not, then the function shall
          fail. The value of sched_ss_max_repl shall be within the
          inclusive range [1,{SS_REPL_MAX}] for the function to succeed; if
          not, the function shall fail.  It is unspecified whether the
          sched_ss_repl_period and sched_ss_init_budget values are stored
          as provided by this function or are rounded to align with the
          resolution of the clock being used.

          The behavior is undefined if the value specified by the attr
          argument to pthread_attr_getschedparam() or
          pthread_attr_setschedparam() does not refer to an initialized
          thread attributes object.


-----------------------------------------------------------------

::

          If successful, the pthread_attr_getschedparam() and
          pthread_attr_setschedparam() functions shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_attr_setschedparam() function shall fail if:

          ENOTSUP
                 An attempt was made to set the attribute to an unsupported
                 value.

          The pthread_attr_setschedparam() function may fail if:

          EINVAL The value of param is not valid.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          After these attributes have been set, a thread can be created
          with the specified attributes using pthread_create().  Using
          these routines does not affect the current running thread.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the attr
          argument to pthread_attr_getschedparam() or
          pthread_attr_setschedparam() does not refer to an initialized
          thread attributes object, it is recommended that the function
          should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_attr_destroy(3p), pthread_attr_getscope(3p),
          pthread_attr_getinheritsched(3p),
          pthread_attr_getschedpolicy(3p), pthread_create(3p)

          The Base Definitions volume of POSIX.1‐2017, pthread.h(0p),
          sched.h(0p)


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

   IEEE/The Open Group               2017    PTHREAD_ATTR_GETSCHEDPARAM(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_attr_getinheritsched(3p) <../man3/pthread_attr_getinheritsched.3p.html>`__, 
`pthread_attr_getschedpolicy(3p) <../man3/pthread_attr_getschedpolicy.3p.html>`__, 
`pthread_attr_getscope(3p) <../man3/pthread_attr_getscope.3p.html>`__, 
`pthread_attr_setschedparam(3p) <../man3/pthread_attr_setschedparam.3p.html>`__

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
