.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_setschedparam(3) — Linux manual page
=================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
| `ATTRIBUTES <#ATTRIBUTES>`__ \|   |                                   |
| `                                 |                                   |
| CONFORMING TO <#CONFORMING_TO>`__ |                                   |
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_ATTR_SETSCHEDPARAM(3) Programmer's ManualD_ATTR_SETSCHEDPARAM(3)

NAME
-------------------------------------------------

::

          pthread_attr_setschedparam, pthread_attr_getschedparam - set/get
          scheduling parameter attributes in thread attributes object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_setschedparam(pthread_attr_t *restrict attr,
                                        const struct sched_param *restrict param);
          int pthread_attr_getschedparam(const pthread_attr_t *restrict attr,
                                        struct sched_param *restrict param);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_attr_setschedparam() function sets the scheduling
          parameter attributes of the thread attributes object referred to
          by attr to the values specified in the buffer pointed to by
          param.  These attributes determine the scheduling parameters of a
          thread created using the thread attributes object attr.

          The pthread_attr_getschedparam() returns the scheduling parameter
          attributes of the thread attributes object attr in the buffer
          pointed to by param.

          Scheduling parameters are maintained in the following structure:

              struct sched_param {
                  int sched_priority;     /* Scheduling priority */
              };

          As can be seen, only one scheduling parameter is supported.  For
          details of the permitted ranges for scheduling priorities in each
          scheduling policy, see sched(7).

          In order for the parameter setting made by
          pthread_attr_setschedparam() to have effect when calling
          pthread_create(3), the caller must use
          pthread_attr_setinheritsched(3) to set the inherit-scheduler
          attribute of the attributes object attr to
          PTHREAD_EXPLICIT_SCHED.


-----------------------------------------------------------------

::

          On success, these functions return 0; on error, they return a
          nonzero error number.


-----------------------------------------------------

::

          pthread_attr_setschedparam() can fail with the following error:

          EINVAL The priority specified in param does not make sense for
                 the current scheduling policy of attr.

          POSIX.1 also documents an ENOTSUP error for
          pthread_attr_setschedparam().  This value is never returned on
          Linux (but portable and future-proof applications should
          nevertheless handle this error return value).


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_attr_setschedparam(),         │ Thread safety │ MT-Safe │
          │pthread_attr_getschedparam()          │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          See pthread_attr_setschedpolicy(3) for a list of the thread
          scheduling policies supported on Linux.


---------------------------------------------------------

::

          See pthread_setschedparam(3).


---------------------------------------------------------

::

          sched_get_priority_min(2), pthread_attr_init(3),
          pthread_attr_setinheritsched(3), pthread_attr_setschedpolicy(3),
          pthread_create(3), pthread_setschedparam(3),
          pthread_setschedprio(3), pthreads(7), sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22  PTHREAD_ATTR_SETSCHEDPARAM(3)

--------------

Pages that refer to this page:
`pthread_attr_init(3) <../man3/pthread_attr_init.3.html>`__, 
`pthread_attr_setinheritsched(3) <../man3/pthread_attr_setinheritsched.3.html>`__, 
`pthread_attr_setschedpolicy(3) <../man3/pthread_attr_setschedpolicy.3.html>`__, 
`pthread_attr_setscope(3) <../man3/pthread_attr_setscope.3.html>`__, 
`pthread_getattr_default_np(3) <../man3/pthread_getattr_default_np.3.html>`__, 
`pthread_getattr_np(3) <../man3/pthread_getattr_np.3.html>`__, 
`pthread_setschedparam(3) <../man3/pthread_setschedparam.3.html>`__, 
`pthread_setschedprio(3) <../man3/pthread_setschedprio.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_attr_setschedparam.3.license.html>`__

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
