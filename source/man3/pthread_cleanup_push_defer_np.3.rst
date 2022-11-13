.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_cleanup_push_defer_np(3) — Linux manual page
====================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `SEE ALSO <#SEE_ALSO>`__ \|    |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_CLEANUP_PUSH_DEFER_NP(3)ogrammer'sHManualLEANUP_PUSH_DEFER_NP(3)

NAME
-------------------------------------------------

::

          pthread_cleanup_push_defer_np, pthread_cleanup_pop_restore_np -
          push and pop thread cancellation clean-up handlers while saving
          cancelability type


---------------------------------------------------------

::

          #include <pthread.h>

          void pthread_cleanup_push_defer_np(void (*routine)(void *), void *arg);
          void pthread_cleanup_pop_restore_np(int execute);

          Compile and link with -pthread.

      Feature Test Macro Requirements for glibc (see
      feature_test_macros(7)):

          pthread_cleanup_push_defer_np(), pthread_cleanup_pop_defer_np():
              _GNU_SOURCE


---------------------------------------------------------------

::

          These functions are the same as pthread_cleanup_push(3) and
          pthread_cleanup_pop(3), except for the differences noted on this
          page.

          Like pthread_cleanup_push(3), pthread_cleanup_push_defer_np()
          pushes routine onto the thread's stack of cancellation clean-up
          handlers.  In addition, it also saves the thread's current
          cancelability type, and sets the cancelability type to "deferred"
          (see pthread_setcanceltype(3)); this ensures that cancellation
          clean-up will occur even if the thread's cancelability type was
          "asynchronous" before the call.

          Like pthread_cleanup_pop(3), pthread_cleanup_pop_restore_np()
          pops the top-most clean-up handler from the thread's stack of
          cancellation clean-up handlers.  In addition, it restores the
          thread's cancelability type to its value at the time of the
          matching pthread_cleanup_push_defer_np().

          The caller must ensure that calls to these functions are paired
          within the same function, and at the same lexical nesting level.
          Other restrictions apply, as described in
          pthread_cleanup_push(3).

          This sequence of calls:

              pthread_cleanup_push_defer_np(routine, arg);
              pthread_cleanup_pop_restore_np(execute);

          is equivalent to (but shorter and more efficient than):

              int oldtype;

              pthread_cleanup_push(routine, arg);
              pthread_setcanceltype(PTHREAD_CANCEL_DEFERRED, &oldtype);
              ...
              pthread_setcanceltype(oldtype, NULL);
              pthread_cleanup_pop(execute);


-------------------------------------------------------------------

::

          These functions are nonstandard GNU extensions; hence the suffix
          "_np" (nonportable) in the names.


---------------------------------------------------------

::

          pthread_cancel(3), pthread_cleanup_push(3),
          pthread_setcancelstate(3), pthread_testcancel(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22PTHREAD_CLEANUP_PUSH_DEFER_NP(3)

--------------

Pages that refer to this page:
`pthread_cleanup_push(3) <../man3/pthread_cleanup_push.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_cleanup_push_defer_np.3.license.html>`__

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
