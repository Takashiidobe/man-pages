.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_condattr_getclock(3p) — Linux manual page
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

   PTHREAD_CONDATTR_GETCLOCK(3P) Programmer's ManualD_CONDATTR_GETCLOCK(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_condattr_getclock, pthread_condattr_setclock — get and
          set the clock selection condition variable attribute


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_condattr_getclock(const pthread_condattr_t *restrict attr,
              clockid_t *restrict clock_id);
          int pthread_condattr_setclock(pthread_condattr_t *attr,
              clockid_t clock_id);


---------------------------------------------------------------

::

          The pthread_condattr_getclock() function shall obtain the value
          of the clock attribute from the attributes object referenced by
          attr.

          The pthread_condattr_setclock() function shall set the clock
          attribute in an initialized attributes object referenced by attr.
          If pthread_condattr_setclock() is called with a clock_id argument
          that refers to a CPU-time clock, the call shall fail.

          The clock attribute is the clock ID of the clock that shall be
          used to measure the timeout service of pthread_cond_timedwait().
          The default value of the clock attribute shall refer to the
          system clock.

          The behavior is undefined if the value specified by the attr
          argument to pthread_condattr_getclock() or
          pthread_condattr_setclock() does not refer to an initialized
          condition variable attributes object.


-----------------------------------------------------------------

::

          If successful, the pthread_condattr_getclock() function shall
          return zero and store the value of the clock attribute of attr
          into the object referenced by the clock_id argument. Otherwise,
          an error number shall be returned to indicate the error.

          If successful, the pthread_condattr_setclock() function shall
          return zero; otherwise, an error number shall be returned to
          indicate the error.


-----------------------------------------------------

::

          The pthread_condattr_setclock() function may fail if:

          EINVAL The value specified by clock_id does not refer to a known
                 clock, or is a CPU-time clock.

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
          argument to pthread_condattr_getclock() or
          pthread_condattr_setclock() does not refer to an initialized
          condition variable attributes object, it is recommended that the
          function should fail and report an [EINVAL] error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_cond_destroy(3p), pthread_cond_timedwait(3p),
          pthread_condattr_destroy(3p), pthread_condattr_getpshared(3p),
          pthread_create(3p), pthread_mutex_destroy(3p)

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

   IEEE/The Open Group               2017     PTHREAD_CONDATTR_GETCLOCK(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_condattr_setclock(3p) <../man3/pthread_condattr_setclock.3p.html>`__

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
