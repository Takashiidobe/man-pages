.. container:: page-top

.. container:: nav-bar

   +----------------------------------+----------------------------------+
   | `m                               | `Linux/UNIX system programming   |
   | an7.org <../../../index.html>`__ | trainin                          |
   | > Linux >                        | g <http://man7.org/training/>`__ |
   | `man-pages <../index.html>`__    |                                  |
   +----------------------------------+----------------------------------+

--------------

pthread_attr_setstacksize(3) — Linux manual page
================================================

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
| \| `NOTES <#NOTES>`__ \|          |                                   |
| `BUGS <#BUGS>`__ \|               |                                   |
| `EXAMPLES <#EXAMPLES>`__ \|       |                                   |
| `SEE ALSO <#SEE_ALSO>`__ \|       |                                   |
| `COLOPHON <#COLOPHON>`__          |                                   |
+-----------------------------------+-----------------------------------+
| .. container:: man-search-box     |                                   |
+-----------------------------------+-----------------------------------+

::

   PTHREAD_ATTR_SETSTACKSIZE(3)x Programmer's ManualAD_ATTR_SETSTACKSIZE(3)

NAME
-------------------------------------------------

::

          pthread_attr_setstacksize, pthread_attr_getstacksize - set/get
          stack size attribute in thread attributes object


---------------------------------------------------------

::

          #include <pthread.h>

          int pthread_attr_setstacksize(pthread_attr_t *attr, size_t stacksize);
          int pthread_attr_getstacksize(const pthread_attr_t *restrict attr,
                                        size_t *restrict stacksize);

          Compile and link with -pthread.


---------------------------------------------------------------

::

          The pthread_attr_setstacksize() function sets the stack size
          attribute of the thread attributes object referred to by attr to
          the value specified in stacksize.

          The stack size attribute determines the minimum size (in bytes)
          that will be allocated for threads created using the thread
          attributes object attr.

          The pthread_attr_getstacksize() function returns the stack size
          attribute of the thread attributes object referred to by attr in
          the buffer pointed to by stacksize.


-----------------------------------------------------------------

::

          On success, these functions return 0; on error, they return a
          nonzero error number.


-----------------------------------------------------

::

          pthread_attr_setstacksize() can fail with the following error:

          EINVAL The stack size is less than PTHREAD_STACK_MIN (16384)
                 bytes.

          On some systems, pthread_attr_setstacksize() can fail with the
          error EINVAL if stacksize is not a multiple of the system page
          size.


---------------------------------------------------------

::

          These functions are provided by glibc since version 2.1.


-------------------------------------------------------------

::

          For an explanation of the terms used in this section, see
          attributes(7).

          ┌──────────────────────────────────────┬───────────────┬─────────┐
          │Interface                             │ Attribute     │ Value   │
          ├──────────────────────────────────────┼───────────────┼─────────┤
          │pthread_attr_setstacksize(),          │ Thread safety │ MT-Safe │
          │pthread_attr_getstacksize()           │               │         │
          └──────────────────────────────────────┴───────────────┴─────────┘


-------------------------------------------------------------------

::

          POSIX.1-2001, POSIX.1-2008.


---------------------------------------------------

::

          For details on the default stack size of new threads, see
          pthread_create(3).

          A thread's stack size is fixed at the time of thread creation.
          Only the main thread can dynamically grow its stack.

          The pthread_attr_setstack(3) function allows an application to
          set both the size and location of a caller-allocated stack that
          is to be used by a thread.


-------------------------------------------------

::

          As at glibc 2.8, if the specified stacksize is not a multiple of
          STACK_ALIGN (16 bytes on most architectures), it may be rounded
          downward, in violation of POSIX.1, which says that the allocated
          stack will be at least stacksize bytes.


---------------------------------------------------------

::

          See pthread_create(3).


---------------------------------------------------------

::

          getrlimit(2), pthread_attr_init(3), pthread_attr_setguardsize(3),
          pthread_attr_setstack(3), pthread_create(3), pthreads(7)

COLOPHON
---------------------------------------------------------

::

          This page is part of release 5.13 of the Linux man-pages project.
          A description of the project, information about reporting bugs,
          and the latest version of this page, can be found at
          https://www.kernel.org/doc/man-pages/.

   Linux                          2021-03-22   PTHREAD_ATTR_SETSTACKSIZE(3)

--------------

Pages that refer to this page:
`pthread_attr_init(3) <../man3/pthread_attr_init.3.html>`__, 
`pthread_attr_setguardsize(3) <../man3/pthread_attr_setguardsize.3.html>`__, 
`pthread_attr_setstack(3) <../man3/pthread_attr_setstack.3.html>`__, 
`pthread_attr_setstackaddr(3) <../man3/pthread_attr_setstackaddr.3.html>`__, 
`pthread_create(3) <../man3/pthread_create.3.html>`__, 
`pthread_getattr_default_np(3) <../man3/pthread_getattr_default_np.3.html>`__, 
`pthread_getattr_np(3) <../man3/pthread_getattr_np.3.html>`__

--------------

`Copyright and license for this manual
page <../man3/pthread_attr_setstacksize.3.license.html>`__

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
