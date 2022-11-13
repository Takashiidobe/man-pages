.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_setdetachstate(3) — Linux manual page
==================================================

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

   PTHREAD_ATTR_SETDETACHSTATE(3)Programmer'sPManual_ATTR_SETDETACHSTATE(3)

NAME
-------------------------------------------------

::

          pthread_attr_setdetachstate, pthread_attr_getdetachstate -
          set/get detach state attribute in thread attributes object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_setdetachstate(pthread_attr_t *attr, int detachstate);
          int pthread_attr_getdetachstate(const pthread_attr_t *attr,
                                          int *detachstate);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_attr_setdetachstate() function sets the detach state
          attribute of the thread attributes object referred to by attr to
          the value specified in detachstate.  The detach state attribute
          determines whether a thread created using the thread attributes
          object attr will be created in a joinable or a detached state.

          The following values may be specified in detachstate:

          PTHREAD_CREATE_DETACHED
                 Threads that are created using attr will be created in a
                 detached state.

          PTHREAD_CREATE_JOINABLE
                 Threads that are created using attr will be created in a
                 joinable state.

          The default setting of the detach state attribute in a newly
          initialized thread attributes object is PTHREAD_CREATE_JOINABLE.

          The pthread_attr_getdetachstate() returns the detach state
          attribute of the thread attributes object attr in the buffer
          pointed to by detachstate.


-----------------------------------------------------------------

::

          On success, these functions return 0; on error, they return a
          nonzero error number.


-----------------------------------------------------

::

          pthread_attr_setdetachstate() can fail with the following error:

          EINVAL An invalid value was specified in detachstate.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_attr_setdetachstate(),        │ Thread safety │ MT-Safe │
          │pthread_attr_getdetachstate()         │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          See pthread_create(3) for more details on detached and joinable
          threads.

          A thread that is created in a joinable state should eventually
          either be joined using pthread_join(3) or detached using
          pthread_detach(3); see pthread_create(3).

          It is an error to specify the thread ID of a thread that was
          created in a detached state in a later call to pthread_detach(3)
          or pthread_join(3).


---------------------------------------------------------

::

          See pthread_attr_init(3).


---------------------------------------------------------

::

          pthread_attr_init(3), pthread_create(3), pthread_detach(3),
          pthread_join(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22 PTHREAD_ATTR_SETDETACHSTATE(3)

--------------

Pages that refer to this page:
`pthread_attr_init(3) <../man3/pthread_attr_init.3.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`pthread_detach(3) <../man3/pthread_detach.3.html>`__, 
`pthread_getattr_default_np(3) <../man3/pthread_getattr_default_np.3.html>`__, 
`pthread_getattr_np(3) <../man3/pthread_getattr_np.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_attr_setdetachstate.3.license.html>`__

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
