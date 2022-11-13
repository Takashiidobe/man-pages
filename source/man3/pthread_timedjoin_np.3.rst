.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_tryjoin_np(3) — Linux manual page
=========================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `VERSIONS <#VERSIONS>`__ \|       |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `BUGS <#BUGS>`__ \|            |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_TRYJOIN_NP(3)   Linux Programmer's Manual  PTHREAD_TRYJOIN_NP(3)

NAME
-------------------------------------------------

::

          pthread_tryjoin_np, pthread_timedjoin_np - try to join with a
          terminated thread


---------------------------------------------------------

::

          #define _GNU_SOURCE             /* See feature_test_macros(7) */
          #include <pthread.h>

          int pthread_tryjoin_np(pthread_t thread, void **retval);
          int pthread_timedjoin_np(pthread_t thread, void **retval,
                                   const struct timespec *abstime);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          These functions operate in the same way as pthread_join(3),
          except for the differences described on this page.

          The pthread_tryjoin_np() function performs a nonblocking join
          with the thread thread, returning the exit status of the thread
          in *retval.  If thread has not yet terminated, then instead of
          blocking, as is done by pthread_join(3), the call returns an
          error.

          The pthread_timedjoin_np() function performs a join-with-timeout.
          If thread has not yet terminated, then the call blocks until a
          maximum time, specified in abstime, measured against the
          CLOCK_REALTIME clock.  If the timeout expires before thread
          terminates, the call returns an error.  The abstime argument is a
          structure of the following form, specifying an absolute time
          measured since the Epoch (see time(2)):

              struct timespec {
                  time_t tv_sec;     /* seconds */
                  long   tv_nsec;    /* nanoseconds */
              };


-----------------------------------------------------------------

::

          On success, these functions return 0; on error, they return an
          error number.


-----------------------------------------------------

::

          These functions can fail with the same errors as pthread_join(3).
          pthread_tryjoin_np() can in addition fail with the following
          error:

          EBUSY  thread had not yet terminated at the time of the call.

          pthread_timedjoin_np() can in addition fail with the following
          errors:

          EINVAL abstime value is invalid (tv_sec is less than 0 or tv_nsec
                 is greater than 1e9).

          ETIMEDOUT
                 The call timed out before thread terminated.

          pthread_timedjoin_np() never returns the error EINTR.


---------------------------------------------------------

::

          These functions first appeared in glibc in version 2.3.3.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_tryjoin_np(),                 │ Thread safety │ MT-Safe │
          │pthread_timedjoin_np()                │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          These functions are nonstandard GNU extensions; hence the suffix
          "_np" (nonportable) in the names.


-------------------------------------------------

::

          The pthread_timedjoin_np() function measures time by internally
          calculating a relative sleep interval that is then measured
          against the CLOCK_MONOTONIC clock instead of the CLOCK_REALTIME
          clock.  Consequently, the timeout is unaffected by discontinuous
          changes to the CLOCK_REALTIME clock.


---------------------------------------------------------

::

          The following code waits to join for up to 5 seconds:

              struct timespec ts;
              int s;

              ...

              if (clock_gettime(CLOCK_REALTIME, &ts) == -1) {
                  /* Handle error */
              }

              ts.tv_sec += 5;

              s = pthread_timedjoin_np(thread, NULL, &ts);
              if (s != 0) {
                  /* Handle error */
              }


---------------------------------------------------------

::

          clock_gettime(2), pthread_exit(3), pthread_join(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-08-27          PTHREAD_TRYJOIN_NP(3)

--------------

Pages that refer to this page:
`pthread_join(3) <../man3/pthread_join.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_tryjoin_np.3.license.html>`__

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
