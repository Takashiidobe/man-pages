.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_setinheritsched(3) — Linux manual page
===================================================

+-----------------------------------+-----------------------------------+
| `NAME <#NAME>`__ \|               |                                   |
| `SYNOPSIS <#SYNOPSIS>`__ \|       |                                   |
| `DESCRIPTION <#DESCRIPTION>`__ \| |                                   |
| `RETURN VALUE <#RETURN_VALUE>`__  |                                   |
| \| `ERRORS <#ERRORS>`__ \|        |                                   |
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

   PTHREAD_ATTR_SETINHERITSCHED(3)rogrammer'sTManualATTR_SETINHERITSCHED(3)

NAME
-------------------------------------------------

::

          pthread_attr_setinheritsched, pthread_attr_getinheritsched -
          set/get inherit-scheduler attribute in thread attributes object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_setinheritsched(pthread_attr_t *attr,
                                           int inheritsched);
          int pthread_attr_getinheritsched(const pthread_attr_t *restrict attr,
                                           int *restrict inheritsched);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_attr_setinheritsched() function sets the inherit-
          scheduler attribute of the thread attributes object referred to
          by attr to the value specified in inheritsched.  The inherit-
          scheduler attribute determines whether a thread created using the
          thread attributes object attr will inherit its scheduling
          attributes from the calling thread or whether it will take them
          from attr.

          The following scheduling attributes are affected by the inherit-
          scheduler attribute: scheduling policy
          (pthread_attr_setschedpolicy(3)), scheduling priority
          (pthread_attr_setschedparam(3)), and contention scope
          (pthread_attr_setscope(3)).

          The following values may be specified in inheritsched:

          PTHREAD_INHERIT_SCHED
                 Threads that are created using attr inherit scheduling
                 attributes from the creating thread; the scheduling
                 attributes in attr are ignored.

          PTHREAD_EXPLICIT_SCHED
                 Threads that are created using attr take their scheduling
                 attributes from the values specified by the attributes
                 object.

          The default setting of the inherit-scheduler attribute in a newly
          initialized thread attributes object is PTHREAD_INHERIT_SCHED.

          The pthread_attr_getinheritsched() returns the inherit-scheduler
          attribute of the thread attributes object attr in the buffer
          pointed to by inheritsched.


-----------------------------------------------------------------

::

          On success, these functions return 0; on error, they return a
          nonzero error number.


-----------------------------------------------------

::

          pthread_attr_setinheritsched() can fail with the following error:

          EINVAL Invalid value in inheritsched.

          POSIX.1 also documents an optional ENOTSUP error ("attempt was
          made to set the attribute to an unsupported value") for
          pthread_attr_setinheritsched().


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_attr_setinheritsched(),       │ Thread safety │ MT-Safe │
          │pthread_attr_getinheritsched()        │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


-------------------------------------------------

::

          As at glibc 2.8, if a thread attributes object is initialized
          using pthread_attr_init(3), then the scheduling policy of the
          attributes object is set to SCHED_OTHER and the scheduling
          priority is set to 0.  However, if the inherit-scheduler
          attribute is then set to PTHREAD_EXPLICIT_SCHED, then a thread
          created using the attribute object wrongly inherits its
          scheduling attributes from the creating thread.  This bug does
          not occur if either the scheduling policy or scheduling priority
          attribute is explicitly set in the thread attributes object
          before calling pthread_create(3).


---------------------------------------------------------

::

          See pthread_setschedparam(3).


---------------------------------------------------------

::

          pthread_attr_init(3), pthread_attr_setschedparam(3),
          pthread_attr_setschedpolicy(3), pthread_attr_setscope(3),
          pthread_create(3), pthread_setschedparam(3),
          pthread_setschedprio(3), pthreads(7), sched(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22PTHREAD_ATTR_SETINHERITSCHED(3)

--------------

Pages that refer to this page:
`pthread_attr_init(3) <../man3/pthread_attr_init.3.html>`__, 
`pthread_attr_setschedparam(3) <../man3/pthread_attr_setschedparam.3.html>`__, 
`pthread_attr_setschedpolicy(3) <../man3/pthread_attr_setschedpolicy.3.html>`__, 
`pthread_attr_setscope(3) <../man3/pthread_attr_setscope.3.html>`__, 
`pthread_getattr_default_np(3) <../man3/pthread_getattr_default_np.3.html>`__, 
`pthread_getattr_np(3) <../man3/pthread_getattr_np.3.html>`__, 
`pthread_setschedparam(3) <../man3/pthread_setschedparam.3.html>`__, 
`pthread_setschedprio(3) <../man3/pthread_setschedprio.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_attr_setinheritsched.3.license.html>`__

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
