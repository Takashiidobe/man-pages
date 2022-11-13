.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_once(3p) — Linux manual page
====================================

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

   PTHREAD_ONCE(3P)        POSIX Programmer's Manual       PTHREAD_ONCE(3P)


-----------------------------------------------------

::

          This manual page is part of the POSIX Programmer's Manual.  The
          Linux implementation of this interface may differ (consult the
          corresponding Linux manual page for details of Linux behavior),
          or the interface may not be implemented on Linux.

NAME
-------------------------------------------------

::

          pthread_once — dynamic package initialization


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_once(pthread_once_t *once_control,
              void (*init_routine)(void));
          pthread_once_t once_control = PTHREAD_ONCE_INIT;


---------------------------------------------------------------

::

          The first call to pthread_once() by any thread in a process, with
          a given once_control, shall call the init_routine with no
          arguments. Subsequent calls of pthread_once() with the same
          once_control shall not call the init_routine.  On return from
          pthread_once(), init_routine shall have completed. The
          once_control parameter shall determine whether the associated
          initialization routine has been called.

          The pthread_once() function is not a cancellation point. However,
          if init_routine is a cancellation point and is canceled, the
          effect on once_control shall be as if pthread_once() was never
          called.

          If the call to init_routine is terminated by a call to longjmp(),
          _longjmp(), or siglongjmp(), the behavior is undefined.

          The constant PTHREAD_ONCE_INIT is defined in the <pthread.h>
          header.

          The behavior of pthread_once() is undefined if once_control has
          automatic storage duration or is not initialized by
          PTHREAD_ONCE_INIT.


-----------------------------------------------------------------

::

          Upon successful completion, pthread_once() shall return zero;
          otherwise, an error number shall be returned to indicate the
          error.


-----------------------------------------------------

::

          The pthread_once() function shall not return an error code of
          [EINTR].

          The following sections are informative.


---------------------------------------------------------

::

          None.


---------------------------------------------------------------------------

::

          If init_routine recursively calls pthread_once() with the same
          once_control, the recursive call will not call the specified
          init_routine, and thus the specified init_routine will not
          complete, and thus the recursive call to pthread_once() will not
          return. Use of longjmp(), _longjmp(), or siglongjmp() within an
          init_routine to jump to a point outside of init_routine prevents
          init_routine from returning.


-----------------------------------------------------------

::

          Some C libraries are designed for dynamic initialization. That
          is, the global initialization for the library is performed when
          the first procedure in the library is called. In a single-
          threaded program, this is normally implemented using a static
          variable whose value is checked on entry to a routine, as
          follows:

              static int random_is_initialized = 0;
              extern void initialize_random(void);

              int random_function()
              {
                  if (random_is_initialized == 0) {
                      initialize_random();
                      random_is_initialized = 1;
                  }
                  ... /* Operations performed after initialization. */
              }

          To keep the same structure in a multi-threaded program, a new
          primitive is needed. Otherwise, library initialization has to be
          accomplished by an explicit call to a library-exported
          initialization function prior to any use of the library.

          For dynamic library initialization in a multi-threaded process,
          if an initialization flag is used the flag needs to be protected
          against modification by multiple threads simultaneously calling
          into the library. This can be done by using a mutex (initialized
          by assigning PTHREAD_MUTEX_INITIALIZER). However, the better
          solution is to use pthread_once() which is designed for exactly
          this purpose, as follows:

              #include <pthread.h>
              static pthread_once_t random_is_initialized = PTHREAD_ONCE_INIT;
              extern void initialize_random(void);

              int random_function()
              {
                  (void) pthread_once(&random_is_initialized, initialize_random);
                  ... /* Operations performed after initialization. */
              }

          If an implementation detects that the value specified by the
          once_control argument to pthread_once() does not refer to a
          pthread_once_t object initialized by PTHREAD_ONCE_INIT, it is
          recommended that the function should fail and report an [EINVAL]
          error.


---------------------------------------------------------------------------

::

          None.


---------------------------------------------------------

::

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

   IEEE/The Open Group               2017                  PTHREAD_ONCE(3P)

--------------

Pages that refer to this page:
`pthread.h(0p) <../man0/pthread.h.0p.html>`__

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
