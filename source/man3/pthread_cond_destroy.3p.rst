.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_cond_destroy(3p) — Linux manual page
============================================

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

   PTHREAD_COND_DESTROY(3P)POSIX Programmer's ManualTHREAD_COND_DESTROY(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_cond_destroy, pthread_cond_init — destroy and initialize
          condition variables


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_cond_destroy(pthread_cond_t *cond);
          int pthread_cond_init(pthread_cond_t *restrict cond,
              const pthread_condattr_t *restrict attr);
          pthread_cond_t cond = PTHREAD_COND_INITIALIZER;


---------------------------------------------------------------

::

          The pthread_cond_destroy() function shall destroy the given
          condition variable specified by cond; the object becomes, in
          effect, uninitialized. An implementation may cause
          pthread_cond_destroy() to set the object referenced by cond to an
          invalid value. A destroyed condition variable object can be
          reinitialized using pthread_cond_init(); the results of otherwise
          referencing the object after it has been destroyed are undefined.

          It shall be safe to destroy an initialized condition variable
          upon which no threads are currently blocked. Attempting to
          destroy a condition variable upon which other threads are
          currently blocked results in undefined behavior.

          The pthread_cond_init() function shall initialize the condition
          variable referenced by cond with attributes referenced by attr.
          If attr is NULL, the default condition variable attributes shall
          be used; the effect is the same as passing the address of a
          default condition variable attributes object. Upon successful
          initialization, the state of the condition variable shall become
          initialized.

          See Section 2.9.9, Synchronization Object Copies and Alternative
          Mappings for further requirements.

          Attempting to initialize an already initialized condition
          variable results in undefined behavior.

          In cases where default condition variable attributes are
          appropriate, the macro PTHREAD_COND_INITIALIZER can be used to
          initialize condition variables. The effect shall be equivalent to
          dynamic initialization by a call to pthread_cond_init() with
          parameter attr specified as NULL, except that no error checks are
          performed.

          The behavior is undefined if the value specified by the cond
          argument to pthread_cond_destroy() does not refer to an
          initialized condition variable.

          The behavior is undefined if the value specified by the attr
          argument to pthread_cond_init() does not refer to an initialized
          condition variable attributes object.


-----------------------------------------------------------------

::

          If successful, the pthread_cond_destroy() and pthread_cond_init()
          functions shall return zero; otherwise, an error number shall be
          returned to indicate the error.


-----------------------------------------------------

::

          The pthread_cond_init() function shall fail if:

          EAGAIN The system lacked the necessary resources (other than
                 memory) to initialize another condition variable.

          ENOMEM Insufficient memory exists to initialize the condition
                 variable.

          These functions shall not return an error code of [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          A condition variable can be destroyed immediately after all the
          threads that are blocked on it are awakened. For example,
          consider the following code:

              struct list {
                  pthread_mutex_t lm;
                  ...
              }

              struct elt {
                  key k;
                  int busy;
                  pthread_cond_t notbusy;
                  ...
              }

              /* Find a list element and reserve it. */
              struct elt *
              list_find(struct list *lp, key k)
              {
                  struct elt *ep;

                  pthread_mutex_lock(&lp->lm);
                  while ((ep = find_elt(l, k) != NULL) && ep->busy)
                      pthread_cond_wait(&ep->notbusy, &lp->lm);
                  if (ep != NULL)
                      ep->busy = 1;
                  pthread_mutex_unlock(&lp->lm);
                  return(ep);
              }

              delete_elt(struct list *lp, struct elt *ep)
              {
                  pthread_mutex_lock(&lp->lm);
                  assert(ep->busy);
                  ... remove ep from list ...
                  ep->busy = 0;  /* Paranoid. */
              (A) pthread_cond_broadcast(&ep->notbusy);
                  pthread_mutex_unlock(&lp->lm);
              (B) pthread_cond_destroy(&ep->notbusy);
                  free(ep);
              }

          In this example, the condition variable and its list element may
          be freed (line B) immediately after all threads waiting for it
          are awakened (line A), since the mutex and the code ensure that
          no other thread can touch the element to be deleted.


---------------------------------------------------------------------------

::

          None.


-----------------------------------------------------------

::

          If an implementation detects that the value specified by the cond
          argument to pthread_cond_destroy() does not refer to an
          initialized condition variable, it is recommended that the
          function should fail and report an [EINVAL] error.

          If an implementation detects that the value specified by the cond
          argument to pthread_cond_destroy() or pthread_cond_init() refers
          to a condition variable that is in use (for example, in a
          pthread_cond_wait() call) by another thread, or detects that the
          value specified by the cond argument to pthread_cond_init()
          refers to an already initialized condition variable, it is
          recommended that the function should fail and report an [EBUSY]
          error.

          If an implementation detects that the value specified by the attr
          argument to pthread_cond_init() does not refer to an initialized
          condition variable attributes object, it is recommended that the
          function should fail and report an [EINVAL] error.

          See also pthread_mutex_destroy(3p).


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

          pthread_cond_broadcast(3p), pthread_cond_timedwait(3p),
          pthread_mutex_destroy(3p)

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

   IEEE/The Open Group               2017          PTHREAD_COND_DESTROY(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__, 
`pthread_condattr_destroy(3p) <../man3/pthread_condattr_destroy.3p.html>`__, 
`pthread_condattr_getclock(3p) <../man3/pthread_condattr_getclock.3p.html>`__, 
`pthread_condattr_getpshared(3p) <../man3/pthread_condattr_getpshared.3p.html>`__, 
`pthread_cond_broadcast(3p) <../man3/pthread_cond_broadcast.3p.html>`__, 
`pthread_mutexattr_destroy(3p) <../man3/pthread_mutexattr_destroy.3p.html>`__, 
`pthread_mutexattr_getprioceiling(3p) <../man3/pthread_mutexattr_getprioceiling.3p.html>`__, 
`pthread_mutexattr_getprotocol(3p) <../man3/pthread_mutexattr_getprotocol.3p.html>`__, 
`pthread_mutexattr_getpshared(3p) <../man3/pthread_mutexattr_getpshared.3p.html>`__

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
